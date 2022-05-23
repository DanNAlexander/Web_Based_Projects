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

namespace appSales.Equipment
{
    public partial class EquipmentEdit : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        //reference to the records
        private static DataRow[] rows;

        //Variable to Store ProductID
        int myID;

        static EquipmentEdit()
        {
            //load data
            dsSales = new SalesDataSet();
            equipmentTableAdapter daEquipment = new equipmentTableAdapter();
            customerTableAdapter daCustomer = new customerTableAdapter();
            equip_typeTableAdapter daType = new equip_typeTableAdapter();
            manufacturerTableAdapter daManufacturer = new manufacturerTableAdapter();
            try
            {
                daEquipment.Fill(dsSales.equipment);
                daCustomer.Fill(dsSales.customer);
                daType.Fill(dsSales.equip_type);
                daManufacturer.Fill(dsSales.manufacturer);
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

                rows = dsSales.equipment.Select("id =" + myID);

                int i = 0;

                foreach (DataRow r in rows)
                {
                    txtModel.Text = r.ItemArray[1].ToString();
                    txtSerial.Text = r.ItemArray[2].ToString();

                    rows = (dsSales.customer.Select("ID =" + r.ItemArray[3].ToString()));
                    i = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0]);
                    ddlCustomer.SelectedValue = i.ToString();

                    rows = (dsSales.equip_type.Select("ID =" + r.ItemArray[4].ToString()));
                    i = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0]);
                    ddlType.SelectedValue = i.ToString();

                    rows = (dsSales.manufacturer.Select("ID =" + r.ItemArray[5].ToString()));
                    i = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0]);
                    ddlManufacturer.SelectedValue = i.ToString();
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
                DataRow myEquipment = dsSales.equipment.FindByid(myID);
                //update record with user's input
                myEquipment[1] = txtModel.Text;
                myEquipment[2] = txtSerial.Text;
                myEquipment[3] = ddlCustomer.SelectedValue;
                myEquipment[4] = ddlType.SelectedValue;
                myEquipment[5] = ddlManufacturer.SelectedValue;

                //save back to the database
                try
                {
                    equipmentTableAdapter taEquipment = new equipmentTableAdapter();
                    taEquipment.Update(myEquipment);
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

        protected void lbEquipmentList_Click(object sender, EventArgs e)
        {
            string Url = "EquipmentList.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }
    }
}