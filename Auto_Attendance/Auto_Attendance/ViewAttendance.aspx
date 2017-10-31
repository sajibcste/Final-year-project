<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAttendance.aspx.cs" Inherits="ViewAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="90%">
    <tr>
        <td align="center" bgcolor="#006600" class="auto-style1" style="background-image: url('../Images/blurred.jpg'); font-family: Calibri; font-size: xx-large;" colspan="3">
                            
            <asp:Label ID="Label1" runat="server" Text="View Attendance" 
                Font-Size="X-Large" Font-Underline="True"></asp:Label>
            <br />
        </td>
    </tr>
        <tr>
            <td colspan="3" align="center">
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Teacher Name  :"></asp:Label>
&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    style="font-family: calibri; font-size: large" Width="155px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" width="40%">

                <asp:Label ID="Label2" runat="server" style="font-family: calibri; font-size: large" Text="From Date :"></asp:Label>

            </td>
            <td rowspan="2" width="15%">

            </td>
            <td align="left" width="40%">

                <asp:Label ID="Label3" runat="server" style="font-family: calibri; font-size: large" Text="To Date :"></asp:Label>

            </td>
        </tr>
        <tr>
            <td align="right" width="40%">

                <asp:Calendar ID="Calendar1" runat="server" style="font-family: calibri"></asp:Calendar>

            </td>
            <td align="left" width="40%">

                <asp:Calendar ID="Calendar2" runat="server" style="font-family: calibri"></asp:Calendar>

            </td>
        </tr>
        <tr>
            <td colspan="3">

                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center">

                <asp:Button ID="Button1" runat="server" 
                    style="font-family: calibri; font-size: x-large" Text="Search" Width="199px" 
                    onclick="Button1_Click" CssClass="intabular" />

            </td>
        </tr>
        <tr>
            <td colspan="3">

                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3">

                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center">

                <table style="border: 1px solid #C0C0C0" width="80%">

                    <tr>
                        <td align="center">
                            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                style="font-family: Calibri; font-size: large" Width="100%">
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                
                            </asp:GridView>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">

                <br />
                <br />

                <asp:Button ID="Button2" runat="server" 
                    style="font-family: calibri; font-size: x-large" Text="Export" Width="199px" 
                    onclick="Button2_Click" CssClass="intabular" Visible="False" />

            </td>
        </tr>
        <tr>
            <td colspan="3">

                &nbsp;</td>
        </tr>
    </table> 
</asp:Content>

