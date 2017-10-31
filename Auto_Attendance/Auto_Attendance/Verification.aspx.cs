using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Verification : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Medical"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        String id = Request.QueryString["id"];
        SqlCommand cmd;
        con.Open();
        string up = "update registration set status='Verified' where id='" + id + "'";
        cmd = new SqlCommand(up, con);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["Verify"] = "Data";
        Response.Redirect("http://localhost:60033/PatientLogin.aspx");
    }
}