<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs"
    Inherits="ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        #image
        {
            background-image: url(images/canva-photo-editor.png);
            min-height: 659px;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }
        
        .style2
        {
            font-size: x-large;
        }
        .style3
        {
            color: #FFFFFF;
            font-size: x-large;
        }
        .style4
        {
            color: #FFFFFF;
        }
        .style5
        {
            color: #FF6D0D;
        }
        .style6
        {
            color: #FF6D0D;
            font-size: x-large;
        }
        .style7
        {
            color: #FFFFFF;
            font-weight: normal;
            font-family: "Times New Roman" , Times, serif;
        }
        .style8
        {
            color: #FF6D0D;
            font-weight: normal;
            font-family: "Times New Roman" , Times, serif;
        }
    </style>
</head>
<body id="image">
    <div class="row" style="height: 120px">
        <div class="col-lg-4">
            <div>
            </div>
        </div>
        <div class="col-lg-4">
            <div>
            </div>
        </div>
        <div class="col-lg-4">
            <div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div>
            </div>
        </div>
        <div class="col-lg-4 col-md-offset-210px">
            <form id="form1" runat="server" style="background: rgba(0,0,0,0.4); margin-left: 20%;
            margin-right: 20%">
            <div align="center">
                <h1 style="text-align: center; padding-top: 20px">
                    <span class="style8"><strong>F</strong></span><span class="style7"><strong>orgot</strong></span>
                    <span class="style8"><strong>P</strong></span><span class="style7"><strong>assword</strong></span>
                </h1>
                <hr />
                <strong class="style2"><span class="style5">E</span><span class="style4">mail</span></strong>
                <br />
                <br />
                <asp:TextBox ID="txtEmail" runat="server" style="border-radius:4px;"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please Enter an email" ControlToValidate="txtEmail" ForeColor="Black" Font-Bold="true" ValidationGroup="Email">
                </asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ErrorMessage="Please Enter an email like 'abc@xyz.com'" 
                    ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Black" Font-Bold="true" ValidationGroup="Email"></asp:RegularExpressionValidator>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                    Style="background-color: transparent; color: #FFFFFF; font-size: large;" Height="40px"
                    Width="80px" ValidationGroup="Email" />
                <br />
                <br />
                <asp:LinkButton ID="lbLoginPage" runat="server" OnClick="lbLoginPage_Click" ForeColor="Black" Font-Bold="true"
                    Font-Size="Medium">Login Page</asp:LinkButton>
                <br />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                <br />
                <br />
            </div>
            </form>
        </div>
        <div class="col-lg-4">
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
        </div>
        <div class="col-lg-4">
        </div>
        <div class="col-lg-4">
        </div>
    </div>
</body>
</html>