using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales
{
    public partial class InventoryEdit : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        //reference to the records
        private static DataRow[] rows;

        //Variable to Store ProductID
        int myID; 

        static InventoryEdit()
        {
            //load data
            dsSales = new SalesDataSet();
            inventoryTableAdapter daInventory = new inventoryTableAdapter();
            productTableAdapter daProduct = new productTableAdapter();
            try
            {
                daInventory.Fill(dsSales.inventory);
                daProduct.Fill(dsSales.product);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            myID = Convert.ToInt32(Request.QueryString["ID"]);

            if (this.IsPostBack)
            {
                return;
            }

            if (myID > 0)
            {

                disableObjects(true);

                rows = dsSales.inventory.Select("id =" + myID);

                foreach (DataRow r in rows)
                {
                    txtQuantity.Text = r.ItemArray[1].ToString();
                    txtSize.Text = r.ItemArray[2].ToString();
                    txtMeasure.Text = r.ItemArray[3].ToString();
                    txtPrice.Text = r.ItemArray[4].ToString();
                    rows = (dsSales.product.Select("ID =" + r.ItemArray[5].ToString()));
                    int i = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0]);
                    ddlProductID.SelectedValue = i.ToString();
                    //lblProduct.Text = "Edit Product: " + rows.FirstOrDefault().ItemArray[1];
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int checkedValidation;
            ValidationFields(out checkedValidation);

            if (myID > 0 && checkedValidation == 5)
            {
                //retrieve the record from Dataset inventory table
                DataRow myInventory = dsSales.inventory.FindByid(myID);
                //update record with user's input
                myInventory[1] = txtQuantity.Text;
                myInventory[2] = txtSize.Text;
                myInventory[3] = txtMeasure.Text;
                myInventory[4] = txtPrice.Text;
                myInventory[5] = ddlProductID.SelectedValue;

                //save back to the database
                try
                {
                    inventoryTableAdapter taInventory = new inventoryTableAdapter();
                    taInventory.Update(myInventory);
                    dsSales.AcceptChanges();
                    lblOutcome.Text = "Record Successfully Updated";
                    disableObjects(false);
                }
                catch { lblOutcome.Text = "Unable to Update Record"; }
            }
        }

        //Disable objects
        void disableObjects(bool option)
        {
            if (option == false)
            {
                txtQuantity.Enabled = false;
                txtSize.Enabled = false;
                txtMeasure.Enabled = false;
                txtPrice.Enabled = false;
                ddlProductID.Enabled = false;
            }
            else
            {
                txtQuantity.Enabled = true;
                txtSize.Enabled = true;
                txtMeasure.Enabled = true;
                txtPrice.Enabled = true;
                ddlProductID.Enabled = true;
            }
        }

        //Method to validate, if the user inserted data correctly. 
        private int ValidationFields(out int countValidation)
        {
            //Variables.
            countValidation = 0;
            lblErrorQuantity.Text = "";
            lblErrorSize.Text = "";
            lblErrorMeasure.Text = "";
            lblErrorPrice.Text = "";
            lblErrorProductID.Text = "";

            string pattern = "([0-9]{1,4})";

            if (Regex.IsMatch(txtQuantity.Text, pattern))
            {
                if (Convert.ToInt32(txtQuantity.Text) > 0 && Convert.ToInt32(txtQuantity.Text) < 10000)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorQuantity.Text = "* Please, do enter just numbers between 1 to 9.999.";
                }
            }
            else
            {
                lblErrorQuantity.Text = "* Please, do enter just numbers between 1 to 9.999.";
            }

            pattern = "([0-9.]{1,6})";

            if (Regex.IsMatch(txtSize.Text, pattern))
            {
                if (Convert.ToDecimal(txtSize.Text) > 0 && Convert.ToDecimal(txtSize.Text) < 10000)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorSize.Text = "* Please, do enter just numbers between 1 to 9.999.";
                }
            }
            else
            {
                lblErrorSize.Text = "* Please, do enter just numbers between 1 to 9.999.";
            }

            pattern = "([a-zA-Z ]{1,20})";
            if (Regex.IsMatch(txtMeasure.Text, pattern))
            {
                if ((txtMeasure.Text).Length < 21 && (txtMeasure.Text).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorMeasure.Text = "* Please, Measure entered is too long.";
                }
            }
            else
            {
                lblErrorMeasure.Text = "* Please, Measure entered only letters.";
            }

            pattern = "([0-9.]{1,7})";

            if (Regex.IsMatch(txtPrice.Text, pattern))
            {
                if (Convert.ToDecimal(txtPrice.Text) > 0 && Convert.ToDecimal(txtPrice.Text) < 10000)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorPrice.Text = "* Please, do enter just numbers between 1 to 9.999.";

                }
            }
            else
            {
                lblErrorPrice.Text = "* Please, do enter just numbers between 1 to 9.999.";
            }

            if (ddlProductID.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorProductID.Text = "* Please, Select a Product.";
            }

            return (countValidation);
        }

        protected void lbInventoryList_Click(object sender, EventArgs e)
        {
            string Url = "inventoryList.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }
    }
}