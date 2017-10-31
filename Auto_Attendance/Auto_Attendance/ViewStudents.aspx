<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStudents.aspx.cs" Inherits="ViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         .intLog
        {
    	    -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }
        .auto-style2 {
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="80%" style="border: 1px solid #C0C0C0">
    <tr>
        <td    
            style="background-image: url('../Images/blurred.jpg'); font-family: Calibri; font-size: xx-large;"
            align="center" bgcolor="#006600" class="auto-style2" >-- Student Profile --
        </td>
        </tr>
        <tr>
            <td align="center">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    Width="100%" AutoGenerateColumns="False" 
                    style="font-family: Calibri; font-size: large">
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                <Columns>
                <asp:BoundField HeaderText="Id" DataField="Sid"/>
                <asp:BoundField HeaderText="Name" DataField="Sname"/>
                <asp:BoundField HeaderText="Address" DataField="Address" />
                <asp:BoundField HeaderText="Mobile" DataField="contact" />
                <asp:BoundField HeaderText="Email Id" DataField="Email" />
                <asp:BoundField HeaderText="Gender" DataField="Gender" />
                <asp:BoundField HeaderText="Dob" DataField="Dob" />
                <asp:BoundField HeaderText="Batch" DataField="Ba" />
                </Columns>
              </asp:GridView>
            </td>
        </tr>
        </table>
       <br />
                <asp:Label ID="lblMsg" runat="server" style="color: #666666; font-family: calibri; font-size: large"></asp:Label>
    <br />
    <br />
</asp:Content>

