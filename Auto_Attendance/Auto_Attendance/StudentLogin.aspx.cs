using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class PatientLogin : System.Web.UI.Page
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
            string str = "select sid,contact from StudentDetails where sid='" + TextBox1.Text + "' and contact='" + TextBox2.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Type"] = "Student";
                Session["Sid"] = TextBox1.Text;
                Response.Redirect("ViewStudents.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Incorret Username or Password')</script>");
            }
        }
    }
}