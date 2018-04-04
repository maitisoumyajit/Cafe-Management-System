<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="SupplierDetails.aspx.cs" Inherits="Finance_SupplierDetails" %>

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
            min-height: 590px;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="Server">
    <div align="center" id="image">
    <br />
        <h1 style="color:Black"><b><u>Supplier Details</u></b></h1>
        <br />
        <asp:GridView ID="GridViewSD" runat="server" AutoGenerateColumns="False" Height="65px"
            Width="300px" BorderStyle="Double" Font-Bold="True" Font-Size="Large" BorderColor="Black"
            BorderWidth="2px" Style="color: Black" DataKeyNames="SupplierId" 
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
                <asp:TemplateField HeaderText="Supplier Id" InsertVisible="False" 
                    SortExpression="SupplierId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SupplierId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SupplierId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" ValidationGroup="Insert" OnClick="lnkAdd_Click" ForeColor="Black" Font-Bold="true" >Add</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier Name" SortExpression="SupplierName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditSuppName" runat="server" Text='<%# Bind("SupplierName") %>' width="90" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditSuppName" runat="server"
                            ErrorMessage="Please enter a supplier name to edit"
                            ControlToValidate="txtEditSuppName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SupplierName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddSuppName" runat="server" width="90" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddSuppName" runat="server"
                            ErrorMessage="Please enter a supplier name to add"
                            ControlToValidate="txtAddSuppName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*" ValidationGroup="Insert" >
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier Address" 
                    SortExpression="SupplierAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditSuppAdd" runat="server" Text='<%# Bind("SupplierAddress") %>' width="100" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditSuppAdd" runat="server"
                            ErrorMessage="Please enter a supplier address to edit"
                            ControlToValidate="txtEditSuppAdd"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SupplierAddress") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddSuppAdd" runat="server" width="100" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddSuppAdd" runat="server"
                            ErrorMessage="Please enter a supplier address to add"
                            ControlToValidate="txtAddSuppAdd"
                            ForeColor="Black" Font-Bold="true"
                            Text="*" ValidationGroup="Insert" >
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile Number" SortExpression="MobileNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditMobNo" runat="server" Text='<%# Bind("MobileNo") %>' width="90" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditMobNo" runat="server"
                            ErrorMessage="Please enter a mobile no. to edit"
                            ControlToValidate="txtEditMobNo"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MobileNo") %>' onkeypress="javascript:return isNumber(event)"></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddMobNo" runat="server" onkeypress="javascript:return isNumber(event)" width="90" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddMobNo" runat="server"
                            ErrorMessage="Please enter a mobile no. to add"
                            ControlToValidate="txtAddMobNo"
                            ForeColor="Black" Font-Bold="true"
                            Text="*" ValidationGroup="Insert" >
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Name" SortExpression="ItemName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditItemName" runat="server" Text='<%# Bind("ItemName") %>' width="70" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfEditItemName" runat="server"
                            ErrorMessage="Please enter an item name to edit"
                            ControlToValidate="txtEditItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddItemName" runat="server"  width="70" MaxLength="48"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAddItemName" runat="server"
                            ErrorMessage="Please enter an item name to add"
                            ControlToValidate="txtAddItemName"
                            ForeColor="Black" Font-Bold="true"
                            Text="*" ValidationGroup="Insert" >
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="Transparent" ForeColor="Black" Font-Bold="true" />
        </asp:GridView>
        
        <br />
        <br />


        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Insert" ForeColor="Black" Font-Bold="true" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Black" Font-Bold="true" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:constr %>" 
            DeleteCommand="DELETE FROM [SuppliersDetails] WHERE [SupplierId] = @SupplierId" 
            InsertCommand="INSERT INTO [SuppliersDetails] ([SupplierName], [SupplierAddress], [MobileNo], [ItemName]) VALUES (@SupplierName, @SupplierAddress, @MobileNo, @ItemName)" 
            SelectCommand="SELECT * FROM [SuppliersDetails]" 
            UpdateCommand="UPDATE [SuppliersDetails] SET [SupplierName] = @SupplierName, [SupplierAddress] = @SupplierAddress, [MobileNo] = @MobileNo, [ItemName] = @ItemName WHERE [SupplierId] = @SupplierId">
            <DeleteParameters>
                <asp:Parameter Name="SupplierId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="MobileNo" Type="Int64" />
                <asp:Parameter Name="ItemName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierName" Type="String" />
                <asp:Parameter Name="SupplierAddress" Type="String" />
                <asp:Parameter Name="MobileNo" Type="Int64" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="SupplierId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
