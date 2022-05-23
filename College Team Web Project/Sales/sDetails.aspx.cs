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

namespace appSales.Sales
{
    public partial class sDetails : System.Web.UI.Page
    {
        //Reference to a Emma's EmployeeOrder Datase
        private static SalesDataSet dsSales;

        //Store customer Selected.
        private static DataRow[] customerRows;

        //store a currency value.
        decimal value;

        //Variable to Store customerID
        int myID;

        static sDetails()
        {
            //load customer Data 
            dsSales = new SalesDataSet(); //Details Dataset
            customerTableAdapter dacustomer = new customerTableAdapter();
            try
            {
                dacustomer.Fill(dsSales.customer);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            myID = Convert.ToInt32(Request.QueryString["ID"]);
            txtID.Text = Request.QueryString["ID"];

            //Hide lblValidationSummary.
            lblValidationSummary.Visible = false;

            if (this.IsPostBack)
            {
                return;
            }

            display();
        }

        void display()
        {
            //Disable gvorderDetails
            gvOrderDetails.Visible = false;

            //Clear lblOrderTotal.
            lblOrderTotal.Text = "";

            if (dsSales.customer.Count > 0 && myID > 0)
            {
                customerRows = dsSales.customer.Select("id =" + myID);
                lblFullName.Text = customerRows.FirstOrDefault().ItemArray[1].ToString() + " " + customerRows.FirstOrDefault().ItemArray[2].ToString();

                //Load DetailsView - customer Data
                LoadDetailsViewcustomer(customerRows);
                dvCustomer.DataBind();
            }
            else
            {
                clearObjects();
            }
        }

        void clearObjects()
        {
            lblFullName.Text = "";
            dvCustomer.Visible = false;
            gvReceipt.Visible = false;
            gvOrderDetails.Visible = false;
            lblOrderTotal.Text = "";
            txtCustomerStatus.Text = "Unable to Load customer Records";
        }

        protected void gvReceipt_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Variable to store Order Total
            decimal orderTotalValue = 0m;

            //Enable gvorderDetails
            gvOrderDetails.Visible = true;

            lblOrderDetails.Visible = true;

            //Load GridView - orderDetails Data
            orderDetailsTableAdapter daorderDetails = new orderDetailsTableAdapter();
            try
            {
                daorderDetails.Fill(dsSales.orderDetails, Convert.ToInt32(gvReceipt.SelectedRow.Cells[1].Text));
            }
            catch
            {
                txtCustomerStatus.Text = "Unable to Load orderDetails Records";
            }

            //Load GridView

            DataTable orderDetailsSelected = new DataTable();
            orderDetailsSelected.Columns.Add("Product");
            orderDetailsSelected.Columns.Add("Qty");
            orderDetailsSelected.Columns.Add("Price");
            orderDetailsSelected.Columns.Add("Total");

            foreach (DataRow r in dsSales.orderDetails)
            {
                DataRow nr = orderDetailsSelected.NewRow();
                nr[0] = r.ItemArray[6].ToString();
                nr[1] = r.ItemArray[2].ToString();
                value = Convert.ToDecimal(r.ItemArray[1].ToString());
                nr[2] = value.ToString("C2");
                value = Convert.ToDecimal(r.ItemArray[5].ToString());
                orderTotalValue += value;
                nr[3] = value.ToString("C2");
                txtUpdateReceiptID.Text = r.ItemArray[7].ToString();

                orderDetailsSelected.Rows.Add(nr);
            }

            gvOrderDetails.DataSource = orderDetailsSelected;
            gvOrderDetails.DataBind();

            lblOrderTotal.Text = "Order Total is: " + orderTotalValue.ToString("C2");
        }

        protected void dvCustomer_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            //Get records entered by the user
            for (int i = 0; i < e.NewValues.Count; i++)
            {
                if (e.NewValues[i] != null)
                {
                    e.NewValues[i] = Server.HtmlEncode(e.NewValues[i].ToString());
                }
            }

            int checkedValidation;
            ValidationFields(out checkedValidation, e);

            if (checkedValidation == 7)
            {
                //update record with user's input
                DataRow myRow = dsSales.customer.FindByid(Convert.ToInt32(customerRows.FirstOrDefault().ItemArray[0]));
                myRow[1] = e.NewValues[0];
                myRow[2] = e.NewValues[1];
                myRow[3] = e.NewValues[2];
                myRow[4] = e.NewValues[3];
                myRow[5] = e.NewValues[4];
                myRow[6] = e.NewValues[5];
                myRow[7] = e.NewValues[6];

                try
                {
                    customerTableAdapter dacustomer = new customerTableAdapter();
                    dacustomer.Update(myRow);
                    dsSales.AcceptChanges();
                    dvCustomer.ChangeMode(DetailsViewMode.ReadOnly);

                    customerRows = dsSales.customer.Select("id=" + Convert.ToInt32(customerRows.FirstOrDefault().ItemArray[0]));

                    //Load DetailsView - customer Data
                    LoadDetailsViewcustomer(customerRows);
                    dvCustomer.DataBind();

                    lblFullName.Text = customerRows.FirstOrDefault().ItemArray[1].ToString() + " " + customerRows.FirstOrDefault().ItemArray[2].ToString();
                }
                catch
                {
                    txtCustomerStatus.Text = "Unable to Update customer Record";
                }
            }
            else
            {
                lblValidationSummary.Visible = true;
            }
        }

