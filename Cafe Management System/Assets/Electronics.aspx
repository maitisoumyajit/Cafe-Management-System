<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="Electronics.aspx.cs" Inherits="Assets_Electronics" %>

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
            min-height: 690px;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }
        
        .centerHeaderText th {
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="Server">
    <div align="center" id="image">
        <h3 style="color: Black;">
            <b>Electronics</b></h3>
        <br />
        <asp:GridView ID="GridViewE" runat="server" AutoGenerateColumns="False" Height="65px"
            Width="500px" BorderStyle="None" Font-Bold="True" Font-Size="Large" BorderWidth="1px"
            Style="color: Black; text-align: center" DataKeyNames="EItemId" DataSourceID="SqlDataSource1"
            ShowFooter="True" BackColor="Transparent" CellPadding="3" 
            AllowPaging="True">
            <AlternatingRowStyle BackColor="Transparent" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                        /
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                        /
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" ForeColor="Black" Font-Bold="true" OnClientClick="return confirm('Do you want to delete??');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Id" InsertVisible="False" SortExpression="EItemId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EItemId") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("EItemId") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" ValidationGroup="Insert" OnClick="lnkAdd_Click"
                            ForeColor="Black" Font-Bold="true">Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Name" SortExpression="EItemName" HeaderStyle-CssClass="centerHeaderText">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EItemName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("EItemName") %>' MaxLength="48"
                            Width="80"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditItemName" runat="server" ErrorMessage="Please enter an item name to update"
                            ControlToValidate="txtEditItemName" ForeColor="Black" Font-Bold="true" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddItemName" runat="server" Width="80" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddItemName" runat="server" ErrorMessage="Please enter an item name to add"
                            ControlToValidate="txtAddItemName" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="EQuantity">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EQuantity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditQuantity" runat="server" Text='<%# Bind("EQuantity") %>' MaxLength="10"
                            Width="65" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditQuantity" runat="server" ErrorMessage="Please enter some quantity for update"
                            ControlToValidate="txtEditQuantity" ForeColor="Black" Font-Bold="true" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddQuantity" runat="server" Width="65" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddQuantity" runat="server" ErrorMessage="Please enter some quantity to add"
                            ControlToValidate="txtAddQuantity" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" />
        </asp:GridView>
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Black" Font-Bold="true" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Black" Font-Bold="true" ValidationGroup="Insert" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
            DeleteCommand="DELETE FROM [Electronics] WHERE [EItemId] = @EItemId" 
            InsertCommand="INSERT INTO [Electronics] ([EItemName], [EQuantity]) VALUES (@EItemName, @EQuantity)"
            SelectCommand="SELECT * FROM [Electronics]" 
            UpdateCommand="UPDATE [Electronics] SET [EItemName] = @EItemName, [EQuantity] = @EQuantity WHERE [EItemId] = @EItemId">
          
            <DeleteParameters>
                <asp:Parameter Name="EItemId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EItemName" Type="String" />
                <asp:Parameter Name="EQuantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EItemName" Type="String" />
                <asp:Parameter Name="EQuantity" Type="Int32" />
                <asp:Parameter Name="EItemId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
