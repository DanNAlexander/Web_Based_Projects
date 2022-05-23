using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales.Sales
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        //reference to the records
        private static DataRow[] rows;

        //Variable to Store ReceiptID
        int myID;

        static OrderDetails()
        {
            //load data
            dsSales = new SalesDataSet();
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            customerTableAdapter dacustomer = new customerTableAdapter();
            employeeTableAdapter daEmployee = new employeeTableAdapter();
            paymentTableAdapter daPayment = new paymentTableAdapter();
            inventoryTableAdapter taInventory = new inventoryTableAdapter();
            try
            {
                daReceipt.Fill(dsSales.receipt);
                dacustomer.Fill(dsSales.customer);
                daEmployee.Fill(dsSales.employee);
                daPayment.Fill(dsSales.payment);
                taInventory.Fill(dsSales.inventory);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            myID = Convert.ToInt32(Request.QueryString["ID"]);
            lblTempNumReceiptID.Text = Request.QueryString["ID"];

            total();

            if (this.IsPostBack)
            {
                return;
            }

            rows = (dsSales.receipt.Select("id =" + lblTempNumReceiptID.Text));
            ddlCustomer.SelectedValue = (rows.FirstOrDefault().ItemArray[5].ToString());
            ddlEmployee.SelectedValue = (rows.FirstOrDefault().ItemArray[6].ToString());
            ddlPayment.SelectedValue = (rows.FirstOrDefault().ItemArray[4].ToString());
        }

        protected void btnAddDetail_Click(object sender, EventArgs e)
        {
            int checkedValidation;
            ValidationDetailsFields(out checkedValidation);

            if (checkedValidation == 3)
            {
                decimal up = Convert.ToDecimal(lblUnitPrice.Text);
                int qty = Convert.ToInt32(txtQuantity.Text);
                rows = (dsSales.inventory.Select("productID =" + ddlProduct.SelectedValue));
                int invID = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0].ToString());

                receiptTableAdapter taReceipt = new receiptTableAdapter();
                try
                {
                    taReceipt.Fill(dsSales.receipt);
                }
                catch { }

                int numOrder = Convert.ToInt32(lblTempNumReceiptID.Text);
                lblTempNumReceiptID.Text = numOrder.ToString();

                order_lineTableAdapter taOrderLine = new order_lineTableAdapter();
                taOrderLine.Insert(up, qty, false, txtNote.Text, invID, numOrder);

                gvDetails.DataBind();
                clearObjects();

                total();
            }
        }

        //Get total per Receipt
        void total()
        {
            orderDetailsTableAdapter taOrderLine = new orderDetailsTableAdapter();
            try
            {
                taOrderLine.Fill(dsSales.orderDetails, Convert.ToInt32(lblTempNumReceiptID.Text));
            }
            catch { }

            decimal value = 0m;
            decimal orderTotalValue = 0m;

            DataTable orderDetailsSelected = new DataTable();
            orderDetailsSelected.Columns.Add("Product");
            orderDetailsSelected.Columns.Add("Qty");
            orderDetailsSelected.Columns.Add("Price");
            orderDetailsSelected.Columns.Add("Total");

            foreach (DataRow r in dsSales.orderDetails)
            {
                DataRow nr = orderDetailsSelected.NewRow();
                value = Convert.ToDecimal(r.ItemArray[5].ToString());
                orderTotalValue += value;

                orderDetailsSelected.Rows.Add(nr);
            }

            lblTotalReceipt.Text = orderTotalValue.ToString("C2");
        }

        //Clear objects
        void clearObjects()
        {
            ddlProduct.SelectedIndex = 0;
            lblUnitPrice.Text = "";
            txtQuantity.Text = "";
            txtNote.Text = "";
        }

        //Method to validate, if the user inserted data correctly. 
        private int ValidationDetailsFields(out int countValidation)
        {
            //Variables.
            countValidation = 0;
            lblErrorProduct.Text = "";
            lblErrorQuanity.Text = "";
            lblErrorNote.Text = "";

            if (ddlProduct.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorProduct.Text = "* Please, Select a product.";
            }

            string pattern = "([0-9]{1,4})";

            if (Regex.IsMatch(txtQuantity.Text, pattern))
            {
                if (Convert.ToInt32(txtQuantity.Text) > 0 && Convert.ToInt32(txtQuantity.Text) < 10000)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorQuanity.Text = "* Please, do enter just numbers between 1 to 9.999.";
                }
            }
            else
            {
                lblErrorQuanity.Text = "* Please, do enter just numbers between 1 to 9.999.";
            }

            pattern = "([a-zA-Z0-9-_ ]{1,100})";

            if (Regex.IsMatch(txtNote.Text, pattern))
            {
                if ((txtNote.Text).Length > 0 && (txtNote.Text).Length < 101)
                {
                    countValidation++;
                }
                else
                {
                    lblErrorNote.Text = "* Please, Note entered is too long.";
                }
            }
            else
            {
                lblErrorNote.Text = "* Please, do enter a valid Note.";
            }

            return (countValidation);
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUnitPrice.Text = "";

            if (ddlProduct.SelectedIndex > 0)
            {
                rows = (dsSales.inventory.Select("productID =" + ddlProduct.SelectedValue));
                lblUnitPrice.Text = rows.FirstOrDefault().ItemArray[4].ToString();
            }
            else
            {
                lblUnitPrice.Text = "* Please, Select a product.";
            }
        }

        protected void lbSalesList_Click(object sender, EventArgs e)
        {
            string Url = "SalesList.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }
    }
}