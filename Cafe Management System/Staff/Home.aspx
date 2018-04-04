<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Staff_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
<div class="row" id="image" align="center">
        <br />
        <h1 style="color:Black;"><u><b>Staff Management</b></u></h1>
        <br />
        <%--1st Column--%>
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Attendance Details</b></h3>
            <br />
            <asp:ImageButton ID="IBAttendanceDetails" runat="server" 
                ImageUrl="~/images/AttendanceDetails.jpg" Height="350" Width="350" onclick="IBAttendanceDetails_Click" 
                 />
        </div>
        <%--2nd Column--%>
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Staff Details</b></h3>
            <br />
            <asp:ImageButton ID="IBStaffDetails" runat="server" 
                ImageUrl="~/images/StaffDetails.jpg" Height="350" Width="350" onclick="IBStaffDetails_Click" 
                 />
        </div>
    </div>
</asp:Content>

