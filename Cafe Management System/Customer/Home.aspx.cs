using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void ibBillDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("BillDetails.aspx");
    }
    protected void ibBillManagement_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("BillManagement.aspx");
    }
}