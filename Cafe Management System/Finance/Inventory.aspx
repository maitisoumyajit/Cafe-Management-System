<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Inventory.aspx.cs" Inherits="Finance_Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
    <div align="center" id="image">
        <br />
        <h1 style="color:Black"><b><u>Inventory</u></b></h1>
        <br />
        <asp:GridView ID="GridViewI" runat="server" AutoGenerateColumns="False"
            Height="65px" Width="300px"
            BorderStyle="Double" Font-Bold="True" 
            Font-Size="Large" BorderColor="Black" BorderWidth="2px"
            style="color:Black" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" 
            ShowFooter="True">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" ForeColor="Black" Font-Bold="true" OnClientClick="return confirm('Do you want to delete??');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Id" InsertVisible="False" 
                    SortExpression="ItemId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" ValidationGroup="Insert" OnClick="lnkAdd_Click" ForeColor="Black" Font-Bold="true">Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Name" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("ItemName") %>' Width="70" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditItemName" runat="server"
                            ErrorMessage="Please enter an item name to update"
                            ControlToValidate="txtEditItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddItemName" runat="server" Width="70" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddItemName" runat="server"
                            ErrorMessage="Please enter an item name to add"
                            ControlToValidate="txtAddItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="55" MaxLength="10"
                        onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditQuantity" runat="server"
                            ErrorMessage="Please enter some quantity to update"
                            ControlToValidate="txtEditQuantity"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddQuantity" runat="server" Width="55" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddQuantity" runat="server"
                            ErrorMessage="Please enter some quantity to add"
                            ControlToValidate="txtAddQuantity"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# (System.DateTime.Now).ToString() %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" />
        </asp:GridView>

        <br /><br />

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" ForeColor="Black" Font-Bold="true" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Black" Font-Bold="true" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:constr %>" 
            DeleteCommand="DELETE FROM [Inventory] WHERE [ItemId] = @ItemId" 
            InsertCommand="INSERT INTO [Inventory] ([ItemName], [Quantity], [Date]) VALUES (@ItemName, @Quantity, @Date)" 
            SelectCommand="SELECT * FROM [Inventory]" 
            UpdateCommand="UPDATE [Inventory] SET [ItemName] = @ItemName, [Quantity] = @Quantity, [Date] = @Date WHERE [ItemId] = @ItemId">
            <DeleteParameters>
                <asp:Parameter Name="ItemId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter DbType="Date" Name="Date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="ItemId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

