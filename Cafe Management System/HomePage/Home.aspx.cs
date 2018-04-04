using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void ibAttendanceReport_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Attendance.aspx");
    }

    protected void ibSalesreport_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/SalesReport.aspx");
    }
}