<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manufacturer.aspx.cs" Inherits="PROG1210Web.Manufacturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Manufacturer</title>
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
        <h1 class="container"><strong>Manufacturer</strong></h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row xtracolour">

                <div class="column">
                    <br />
                    Select a Manufacturer:<br />
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="ddlManufacturer" runat="server" DataSourceID="odsManufacturer" DataTextField="manName" DataValueField="id" Width="180px" Height="22px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button class="buttonsize" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    <br />
                </div>
                <div class="column">
                    <br />
                    <p class="column">
                        Selected Manufacturer:        
                    </p>
                    <br />
                    <asp:DetailsView ID="dvManufacturer" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsManufacturer" Height="50px" Width="420px">
                        <Fields>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="manName" HeaderText="Name" SortExpression="manName" />
                            <asp:CommandField ShowEditButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <br />
                </div>
            </div>
        </div>
                <br />
                <!-- EQUIPMENT CHART -->
                <br />
            <div class="container">
                <p>
                    <strong>Corresponding Equipment:</strong>
                </p>
                <br />
                &nbsp;<asp:GridView class="container" ID="gvEquipment" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsEquipment" Height="195px" Width="776px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="equModel" HeaderText="Model" SortExpression="equModel" />
                        <asp:BoundField DataField="equSerial" HeaderText="Serial" SortExpression="equSerial" />
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
                        <asp:TemplateField HeaderText="Equipment Type" SortExpression="equtypeID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="odsEquip_TypeLookUp" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equtypeID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="odsEquip_TypeLookUp" DataTextField="eqtType" DataValueField="id" SelectedValue='<%# Bind("equtypeID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Manufacturer" SortExpression="equManuID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="odsManufacturer" DataTextField="manName" DataValueField="id" SelectedValue='<%# Bind("equManuID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="odsManufacturer" DataTextField="manName" DataValueField="id" SelectedValue='<%# Bind("equManuID") %>'>
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
            </div>
                <br />
                <asp:ObjectDataSource ID="odsManufacturer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.ManufacturerTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="manName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="manName" Type="String" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsEquipment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.EquipmentTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="equModel" Type="String" />
                        <asp:Parameter Name="equSerial" Type="String" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="equtypeID" Type="Int32" />
                        <asp:Parameter Name="equManuID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlManufacturer" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="equModel" Type="String" />
                        <asp:Parameter Name="equSerial" Type="String" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="equtypeID" Type="Int32" />
                        <asp:Parameter Name="equManuID" Type="Int32" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsCustomerLookUp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.CustomerLookUpTableAdapter"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsEquip_TypeLookUp" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.Equip_TypeLookUpTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>