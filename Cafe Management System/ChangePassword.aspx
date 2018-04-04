<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

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
    <div class="row" style="height: 40px">
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
                    <span class="style8"><strong>C</strong></span><span class="style7"><strong>hange</strong></span>
                    <span class="style8"><strong>P</strong></span><span class="style7"><strong>assword</strong></span>
                </h1>
                <hr />
                <br />
                <asp:Label ID="lblSecurityQuestion" runat="server" 
                    Text="Selecct your security question" 
                    style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:DropDownList ID="ddlSecurityQuestion" runat="server">
                <asp:ListItem>Please Select Your Security Question</asp:ListItem>
                <asp:ListItem>What was your childhood nickname?</asp:ListItem>
                <asp:ListItem>In what city or town did your mother and father meet?</asp:ListItem>
                <asp:ListItem>What is your favorite team?</asp:ListItem>
                <asp:ListItem>What school did you attend for sixth grade?</asp:ListItem>
                <asp:ListItem>In what town was your first job?</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="rfvSecurityQuestion" runat="server" ErrorMessage="Plase select one of the sequrity question"
                                ControlToValidate="ddlSecurityQuestion" ForeColor="Black" Font-Bold="true" ValidationGroup="Password"
                                InitialValue="Please Select Your Security Question">
                            </asp:RequiredFieldValidator>
                <br />
                <%--Security Answer--%>
                <asp:Label ID="lblSecurityAns" runat="server" Text="Security Answer" 
                    style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtSecurityAns" runat="server" Style="border-radius: 4px;"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvSecurityAns" runat="server" ErrorMessage="Please enter your old password"
                    ControlToValidate="txtSecurityAns" ForeColor="Black" Font-Bold="true" ValidationGroup="Password">
                </asp:RequiredFieldValidator>
                <br />
                <%--New Password--%>
                <asp:Label ID="lblNewPasswd" runat="server" Text="New Password" 
                    style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtNewPasswd" runat="server" Style="border-radius: 4px;" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvNewPasswd" runat="server" ErrorMessage="Please Enter a new password"
                    ControlToValidate="txtNewPasswd" ForeColor="Black" Font-Bold="true" ValidationGroup="Password">
                </asp:RequiredFieldValidator>
                <br />
                <%--Confirm Password--%>
                <asp:Label ID="lblConfirmPasswd" runat="server" Text="Confirm Password" 
                    style="font-size: large; font-weight: 700"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtConfirmPasswd" runat="server" Style="border-radius: 4px;" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvConfirmPasswd" runat="server" ErrorMessage="Please re type your password"
                    ControlToValidate="txtConfirmPasswd" ForeColor="Black" Font-Bold="true" ValidationGroup="Password">
                </asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cmptxtConfirmPasswd" runat="server" ErrorMessage="Password did not match"
                    ControlToCompare="txtNewPasswd" ControlToValidate="txtConfirmPasswd" ValidationGroup="Password" Font-Bold="true" ></asp:CompareValidator>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Style="background-color: transparent;
                    color: #FFFFFF; font-size: large;" Height="40px" Width="80px" 
                    ValidationGroup="Password" onclick="btnSubmit_Click" />
                <br />
                <br />
                <asp:LinkButton ID="lbLoginPage" runat="server" ForeColor="White" Font-Bold="true"
                    Font-Size="Medium" onclick="lbLoginPage_Click">Login Page</asp:LinkButton>
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
