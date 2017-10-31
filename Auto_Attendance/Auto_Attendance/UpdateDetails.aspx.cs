using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class UpdateDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Medical"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Type"] == "User")
            {
                string uid = Session["Uid"].ToString();
                string str = "select name,address,mobile,email,age from registration where id='" + uid + "'";
                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
                    TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
                    TextBox3.Text = ds.Tables[0].Rows[0][2].ToString();
                    TextBox4.Text = ds.Tables[0].Rows[0][3].ToString();
                    TextBox5.Text = ds.Tables[0].Rows[0][4].ToString();
                }
            }
            else if (Session["Type"] == "Doctor")
            {
                string did = Session["Did"].ToString();
                string str = "select name,address,mobile,email,specialist from DoctorDetails where id='" + did + "'";
                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
                    TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
                    TextBox3.Text = ds.Tables[0].Rows[0][2].ToString();
                    TextBox4.Text = ds.Tables[0].Rows[0][3].ToString();
                    TextBox5.Text = ds.Tables[0].Rows[0][4].ToString();
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Session["Type"] == "User")
        {
            string uid = Session["Uid"].ToString();
            string update = "Update Registration set Address='" + TextBox2.Text + "', Mobile='" + TextBox3.Text + "', Email='" + TextBox4.Text + "', Age='" + TextBox5.Text + "' where id='"+uid+"'";
            SqlCommand cmd = new SqlCommand(update, con);
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Data Upadated Successfully')", true);
        }
        else if (Session["Type"] == "Doctor")
        {
            string did = Session["Did"].ToString();
            string update = "Update DoctorDetails set Mobile='" + TextBox2.Text + "', Address='" + TextBox3.Text + "', Email='" + TextBox4.Text + "', Specialist='" + TextBox5.Text + "' where id='"+did+"'";
            SqlCommand cmd = new SqlCommand(update, con);
            con.Open();
            cmd.ExecuteReader();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Data Upadated Successfully')", true);
        }
    }
}