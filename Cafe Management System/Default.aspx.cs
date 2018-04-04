using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("mysession");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand cmd;
        string str = "select UserName , Password From AdminTable";
        con.Open();
        cmd = new SqlCommand(str,con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string username = dr.GetString(0);
            string password = dr.GetString(1);
            if (txtUsrName.Text.Trim() == username && txtPasswd.Text.Trim() == password)
            {
                Session["mysession"] = txtUsrName.Text;
                Response.Redirect("~/HomePage/Home.aspx");
            }
            else
            {
                lblMsg.Text = "Username or Password does not match";
                lblMsg.ForeColor = System.Drawing.Color.Black;
            }

            
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ForgotPassword.aspx");
    }
}