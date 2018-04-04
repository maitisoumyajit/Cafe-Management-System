using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for AttendanceDetails
/// </summary>
namespace DeathMetal
{
    public class Attendance
    {
        public int id { get; set; }
        public int EmpId { get; set; }
        public string Attendance_Emp { get; set; }
        public string Name { get; set; }
        public DateTime date { get; set; }
    }

    public class AttendanceDetails
    {
        public static List<Attendance> GetAllAttendance()
        {
            List<Attendance>listAttendance = new List<Attendance>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            string str = "select * from AttendanceDetails";
            SqlCommand cmd = new SqlCommand(str,con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                Attendance att = new Attendance();
                att.id = Convert.ToInt32(dr["id"]);
                att.EmpId = Convert.ToInt32(dr["EmpId"]);
                att.Attendance_Emp = dr["Attendance"].ToString();
                att.Name = dr["Name"].ToString();
                att.date = System.DateTime.Now;

                listAttendance.Add(att);
            }
            return listAttendance;
        }

        public static int UpdateAttendance(int id,string Attendance_Emp)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            string strU = "Update AttendanceDetails set Attendance  = @Attendance_ Emp where id = @id";
            SqlCommand cmd = new SqlCommand(strU, con);
            SqlDataReader dr = cmd.ExecuteReader();
            SqlParameter paramId = new SqlParameter("@id",id);
            cmd.Parameters.Add(paramId);
            SqlParameter paramAttendance_Emp = new SqlParameter("@Attendance_Emp", Attendance_Emp);
            cmd.Parameters.Add(paramAttendance_Emp);
            con.Open();
            return cmd.ExecuteNonQuery();
        }
	}
}