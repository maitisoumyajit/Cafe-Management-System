<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Menu_Home" %>

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
        min-height: 650px;
        -webkit-background-size:cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        -ms-background-size: cover;
        position: relative;       
        }
        .headerAlign
        {
            text-align:center !important;
            }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
    <div class="w3l-footer" id="image" align="center">
        <div align="center"> 
            <br />
            <h1 style="color:Black; background-color:transparent;"><b><u>Menu</u></b></h1>
            
            <br />
   
            <asp:GridView ID="GridView1" runat="server" 
                Height="250px" Width="300px"
                BorderStyle="Double" Font-Bold="True" 
                Font-Size="Large" BorderColor="Black" BorderWidth="2px"
                style="color:Black" AutoGenerateColumns="False" DataKeyNames="ItemId" 
                DataSourceID="SqlDataSource1" ShowFooter="True">
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
                            <asp:LinkButton ID="lnkAdd" runat="server" ForeColor="Black" Font-Bold="true" ValidationGroup="Insert" OnClick="lnkAdd_Click" >Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Items" SortExpression="Items">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("Items") %>' width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditItemName" runat="server"
                            ErrorMessage="Please enter item name to edit"
                            ControlToValidate="txtEditItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Items") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddItemName" runat="server" width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddItemName" runat="server"
                            ErrorMessage="Please enter item name to add"
                            ControlToValidate="txtAddItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditPrice" runat="server" Text='<%# Bind("Price") %>' width="50" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditPrice" runat="server"
                            ErrorMessage="Please enter some price to edit"
                            ControlToValidate="txtEditPrice"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddPrice" runat="server" width="35" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddPrice" runat="server"
                            ErrorMessage="Please enter some price to add"
                            ControlToValidate="txtAddPrice"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" HorizontalAlign="Center" />
                <RowStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" HorizontalAlign="Center" />
            </asp:GridView>

            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" ForeColor="Black" Font-Bold="true" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Black" Font-Bold="true" />
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:constr %>" 
                DeleteCommand="DELETE FROM [Menu_Items] WHERE [ItemId] = @ItemId" 
                InsertCommand="INSERT INTO [Menu_Items] ([Items], [Price]) VALUES (@Items, @Price)" 
                SelectCommand="SELECT * FROM [Menu_Items]" 
                UpdateCommand="UPDATE [Menu_Items] SET [Items] = @Items, [Price] = @Price WHERE [ItemId] = @ItemId">
                <DeleteParameters>
                    <asp:Parameter Name="ItemId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Items" Type="String" />
                    <asp:Parameter Name="Price" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Items" Type="String" />
                    <asp:Parameter Name="Price" Type="Int32" />
                    <asp:Parameter Name="ItemId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <br />
            <br />


        </div>
    </div>
</asp:Content>


