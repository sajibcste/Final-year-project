using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class DoctorLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        Label3.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            Label2.Text = "Please fill out this field";
        }
        else if (TextBox2.Text == "")
        {
            Label3.Visible = true;
            Label3.Text = "Please fill out this field";
        }
        else if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            string str1 = "select tid,password from TeacherDetails where tid='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(str1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Session["Type"] = "Teacher";
                Session["Tid"] = TextBox1.Text;
                Response.Redirect("Attendance.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Incorrect User Id or Password.')", true);
            }
        }
    }
}