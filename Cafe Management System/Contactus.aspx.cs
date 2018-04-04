using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;
public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtName.Focus();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("fzdsmj1212@gmail.com");
                mailMessage.To.Add(txtEmail.Text.Trim());
                mailMessage.Subject = "Feedback";

                mailMessage.Body = "<b>Sender Name:</b>" + txtName.Text + "<br/>"
                    + "<b>Sender Email:</b>" + txtEmail.Text + "<br/>"
                    + "<b>Sender Mobile:</b>" + txtMobile.Text + "<br/>"
                    + "<b>Sender Message:</b>" + txtMessage.Text;
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("your Mailid", "Your Password");
                smtpClient.Send(mailMessage);
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Thank you for contacting us";
                txtName.Text = txtEmail.Text = txtMobile.Text = txtMessage.Text = string.Empty;                
                }

        }
        catch (Exception ex)
        {
            //Log= Event Viewer or table
            lblStatus.ForeColor = System.Drawing.Color.Red;
            //lblStatus.Text = "There is an unknown problem. Please try later";
            lblStatus.Text = ex.Message;
        } 
    
    }
}