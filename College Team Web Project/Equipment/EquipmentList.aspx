<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentList.aspx.cs" Inherits="appSales.Equipment.EquipmentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../StyleSheetMaster.css"/>
    <title>Equipment</title>
</head>
<body>
    <!-- NAV BAR -->
    <img class="logoimg" src="../Images/netcomlogolight.png"/>
        &nbsp;<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Product.aspx">Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="EquipmentList.aspx">Equipment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Inventory/InventoryList.aspx">Inventory</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Manufacturer.aspx">Manufacturer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Customer.aspx">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Sales/SalesList.aspx">Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Payment.aspx">Payment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Position.aspx">Position</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Title Area -->
    <div>
        <h1 class="container">&nbsp;</h1>
        <h1 class="container"><strong>Equipment List</strong></h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="xtracolour">
                <br />
                <table class="container" style="width: 42%;">
                    <tr>
                        <td>Model:</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Serial:</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtSerial" runat="server"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Customer:</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlCustomer" runat="server" DataSourceID="obsCustomer" DataTextField="FullName" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem>None</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Type:</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlType" runat="server" DataSourceID="obsType" DataTextField="eqtType" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem>None</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Manufacturer:</td>
                        <td>
                           &nbsp;
                         </td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlManufacturer" runat="server" DataSourceID="obsManufacturer" DataTextField="manName" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem>None</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br />
                    </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button class="buttonsize" ID="btnSearchEquipment" runat="server" OnClick="btnSearchEquipment_Click" Text="Search" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button class="buttonsize" ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
                        </td>
                    </tr>
                </table>                
                <br />
            </div>


            <br />
            <br />
            <asp:LinkButton ID="lbInsertEquipment" runat="server" OnClick="lbInsertEquipment_Click"><strong>Insert Equipment</strong></asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <div class="container">
                <asp:GridView class="container" ID="gvEquipmentlist" runat="server" OnSelectedIndexChanged="gvEquipmentlist_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField HeaderText="Actions" SelectText="Edit" ShowHeader="True" ShowSelectButton="True" />
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
            </div>
            <br />
            <asp:ObjectDataSource ID="obsCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_custFirst" Type="String" />
                    <asp:Parameter Name="Original_custLast" Type="String" />
                    <asp:Parameter Name="Original_custPhone" Type="String" />
                    <asp:Parameter Name="Original_custAddress" Type="String" />
                    <asp:Parameter Name="Original_custCity" Type="String" />
                    <asp:Parameter Name="Original_custPostal" Type="String" />
                    <asp:Parameter Name="Original_custEmail" Type="String" />
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
                <UpdateParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_custFirst" Type="String" />
                    <asp:Parameter Name="Original_custLast" Type="String" />
                    <asp:Parameter Name="Original_custPhone" Type="String" />
                    <asp:Parameter Name="Original_custAddress" Type="String" />
                    <asp:Parameter Name="Original_custCity" Type="String" />
                    <asp:Parameter Name="Original_custPostal" Type="String" />
                    <asp:Parameter Name="Original_custEmail" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="obsType" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.equip_typeTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_eqtType" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="eqtType" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="eqtType" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_eqtType" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="obsManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.manufacturerTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_manName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="manName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="manName" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                    <asp:Parameter Name="Original_manName" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <br />
        </div>
    </form>
</body>
</html>
