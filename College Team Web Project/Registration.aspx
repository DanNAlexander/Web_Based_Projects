<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PROG1210Web.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Registration</title>
</head>
<body>
    <!-- Title Area -->
    <div>
        <img class="logoimg" src="Images/netcomlogolight.png">
        <h1 class="container"><strong>Registration</strong></h1>
        <br />
    </div>
    <form id="form1" runat="server">
    <div class="container">
    
        <h2>&nbsp;</h2>
        <h2>Create New User</h2><br />
        <div class="xtracolour">
            <br />
            <table class="container" style="width: 42%;">
                <tr>
                    <td>First Name:</td>
                    <td>
                        <asp:TextBox ID="txtFirst" runat="server" Width="165px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>
                        <asp:TextBox ID="txtLast" runat="server" Width="165px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Position:</td>
                    <td>
                        <asp:DropDownList ID="ddlPosition" runat="server" DataSourceID="ObjectPosition" DataTextField="posName" DataValueField="id" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" Width="165px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="165px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td>
                        <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="165px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
        </div>

        <br />
        <asp:Button class="buttonsize" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />    
    
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirm" ErrorMessage="Password does not match" SetFocusOnError="True"></asp:CompareValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" ErrorMessage="Must confirm password" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFirst" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLast" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ddlPosition" ErrorMessage="Position is required"></asp:RegularExpressionValidator>

      <asp:ObjectDataSource ID="ObjectPosition" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PROG1210.EmmasDataSetTableAdapters.PositionTableAdapter"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
