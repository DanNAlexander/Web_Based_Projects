using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales.Equipment
{
    public partial class EquipmentInsert : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        static EquipmentInsert()
        {
            //load data
            dsSales = new SalesDataSet();
            equipmentTableAdapter daEquupment = new equipmentTableAdapter();
            try
            {
                daEquupment.Fill(dsSales.equipment);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            disableObjects(true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int checkedValidation;
            ValidationFields(out checkedValidation);

            if (checkedValidation == 5)
            {
                equipmentTableAdapter taEquipment = new equipmentTableAdapter();
                taEquipment.Insert(txtModel.Text, txtSerial.Text, Convert.ToInt32(ddlCustomer.SelectedValue.ToString()), Convert.ToInt32(ddlType.SelectedValue.ToString()), Convert.ToInt32(ddlManufacturer.SelectedValue.ToString()));

                lblOutcome.Text = "Record Successfully Inserted";
                disableObjects(false);
            }
        }

        //Disable objects
        void disableObjects(bool option)
        {
            if (option == false)
            {
                txtModel.Enabled = false;
                txtSerial.Enabled = false;
                ddlCustomer.Enabled = false;
                ddlType.Enabled = false;
                ddlManufacturer.Enabled = false;
            }
            else
            {
                txtModel.Enabled = true;
                txtSerial.Enabled = true;
                ddlCustomer.Enabled = true;
                ddlType.Enabled = true;
                ddlManufacturer.Enabled = true;
            }
        }

        protected void lbEquipmentList_Click(object sender, EventArgs e)
        {
            string Url = "EquipmentList.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }

        //Method to validate, if the user inserted data correctly. 
        private int ValidationFields(out int countValidation)
        {
            //Variables.
            countValidation = 0;
            lblErrorModel.Text = "";
            lblErrorSerial.Text = "";
            lblErrorCustomer.Text = "";
            lblErrorType.Text = "";
            lblErrorManufacturer.Text = "";

            string pattern = "([a-zA-Z0-9]{1,50})";

            if (Regex.IsMatch(txtModel.Text, pattern))
            {
                if ((txtModel.Text).Length > 0 && (txtModel.Text).Length < 51)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorModel.Text = "* Please, Model entered is too long.";
                }
            }
            else
            {
                lblErrorModel.Text = "* Please, do enter a valid Model.";
            }

            pattern = "([a-zA-Z0-9]{1,30})";

            if (Regex.IsMatch(txtSerial.Text, pattern))
            {
                if ((txtSerial.Text).Length > 0 && (txtSerial.Text).Length < 51)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorSerial.Text = "* Please, Serial entered is too long.";
                }
            }
            else
            {
                lblErrorSerial.Text = "* Please, do enter a valid Serial.";
            }

            if (ddlCustomer.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorCustomer.Text = "* Please, Select a Customer.";
            }

            if (ddlType.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorType.Text = "* Please, Select a Type.";
            }

            if (ddlManufacturer.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorManufacturer.Text = "* Please, Select a Manufacturer.";
            }

            return (countValidation);
        }
    }
}