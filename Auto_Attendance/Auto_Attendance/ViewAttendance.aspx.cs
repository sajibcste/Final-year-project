using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Drawing;

public partial class ViewAttendance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Attendance"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string sel = "select tname from teacherdetails";
        SqlDataAdapter sda = new SqlDataAdapter(sel, con);
        DataSet sds = new DataSet();
        sda.Fill(sds);
        if (sds.Tables[0].Rows.Count > 0)
        {
            DropDownList1.Items.Add("-- Select --");
            for (int i = 0; i < sds.Tables[0].Rows.Count; i++)
            {
                string val = sds.Tables[0].Rows[i][0].ToString();
                DropDownList1.Items.Add(val);
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string d1 = Calendar1.SelectedDate.ToString("yyyy/MM/dd");
        string d2 = Calendar2.SelectedDate.ToString("yyyy/MM/dd");

        SqlCommand cmd = new SqlCommand("Delete from temp",con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        string[] s,a;
        SqlDataAdapter da = new SqlDataAdapter("Select SName from StudentDetails where Teacher = '"+DropDownList1.Text+"'",con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        int row = ds.Tables[0].Rows.Count;

        s = new string[row];
        a = new string[row];

        for (int i = 0; i < row; i++)
        { 
            s[i] = ds.Tables[0].Rows[i][0].ToString();
        }

        for (int i = 0; i < row; i++)
        {
            da = new SqlDataAdapter("Select Attendance from Attendance where SName = '"+s[i]+"' AND Attendance = 'P' AND TName = '"+DropDownList1.Text+"' AND Date Between '"+d1+"' AND '"+d2+"'",con);
            ds = new DataSet();
            da.Fill(ds);

            cmd = new SqlCommand("Insert into Temp Values ('"+s[i]+"','"+ds.Tables[0].Rows.Count+"')",con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        da = new SqlDataAdapter("Select * from Temp",con);
        ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.Visible = true;
        Button2.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Xl();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }

    public void Xl()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}