<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="PROG1210Web.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Product</title>
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
        <h1 class="container">Product</h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row xtracolour">
                <div class="column">
                    <br />
                    <br />
                    Select a Product:<br />
                    <br />
                    <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="odsProduct" DataTextField="prodNameBrand" DataValueField="id" Width="200px">
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
                        Selected Product:
                    </p>
                    <asp:DetailsView ID="dvProduct" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsProduct" Height="50px" Width="390px">
                        <Fields>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
                            <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                            <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
            <br />

            <div class="container">
                <p>
                    <strong>Corresponding Inventory:</strong>
                </p>

                <asp:GridView class="container" ID="gvInventory" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsInventory" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="invQuantity" HeaderText="Quantity" SortExpression="invQuantity" />
                        <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
                        <asp:BoundField DataField="invMeasure" HeaderText="Measure" SortExpression="invMeasure" />
                        <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" DataFormatString="{0:0.00}" />
                        <asp:TemplateField HeaderText="Product" SortExpression="productID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="odsProduct" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsProduct" DataTextField="prodNameBrand" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
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
                    <asp:ObjectDataSource ID="odsProduct" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.ProductTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="prodName" Type="String" />
                            <asp:Parameter Name="prodDescription" Type="String" />
                            <asp:Parameter Name="prodBrand" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="prodName" Type="String" />
                            <asp:Parameter Name="prodDescription" Type="String" />
                            <asp:Parameter Name="prodBrand" Type="String" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsInventory" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.InventoryTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProduct" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>