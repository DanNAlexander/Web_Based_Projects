<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Position.aspx.cs" Inherits="PROG1210Web.Position" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Position</title>
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
        <h1 class="container">Position</h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row xtracolour">
                <div class="column">
                    <br />
                    Select a position:<br />
                    <br />
                    <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id" Width="130px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    <br />
                    <br />
                    <br />
                </div>
                <div class="column">
                    <br />
                    <p class="column">
                        Selected position:
                    </p>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DetailsView ID="dvPosition" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsPosition" Height="50px" Width="318px">
                        <Fields>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="posName" HeaderText="Name" SortExpression="posName" />
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>

                <br />
            <div class="container">
                Corresponding employee:
                &nbsp;<br />
                <asp:GridView class="container" ID="gvEmployee" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsEmployee" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
                        <asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
                        <asp:TemplateField HeaderText="Position" SortExpression="posID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsPosition" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
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
                <asp:ObjectDataSource ID="odsPosition" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.PositionTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="posName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="posName" Type="String" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsEmployee" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.EmployeeTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="empFirst" Type="String" />
                        <asp:Parameter Name="empLast" Type="String" />
                        <asp:Parameter Name="posID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlPosition" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="empFirst" Type="String" />
                        <asp:Parameter Name="empLast" Type="String" />
                        <asp:Parameter Name="posID" Type="Int32" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>