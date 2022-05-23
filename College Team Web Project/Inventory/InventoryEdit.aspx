<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryEdit.aspx.cs" Inherits="appSales.InventoryEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../StyleSheetMaster.css"/>
    <title>Inventory Edit</title>
</head>
<body>
    <!-- Title Area -->
    <div>
        <img class="logoimg" src="../Images/netcomlogolight.png"/>
        <h1 class="container">&nbsp;</h1>
        <h1 class="container"><strong>Inventory Edit</strong></h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="xtracolour">
                <table class="container" style="width: 42%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorQuantity" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Size</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtSize" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorSize" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Measure</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtMeasure" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorMeasure" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorPrice" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Product</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlProductID" runat="server" DataSourceID="obsProduct" DataTextField="prodName" DataValueField="id">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorProductID" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblOutcome" runat="server" Text="" ForeColor="Green"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button class="buttonsize" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:LinkButton ID="lbInventoryList" runat="server" OnClick="lbInventoryList_Click"><strong>Inventory List</strong></asp:LinkButton>
                        </td>
                    </tr>
                </table>
        1   </div>
            <asp:ObjectDataSource ID="obsProduct" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.productTableAdapter"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>

