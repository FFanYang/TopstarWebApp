using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Topstar
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();

        string proType = "Rent";
       
        string furnishedStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            RentPanel.Visible = true;
            BuyPanel.Visible = false;
        }

        

        protected void txtcity_TextChanged(object sender, EventArgs e)
        {
            
        }

       

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string type = dpType.SelectedValue;
            if(type == "Buy")
            {
                RentPanel.Visible = false;
                BuyPanel.Visible = true;
                proType = "Buy";
            }
            else if(type == "Rent")
            {
                RentPanel.Visible = true;
                BuyPanel.Visible = false;
                proType = "Rent";

            }
            
        }

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    string filePath = Server.MapPath("~/images/");
        //    HttpFileCollection uploadedFiles = Request.Files;

        //    //Span1.Text = string.Empty;

        //    for (int i = 0; i < uploadedFiles.Count; i++)
        //    {
        //        HttpPostedFile userPostedFile = uploadedFiles[i];
        //        try
        //        {
        //            if (userPostedFile.ContentLength > 0)
        //            {
        //                //Span1.Text += "<u>File#" + (i + 1) + "<u><br>";
        //                //Span1.Text += "File Content type:" + userPostedFile.ContentType + "<br>";
        //                //Span1.Text += "File size:" + userPostedFile.ContentLength + "kb <br>";
        //                //Span1.Text += "File Name:" + userPostedFile.FileName + "<br>";

        //                userPostedFile.SaveAs(filePath + "\\" + Path.GetFileName(userPostedFile.FileName));
        //           //     Span1.Text += "Location where saved:" + filePath + "\\" + Path.GetFileName(userPostedFile.FileName) + "<p>";

        //                dao.addImages(userPostedFile.FileName, filePath + "\\" + Path.GetFileName(userPostedFile.FileName));
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            lblMessage.Text = ex.Message.ToString();
        //            //Span1.Text += "Error: <br> " + ex.Message;
        //        }
        //    }   
        //}

        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            if(proType == "Rent")
            {
                furnishedStatus = rbFurnishedStatus.SelectedValue.ToString();

                int propertyid = dao.Addrentproperty(Convert.ToInt32(txtStreetNo.Text), txtStreetName.Text, txtSuburb.Text, txtCity.Text, Convert.ToInt32(txtNoOfBedrooms.Text), Convert.ToInt32(txtNoOfBathroonms.Text), Convert.ToInt32(txtParking.Text), Convert.ToDateTime(availableDate.SelectedDate), dpPropertyType.SelectedValue.ToString(), txtDescription.Text, Convert.ToDouble(txtWeeklyRent.Text), furnishedStatus);
                DirectoryInfo di = Directory.CreateDirectory("E:/Topstar/Topstar/Topstar/images/" + propertyid);

                string filePath = Server.MapPath("~/images/" + propertyid + "/");
                HttpFileCollection uploadedFiles = Request.Files;
              

                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            
                            userPostedFile.SaveAs(filePath + Path.GetFileName(userPostedFile.FileName));
                            string imgPath = filePath + Path.GetFileName(userPostedFile.FileName);
                            string imgName = userPostedFile.FileName;
                            dao.addImages(imgName, imgPath);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message.ToString();
                     
                    }
                }

                lblMessage.Text = "The property was added successfully";

            }
            else
            {

                furnishedStatus = rbFurnishedStatus.SelectedValue.ToString();

                int propertyid = dao.Addbuyproperty(Convert.ToInt32(txtStreetNo.Text), txtStreetName.Text, txtSuburb.Text, txtCity.Text, Convert.ToInt32(txtNoOfBedrooms.Text), Convert.ToInt32(txtNoOfBathroonms.Text), Convert.ToInt32(txtParking.Text), Convert.ToDateTime(availableDate.SelectedDate), dpPropertyType.SelectedValue.ToString(), txtDescription.Text,Convert.ToInt32(txtPrice.Text));
                DirectoryInfo di = Directory.CreateDirectory("E:/Topstar/Topstar/Topstar/images/" + propertyid);

                string filePath = Server.MapPath("~/images/" + propertyid + "/");
                HttpFileCollection uploadedFiles = Request.Files;


                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {

                            userPostedFile.SaveAs(filePath + Path.GetFileName(userPostedFile.FileName));
                            string imgPath = filePath + Path.GetFileName(userPostedFile.FileName);
                            string imgName = userPostedFile.FileName;
                            dao.addImages(imgName, imgPath);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message.ToString();

                    }
                }

                lblMessage.Text = "The property was added successfully";

            }
        }

      

       
    }
}