using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PROG1210_Customer;
using PROG1210_Customer.EmmasDataSetTableAdapters;


namespace TeamProject
{
    public partial class Customer : System.Web.UI.Page
    {
        private static EmmasDataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                equipmentButton.Visible = true;

            else
                Response.Redirect("~/Login.aspx");
        }





        protected void ManufacturerDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByManufacturerTableAdapter daManufacturer = new CustomerByManufacturerTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daManufacturer.GetCustomerByManufacturer(ManufacturerDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[2].ToString();
                nr[2] = r.ItemArray[3].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void EquipmentTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByEquipmentTypeTableAdapter daEquipmentType = new CustomerByEquipmentTypeTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daEquipmentType.GetCustomerByEquipmentType(EquipmentTypeDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[1].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[0].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void PositionDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByPositionTableAdapter daPosition = new CustomerByPositionTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daPosition.GetCustomerByPosition(PositionDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void ServiceDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByServiceTableAdapter daService = new CustomerByServiceTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daService.GetCustomerByService(ServiceDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void EmployeeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByEmployeeTableAdapter daEmployee = new CustomerByEmployeeTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daEmployee.GetCustomerByEmployee(EmployeeDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[2].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[0].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void PaymentTypeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByPaymentTypeTableAdapter daPaymentType = new CustomerByPaymentTypeTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daPaymentType.GetCustomerByPaymentType(PaymentTypeDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }

        protected void ProductDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CustomerByProductTableAdapter daProduct = new CustomerByProductTableAdapter();
            DataTable customersByEmployee = new DataTable();
            customersByEmployee.Columns.Add("ID");
            customersByEmployee.Columns.Add("Customer");
            customersByEmployee.Columns.Add("Phone Number");
            foreach (DataRow r in daProduct.GetCustomerByProduct(ProductDropDownList.SelectedIndex))
            {
                DataRow nr = customersByEmployee.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByEmployee.Rows.Add(nr);
            }
            DisplayCustomers(customersByEmployee);
        }



        protected void serviceOrderCalendar_SelectionChanged(object sender, EventArgs e)
        {
            CustomerByServiceOrderTableAdapter daServiceOrder = new CustomerByServiceOrderTableAdapter();
            DataTable customersByDate = new DataTable();
            customersByDate.Columns.Add("ID");
            customersByDate.Columns.Add("Customer");
            customersByDate.Columns.Add("Phone Number");
            foreach (DataRow r in daServiceOrder.GetCustomerByServiceOrder(serviceOrderCalendar.SelectedDate))
            {
                DataRow nr = customersByDate.NewRow();
                nr[0] = r.ItemArray[1].ToString();
                nr[1] = r.ItemArray[2].ToString();
                nr[2] = r.ItemArray[0].ToString();
                customersByDate.Rows.Add(nr);
            }
            DisplayCustomers(customersByDate);
        }

        protected void receiptCalendar_SelectionChanged(object sender, EventArgs e)
        {
            CustomerByReceiptTableAdapter daReceipt = new CustomerByReceiptTableAdapter();
            DataTable customersByDate = new DataTable();
            customersByDate.Columns.Add("ID");
            customersByDate.Columns.Add("Customer");
            customersByDate.Columns.Add("Phone Number");
            foreach (DataRow r in daReceipt.GetCustomerByReceipt(receiptCalendar.SelectedDate))
            {
                DataRow nr = customersByDate.NewRow();
                nr[0] = r.ItemArray[1].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByDate.Rows.Add(nr);
            }
            DisplayCustomers(customersByDate);
        }

        protected void equipmentButton_Click(object sender, EventArgs e)
        {
            CustomerByEquipmentTableAdapter daEmployee = new CustomerByEquipmentTableAdapter();
            DataTable customersByFirst = new DataTable();
            customersByFirst.Columns.Add("ID");
            customersByFirst.Columns.Add("Customer");
            customersByFirst.Columns.Add("Phone Number");
            foreach (DataRow r in daEmployee.GetCustomerByEquipment(equipmentTextBox.Text))
            {
                DataRow nr = customersByFirst.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[2].ToString();
                nr[2] = r.ItemArray[1].ToString();
                customersByFirst.Rows.Add(nr);
            }
            DisplayCustomers(customersByFirst);
        }



        protected void onOrderButton_Click(object sender, EventArgs e)
        {
            CustomerByOnOrderTableAdapter daOnOrder = new CustomerByOnOrderTableAdapter();
            DataTable customersByFirst = new DataTable();
            customersByFirst.Columns.Add("ID");
            customersByFirst.Columns.Add("Customer");
            customersByFirst.Columns.Add("Phone Number");
            foreach (DataRow r in daOnOrder.GetCustomerByOnOrder(onOrderTextBox.Text))
            {
                DataRow nr = customersByFirst.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByFirst.Rows.Add(nr);
            }
            DisplayCustomers(customersByFirst);
        }

        protected void prodOrderButton_Click(object sender, EventArgs e)
        {
            CustomerByProdOrderTableAdapter daProdOrder = new CustomerByProdOrderTableAdapter();
            DataTable customersByFirst = new DataTable();
            customersByFirst.Columns.Add("ID");
            customersByFirst.Columns.Add("Customer");
            customersByFirst.Columns.Add("Phone Number");
            foreach (DataRow r in daProdOrder.GetCustomerByProdOrder(prodOrderTextBox.Text))
            {
                DataRow nr = customersByFirst.NewRow();
                nr[0] = r.ItemArray[0].ToString();
                nr[1] = r.ItemArray[3].ToString();
                nr[2] = r.ItemArray[2].ToString();
                customersByFirst.Rows.Add(nr);
            }
            DisplayCustomers(customersByFirst);
        }


        private void DisplayCustomers(DataTable customers)
        {
            customerGridView.DataSource = customers;
            customerGridView.DataBind();
        }

        protected void customerGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string custid = customerGridView.SelectedRow.Cells[1].Text;
            Response.Redirect("CustomerDetail.aspx?ID=" + custid);
        }
    }
}