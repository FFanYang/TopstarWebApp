using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class AddPanelItems : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            if (fpLogoImage.HasFile)
            {
                string logo1 = fpLogoImage.FileName;
                fpLogoImage.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + logo1);

                string slideshow1 = slide1.FileName;
                slide1.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + slideshow1);

                string slideshow2 = slide2.FileName;
                slide2.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + slideshow2);

                string slideshow3 = slide3.FileName;
                slide3.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + slideshow3);

                string path1 = "/images/" + logo1.ToString();
                string slidePath1 = "/images/" + slideshow1.ToString();
                string slidePath2 = "/images/" + slideshow2.ToString();
                string slidePath3 = "/images/" + slideshow3.ToString();

                dao.AddPanelIems(path1, txtComName.Text, slidePath1, slidePath2, slidePath3, txtComAddress.Text, Convert.ToInt32(txtComPhoneNo.Text), txtNavigation.Text);


            }
            else
            {
                lbMessage.Text = "Atleast one logo image is required";
            }




        }


        protected void btnAddNav_Click(object sender, EventArgs e)
        {
            string name = txtNavigation.Text;
            dao.AddNewNavigation(name);
            lbMessage.Text = "Navigation Added";



        }
    }
}