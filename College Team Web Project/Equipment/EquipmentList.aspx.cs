using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using librarySales;
using librarySales.SalesDataSetTableAdapters;

namespace appSales.Equipment
{
    public partial class EquipmentList : System.Web.UI.Page
    {
        //Reference to a SportMotor DataSet
        private static SalesDataSet dsSales;

        //reference to the current search records
        private static DataRow[] rows;

        //reference to the current search records
        private static DataRow[] tempRows;

        static EquipmentList()
        {
            dsSales = new SalesDataSet();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            gvEquipmentlist.Visible = false;
        }

        protected void lbInsertEquipment_Click(object sender, EventArgs e)
        {
            string Url = "EquipmentInsert.aspx"; // change with filename you want to open in new tab
            Response.Write("<script language='javascript'>window.open('" + Url + "','_self','');");
            Response.Write("</script>");
        }

        protected void btnSearchEquipment_Click(object sender, EventArgs e)
        {
            dsSales.Clear();

            equipmentTableAdapter daReceiptView = new equipmentTableAdapter();
            customerTableAdapter daCustomer = new customerTableAdapter();
            equip_typeTableAdapter daEquipType = new equip_typeTableAdapter();
            manufacturerTableAdapter daManufacturer = new manufacturerTableAdapter();

            try
            {
                daReceiptView.Fill(dsSales.equipment);
                daCustomer.Fill(dsSales.customer);
                daEquipType.Fill(dsSales.equip_type);
                daManufacturer.Fill(dsSales.manufacturer);
            }
            catch { }

            if (dsSales.equipment.Count > 0)
            {
                string criteria = GetReceiptCriteria();

                gvEquipmentlist.Visible = true;

                rows = (criteria.Length > 0) ? dsSales.equipment.Select(criteria) : dsSales.equipment.Select();

                DataTable equipmentRecords = new DataTable();
                equipmentRecords.Columns.Add("#");
                equipmentRecords.Columns.Add("Model");
                equipmentRecords.Columns.Add("Serial");
                equipmentRecords.Columns.Add("Customer");
                equipmentRecords.Columns.Add("Type");
                equipmentRecords.Columns.Add("Manufacturer");

                foreach (DataRow r in rows)
                {
                    DataRow nr = equipmentRecords.NewRow();
                    nr[0] = r.ItemArray[0].ToString();
                    nr[1] = r.ItemArray[1].ToString();
                    nr[2] = r.ItemArray[2].ToString();
                    tempRows = dsSales.customer.Select("id =" + r.ItemArray[3].ToString());
                    nr[3] = tempRows.FirstOrDefault().ItemArray[8].ToString();
                    tempRows = dsSales.equip_type.Select("id =" + r.ItemArray[4].ToString());
                    nr[4] = tempRows.FirstOrDefault().ItemArray[1].ToString();
                    tempRows = dsSales.manufacturer.Select("id =" + r.ItemArray[5].ToString());
                    nr[5] = tempRows.FirstOrDefault().ItemArray[1].ToString();

                    equipmentRecords.Rows.Add(nr);
                }

                gvEquipmentlist.DataSource = equipmentRecords;
                gvEquipmentlist.DataBind();
            }
            else
            {
                gvEquipmentlist.Visible = false;
                this.lblStatus.Text = "No Order Records";
            }
        }

        //method to get critera relate to the Receipts - query to the database
        private string GetReceiptCriteria()
        {
            string criteria = "";

            criteria = (txtModel.Text.Length > 0) ? "equModel LIKE '%" + txtModel.Text + "%'" : "";

            criteria += (txtSerial.Text.Length > 0 && criteria.Length > 0) ? " AND equSerial LIKE '%" + txtSerial.Text + "%'"
               : (txtSerial.Text.Length > 0) ? "equSerial LIKE '%" + txtSerial.Text + "%'" : "";

            criteria += (ddlCustomer.Text != "None" && criteria.Length > 0) ? " AND custID = '" + ddlCustomer.SelectedValue.ToString() + "'"
                : (ddlCustomer.Text != "None") ? "custID = '" + ddlCustomer.SelectedValue.ToString() + "'" : "";

            criteria += (ddlType.Text != "None" && criteria.Length > 0) ? " AND equtypeID = '" + ddlType.SelectedValue.ToString() + "'"
                : (ddlType.Text != "None") ? "equtypeID = '" + ddlType.SelectedValue.ToString() + "'" : "";

            criteria += (ddlManufacturer.Text != "None" && criteria.Length > 0) ? " AND equManuID = '" + ddlManufacturer.SelectedValue.ToString() + "'"
                : (ddlManufacturer.Text != "None") ? "equManuID = '" + ddlManufacturer.SelectedValue.ToString() + "'" : "";

            return criteria;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearObjects();
        }

        //method to clear objects
        void ClearObjects()
        {
            gvEquipmentlist.Visible = false;
            txtModel.Text = "";
            txtSerial.Text = "";
            ddlCustomer.SelectedIndex = -1;
            ddlType.SelectedIndex = -1;
            ddlManufacturer.SelectedIndex = -1;
        }

        protected void gvEquipmentlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iEdit = Convert.ToInt32(gvEquipmentlist.SelectedRow.Cells[1].Text);
            Response.Redirect("EquipmentEdit.aspx?ID=" + iEdit);
        }
    }
}