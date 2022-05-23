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
    public partial class SalesInsert : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        //reference to the records
        private static DataRow[] rows;

        static SalesInsert()
        {
            //load data
            dsSales = new SalesDataSet();
            inventoryTableAdapter taInventory = new inventoryTableAdapter();
            try
            {
                taInventory.Fill(dsSales.inventory);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                return;
            }

            enableObjects(false);
        }

        protected void btnSaveReceipt_Click(object sender, EventArgs e)
        {
            int checkedValidation;
            ValidationFields(out checkedValidation);

            if (checkedValidation == 3)
            {
                DateTime myDate = DateTime.Today;

                receiptTableAdapter taReceipt = new receiptTableAdapter();
                try
                {
                    taReceipt.Fill(dsSales.receipt);
                }
                catch { }

                //Variable to store order number
                int numOrder = 0;

                int xNumberOfReceipts = Convert.ToInt32(dsSales.receipt.Count);

                numOrder = xNumberOfReceipts + 1;

                receiptTableAdapter taReceiptRecord = new receiptTableAdapter();
                taReceiptRecord.Insert(numOrder.ToString(), Convert.ToDateTime(myDate.ToString("d")), false, Convert.ToInt32(ddlPayment.SelectedValue.ToString()), Convert.ToInt32(ddlCustomer.SelectedValue.ToString()), Convert.ToInt32(ddlEmployee.SelectedValue.ToString()));

                txtTempNumReceipt.Text = numOrder.ToString();

                enableObjects(true);
            }
        }

        //Clear objects
        void clearObjects()
        {
            ddlProduct.SelectedIndex = 0;
            lblUnitPrice.Text = "";
            txtQuantity.Text = "";
            txtNote.Text = "";
        }

        //Disable objects
        void enableObjects(bool option)
        {
            if (option == false)
            {
                lblProduct.Visible = false;
                lblPrice.Visible = false;
                lblQuantity.Visible = false;
                lblNote.Visible = false;
                btnAddDetail.Visible = false;
                ddlProduct.Visible = false;
                lblUnitPrice.Visible = false;
                txtQuantity.Visible = false;
                txtNote.Visible = false;
                lblTotalReceipt.Visible = false;
                lblTitleDetails.Visible = false;
            }
            else
            {
                lblTitleDetails.Visible = true;
                lblProduct.Visible = true;
                lblPrice.Visible = true;
                lblQuantity.Visible = true;
                lblNote.Visible = true;
                btnAddDetail.Visible = true;
                ddlProduct.Visible = true;
                lblUnitPrice.Visible = true;
                txtQuantity.Visible = true;
                txtNote.Visible = true;
                ddlPayment.Enabled = false;
                ddlCustomer.Enabled = false;
                ddlEmployee.Enabled = false;
            }
        }

        protected void lbSalesList_Click(object sender, EventArgs e)
        {
            string Url = "SalesList.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }

        //Method to validate, if the user inserted data correctly. 
        private int ValidationFields(out int countValidation)
        {
            //Variables.
            countValidation = 0;
            lblErrorPayment.Text = "";
            lblErrorCustomer.Text = "";
            lblErrorEmployee.Text = "";

            if (ddlPayment.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorPayment.Text = "* Please, Select a payment method.";
            }

            if (ddlCustomer.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorCustomer.Text = "* Please, Select a Customer.";
            }

            if (ddlEmployee.SelectedIndex > 0)
            {
                countValidation++;
            }
            else
            {
                lblErrorEmployee.Text = "* Please, Select a Employee.";
            }

            return (countValidation);
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

                rows = (dsSales.receipt.Select("ordNumber =" + txtTempNumReceipt.Text));
                int numOrder = Convert.ToInt32(rows.FirstOrDefault().ItemArray[0].ToString());
                lblTempNumReceiptID.Text = numOrder.ToString();

                order_lineTableAdapter taOrderLine = new order_lineTableAdapter();
                taOrderLine.Insert(up, qty, false, txtNote.Text, invID , numOrder);

                gvDetails.DataBind();
                clearObjects();
                total();
            }
        }

        //Get total per Receipt
        void total()
        {
            lblTotalReceipt.Visible = true;

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

            lblTotalReceipt.Text = "Order Total is: " + orderTotalValue.ToString("C2");
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
    }
}