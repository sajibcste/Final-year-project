using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SAttendance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter da= new SqlDataAdapter("Select TName,Attendance,Date,Time from Attendance Where SId = '"+Session["Sid"].ToString()+"' Order By Date Desc",con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
           
        }
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //GridView1.DataSource = ds;
        //GridView1.DataBind();
    }
}