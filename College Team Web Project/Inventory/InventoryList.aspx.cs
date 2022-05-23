using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales
{
    public partial class Inventory : System.Web.UI.Page
    {
        //Reference to a SalesDataset
        private static SalesDataSet dsSales;

        //reference to the records
        private static DataRow[] rows;

        static Inventory()
        {
            //load data
            dsSales = new SalesDataSet();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void LoadGridViewInventory(DataRow[] inventory)
        {
            decimal value = 0m;

            //Load GridView
            DataTable names = new DataTable();
            names.Columns.Add("ID");
            names.Columns.Add("Quantity");
            names.Columns.Add("Size");
            names.Columns.Add("Measure");
            names.Columns.Add("Price");
            names.Columns.Add("Product");

            foreach (DataRow i in inventory)
            {
                DataRow inv = names.NewRow();
                inv[0] = i.ItemArray[0].ToString();
                inv[1] = i.ItemArray[1].ToString();
                value = Convert.ToDecimal(i.ItemArray[2].ToString());
                inv[2] = value.ToString("F2");
                inv[3] = i.ItemArray[3].ToString();
                value = Convert.ToDecimal(i.ItemArray[4].ToString());
                inv[4] = value.ToString("C2");
                rows = (dsSales.product.Select("ID =" + i.ItemArray[5].ToString()));
                inv[5] = rows.FirstOrDefault().ItemArray[1];

                names.Rows.Add(inv);
            }

            gvInventorylist.DataSource = names;
            gvInventorylist.DataBind();
        }

        protected void btnSearchProduct_Click(object sender, EventArgs e)
        {
            dsSales.Clear();

            inventoryTableAdapter daInventory = new inventoryTableAdapter();
            productTableAdapter daProduct = new productTableAdapter();
            try
            {
                daInventory.Fill(dsSales.inventory);
                daProduct.Fill(dsSales.product);
            }
            catch { }

            //Variable to store Employee
            string criteria = txtProductName.Text;

            if (dsSales.inventory.Count > 0 && criteria == "")
            {
                rows = dsSales.inventory.Select();
            }
            else
            {
                rows = dsSales.product.Select("prodName LIKE '%" + criteria + "%'");

                var numberProduct = new List<int>();

                foreach (var r in rows)
                {
                    numberProduct.Add(Convert.ToInt32(r.ItemArray[0]));
                }

                var outcomeProducts = String.Join(",", numberProduct);

                rows = dsSales.inventory.Select("productID IN (" + outcomeProducts + ")");
            }

            LoadGridViewInventory(rows);
        }

        protected void gvInventorylist_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iEdit = Convert.ToInt32(gvInventorylist.SelectedRow.Cells[1].Text);
            Response.Redirect("InventoryEdit.aspx?ID=" + iEdit);
        }

        protected void lbInsertInventory_Click(object sender, EventArgs e)
        {
            string Url = "inventoryInsert.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }
    }
}