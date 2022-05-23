<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PROG1210Web.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Payment</title>
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
        <h1 class="container">Payment</h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row xtracolour">
                <div class="column">
                    <br />
                    Select a Payment:<br />
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="ddlPayment" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" Width="180px" Height="28px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button class="buttonsize" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    <br />
                    <br />
                    <br />
                </div>
                <div class="column">
                    <br />
                    <p class="column">
                        Selected Payment:
                    </p>

                    <asp:DetailsView ID="dvPayment" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsPayment" Height="60px" Width="320px">
                        <Fields>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="payType" HeaderText="Type" SortExpression="payType" />
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <br />
                </div>
            </div>
                <div class="container">
                    <br />
                    <br />
                    Corresponding Receipt:
                    <br />
                    <br />
                    <asp:GridView class="container" ID="gvReceipt" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsReceipt" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="ordNumber" HeaderText="Order Number" SortExpression="ordNumber" />
                        <asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Order Date" SortExpression="ordDate" />
                        <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                        <asp:TemplateField HeaderText="Payment" SortExpression="paymentID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="odsCustomerLookUp" DataTextField="custFull" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="odsCustomerLookUp" DataTextField="custFull" DataValueField="id" SelectedValue='<%# Bind("custID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="odsEmployeeLookUp" DataTextField="empFull" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="odsEmployeeLookUp" DataTextField="empFull" DataValueField="id" SelectedValue='<%# Bind("empID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                    <br />
                <br />
                <asp:ObjectDataSource ID="odsPayment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.PaymentTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="payType" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="payType" Type="String" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsReceipt" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.ReceiptTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ordNumber" Type="String" />
                        <asp:Parameter Name="ordDate" Type="DateTime" />
                        <asp:Parameter Name="ordPaid" Type="Boolean" />
                        <asp:Parameter Name="paymentID" Type="Int32" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="empID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPayment" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ordNumber" Type="String" />
                        <asp:Parameter Name="ordDate" Type="DateTime" />
                        <asp:Parameter Name="ordPaid" Type="Boolean" />
                        <asp:Parameter Name="paymentID" Type="Int32" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsCustomerLookUp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.CustomerLookUpTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsEmployeeLookUp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.EmployeeLookUpTableAdapter"></asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>