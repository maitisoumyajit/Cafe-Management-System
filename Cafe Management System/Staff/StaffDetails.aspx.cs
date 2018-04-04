using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Staff_StaffDetails : System.Web.UI.Page
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
        SqlDataSource1.InsertParameters["Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddName")).Text;
        //SqlDataSource1.InsertParameters["LastName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddLastName")).Text;
        SqlDataSource1.InsertParameters["City"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddCity")).Text;
        SqlDataSource1.InsertParameters["State"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddState")).Text;
        SqlDataSource1.InsertParameters["Country"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddCountry")).Text;
        SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddEmail")).Text;
        SqlDataSource1.InsertParameters["MobileNo"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddMobileNo")).Text;
        SqlDataSource1.InsertParameters["DeptId"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddDeptId")).Text;
        SqlDataSource1.InsertParameters["DeptName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddDeptName")).Text;
        SqlDataSource1.InsertParameters["Salary"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtAddSalary")).Text;
        SqlDataSource1.InsertParameters["Gender"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("ddlAddGender")).SelectedValue;

        SqlDataSource1.Insert();
    }
   
}