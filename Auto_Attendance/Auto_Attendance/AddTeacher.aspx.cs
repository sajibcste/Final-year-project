using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AddDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Add"] == "Data")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Details Inserted Successfully')", true);
            Session["Add"] = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
        string str = "select count(Tid) from TeacherDetails";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string s = ds.Tables[0].Rows[0][0].ToString();
        if (s == "0")
        {
            Label2.Text = "101";
        }
        else
        {
            string str1 = "select top 1 tid from TeacherDetails order by tid desc";
            SqlDataAdapter da1 = new SqlDataAdapter(str1, con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            string s1 = ds1.Tables[0].Rows[0][0].ToString();
            int s2 = Convert.ToInt32(s1) + 1;
            Label2.Text = s2.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.Text == "")
        {
            lblError.Text = "Kindly select gender";
        }
        else
        {
            con.Open();
            string sql = "insert into TeacherDetails values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();

            con.Close();
            Session["Add"] = "Data";
            Response.Redirect("AddTeacher.aspx");
        }
    }
}
