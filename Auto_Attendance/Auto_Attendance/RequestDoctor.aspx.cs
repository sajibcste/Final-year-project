using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Text;

public partial class ViewDoctor : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Medical"].ConnectionString);
    string init = "";
    string uname = "";
    string address = "";
    string mob = "";
    string uemail = "";
    string age = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        TextBox1.Visible = false;
        btnConfirmReq.Visible = false;
        string str = "select id,name,mobile,address,email,specialist,image from doctordetails";
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
            lblMsg.Text = "Currently, No record found.";
            lblMsg.Visible = true;
        }
        string str1 = "select top 1 ReqId from RequestDoc order by ReqId desc";
        SqlDataAdapter dal = new SqlDataAdapter(str1, con);
        DataSet dsl = new DataSet();
        dal.Fill(dsl);
        int s = dsl.Tables[0].Rows.Count;
        if (s == 0)
        {
            init = "1";
        }
        else
        {
            string st = ds.Tables[0].Rows[0][0].ToString();
            int s1 = Convert.ToInt32(st) + 1;
            init = s1.ToString();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Request")
        {
            string i = Convert.ToString(e.CommandArgument.ToString());
            string s = "select id,name,mobile,address,email,specialist,image from doctordetails where id='" + i + "'";
            SqlDataAdapter da = new SqlDataAdapter(s, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                lblDocId.Text = ds.Tables[0].Rows[0][0].ToString();
                lblDocName.Text = ds.Tables[0].Rows[0][1].ToString();
                lblEmail.Text = ds.Tables[0].Rows[0][4].ToString();
                TextBox1.Visible = true;
                btnConfirmReq.Visible = true;
            }
        }
    }

    protected void btnConfirmReq_Click(object sender, EventArgs e)
    {
        string id = Session["Uid"].ToString();
        string str = "select name,address,mobile,email,age from registration where id=" + id + "";
        SqlDataAdapter sda = new SqlDataAdapter(str, con);
        DataSet sds = new DataSet();
        sda.Fill(sds);
        if (sds.Tables[0].Rows.Count > 0)
        {
            uname = sds.Tables[0].Rows[0][0].ToString();
            address = sds.Tables[0].Rows[0][1].ToString();
            mob = sds.Tables[0].Rows[0][2].ToString();
            uemail = sds.Tables[0].Rows[0][3].ToString();
            age = sds.Tables[0].Rows[0][4].ToString();
        }
        string date = DateTime.Now.ToString("dd/MM/yyyy");
        string ins = "insert into RequestDoc values('" + init + "','" + id + "','" + uname + "','" + address + "','" + mob + "','" + age + "','" + uemail + "','" + date + "','" + lblDocId.Text + "','" + lblDocName.Text + "','" + TextBox1.Text + "')";
        SqlCommand cmd = new SqlCommand(ins, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        //Email Code

        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        mail.From = new MailAddress("voramish7018@gmail.com");
        mail.To.Add(lblEmail.Text);
        mail.Subject = "Mail from Medical Helpline System";
        mail.Body = TextBox1.Text;

        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("voramish7018@gmail.com", "allbesss");
        SmtpServer.EnableSsl = true;
        SmtpServer.Send(mail);

        Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Your details sent to Doctor..!!')", true);

        string str2 = "select id,name,mobile,address,email,specialist,image from doctordetails";
        SqlDataAdapter da2 = new SqlDataAdapter(str2, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds2;
            GridView1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string ddl=DropDownList1.SelectedItem.Text;
        if (ddl == "Specialist")
        {
            string str = "select id,name,mobile,address,email,specialist,image from doctordetails where Specialist like '%" + TextBox2.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                lblMsg.Text = "No record found";
                lblMsg.Visible = true;
            }
        }
        else if (ddl == "Location")
        {
            string str = "select id,name,mobile,address,email,specialist,image from doctordetails where address like '%" + TextBox2.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                lblMsg.Text = "No record found";
                lblMsg.Visible = true;
            }
        }
        else if(ddl=="-- Select --")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Kindly select Search By..!')", true);
        }
    }
}
    
