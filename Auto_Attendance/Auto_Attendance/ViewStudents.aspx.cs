using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ViewUser : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Type"] == "Student")
        {
            string sid = Session["Sid"].ToString();
            string str = "select sid,sname,address,contact,email,gender,dob,Ba from StudentDetails where sid='" + sid + "'";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                lblMsg.Text = "Currently, No Records found...!!";
            }
        }
        else
        {
            string str = "select sid,sname,address,contact,email,gender,dob,Ba from StudentDetails";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                lblMsg.Text = "Currently, No Records found...!!";
            }
        }
    }
}