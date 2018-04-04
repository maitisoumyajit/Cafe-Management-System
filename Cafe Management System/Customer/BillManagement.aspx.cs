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
using System.IO;

public partial class Customer_Home : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    SqlCommand cmd;
    //StringBuilder str;
    public void getDataFromMenuItems()
    {
        con.Open();
        //string str = "select * from Menu_Items order by Price asc";
        cmd = new SqlCommand("menuSelect", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Menu_Items");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
    }
    public void getDataFromDDL()
    {
        con.Open();
        cmd = new SqlCommand("menuSelect", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Menu_Items");
        ddlItems.DataSource = ds;
        ddlItems.DataBind();
        ddlItems.DataTextField = "Items";
        ddlItems.DataValueField = "Items";
        ddlItems.DataBind();
        con.Close();
    }
    public int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["mysession"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                getDataFromMenuItems();
                getDataFromDDL();
            }

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int rnum = RandomNumber(10000, 99999);
        //#
        txtBill.Text = "\t\t\t\t\tCafe CRM \n \t\tAddr:201 Sky Flama A Dosti Flamingos \n \t\t\tSewri Naka Mumbai-400015 \n \t\t\t\tMb.No.:9892333058 \n \t\t\t\twww.CafeCRM.com\n";
        txtBill.Text += "\t\t\t DTTM:" + System.DateTime.Now.ToString() + "\n";
        txtBill.Text += "\t\t\t\t INVOICE NO.:" + rnum + "\n";
        txtBill.Text += "===============================================\n";
        txtBill.Text += "\t\t\t\t ITEM \t QTY \t PRICE" + "\n";
        txtBill.Text += "\t\t\t\t" + txtItems.Text;
        txtBill.Text += "===============================================\n";
        txtBill.Text += "\t\t\t\t\tTax Included\n";
        txtBill.Text += "\t\t\t\t\tCGST" + "(5%)" + "\n";
        txtBill.Text += "\t\t\t\t\tSGST" + "(5%)" + "\n";
        txtBill.Text += "===============================================\n";
        txtBill.Text += "\t\t\t\tTotal\t\t\t" + lblTotal.Text + "\n\n";
        txtBill.Text += "\t\t\t\t\t Thank you";

        System.IO.File.WriteAllText(@"E:\txt1.txt", txtBill.Text);

        string str = "Insert Into Sales(InvoiceNo,date,Amount) values(@InvoiceNo,@date,@Amount)";
        con.Open();
        cmd = new SqlCommand(str,con);
        cmd.Parameters.AddWithValue("@InvoiceNo",rnum);
        cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Amount", lblTotal.Text.Trim());
        cmd.ExecuteNonQuery();
        con.Close();

        txtItems.Text = "";
        lblTotal.Text = "0";
        lblPrice.Text = "0";
    }
    //protected void btnAToC_Click(object sender, EventArgs e)
    //{
    //    if (txtQty.Text == string.Empty)
    //    {
    //        lblMessage.Text = "Please enter some quantity";
    //        lblMessage.ForeColor = System.Drawing.Color.Red;
    //        lblMessage.Dispose();
    //    }
    //    else
    //    {
    //        try
    //        {
    //            int qty = Convert.ToInt32(txtQty.Text.Trim());
    //            string str = "Select Price from Menu_Items where Items like '" + ddlItems.SelectedItem.Text + "'";
    //            con.Open();
    //            cmd = new SqlCommand(str, con);
    //            SqlDataReader dr = cmd.ExecuteReader();
    //            if (dr.Read())
    //            {
    //                int price = dr.GetInt32(0);
    //                int total = price * qty;
    //                lblPrice.Text = total.ToString();
    //                con.Close();
    //            }

    //        }
    //        catch (Exception ex)
    //        {
    //            lblTotal.Text = ex.Message;
    //        }
    //        if (lblTotal.Text != "")
    //        {
    //            lblTotal.Text = (Convert.ToInt32(lblTotal.Text) + Convert.ToInt32(lblPrice.Text)).ToString();
    //        }
    //        else
    //        {
    //            lblTotal.Text = lblPrice.Text;
    //        }
    //        txtItems.Text += ddlItems.SelectedItem.Text + "\t" + txtQty.Text + "\t" + lblPrice.Text + "\n\t\t\t\t";
    //        txtQty.Text = string.Empty;
    //    }
    //}
    protected void IBAToC_Click(object sender, ImageClickEventArgs e)
    {
        if (txtQty.Text == string.Empty)
        {
            lblMessage.Text = "Please enter some quantity";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Dispose();
        }
        else
        {
            try
            {
                int qty = Convert.ToInt32(txtQty.Text.Trim());
                string str = "Select Price from Menu_Items where Items like '" + ddlItems.SelectedItem.Text + "'";
                con.Open();
                cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    int price = dr.GetInt32(0);
                    int total = price * qty;
                    lblPrice.Text = total.ToString();
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                lblTotal.Text = ex.Message;
            }
            if (lblTotal.Text != "")
            {
                lblTotal.Text = (Convert.ToInt32(lblTotal.Text) + Convert.ToInt32(lblPrice.Text)).ToString();
            }
            else
            {
                lblTotal.Text = lblPrice.Text;
            }
            txtItems.Text += ddlItems.SelectedItem.Text + "\t" + txtQty.Text + "\t" + lblPrice.Text + "\n\t\t\t\t";
            txtQty.Text = string.Empty;
        }
    }
}
