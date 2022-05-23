<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PROG1210Web.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>    
    <link rel="stylesheet" href="StyleSheetMaster.css"/>
    <title>Home</title>
</head>
<body>
    <!-- NAV BAR -->
    <img class="logoimg" src="Images/netcomlogolight.png"/><form id="form1" runat="server">
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
                        <a class="nav-link active" aria-current="page" href="Position.aspx">Position</a></li>
                    <li class="nav-item">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Title Area -->
    <div>
        <br />
        <h1 class="container">Home - NetCom Solutions</h1>
        <br />
    </div>

        <div class="container xtracolour">
            <h2>&nbsp;</h2>
            <h2>Selling Proposition</h2>
            <p>Call me Ishmael. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world.</p>
            <br />
            <hr/>
            <br />
            <h2>Product Shots</h2>
            <p>Call me Ishmael. Some years ago - never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world.</p>
            <br />
            <!-- IMAGES -->
            <section id="boxes">
              <div class="container">
                <div class="box">
                  <img alt="Lawn Mowers" src="Images/mower.jpg"/>
                  <h2>Lawn Mowers</h2>
                </div>
                <div class="box">
                  <img alt="Lawn Trimmers" src="Images/lawntrimmer.jpg"/>
                  <h2>Lawn Trimmers</h2>
                </div>
                <div class="box">
                  <img alt="Tractor Mowers" src="Images/tractormower.png"/>
                  <h2>Tractor Mowers</h2>
                </div>
              </div>
            </section>
        </div>
    </form>
</body>
</html>
