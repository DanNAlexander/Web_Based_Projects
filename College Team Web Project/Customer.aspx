<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="TeamProject.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Customer</title>
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
        <h1 class="container">Customer</h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="row">

                <!------------ ROW 1 ------------>
                <div class="column">
                    <div>
                        <asp:Label ID="ManufactrerLabel" runat="server" Text="Manufacturer"></asp:Label>
                    </div>
                    <asp:DropDownList class="dropdownsize" ID="ManufacturerDropDownList" runat="server" DataSourceID="ManufacturerDataSource" DataTextField="manName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ManufacturerDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Manufacturer</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ManufacturerDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetManufacturers" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.ManufacturerTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="EquipmentTypeLabel" runat="server" Text="Equipment Type"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="EquipmentTypeDropDownList" runat="server" DataSourceID="EquipmentTypeObjectDataSource" DataTextField="eqtType" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="EquipmentTypeDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Equipment</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="EquipmentTypeObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetEquipmentType" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.Equip_typeTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="PositionLabel" runat="server" Text="Position"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="PositionDropDownList" runat="server" DataSourceID="PositionObjectDataSource" DataTextField="posName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="PositionDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Position</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="PositionObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPosition" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.PositionTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="ServiceLabel" runat="server" Text="Service"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="ServiceDropDownList" runat="server" DataSourceID="ServiceObjectDataSource" DataTextField="serName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ServiceDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Service</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ServiceObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetService" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.ServiceTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="EmployeeLabel" runat="server" Text="Employee"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="EmployeeDropDownList" runat="server" DataSourceID="EmployeeObjectDataSource" DataTextField="EmployeeFullName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="EmployeeDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Employee</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="EmployeeObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployee" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
                    <br />
                </div>

                <!------------ ROW 2 ------------>
                <div class="column">
                    <asp:Label ID="PaymemtTypeLabel" runat="server" Text="Payment Type"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="PaymentTypeDropDownList" runat="server" DataSourceID="PaymentTypeObjectDataSource" DataTextField="payType" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="PaymentTypeDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Payment Type</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="PaymentTypeObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPaymentType" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="ProductLabel" runat="server" Text="Product"></asp:Label>
                    <br />
                    <asp:DropDownList class="dropdownsize" ID="ProductDropDownList" runat="server" DataSourceID="ProductObjectDataSource" DataTextField="Product" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ProductDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
                        <asp:ListItem>Select Product</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ProductObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProduct" TypeName="PROG1210_Customer.EmmasDataSetTableAdapters.ProductTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <br />
                    <asp:Label ID="equipmentLabel" runat="server" Text="Equipment Serial Number"></asp:Label>
                    <br />
                    <asp:TextBox class="textsize" ID="equipmentTextBox" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button class="buttonsize" ID="equipmentButton" runat="server" Text="Search" OnClick="equipmentButton_Click" />
                    <br />
                    <br />
                    <asp:Label ID="onOrderLabel" runat="server" Text="OnOrder Invoice Number"></asp:Label>
                    <br />
                    <asp:TextBox class="textsize" ID="onOrderTextBox" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button class="buttonsize" ID="onOrderButton" runat="server" Text="Search" OnClick="onOrderButton_Click" />
                    <br />
                    <br />
                    <asp:Label ID="prodOrderLabel" runat="server" Text="Product Number"></asp:Label>
                    <br />
                    <asp:TextBox class="textsize" ID="prodOrderTextBox" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button class="buttonsize" ID="prodOrderButton" runat="server" Text="Search" OnClick="prodOrderButton_Click" />
                    <br />
                </div>
            </div>

            
            <!------------ DATES ROWS ------------>
            <div class="container">
                <div class="row">

                    <!------------ ROW 1 ------------>
                    <div class="column">
                        <br />
                        <asp:Label ID="serviceOrderLabel" runat="server" Text="Service Date In"></asp:Label>
                        <br />
                        <br />
                        <asp:Calendar class="container" ID="serviceOrderCalendar" runat="server" OnSelectionChanged="serviceOrderCalendar_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="240px" Width="260px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        <br />
                        <br />
                    </div>

                    <!------------ ROW 2 ------------>
                    <div class="column">
                        <br />
                        <asp:Label ID="receiptLabel" runat="server" Text="Receipt Order Date"></asp:Label>
                        <br />
                        <br />
                        <asp:Calendar class="container" ID="receiptCalendar" runat="server" OnSelectionChanged="receiptCalendar_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="240px" Width="260px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </div>
                </div>
            </div>

            <!------------RESULT CHART ------------>
            <div class="container">
                <asp:GridView class="container" ID="customerGridView" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="customerGridView_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="600px">
                    <AlternatingRowStyle BackColor="White" />
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
            </div>

        </div>
    </form>
</body>
</html>
