<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RequestDoctor.aspx.cs" Inherits="ViewDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
    <style type="text/css">
 .intLog
        {
    	    -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }
        .auto-style2 {
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        background-color: #006600;
        color: #FFFFFF;
    }
        .auto-style3 {
            font-family: calibri;
            font-size: large;
            font-weight: bold;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="80%" style="border: 1px solid #C0C0C0">
    <tr>
        <td class="auto-style2"   
            style="background-image: url('../Images/blurred.jpg'); font-family: Calibri; font-size: xx-large;"
            align="center" bgcolor="#006600" colspan="2" >--Doctor's Profile--
        </td>
        </tr>
        <tr>
            <td align="right" width="50%">

                &nbsp;</td>
            <td align="right" width="50%">

                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" width="50%">

                <asp:Label ID="Label2" runat="server" CssClass="auto-style3" Text="Search By :"></asp:Label>

            </td>
            <td align="left" width="50%">

                <asp:DropDownList ID="DropDownList1" runat="server" 
                    style="font-size: large; font-family: Calibri;" Width="125px">
                    <asp:ListItem>-- Select --</asp:ListItem>
                    <asp:ListItem>Specialist</asp:ListItem>
                    <asp:ListItem>Location</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td align="right" width="50%">

                &nbsp;</td>
            <td align="right" width="50%">

                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" width="50%">

                <asp:Label ID="Label3" runat="server" CssClass="auto-style3" Text="Keyword :"></asp:Label>

            </td>
            <td align="left" width="50%">

                <asp:TextBox ID="TextBox2" runat="server" style="font-size: large; font-family: calibri" Width="250px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td align="right" width="50%">

                &nbsp;</td>
            <td align="left" width="50%" style="font-family: Calibri; font-size: large">

                <asp:Button ID="btnSearch" runat="server" Height="32px" 
                    onclick="btnSearch_Click" style="font-family: Calibri; font-size: large" 
                    Text="Search" Width="103px" />
            </td>
        </tr>
       
        </table>
    <table>
         <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
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
                <asp:BoundField HeaderText="Id" DataField="Id"/>
                <asp:BoundField HeaderText="Name" DataField="Name"/>
                <asp:BoundField HeaderText="Contact No." DataField="Mobile" />
                <asp:BoundField HeaderText="Address" DataField="Address" />
                <asp:BoundField HeaderText="Email Id" DataField="Email" />
                <asp:BoundField HeaderText="Specialist" DataField="Specialist" />
                    <asp:ImageField DataImageUrlField="image" HeaderText="Photograph" ControlStyle-Width="100px">
<ControlStyle Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Request Doctor">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("Id")%>' Text ="Send Request" CommandName ="Request" Font-Bold="False" ForeColor="#009933" style="color: #00CC99"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
              </asp:GridView>
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Height="63px" Width="516px" placeholder="Notify your doctor about the diseases you are suffering from...(Optional field)" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnConfirmReq" runat="server" BorderColor="#009933" Font-Size="Large" Height="37px" OnClick="btnConfirmReq_Click" Text="Confirm Request" Width="212px" />
             
                <br />
                <asp:Label ID="lblDocId" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblDocName" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Visible="False"></asp:Label>
                
                <asp:Label ID="lblMsg" runat="server" style="color: #666666; font-family: calibri; font-size: x-large"></asp:Label>
                
            </td>
        </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
</asp:Content>

