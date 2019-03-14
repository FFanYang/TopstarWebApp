<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoImage.aspx.cs" Inherits="Topstar.DemoImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Multiple File Upload</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>
    $('#btUpload').click(function() { 
        if (fileUpload.value.length == 0) {    // CHECK IF FILE(S) SELECTED.
            alert('No files selected.');        
            return false; 
        } 
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divFile">
             <input type="file" id="myfile" multiple="multiple" name="myfile" runat="server" size="100" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="Span1" runat="server"></asp:Label>
            </div>
    </form>
</body>
</html>
