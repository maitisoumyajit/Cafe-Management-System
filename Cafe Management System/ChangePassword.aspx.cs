using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ChangePassword : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        string str = "Select Security_Question,Answer from AdminTable Where Security_Question='"+ddlSecurityQuestion.SelectedItem.Text+"'";
        cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string ans = dr.GetString(1);
            if (ans == txtSecurityAns.Text.Trim())
            {
                con.Close();
                con.Open();
                string str1 = "Update AdminTable set Password='" + txtNewPasswd.Text.Trim() + "' Where Answer = '" + ans + "'";
                cmd = new SqlCommand(str1, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Password Changes Successfully')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Input.Please try again')</script>");
            }
        }
        con.Close();
    }
    protected void lbLoginPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}