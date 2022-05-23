<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetail.aspx.cs" Inherits="TeamProject.CustomerDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Customer Detail</title>
</head>
<body>
    <!-- NAV BAR -->
    <img class="logoimg" src="Images/netcomlogolight.png"/>
        &nbsp;<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Product.aspx">Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Equipment/EquipmentList.aspx">Equipment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Inventory/InventoryList.aspx">Inventory</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Manufacturer.aspx">Manufacturer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Customer.aspx">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Sales/SalesList.aspx">Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Payment.aspx">Payment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="Position.aspx">Position</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Title Area -->
    <div>
        <br />
        <h1 class="container">Customer Detail</h1>
        <br />
    </div>

    <!-------- CUSTOMER INFO -------->
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <asp:FormView class="container xtracolour" ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1" Height="217px" Width="566px">
                
                <EditItemTemplate>
                    <div class="column">
                        <br />
                        id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        <br />
                        custFirst:
                        <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                        <br />
                        <br />
                        custLast:
                        <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                        <br />
                        <br />
                        custPhone:
                        <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                        <br />
                        <br />
                    </div>
                    <div class="column">
                        <br />
                        custAddress:
                        <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                        <br />
                        <br />
                        custCity:
                        <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                        <br />
                        <br />
                        custPostal:
                        <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                        <br />
                        <br />
                        custEmail:
                        <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                        <br />
                        <br />
                    </div> 
                    <div class="container">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </EditItemTemplate>
                
            
                <InsertItemTemplate>
                    <div class="column">
                        custFirst:
                        <asp:TextBox ID="custFirstTextBox" runat="server" Text='<%# Bind("custFirst") %>' />
                        <br />
                        <br />
                        custLast:
                        <asp:TextBox ID="custLastTextBox" runat="server" Text='<%# Bind("custLast") %>' />
                        <br />
                        <br />
                        custPhone:
                        <asp:TextBox ID="custPhoneTextBox" runat="server" Text='<%# Bind("custPhone") %>' />
                        <br />
                        <br />
                        custAddress:
                        <asp:TextBox ID="custAddressTextBox" runat="server" Text='<%# Bind("custAddress") %>' />
                        <br />
                        <br />
                    </div>

                    <div class="column">
                        custCity:
                        <asp:TextBox ID="custCityTextBox" runat="server" Text='<%# Bind("custCity") %>' />
                        <br />
                        <br />
                        custPostal:
                        <asp:TextBox ID="custPostalTextBox" runat="server" Text='<%# Bind("custPostal") %>' />
                        <br />
                        <br />
                        custEmail:
                        <asp:TextBox ID="custEmailTextBox" runat="server" Text='<%# Bind("custEmail") %>' />
                    </div>
                    <br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                
          
                <ItemTemplate>
                    <div class="column">
                        id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        <br />
                        custFirst:
                        <asp:Label ID="custFirstLabel" runat="server" Text='<%# Bind("custFirst") %>' />
                        <br />
                        <br />
                        custLast:
                        <asp:Label ID="custLastLabel" runat="server" Text='<%# Bind("custLast") %>' />
                        <br />
                        <br />
                        custPhone:
                        <asp:Label ID="custPhoneLabel" runat="server" Text='<%# Bind("custPhone") %>' />
                        <br />
                        <br />
                    </div>

                    <div class="column">
                        custAddress:
                        <asp:Label ID="custAddressLabel" runat="server" Text='<%# Bind("custAddress") %>' />
                        <br />
                        <br />
                        custCity:
                        <asp:Label ID="custCityLabel" runat="server" Text='<%# Bind("custCity") %>' />
                        <br />
                        <br />
                        custPostal:
                        <asp:Label ID="custPostalLabel" runat="server" Text='<%# Bind("custPostal") %>' />
                        <br />
                        <br />
                        custEmail:
                        <asp:Label ID="custEmailLabel" runat="server" Text='<%# Bind("custEmail") %>' />
                    </div>

                    <br />
                    <br />
                    <div class="container">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
            <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomersById" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.CustomerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="Param1" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        </div>
        
        <!-------- RESULT TABLE -------->
        <br />
        <br />
        <div class="container">
        <asp:GridView class="container" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Expr1" DataSourceID="ObjectDataSource2" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                <asp:BoundField DataField="paymentID" HeaderText="paymentID" SortExpression="paymentID" />
                <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                <asp:BoundField DataField="payType" HeaderText="payType" SortExpression="payType" />
                <asp:BoundField DataField="CustomerFull" HeaderText="CustomerFull" ReadOnly="True" SortExpression="CustomerFull" />
                <asp:BoundField DataField="EmployeeFull" HeaderText="EmployeeFull" ReadOnly="True" SortExpression="EmployeeFull" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetReceiptByCustomer" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.ReceiptByCustomerTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="Param1" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>        
        </div>

    </div>
    </form>
</body>
</html>
