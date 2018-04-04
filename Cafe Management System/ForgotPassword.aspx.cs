using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class ForgotPassword : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbLoginPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT UserName,Password FROM AdminTable Where Email= '" + txtEmail.Text.Trim() + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress(txtEmail.Text);
            // Recipient e-mail address.
            Msg.To.Add(txtEmail.Text);
            Msg.Subject = "Your Password Details";
            Msg.Body = "Hi, <br/>Click the link for change your password<br/><br/>Username: " + ds.Tables[0].Rows[0]["UserName"] + "<a href=http://localhost/ChangePassword.aspx> Click Here To Change Password</a>";
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("fzdsmj1212@gmail.com", "farzaadsoumyajit10");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Email Send Successfully')</script>");
            txtEmail.Text = string.Empty;
            // "<br/><br/>Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>" 
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('OOPS, You Entered Wrong Email Id')</script>");
        }
    }
}