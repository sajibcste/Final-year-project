<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherLogin.aspx.cs" Inherits="DoctorLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 15%;
        }
         .intLog
        {
    	    -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="60%" style="background-image: url('Images/bg.jpg'); " class="intLog">
            <tr>
                <td class="intLog"
                    style="background-image: url('Images/bg3.jpg'); color: #FFFFFF; background-color: #DADADA; width: 0.1%;" 
                    align="center">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/back.png" Width="40px" CausesValidation="False" PostBackUrl="~/MainLogin.aspx" EnableViewState="False" />
                    </td>
                <td width="90%" class="intLog"
                    style="background-image: url('Images/bg3.jpg'); color: #FFFFFF; background-color: #006600; width: 25%;" 
                    align="center">
                    <asp:Label ID="Label1" runat="server" Text="-- Teacher Login --" Font-Size="XX-Large" 
                        ForeColor="#333333" style="font-family: Calibri; color: #FFFFFF"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td width="50%" 
                    style="background-image: url('Images/blurred.jpg')" 
                    class="intLog" height="300" align="center" colspan="2">
                    <table width="100%">
                        <tr>
                            <td align="right" width="90%">
                                &nbsp;</td>
                            <td align="right" width="10%">
                                &nbsp;</td>
                        </tr>
                        </table> 
                    <table class="style3">
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style4" align="center">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="  Username" 
                                     CssClass="intLog" Height="30px" Width="230px" 
                                    Font-Size="Large"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="style4" align="left">
                                <asp:Label ID="Label2" runat="server" style="color: #FF0000; font-family: calibri"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="center">
                                <asp:TextBox ID="TextBox2" runat="server"  placeholder="  Password" 
                                    CssClass="intLog" Height="30px" Width="230px" 
                                    Font-Size="Large" TextMode="Password" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" style="color: #FF0000; font-family: calibri"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="Button1" runat="server" Font-Bold="False" Font-Size="14pt" style="font-family: calibri" Text="Login &gt;" OnClick="Button1_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
         </table>
    <br />
    <br />
</asp:Content>

