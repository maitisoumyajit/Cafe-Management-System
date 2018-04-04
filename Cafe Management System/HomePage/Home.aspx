<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="HomePage_Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" Runat="Server">
<div class="row" align="center" id="image">
        <br />
        <h1 style="color:Black;"><u><b>Report Management</b></u></h1>
        <br />
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Attendance Report</b></h3>
            <br />
            <asp:ImageButton ID="ibAttendanceReport" runat="server" Height="350" Width="350" 
                 ImageUrl="~/images/report_attendance_summary.png" 
                onclick="ibAttendanceReport_Click" />
        </div>
        <div class="col-md-6" align="center">
            <br />
            <h3><b>Sales Report</b></h3>
            <br />
            <asp:ImageButton ID="ibSalesreport" runat="server" Height="350" Width="350" 
                 ImageUrl="~/images/sales-conversion-dashboard-datapine.png" 
                onclick="ibSalesreport_Click" />
        </div>
    </div>
</asp:Content>

