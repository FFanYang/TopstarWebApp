using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace Topstar
{
    public partial class SlideshowDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public static string GetPrice(int start, int end)
        {

            string strConnString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                string query = "SELECT * FROM tbrproperty WHERE (Rweekly BETWEEN @Start AND @End) OR (@Start = 0 AND @End = 0)";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Start", start);
                    cmd.Parameters.AddWithValue("@End", end);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(ds, "Products");
                    }
                }
            }
            DataTable dt = new DataTable();
            dt.TableName = "Range";
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                string query = "SELECT MIN(Rweekly) [Min], MAX(Rweekly) [Max] FROM tbrproperty";
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                }
            }
            ds.Tables.Add(dt);
            return ds.GetXml();

        }
    }

}