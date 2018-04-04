using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DeathMetal;
using iTextSharp;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Staff_Home : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    //SqlCommand cmd;
    string empId;

    private void BindNameInDDl()
    {
        string str = "Select * From Emp_Details";
        SqlCommand cmd = new SqlCommand(str,con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Emp_Details");
        ddlName.DataSource = ds;
        ddlName.DataBind();
        ddlName.DataTextField = "Name";
        ddlName.DataValueField = "Name";
        ddlName.DataBind();
        con.Close();

        ddlName.Items.Insert(0, new ListItem("Select Name", string.Empty));
        ddlName.SelectedIndex = 0;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridViewData();
            BindNameInDDl();
            if (Session["mysession"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }

    public void BindGridViewData()
    {
        //GridView1.DataSource = AttendanceDetails.GetAllAttendance();
        //GridView1.DataBind();
        con.Open();
        string str = "Select * from AttendanceDetails";
        SqlCommand cmd = new SqlCommand(str,con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds,"AttendanceDetails");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
    }
    //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "Edit")
    //    {
    //        int rowIndex = ((GridViewRow)((LinkButton) e.CommandSource).NamingContainer).RowIndex;
    //        GridView1.EditIndex = rowIndex;
    //        BindGridViewData();
    //    }
    //    else if (e.CommandName == "Cancel")
    //    {
    //        GridView1.EditIndex = -1;
    //        BindGridViewData();
    //    }
    //    else if (e.CommandName == "Update")
    //    {
    //        int rowIndex = ((GridViewRow)((LinkButton) e.CommandSource).NamingContainer).RowIndex;
    //        int id = Convert.ToInt32(e.CommandArgument);
    //        int empId = Convert.ToInt32(e.CommandArgument);
    //        string name = ((Label)GridView1.Rows[rowIndex].FindControl("lblEditName")).Text;
    //        string  date = ((Label)GridView1.Rows[rowIndex].FindControl("lblEditDate")).Text;
    //        string Atten = ((DropDownList)GridView1.Rows[rowIndex].FindControl("ddlEditAttendance_Emp")).SelectedValue;

    //        AttendanceDetails.UpdateAttendance(id,Atten);

    //        GridView1.EditIndex = -1;
    //        BindGridViewData();
    //    }
    //}
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        string str1 = "SELECT EmpId FROM Emp_Details where Name = '" + ddlName.SelectedItem.Text + "'";
        SqlCommand cmd1 = new SqlCommand(str1,con);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            empId = dr.GetInt32(0).ToString();
        }
        con.Close();
        con.Open();
        string str = "Insert Into AttendanceDetails (EmpId,Name,Date_,Attendance) values(@EmpId,@Name,@Date,@Attendance)";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.Parameters.AddWithValue("@EmpId", empId);
        cmd.Parameters.AddWithValue("@Name", ddlName.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Date", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@Attendance", ddlAttendenceStatus.SelectedItem.Text);
        cmd.ExecuteNonQuery();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridViewData();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditId")).Text;
        string empid = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditEmpId")).Text;
        string Name = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditName")).Text;
        string Date = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblEditDate")).Text;
        string Atte = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlEditAttendance")).Text;
        con.Open();
        string str = "update AttendanceDetails set Attendance = '" +Atte+ "' where id='" + Convert.ToInt32(id) + "'";
        SqlCommand cmd = new SqlCommand(str,con);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGridViewData();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridViewData();
    }
}