<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="AddDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
         .intLog
        {
    	    -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }
         .auto-style1 {
             font-size: x-large;
             color: #666666;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="60%" style="background-image: url('../Images/bg1.jpg')" class="intLog">

        <tr>
            <td align="center" class="intLog" 
                style="border-bottom: 3px solid #808080; color: #FFFFFF; font-size: xx-large; background-image: url('../Images/blurred.jpg'); font-family: Calibri; background-color: #006600;" colspan="2">
                <asp:Label ID="Label3" runat="server" style="color: #FFFFFF" Text="-- Add Student --"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
               
                &nbsp;</td>
        </tr>
       
        <tr>
            <td align="center" colspan="2">
               
                <strong>
               
                <asp:Label ID="Label1" runat="server" Text="Id :" style="font-family: Calibri; " CssClass="auto-style1"></asp:Label>
               
                <asp:Label ID="Label2" runat="server" style="font-family: Calibri; " Text="Label" CssClass="auto-style1"></asp:Label>
               
                </strong>
               
                <br />
               
            </td>
        </tr>
      
              
        <tr>
            <td align="center" colspan="2">
               
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
               
                <asp:TextBox ID="TextBox1" runat="server" CssClass="intLog" Height="25px" placeholder=" Name" required="Required" Width="275px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>           
        </tr>
       <tr>
            <td align="center" colspan="2">
               
                <asp:TextBox ID="TextBox2" runat="server" CssClass="intLog" Height="25px" placeholder=" Address" required="Required" Width="275px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="intLog" Height="25px" placeholder=" Contact No." required="Required" Width="275px" MaxLength="10"></asp:TextBox>
               <br />
                <asp:RegularExpressionValidator ID="RxvMobNo" runat="Server" 
                                ControlToValidate="TextBox3" ErrorMessage="Invalid Mobile No.!" 
                                ForeColor="#FF3300" ValidationExpression="^[7-9]\d{9}$" 
                                style="font-family: Calibri"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="intLog" Height="25px" placeholder=" Email Id" required="Required" Width="275px"></asp:TextBox>
             <br />
                 <asp:RegularExpressionValidator ID="RxvEmail" runat="Server" 
                                ControlToValidate="TextBox4" ErrorMessage="Invalid Email Id!" 
                                ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                style="font-family: Calibri"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                </td>
            
        </tr>
         <tr>
            <td align="right" width="45%">
                <asp:Label ID="Label4" runat="server" CssClass="auto-style1" style="font-family: calibri" Text="Gender :"></asp:Label>
             </td>   
             <td align="left" width="55%">
                 <asp:RadioButtonList ID="RadioButtonList1" runat="server" style="font-family: calibri; font-size: large" Width="134px">
                     <asp:ListItem>Male</asp:ListItem>
                     <asp:ListItem>Female</asp:ListItem>
                 </asp:RadioButtonList>
             </td>
        </tr>
        <tr>
            <td align="center" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="intLog" Height="25px" placeholder=" DOB" required="Required" Type="Date" Width="275px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:TextBox ID="TextBox6" runat="server" CssClass="intLog" Height="25px" placeholder=" Class" required="Required" Width="275px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label5" runat="server" CssClass="auto-style1" style="font-family: calibri" Text="Class Teacher :"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="DropDownList1" runat="server" style="font-family: calibri; font-size: large" Width="150px"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" BorderColor="#666666" CssClass="intLog" Font-Size="Large" Height="40px" OnClick="Button1_Click" Text="Submit" Width="220px" />
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

