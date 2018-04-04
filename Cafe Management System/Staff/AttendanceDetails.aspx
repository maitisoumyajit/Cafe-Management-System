<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true"
    CodeFile="AttendanceDetails.aspx.cs" Inherits="Staff_Home" ViewStateMode="Enabled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
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
        
        .centerHeaderText th
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="Server">
    <div align="center" id="image">
        <br />
        <h1><b><u>ATTENDANCE DETAILS</u></b></h1>
        <br />
        <asp:Label ID="lblSelectName" runat="server" Text="Select Name" 
            style="font-size: large; font-weight: 700"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlName" runat="server" ViewStateMode="Enabled">
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="rfvddlName" runat="server" ErrorMessage="Please select a name"
            ControlToValidate="ddlName" ForeColor="Black" Font-Bold="true" InitialValue="Select Name"
            ValidationGroup="Insert">
        </asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblSelectAttendanceStatus" runat="server" 
            Text="Select Attendance Status" style="font-size: large; font-weight: 700"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlAttendenceStatus" runat="server" ValidationGroup="Insert">
            <asp:ListItem>Select Attendance</asp:ListItem>
            <asp:ListItem>Present</asp:ListItem>
            <asp:ListItem>Absent</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="rfvAttendenceStatus" runat="server" ErrorMessage="Please select something"
            ControlToValidate="ddlAttendenceStatus" ForeColor="Black" Font-Bold="true" InitialValue="Select Attendance">
        </asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"
        Style="background-color: transparent; color: #FFFFFF; font-size: large;" Height="40px"
                Width="80px" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="false"
            Height="65px" Width="500px" BorderStyle="None" Font-Bold="True" Font-Size="Large"
            BorderWidth="1px" BackColor="Transparent" CellPadding="3" 
            DataKeyNames="id" onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandArgument='<%# Eval("id")%>'
                            CommandName="Update" Text="Update" ForeColor="Black" Font-Bold="true" OnClientClick="return confirm('Do you want to update??');"></asp:LinkButton>
                        /
                        <asp:LinkButton ID="lnkCancel" runat="server" CommandArgument='<%# Eval("id")%>'
                            CommandName="Cancel" Text="Cancel" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("id")%>' CommandName="Edit"
                            Text="Edit" ForeColor="Black" Font-Bold="true"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee Id" SortExpression="EmpId">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditEmpId" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItemEmpId" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="date">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditDate" runat="server" Text='<%# Bind("Date_") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItemDate" runat="server" Text='<%# Bind("Date_") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Attendance" SortExpression="Attendance">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditAttendance" runat="server" SelectedValue='<%# Bind("Attendance") %>'>
                            <asp:ListItem>Select Attendance</asp:ListItem>
                            <asp:ListItem>Present</asp:ListItem>
                            <asp:ListItem>Absent</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvAttendance" runat="server" ErrorMessage="Please select one type of gender to edit"
                            ControlToValidate="ddlEditAttendance" ForeColor="Black" Font-Bold="true" Text="*" InitialValue="Select Attendance">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblItemAttendnce" runat="server" Text='<%# Bind("Attendance") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />

    </div>
</asp:Content>
