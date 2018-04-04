<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Goods.aspx.cs" Inherits="Finance_Bills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#image
    {
        background-image:url(http://localhost/images/Coffe2.png); 
        min-height: 590px;
        -webkit-background-size:cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        -ms-background-size: cover;
        position: relative;       
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
<div align="center" class="row" id="image">
    <br />
        <h1 style="color:Black;"><u><b>Goods Management</b></u></h1>
    <br />
    <br />
    <%--1st Column--%>

    <div class="col-md-6" align="center">
        <h3 style="color:Black;"><u><b>Inventory</b></u></h3><br />
        <asp:ImageButton ID="IBInventory" runat="server" 
            ImageUrl="~/images/FinanceGoods.jpg" onclick="IBInventory_Click" height="350" width="350" />
    </div>

    <%--2nd Column--%>
        
    <div class="col-md-6" align="center">
        <h3 style="color:Black;"><u><b>Supplier Details</b></u></h3><br />
        <asp:ImageButton ID="IBSupplierDetails" runat="server" 
            ImageUrl="~/images/Supplier_Details.jpg" onclick="IBSupplierDetails_Click" height="350" width="350"/>
    </div>
</div>
</asp:Content>

