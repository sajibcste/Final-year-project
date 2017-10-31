using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Check;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        #region System Generated . . .
        Class1 c = new Class1();
        bool c1 = c.check("W188", con);
        if (!c1)
        {
            Response.Redirect("Login.aspx");
        }
        #endregion

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
            if (TextBox1.Text == "Admin" && TextBox2.Text == "Admin")
            {
                Session["Type"] = "Admin";
                Session["Aid"] = TextBox1.Text;
                Response.Redirect("AddTeacher.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Incorrect Username or Password')</script>");
            }
        }
    }
}