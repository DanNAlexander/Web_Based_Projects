using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales.Sales
{
    public partial class SalesList : System.Web.UI.Page
    {
        //Reference to a SportMotor DataSet
        private static SalesDataSet dsSales;

        //reference to the current search records
        private static DataRow[] rows;

        static SalesList()
        {
            dsSales = new SalesDataSet();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gvOrders.Visible = false;
        }

        //Method to search data according to user's selection.
        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            dsSales.Clear();

            receiptViewTableAdapter daReceiptView = new receiptViewTableAdapter();
            try
            {
                daReceiptView.Fill(dsSales.receiptView);
            }
            catch { }

            if (dsSales.receiptView.Count > 0)
            {
                string criteria = GetReceiptCriteria();

                gvOrders.Visible = true;

                rows = (criteria.Length > 0) ? dsSales.receiptView.Select(criteria) : dsSales.receiptView.Select();

                DataTable receiptRecords = new DataTable();
                receiptRecords.Columns.Add("#");
                receiptRecords.Columns.Add("Date");
                receiptRecords.Columns.Add("ID");
                receiptRecords.Columns.Add("Customer");
                receiptRecords.Columns.Add("Phone");
                receiptRecords.Columns.Add("Payment");
                receiptRecords.Columns.Add("Employee");

                foreach (DataRow r in rows)
                {
                    DataRow nr = receiptRecords.NewRow();
                    nr[0] = r.ItemArray[1].ToString();
                    nr[1] = r.ItemArray[2].ToString();
                    nr[2] = r.ItemArray[5].ToString();
                    nr[3] = r.ItemArray[7].ToString();
                    nr[4] = r.ItemArray[8].ToString();
                    nr[5] = r.ItemArray[10].ToString();
                    nr[6] = r.ItemArray[9].ToString();

                    receiptRecords.Rows.Add(nr);
                }

                gvOrders.DataSource = receiptRecords;
                gvOrders.DataBind();
            }
            else
            {
                gvOrders.Visible = false;
                this.lblStatus.Text = "No Order Records";
            }
        }

        //method to get critera relate to the Receipts - query to the database
        private string GetReceiptCriteria()
        {
            string criteria = "";

            criteria = (ddlEmployee.Text != "None") ? "empID = '" + ddlEmployee.SelectedValue.ToString() + "'" : "";

            criteria += (ddlCustomer.Text != "None" && criteria.Length > 0) ? " AND custID = '" + ddlCustomer.SelectedValue.ToString() + "'"
                : (ddlCustomer.Text != "None") ? "custID = '" + ddlCustomer.SelectedValue.ToString() + "'" : "";

            criteria += (ddlPayment.Text != "None" && criteria.Length > 0) ? " AND paymentID = '" + ddlPayment.SelectedValue.ToString() + "'"
                : (ddlPayment.Text != "None") ? "paymentID = '" + this.ddlCustomer.SelectedValue.ToString() + "'" : "";

            criteria += (txtPhone.Text.Length > 0 && criteria.Length > 0) ? " AND custPhone LIKE '%" + txtPhone.Text + "%'"
               : (txtPhone.Text.Length > 0) ? "custPhone LIKE '%" + txtPhone.Text + "%'" : "";

            criteria += (txtOrderNumber.Text.Length > 0 && criteria.Length > 0) ? " AND ordNumber = '" + txtOrderNumber.Text + "'"
               : (txtOrderNumber.Text.Length > 0) ? "ordNumber = '" + txtOrderNumber.Text + "'" : "";

            return criteria;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearObjects();
        }

        //method to clear objects
        void ClearObjects()
        {
            gvOrders.Visible = false;
            ddlEmployee.SelectedIndex = -1;
            ddlCustomer.SelectedIndex = -1;
            ddlPayment.SelectedIndex = -1;
            txtPhone.Text = "";
            txtOrderNumber.Text = "";
        }

        protected void gvOrders_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iEdit = Convert.ToInt32(gvOrders.SelectedRow.Cells[3].Text);
            Response.Redirect("sDetails.aspx?ID=" + iEdit);
        }

        protected void lblInsertReceipt_Click(object sender, EventArgs e)
        {
            string Url = "SalesInsert.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }
    }
}