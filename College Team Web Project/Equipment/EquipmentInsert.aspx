<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentInsert.aspx.cs" Inherits="appSales.Equipment.EquipmentInsert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../StyleSheetMaster.css"/>
    <title>Equipment Insert</title>
</head>
<body>
    <!-- Title Area -->
    <div>
        <img class="logoimg" src="../Images/netcomlogolight.png"/>
        <h1 class="container">&nbsp;</h1>
        <h1 class="container"><strong>Equipment List</strong></h1>
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
                        <td>Model:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorModel" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Serial:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtSerial" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorSerial" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Customer:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlCustomer" runat="server" DataSourceID="obsCustomer" DataTextField="FullName" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">None</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorCustomer" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Type:</td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:DropDownList class="dropdownsize" ID="ddlType" runat="server" DataSourceID="obsType" DataTextField="eqtType" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">None</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorType" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Manufacturer:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlManufacturer" runat="server" DataSourceID="obsManufacturer" DataTextField="manName" DataValueField="id" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">None</asp:ListItem>      
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorManufacturer" runat="server" Text="" ForeColor="Red"></asp:Label>
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
                            <asp:LinkButton ID="EquipmentList" runat="server" OnClick="lbEquipmentList_Click"><strong>Equipment List</strong></asp:LinkButton>
                        </td>
                    </tr>
                </table>
                  <br />
            </div>  

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
        </div>
    </form>
</body>
</html>
