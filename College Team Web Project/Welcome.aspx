<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="PROG1210Web.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Welcome</title>
</head>
<body>
    <!-- Title Area -->
    <form class="container" id="form1" runat="server">
    <div>
        <img class="logoimg" src="Images/netcomlogolight.png"/>
        <h1 class="container">&nbsp;</h1>
        <h1 class="container">Welcome
            <asp:Label ID="lblUserName" runat="server"></asp:Label>
        </h1>
        <br />
        <asp:Label ID="lblProceed" runat="server" Font-Size="Large" Text="Do you want to proceed?"></asp:Label>
        <br />
        <br />
        <br />
    </div>
            <asp:Button class="buttonsize" ID="btnProceed" runat="server" OnClick="btnSubmit_Click" Text="Proceed" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button class="buttonsize" ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
    </form>
</body>
</html>
