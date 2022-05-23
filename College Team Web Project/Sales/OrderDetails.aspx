<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="appSales.Sales.OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../StyleSheetMaster.css"/>
    <title>Order Details</title>
</head>
<body>
    <!-- Title Area -->
    <div>
        <img class="logoimg" src="../Images/netcomlogolight.png"/>
        <h1 class="container"><strong>Order Details</strong></h1>
        <br />
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="xtracolour">
            <br />
            <asp:LinkButton ID="lbSalesList" runat="server" OnClick="lbSalesList_Click"><strong>Sales List</strong></asp:LinkButton>
            <br />
            <br />
                <table class="container" style="width: 42%;">
                    <tr>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td>Receipt:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lblTempNumReceiptID" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblProduct" runat="server" Text="Product:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlProduct" runat="server" AppendDataBoundItems="True" DataSourceID="obsProduct" DataTextField="prodName" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                                <asp:ListItem Value="0">None</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:Label ID="lblErrorProduct" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Payment:</td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:DropDownList class="dropdownsize" ID="ddlPayment" runat="server" AppendDataBoundItems="True" DataSourceID="obsPayment" DataTextField="payType" DataValueField="id" Enabled="False">
                                <asp:ListItem Value="0">None</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblUnitPrice" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorPayment" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Customer:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlCustomer" runat="server" AppendDataBoundItems="True" DataSourceID="obsCustomer" DataTextField="FullName" DataValueField="id" Enabled="False">
                                <asp:ListItem Value="0">None</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblQuantity" runat="server" Text="Quantity:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="auto-style1">
                            <asp:Label ID="lblErrorCustomer" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            </td>
                        <td colspan="3">
                            <asp:Label ID="lblErrorQuanity" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Employee:</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:DropDownList class="dropdownsize" ID="ddlEmployee" runat="server" AppendDataBoundItems="True" DataSourceID="obsEmployee" DataTextField="FullName" DataValueField="id" Enabled="False">
                                <asp:ListItem Value="0">None</asp:ListItem>      
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lblNote" runat="server" Text="Note:"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtNote" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblErrorEmployee" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            <asp:Label ID="lblErrorNote" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                            <asp:Label ID="lblOutcome" runat="server" Text="" ForeColor="Green"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button class="buttonsize" ID="btnAddDetail" runat="server" Text="Add Product" OnClick="btnAddDetail_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <br />
                            <asp:Label ID="lblTitleDetails" runat="server" Font-Size="XX-Large" Text="Receipt Details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="7">
                    
                            <asp:GridView class="container" ID="gvDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="obsOrderLineGV" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:TemplateField HeaderText="Price" SortExpression="orlPrice">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("orlPrice") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("orlPrice") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                                    <asp:BoundField DataField="orlNote" HeaderText="Note" SortExpression="orlNote" />
                                    <asp:TemplateField HeaderText="Product" SortExpression="inventoryID">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="obsProduct" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' Enabled="False">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="obsProduct" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("inventoryID") %>' Enabled="False">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Receipt" SortExpression="receiptID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("receiptID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("receiptID") %>'></asp:Label>
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
                    
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                        <td class="auto-style1">
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text="Total:"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblTotalReceipt" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </div>

        </div>

        <div class="container"></div>
        <asp:ObjectDataSource ID="obsPayment" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.paymentTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_payType" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="payType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="payType" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_payType" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
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
        <asp:ObjectDataSource ID="obsEmployee" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.employeeTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_empFirst" Type="String" />
                <asp:Parameter Name="Original_empLast" Type="String" />
                <asp:Parameter Name="Original_posID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="empFirst" Type="String" />
                <asp:Parameter Name="empLast" Type="String" />
                <asp:Parameter Name="posID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_empFirst" Type="String" />
                <asp:Parameter Name="Original_empLast" Type="String" />
                <asp:Parameter Name="Original_posID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:ObjectDataSource ID="obsProduct" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.productTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="obsOrderLineGV" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="librarySales.SalesDataSetTableAdapters.order_line_GVTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="orlPrice" Type="Decimal" />
                <asp:Parameter Name="orlQuantity" Type="Int32" />
                <asp:Parameter Name="orlOrderReq" Type="Boolean" />
                <asp:Parameter Name="orlNote" Type="String" />
                <asp:Parameter Name="inventoryID" Type="Int32" />
                <asp:Parameter Name="receiptID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblTempNumReceiptID" Name="Param1" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="orlPrice" Type="Decimal" />
                <asp:Parameter Name="orlQuantity" Type="Int32" />
                <asp:Parameter Name="orlOrderReq" Type="Boolean" />
                <asp:Parameter Name="orlNote" Type="String" />
                <asp:Parameter Name="inventoryID" Type="Int32" />
                <asp:Parameter Name="receiptID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
    </form>
</body>
</html>
