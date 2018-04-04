<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Assets_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #image
        {
            background-image:url(http://localhost/images/Coffe2.png); 
            min-height: 690px;
            -webkit-background-size:cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;       
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
    <div class="row" id="image" align="center">
        <br />
        <h1 style="color:Black;"><u><b>Assets Management</b></u></h1>
        <br />
        <%--1st Column--%>
        <div class="col-md-4" align="center">
            <br />
            <h3><b>Furniture</b></h3>
            <br />
            <asp:ImageButton ID="IBFurniture" runat="server" 
                ImageUrl="~/images/AssetsFurniture.jpg" Height="350" Width="350" onclick="IBFurniture_Click" 
                 />
        </div>
        <%--2nd Column--%>
        <div class="col-md-4" align="center">
            <br />
            <h3><b>Electronics</b></h3>
            <br />
            <asp:ImageButton ID="IBElectronics" runat="server" 
                ImageUrl="~/images/AssetsElectronics.jpg" Height="350" Width="350" onclick="IBElectronics_Click" 
                 />
        </div>
        <%--3rd Column--%>
        <div class="col-md-4" align="center">
            <br />
            <h3><b>Kitchen Appliances</b></h3>
            <br />
            <asp:ImageButton ID="IBKitchenAppliances" runat="server" 
                ImageUrl="~/images/AssetsKitchenAppliances.jpg" Height="350" Width="350" onclick="IBKitchenAppliances_Click" 
                 />
        </div>
    </div>
</asp:Content>

