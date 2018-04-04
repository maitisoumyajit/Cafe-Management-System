using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Finance_SupplierDetails : System.Web.UI.Page
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
        SqlDataSource1.InsertParameters["SupplierName"].DefaultValue = ((TextBox)GridViewSD.FooterRow.FindControl("txtAddSuppName")).Text;
        SqlDataSource1.InsertParameters["SupplierAddress"].DefaultValue = ((TextBox)GridViewSD.FooterRow.FindControl("txtAddSuppAdd")).Text;
        SqlDataSource1.InsertParameters["MobileNo"].DefaultValue = ((TextBox)GridViewSD.FooterRow.FindControl("txtAddMobNo")).Text;
        SqlDataSource1.InsertParameters["ItemName"].DefaultValue = ((TextBox)GridViewSD.FooterRow.FindControl("txtAddItemName")).Text;


        SqlDataSource1.Insert();
    }
}