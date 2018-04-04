<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Customer_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #image
        {
            background-image: url(http://localhost/images/Coffe2.png);
            min-height: 690px;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="Server">
    <div class="row" align="center" id="image">
        <br />
        <h1 style="color:Black;"><u><b>Customer Management</b></u></h1>
        <br />
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Bill Details</b></h3>
            <br />
            <asp:ImageButton ID="ibBillDetails" runat="server" Height="350" Width="350" 
                onclick="ibBillDetails_Click" ImageUrl="~/images/UBM_Icon.png" />
        </div>
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Bill Management</b></h3>
            <br />
            <asp:ImageButton ID="ibBillManagement" runat="server" Height="350" Width="350" 
                onclick="ibBillManagement_Click" ImageUrl="~/images/Bill.jpg" />
        </div>
    </div>
</asp:Content>