        protected void dvCustomer_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            //Load DetailsView - customer Data
            LoadDetailsViewcustomer(customerRows);

            if (e.CancelingEdit)
            {
                dvCustomer.ChangeMode(DetailsViewMode.ReadOnly);
            }
            else
            {
                dvCustomer.ChangeMode(DetailsViewMode.Edit);
            }
            dvCustomer.DataBind();
        }

        //Open EmployeeOrder Page.
        protected void lblSalesList_Click(object sender, EventArgs e)
        {
            string Url = "SalesList.aspx";
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }

        //Load DetailsView - customer Data.
        void LoadDetailsViewcustomer(DataRow[] cust)
        {

            DataTable customerSelected = new DataTable();
            customerSelected.Columns.Add("First");
            customerSelected.Columns.Add("Last");
            customerSelected.Columns.Add("Phone");
            customerSelected.Columns.Add("Address");
            customerSelected.Columns.Add("City");
            customerSelected.Columns.Add("Postal");
            customerSelected.Columns.Add("Email");

            foreach (DataRow r in cust)
            {
                DataRow nr = customerSelected.NewRow();
                nr[0] = r.ItemArray[1].ToString();
                nr[1] = r.ItemArray[2].ToString();
                nr[2] = r.ItemArray[3].ToString();
                nr[3] = r.ItemArray[4].ToString();
                nr[4] = r.ItemArray[5].ToString();
                nr[5] = r.ItemArray[6].ToString();
                nr[6] = r.ItemArray[7].ToString();

                customerSelected.Rows.Add(nr);
            }
            dvCustomer.DataSource = customerSelected;
        }

        //Method to validate, if the user inserted data correctly. 
        private int ValidationFields(out int countValidation, DetailsViewUpdateEventArgs custData)
        {
            //Variables.
            countValidation = 0;
            txtCustomerStatus.Text = "";
            lblValidationSummary.Visible = false;

            string pattern = "([a-zA-Z ]{1,30})";
            if (Regex.IsMatch(custData.NewValues[0].ToString(), pattern))
            {
                if ((custData.NewValues[0].ToString()).Length < 31 && (custData.NewValues[0].ToString()).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text = "* Please, First Name entered is too long.";
                }
            }
            else
            {
                txtCustomerStatus.Text = "* Please, First Name entered only letters.";
            }

            pattern = "([a-zA-Z ]{1,30})";
            if (Regex.IsMatch(custData.NewValues[1].ToString(), pattern))
            {
                if ((custData.NewValues[1].ToString()).Length < 31 && (custData.NewValues[1].ToString()).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text += "\n* Please, Last Name entered is too long.";
                }
            }
            else
            {
                txtCustomerStatus.Text += "\n* Please, Last Name entered only letters.";
            }

            pattern = "(^[1-9]{1}[1-9]{9}$)";
            if (Regex.IsMatch(custData.NewValues[2].ToString(), pattern))
            {
                if ((custData.NewValues[2].ToString()).Length == 10)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text += "\n* Please, Phone Number has 10 numbers";
                }
            }
            else
            {
                txtCustomerStatus.Text += "\n* Please, do enter just numbers between 0 to 9.";
            }

            if ((custData.NewValues[3].ToString()).Length < 61 && (custData.NewValues[3].ToString()).Length > 0)
            {
                countValidation++;
            }
            else
            {
                txtCustomerStatus.Text += "\n* Please, Addres entered is too long.";
            }

            pattern = "([a-zA-Z. ]{1,50})";
            if (Regex.IsMatch(custData.NewValues[4].ToString(), pattern))
            {
                if ((custData.NewValues[4].ToString()).Length < 51 && (custData.NewValues[4].ToString()).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text += "\n* Please, City entered is too long.";
                }
            }
            else
            {
                txtCustomerStatus.Text += "\n* Please, Enter a valid City.";
            }

            pattern = "([a-zA-Z0-9]{1,6})";
            if (Regex.IsMatch(custData.NewValues[5].ToString(), pattern))
            {
                if ((custData.NewValues[5].ToString()).Length < 7 && (custData.NewValues[5].ToString()).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text += "\n* Please, Postal Code entered is too long.";
                }
            }
            else
            {
                txtCustomerStatus.Text += "\n* Please, Enter a valid postal code.";
            }

            pattern = @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z";
            if (Regex.IsMatch(custData.NewValues[6].ToString(), pattern))
            {
                if ((custData.NewValues[6].ToString()).Length < 31 && (custData.NewValues[6].ToString()).Length > 0)
                {
                    countValidation++;
                }
                else
                {
                    txtCustomerStatus.Text = "\n* Please, Email entered is too long.";
                }
            }
            else
            {
                txtCustomerStatus.Text = "\n* Please, Enter a valid Email.";
            }

            return (countValidation);
        }

        protected void lblOrderDetails_Click(object sender, EventArgs e)
        {
            int iEdit = Convert.ToInt32(txtUpdateReceiptID.Text);
            Response.Redirect("OrderDetails.aspx?ID=" + iEdit);
        }

        protected void gvOrderDetails_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}