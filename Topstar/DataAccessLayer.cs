using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Topstar
{
    public class DataAccessLayer
    {
        public SqlConnection connection = null;
        String connectionString = null;


        public void AddPanelIems(string logo, string companyName, string img1, string img2, string img3, string address, int phoneNo, string nav)
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            String query = "insert into tbPanel values ('" + img1 + "','" + img2 + "','" + img3 + "','" + logo + "','" + companyName + "','" + address + "','" + phoneNo + "','" + nav + "')";

            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();


        }


        public void AddNewNavigation(string name)
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();

            string query = "insert into tbnavigation values('" + name + "')";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();


        }
    }
}