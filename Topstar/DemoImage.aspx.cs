using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Topstar
{
    public partial class DemoImage : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload_Files(object sender, EventArgs e)
        {
            //string[] files = Directory.GetFiles(Server.MapPath(imgPath));

            //List<string> filenames = new List<string>();

            //for(int i=0;i<files.Length;i++)
            //{
            //    try
            //    {
            //        Boolean enable = true;
            //        string relativePath = "~/images/";
            //        string imgName = File.FileName.ToString();
            //        //   File.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + imgName);
            //        string imgPath = "/images/" + imgName.ToString();

            //        bool isExists = System.IO.Directory.Exists(Server.MapPath(imgPath));
            //        if (!isExists)
            //        {
            //            System.IO.Directory.CreateDirectory(Server.MapPath(imgPath));
            //            File.SaveAs(Server.MapPath(imgPath + imgName));
            //            dao.addImages(imgName, imgPath);
            //         //   Log.InsertLogs(Session["Role"].ToString() + ":" + Session["trainer"].ToString(), "CreateModule.aspx.cs btn_Click", "Query Successfully Executed to insert image");
            //            Response.Write("<script>alert('Image uploaded..!!!');</script>");


            //        } 
            //    }
            //    catch(Exception ex)
            //    {
            //        lblUploadStatus.Text = ex.Message.ToString();
            //    }
                
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/images/");
            HttpFileCollection uploadedFiles = Request.Files;

            Span1.Text = string.Empty;

            for(int i=0;i<uploadedFiles.Count;i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if(userPostedFile.ContentLength >0)
                    {
                        Span1.Text += "<u>File#" + (i + 1) + "<u><br>";
                        Span1.Text += "File Content type:" + userPostedFile.ContentType + "<br>";
                        Span1.Text += "File size:" + userPostedFile.ContentLength + "kb <br>";
                        Span1.Text += "File Name:" + userPostedFile.FileName + "<br>";

                        userPostedFile.SaveAs(filePath + "\\" + Path.GetFileName(userPostedFile.FileName));
                        Span1.Text += "Location where saved:" + filePath + "\\" + Path.GetFileName(userPostedFile.FileName) + "<p>";

                        dao.addImages(userPostedFile.FileName, filePath + "\\" + Path.GetFileName(userPostedFile.FileName));
                    }
                }
                catch (Exception ex)
                {
                    Span1.Text += "Error: <br> " + ex.Message;
                }
            }
        }
    }
    }
