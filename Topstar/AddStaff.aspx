<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLogin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Topstar.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <script src="Scripts/jquery-3.0.0.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            var scntDiv = $('#FileUploaders');
            var i = $('#FileUploaders p').size() + 1;

            $('#addUploaders').live('click', function () {
                $('<p> <input type="file" id="fileUpaloder' + i + '"name = "FileUploader' + i + '"/> </label> <a href="#" id="removeUploader"> Remove </a> </p>').appendTo(scntDiv);
                i++;
                return false;
            });

            $('#removeUpLoader').live('click', function () {
                if (i > 2) {
                    $(this).parents('p').remove();
                    i--;
                }
                return false;
            });
        });
    </script>--%>
<%--    <form  method='post' runat="server">
        <asp:FileUpload ID="imgupload" runat="server" multiple='multiple'/>

<input type='submit' name='submit'/>
        <asp:Button ID="btnAddImage" runat="server" Text="Button" OnClick="btnAddImage_Click" />
        <asp:Label ID="Label1" runat="server" ></asp:Label>
</form>--%>
 <script src="Scripts/jquery-1.10.2.js"></script>

    <script type="text/javascript">

        $(function () {

            debugger;

            var DivElement = $('#MultipleFileUploader');

            var i = $('#MultipleFileUploader p').size() + 1;

 

            $('#AddAnotherUploader').on('click', function () {

                $('<p><input type="file" ID="FileUploader1' + i + '" name="FileUploader1' + i + '" class="form-control" />

                 </p>').appendTo(DivElement);

                i++;

                return false;

            });           

        });

    </script>

    <div class="form-horizontal">

        <h4>Uploading Multiple Files</h4>

        <hr />

        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <div class="form-group">

            <asp:Label runat="server" CssClass="col-md-2 control-label">Choose File</asp:Label>

            <div class="col-md-10" id="MultipleFileUploader">

                <p>

                    <asp:FileUpload runat="server" ID="FileUploader" CssClass="form-control" />

                    <a href="#" id="AddAnotherUploader">Add Files</a>

                </p>

            </div>

        </div>

        <div class="form-group">

            <div class="col-md-offset-2 col-md-10">

                <asp:Button runat="server" ID="BtnUploadFile" OnClick="BtnUploadFile_Click" 

                Text="Upload Files" CssClass="btn btn-default" />

            </div>

        </div>

        <div class="form-group">

            <asp:Label runat="server" CssClass="col-md-2 control-label">Select Files:</asp:Label>

            <div class="col-md-10">

                <asp:GridView runat="server" ID="DataGridView" AutoGenerateColumns="false"

                 OnRowCommand="DataGridView_RowCommand" CssClass="form-control">

                    <Columns>

                        <asp:BoundField HeaderText="File Name" DataField="Name" />

                        <asp:BoundField HeaderText="File Size" DataField="Size" />

                        <asp:TemplateField HeaderText="Get File">

                            <ItemTemplate>

                                <asp:LinkButton ID="LbnDownload" runat="server" CommandName="DownloadFile" 

                                    CommandArgument='<%# Eval("Id") %>'>Download</asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>
</asp:Content>
