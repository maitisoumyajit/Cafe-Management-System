using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void IBStaffDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Staff/StaffDetails.aspx");
    }
    protected void IBAttendanceDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Staff/AttendanceDetails.aspx");
    }
}