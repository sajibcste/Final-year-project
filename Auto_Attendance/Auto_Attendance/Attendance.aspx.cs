using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ViewRequest : System.Web.UI.Page
{
    string tid = "";
    string tname = "";
    string date = "";
    string time = "";
    string attendance = "";
    int select;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tid = Session["Tid"].ToString();
            lblTid.Text = tid;

            string str = "select tname from TeacherDetails where tid='" + tid + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                dr.Read();
                tname = dr[0].ToString();
                lblTname.Text = tname;
                con.Close();
            
                cmd = new SqlCommand("Select Sname from Attendance where TName = '" + tname + "' AND Date = '"+DateTime.Now.ToString("yyyy/MM/dd")+"'", con);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Button1.Visible = false;
                }
                else
                {
                    Button1.Visible = true;
                }
                con.Close();
                string str1 = "select sid,sname from StudentDetails where teacher='" + tname + "' order By SId";
                SqlDataAdapter da1 = new SqlDataAdapter(str1, con);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds1;
                    GridView1.DataBind();
                    lblMsg.Visible = false;
                }
                else
                {
                    lblMsg.Text = "Currently, No request found.";
                }
            
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            GridViewRow row = GridView1.Rows[i];
            CheckBox Chbox = (CheckBox)row.FindControl("CheckBox1");
            if (Chbox.Checked == true)
            {
                select++;
            }
        }

        if (select == 0)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please check one checkbox records');", true);
        }
        else
        {
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                date = DateTime.Now.ToString("yyyy/MM/dd");
                time = DateTime.Now.ToString("HH:mm");
                string sid = GridView1.Rows[i].Cells[1].Text;
                string sname = GridView1.Rows[i].Cells[2].Text;

                GridViewRow row = GridView1.Rows[i];
                CheckBox Chbox = (CheckBox)row.FindControl("CheckBox1");
                if (Chbox.Checked == true)
                {
                    InsertData(sid, sname, "P");
                }
                else
                {
                    InsertData(sid, sname, "A");
                }
            }
        }
        //Response.Write("Record inserted successfully");
    }
    void InsertData(String sid, String sname,string AP)
    {
        
        try
        {
            string ins = "insert into Attendance values('" + sid + "','" + sname + "','" + lblTid.Text + "','" + lblTname.Text + "','" + AP + "','" + date + "','" + time + "' )";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Attendance Marked Successfully')", true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
}