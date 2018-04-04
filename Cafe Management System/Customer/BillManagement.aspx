<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="BillManagement.aspx.cs" Inherits="Customer_Home" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.
        function isNumber(evt) {
            var iKeyCode = (evt.which) ? evt.which : evt.keyCode
            if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                return false;

            return true;
        }    
    </script>
    <style type="text/css">
        #image
        {
            background-image: url(http://localhost/images/Coffe2.png);
            min-height: 650px;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="Server">
    <div class="row" id="image" align="center">
        <br />
        <h1>
            <b><u>Bill Management</u></b></h1>
        <br />
        <div class="col-md-4" align="center">
            <br />
            <h3 style="color: Black">
                Menu</h3>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" Height="250px"
                Width="300px" BorderStyle="Double" Font-Bold="True" Font-Size="Large" BorderColor="Black"
                BorderWidth="2px" Style="color: Black">
            </asp:GridView>
        </div>
        <div class="col-md-4" align="center">
            <br />
            <asp:DropDownList ID="ddlItems" runat="server" Height="29px" Width="126px" ViewStateMode="Enabled">
            </asp:DropDownList>
            <br />
            <br />
            <h3>
                Quantity
            </h3>
            <br />
            <asp:TextBox ID="txtQty" runat="server" Width="48px" Height="35" onkeypress="javascript:return isNumber(event)"
                MaxLength="10"></asp:TextBox>
            &nbsp;
          <%--  <asp:Button ID="btnAToC" runat="server" Text="AToC" Style="background-color: transparent;
                color: #FFFFFF; font-size: small;" Height="28px" Width="48px" OnClick="btnAToC_Click"
                ValidationGroup="G1" UseSubmitBehavior="False" />--%>
            <asp:ImageButton ID="IBAToC" runat="server" ImageAlign="Middle" 
                ImageUrl="~/images/AddToCart.jpg" Height="30" Width="45"
            ValidationGroup="G1" UseSubmitBehavior = "false" onclick="IBAToC_Click" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ValidationGroup="G1" ControlToValidate="txtQty"></asp:RequiredFieldValidator>
            
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
                Style="background-color: transparent; color: #FFFFFF; font-size: large;" Height="40px"
                Width="80px" /><br />
            <asp:Label ID="lblPrice" runat="server" ForeColor="orange" Text=""></asp:Label><br />
            <asp:Label ID="lblTotal" runat="server" ForeColor="orange" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Style="text-align: center"><h3><u>SELECTED ITEMS</u></h3></asp:Label>
            <br />
            <asp:TextBox ID="txtItems" runat="server" TextMode="MultiLine" Style="height: 150px;
                width: 40%; text-align: center; font-size: larger; font-weight: bold"></asp:TextBox><br />
        </div>
        <%--3rd div--%>
        <div class="col-md-4" align="center">
            <br />
            <h3>
                <u>FINAL BILL</u></h3>
            <br />
            <asp:TextBox ID="txtBill" runat="server" TextMode="MultiLine" Style="height: 400px;
                width: 90%" ReadOnly="True"></asp:TextBox>
        </div>
    </div>
</asp:Content>
