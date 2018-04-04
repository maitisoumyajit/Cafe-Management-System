<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Furniture.aspx.cs" Inherits="Assets_Furniture" %>

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
            min-height: 690px;
            -webkit-background-size:cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;       
        }
    </style>
    <%--OnClientClick="return confirm('Do you want to delete');"--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
    <div align="center" id="image">
        <br />
        <h1 style="color:Black;"><u><b>Furniture</b></u></h1>
            <br />
            <asp:GridView ID="GridViewF" runat="server" AutoGenerateColumns="False"
                Height="65px" Width="300px"
                BorderStyle="Double" Font-Bold="True" 
                Font-Size="Large" BorderColor="Black" BorderWidth="2px"
                style="color:Black" DataKeyNames="FItemId" 
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
                            <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" ForeColor="Black" Font-Bold="true"
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" ForeColor="Black" Font-Bold="true"
                                CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you want to delete');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Id" InsertVisible="False" 
                        SortExpression="FItemId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("FItemId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("FItemId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkAdd" runat="server" ValidationGroup="Insert" ForeColor="Black" Font-Bold="true" OnClick="lnkAdd_Click">Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name" SortExpression="FItemName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("FItemName") %>' Width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvfEditItemName" runat="server"
                            ErrorMessage="Please enter an item name to update"
                            ControlToValidate="txtEditItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("FItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddItemName" runat="server" Width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvfAddItemName" runat="server"
                            ErrorMessage="Please enter an item name to add"
                            ControlToValidate="txtAddItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="FQuantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditQuantity" runat="server" Text='<%# Bind("FQuantity") %>' Width="65" MaxLength="10"
                            onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvfEditQuantity" runat="server"
                            ErrorMessage="Please enter some quantity to update"
                            ControlToValidate="txtEditQuantity"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("FQuantity") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddQuantity" runat="server" Width="65" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvfAddQuantity" runat="server"
                            ErrorMessage="Please enter some quantity to add"
                            ControlToValidate="txtAddQuantity"
                            ForeColor="Black" Font-Bold="true"
                            Text="*"
                            ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" />
            </asp:GridView>

            <br /><br />

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" ForeColor="Black" Font-Bold="true" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Black" Font-Bold="true" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:constr %>" 
            DeleteCommand="DELETE FROM [Furniture] WHERE [FItemId] = @FItemId" 
            InsertCommand="INSERT INTO [Furniture] ([FItemName], [FQuantity]) VALUES (@FItemName, @FQuantity)" 
            SelectCommand="SELECT * FROM [Furniture]" 
            UpdateCommand="UPDATE [Furniture] SET [FItemName] = @FItemName, [FQuantity] = @FQuantity WHERE [FItemId] = @FItemId">
            <DeleteParameters>
                <asp:Parameter Name="FItemId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FItemName" Type="String" />
                <asp:Parameter Name="FQuantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FItemName" Type="String" />
                <asp:Parameter Name="FQuantity" Type="Int32" />
                <asp:Parameter Name="FItemId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

