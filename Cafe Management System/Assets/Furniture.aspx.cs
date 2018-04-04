using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Assets_Furniture : System.Web.UI.Page
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
        SqlDataSource1.InsertParameters["FItemName"].DefaultValue = ((TextBox)GridViewF.FooterRow.FindControl("txtAddItemName")).Text;
        SqlDataSource1.InsertParameters["FQuantity"].DefaultValue = ((TextBox)GridViewF.FooterRow.FindControl("txtAddQuantity")).Text;

        SqlDataSource1.Insert();
    }


}