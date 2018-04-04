using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;    

public partial class Finance_Bills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void IBInventory_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Finance/Inventory.aspx");
    }
    protected void IBSupplierDetails_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Finance/SupplierDetails.aspx");
    }
}