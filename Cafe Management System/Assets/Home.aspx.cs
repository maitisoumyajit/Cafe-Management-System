using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Assets_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void IBFurniture_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Assets/Furniture.aspx");
    }
    protected void IBElectronics_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Assets/Electronics.aspx");
    }
    protected void IBKitchenAppliances_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Assets/KitchenAppliances.aspx");
    }
}