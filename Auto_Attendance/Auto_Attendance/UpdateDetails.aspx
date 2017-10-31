<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateDetails.aspx.cs" Inherits="UpdateDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 60%;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style1" style="background-image: url('Images/bg.jpg'); ">
        <tr>
            <td bgcolor="#CC3300" align="center">
                <asp:Label ID="Label1" runat="server" style="font-family: calibri; font-size: xx-large; color: #FFFFFF" Text="-- Update your Profile --"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Height="25px" Width="250px" BackColor="#CCCCCC"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="250px" MaxLength="10"></asp:TextBox>
                <br />
             <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid Mobile No.!" 
                                ForeColor="#FF3300" ValidationExpression="^[7-9]\d{9}$" 
                                style="font-family: Calibri"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="250px"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RxvEmail" runat="Server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Id!" 
                                ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                style="font-family: Calibri"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" BorderColor="#009900" Font-Size="Large" Height="35px" OnClick="btnUpdate_Click" Width="120px" />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

