<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        background-color: White;
        color: #FFFFFF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="50%">
    <tr>
        <td class="auto-style2"   
            style="background-image: url('../Images/blurred.jpg'); font-family: Calibri; font-size: xx-large; background-color: #006600;"
            align="center" >-- Mark Attendance --
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
                   <asp:TemplateField HeaderText="Present">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" AutoPostBack="true" Checked="true" Text="Yes" runat="server" />
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Student Id" DataField="Sid"/>
                <asp:BoundField HeaderText="Name" DataField="Sname" />
                </Columns>
              </asp:GridView>
            </td>            
        </tr>
        </table>
    <br />
    <asp:Label ID="lblMsg" runat="server" style="color: #666666; font-family: calibri; font-size: x-large"></asp:Label>
    <asp:Label ID="lblTid" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblTname" runat="server" Visible="False"></asp:Label>
    <br />  
    <asp:Button ID="Button1" runat="server" Text="Present" CssClass="intabular" OnClick="Button1_Click" style="font-size: large" />    
    <br />
</asp:Content>

