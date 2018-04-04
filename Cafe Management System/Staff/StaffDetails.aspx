<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="StaffDetails.aspx.cs" Inherits="Staff_StaffDetails" %>

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
    <div id="image">
        <div align="center">
            <br />
            <h1 style="color: Black">
                <b><u>Staff Details</u></b></h1>
            <br />
            <asp:GridView ID="GridView1" runat="server" BorderStyle="Double" Font-Bold="True"
                Font-Size="Large" BorderColor="Black" BorderWidth="2px" Style="color: Black"
                AutoGenerateColumns="False" DataKeyNames="EmpId" DataSourceID="SqlDataSource1"
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
                    <asp:TemplateField HeaderText="Employee Id" SortExpression="EmpId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmpId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkAdd" runat="server" ValidationGroup="Insert" OnClick="lnkAdd_Click" ForeColor="Black" Font-Bold="true">Add</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditName" runat="server" MaxLength="48" Text='<%# Bind("Name") %>'
                                Width="70"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ErrorMessage="Please enter first name to edit"
                                ControlToValidate="txtEditName" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddName" runat="server" Width="70" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddName" runat="server" ErrorMessage="Please enter first name to add"
                                ControlToValidate="txtAddName" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditLastName" runat="server" Text='<%# Bind("LastName") %>' Width="70" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditLastName" runat="server" ErrorMessage="Please enter last name to edit"
                                ControlToValidate="txtEditLastName" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddLastName" runat="server" Width="70" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddLastName" runat="server" ErrorMessage="Please enter last name to add"
                                ControlToValidate="txtAddLastName" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCity" runat="server" Text='<%# Bind("City") %>' Width="75" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditCity" runat="server" ErrorMessage="Please enter city to edit"
                                ControlToValidate="txtEditCity" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddCity" runat="server" Width="75" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddCity" runat="server" ErrorMessage="Please enter city to add"
                                ControlToValidate="txtAddCity" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State" SortExpression="State">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditState" runat="server" Text='<%# Bind("State") %>' Width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditState" runat="server" ErrorMessage="Please enter state to edit"
                                ControlToValidate="txtEditState" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddState" runat="server" Width="80" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddState" runat="server" ErrorMessage="Please enter state to add"
                                ControlToValidate="txtAddState" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" SortExpression="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCountry" runat="server" Text='<%# Bind("Country") %>' Width="50" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditCountry" runat="server" ErrorMessage="Please enter country to edit"
                                ControlToValidate="txtEditCountry" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddCountry" runat="server" Width="50" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddCountry" runat="server" ErrorMessage="Please enter country to add"
                                ControlToValidate="txtAddCountry" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("Email") %>' Width="230" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Please enter email to edit"
                                ControlToValidate="txtEditEmail" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddEmail" runat="server" Width="230" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddEmail" runat="server" ErrorMessage="Please enter email to add"
                                ControlToValidate="txtAddEmail" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revAddEmail" runat="server" ErrorMessage="Please Input a vald Email Id like abc@xyz.com"
                                ForeColor="Black" Font-Bold="true" Text="*" ControlToValidate="txtAddEmail" ValidationGroup="Insert"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile Number" SortExpression="MobileNo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditMobileNo" runat="server" Text='<%# Bind("MobileNo") %>' Width="90" MaxLength="10"
                                onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditMobileNo" runat="server" ErrorMessage="Please enter mobile no to edit"
                                ControlToValidate="txtEditMobileNo" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddMobileNo" runat="server" Width="90" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddMobileNo" runat="server" ErrorMessage="Please enter mobile no to add"
                                ControlToValidate="txtAddMobileNo" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department Id" SortExpression="DeptId">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDeptId" runat="server" Text='<%# Bind("DeptId") %>' Width="40" MaxLength="10"
                                onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditDeptId" runat="server" ErrorMessage="Please enter department id to edit"
                                ControlToValidate="txtEditDeptId" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("DeptId") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddDeptId" runat="server" Width="40" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddDeptId" runat="server" ErrorMessage="Please enter department id to add"
                                ControlToValidate="txtAddDeptId" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department Name" SortExpression="DeptName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDeptName" runat="server" Text='<%# Bind("DeptName") %>' Width="70" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditDeptName" runat="server" ErrorMessage="Please enter department name to edit"
                                ControlToValidate="txtEditDeptName" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEditDeptName" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddDeptName" runat="server" Width="70" MaxLength="48"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddDeptName" runat="server" ErrorMessage="Please enter department name to add"
                                ControlToValidate="txtAddDeptName" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary" SortExpression="Salary">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditSalary" runat="server" Text='<%# Bind("Salary") %>' Width="90"
                                onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEditSalary" runat="server" ErrorMessage="Please enter salary to edit"
                                ControlToValidate="txtEditSalary" ForeColor="Black" Font-Bold="true" Text="*">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtAddSalary" runat="server" Width="90" onkeypress="javascript:return isNumber(event)" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddSalary" runat="server" ErrorMessage="Please enter salary to add"
                                ControlToValidate="txtAddSalary" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditGender" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEditGender" runat="server" ErrorMessage="Please select one type of gender to edit"
                                ControlToValidate="ddlEditGender" ForeColor="Black" Font-Bold="true" Text="*" InitialValue="Select Gender">
                            </asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlAddGender" runat="server" Width="80">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAddGender" runat="server" ErrorMessage="Plase select one of the gender to add"
                                ControlToValidate="ddlAddGender" ForeColor="Black" Font-Bold="true" Text="*" ValidationGroup="Insert"
                                InitialValue="Select Gender">
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
                DeleteCommand="DELETE FROM [Emp_Details] WHERE [EmpId] = @EmpId" InsertCommand="INSERT INTO [Emp_Details] ([Name], [City], [State], [Country], [Email], [MobileNo], [DeptId], [DeptName], [Salary], [Gender]) VALUES (@Name, @City, @State, @Country, @Email, @MobileNo, @DeptId, @DeptName, @Salary, @Gender)"
                SelectCommand="SELECT * FROM [Emp_Details]" UpdateCommand="UPDATE [Emp_Details] SET [Name] = @Name, [City] = @City, [State] = @State, [Country] = @Country, [Email] = @Email, [MobileNo] = @MobileNo, [DeptId] = @DeptId, [DeptName] = @DeptName, [Salary] = @Salary, [Gender] = @Gender WHERE [EmpId] = @EmpId">
                <DeleteParameters>
                    <asp:Parameter Name="EmpId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmpId" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <%--<asp:Parameter Name="LastName" Type="String" />--%>
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="String" />
                    <asp:Parameter Name="DeptId" Type="Int32" />
                    <asp:Parameter Name="DeptName" Type="String" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="Gender" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <%--<asp:Parameter Name="LastName" Type="String" />--%>
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="String" />
                    <asp:Parameter Name="DeptId" Type="Int32" />
                    <asp:Parameter Name="DeptName" Type="String" />
                    <asp:Parameter Name="Salary" Type="Decimal" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="EmpId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
