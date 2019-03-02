<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProperties.aspx.cs" Inherits="Topstar.AddProperties" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
     <h1 class="auto-style1"> Add New Property</h1>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table >
                <tr> <td class="auto-style1"> 
                    <asp:Label ID="Label1" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="auto-style1"> <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="217px"></asp:TextBox></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
