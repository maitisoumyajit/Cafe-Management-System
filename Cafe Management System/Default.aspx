<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    #image
    {
        background-image:url(images/canva-photo-editor.png); 
min-height: 659px;
background-size: cover;
-webkit-background-size:cover;
-moz-background-size: cover;
-o-background-size: cover;
-ms-background-size: cover;
position: relative;       }
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
            font-family: "Times New Roman", Times, serif;
        }
        .style8
        {
            color: #FF6D0D;
            font-weight: normal;
            font-family: "Times New Roman", Times, serif;
        }
 </style>
</head>
<body id="image">
    <div class="row"  style="height:120px">
        <div class="col-lg-4">
            <div></div>
        </div>
        <div class="col-lg-4">
            <div></div>
        </div>
        <div class="col-lg-4">
            <div></div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div></div>
        </div>
        <div class="col-lg-4 col-md-offset-210px">
            <form id="form1" runat="server" style="background:rgba(0,0,0,0.4);margin-left:20%;margin-right:20%">
                <div align="center">   
                    <h1 style="text-align:center;padding-top:20px"><span class="style8"><strong>L</strong></span><span class="style7"><strong>ogin</strong></span></h1>
                    <hr />
                    <strong class="style2"><span class="style5">U</span><span class="style4">sername</span></strong><br />
                    <asp:TextBox ID="txtUsrName" runat="server"  style="border-radius:4px;background-color:transparent;color:White"></asp:TextBox>
                    <br />
                    <br />
                    <strong><span class="style6">P</span><span class="style3">assword</span></strong><br />
                    <asp:TextBox ID="txtPasswd" runat="server" TextMode="Password" style="border-radius:4px;background-color:transparent;color:White"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="Button1_Click"   
                        style="background-color:transparent; color: #FFFFFF; font-size: large;" 
                        Height="40px" Width="80px" />
                    <br /> 
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                    Font-Size="Medium" style="color:White">Forgot Password</asp:LinkButton>
                    <br />
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="true"></asp:Label>
                    <br />
                    <br />
                </div>
            </form>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4"></div>
        <div class="col-lg-4"></div>
    </div>
</body>
</html>
