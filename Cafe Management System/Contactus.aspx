<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
<div class="container">
<div class="col-md-3"></div>
<div class="col-md-6">
<b>Name</b>
<asp:TextBox ID="txtName" runat="server" CssClass="form-control" placholder="Name"></asp:TextBox>
<b>Email Id</b>
<asp:TextBox ID="txtEmail" runat="server"  CssClass="form-control" placholder="abc@gmail.com"></asp:TextBox>
<b>Mobile</b>
<asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placholder="99999999999"></asp:TextBox>
<b>Message </b>
<asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placholder="Message" TextMode="MultiLine" Rows="5"></asp:TextBox>
<asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" 
        onclick="btnSubmit_Click" />
<br />
<asp:Label ID="lblStatus" runat="server"></asp:Label>
</div>
<div class="col-md-3"></div>
</div>
</asp:Content>

