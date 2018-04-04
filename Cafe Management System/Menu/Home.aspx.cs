using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Menu_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void lnkAdd_Click(Object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["Items"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddItemName")).Text;
        SqlDataSource1.InsertParameters["Price"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddPrice")).Text;

        SqlDataSource1.Insert();
    }
}