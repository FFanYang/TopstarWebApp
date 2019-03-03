<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPanelItems.aspx.cs" Inherits="Topstar.AddPanelItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        .auto-style1 {
            height: 32px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <table >
                <tr>
                    <td>   <asp:Label ID="Label0" runat="server" Text="Company Logo:"></asp:Label></td>
                    <td>  <asp:FileUpload ID="fpLogoImage" runat="server" Height="25px" Width="269px" />
&nbsp;</td>
                </tr>
                <tr> <td> 
                    <asp:Label ID="Label1" runat="server" Text="Company name:"></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtComName" runat="server" Height="22px" Width="206px"></asp:TextBox>
                    </td></tr>

                <tr> <td> 
                    <asp:Label ID="Label2" runat="server" Text="Company Address:"></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtComAddress" runat="server" Height="22px" Width="206px"></asp:TextBox>
                    </td></tr>

                
                <tr> <td> 
                    <asp:Label ID="Label3" runat="server" Text="Company Phone No:"></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtComPhoneNo" runat="server" Height="22px" Width="206px"></asp:TextBox>
                    </td></tr>

                
                <tr> <td> 
                    <asp:Label ID="Label4" runat="server" Text="Slide show Image1"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="slide1" runat="server" />
                    </td></tr>

                <tr> <td> 
                    <asp:Label ID="Label5" runat="server" Text="Slide show Image2"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="slide2" runat="server" />
                    </td></tr>

                <tr> <td> 
                    <asp:Label ID="Label6" runat="server" Text="Slide show Image3"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="slide3" runat="server" />
                    </td></tr>

                <tr> <td class="auto-style1"> 
                    <asp:Label ID="Label7" runat="server" Text="Navigation Bars"></asp:Label>
                    </td>
                    <td id="txtNav1" class="auto-style1">
                    <asp:TextBox ID="txtNavigation" runat="server" Height="22px" Width="206px"></asp:TextBox>
                    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT DISTINCT [navName] FROM [tbnavigation]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtopstarConnectionString %>" SelectCommand="SELECT DISTINCT [navName] FROM [tbPanel]"></asp:SqlDataSource>
                    </td></tr>

                <tr> <td> 
                    &nbsp;</td>
                    <td >
                        <asp:Button ID="btnAddNav" runat="server" OnClick="btnAddNav_Click" Text="Add New navigation item" />
                    </td></tr>

                <tr> <td> 
                    &nbsp;</td>
                    <td>
                        <asp:button id="btnUpload" type="submit" text="Upload" runat="server" Height="31px" Width="119px" OnClick="btnUpload_Click"></asp:button>
                    </td></tr>

                <tr> <td> 
                    &nbsp;</td>
                    <td>
                        <asp:Label ID="lbMessage" runat="server"></asp:Label>
                    </td></tr>

            </table>
            
        </div>
    </form>
</body>
</html>
