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
        public int propertyid;

        public void openConnection()
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        public void AddPanelIems(string logo, string companyName, string img1, string img2, string img3, string address, int phoneNo, string nav)
        {
            openConnection();

            String query = "insert into tbPanel values ('" + img1 + "','" + img2 + "','" + img3 + "','" + logo + "','" + companyName + "','" + address + "','" + phoneNo + "','" + nav + "')";

            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();


        }


        public void AddNewNavigation(string name)
        {
            openConnection();

            string query = "insert into tbnavigation values('" + name + "')";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();


        }

        public void addImages(string imgName, string imgPath)
        {
            openConnection();

            string addImages = "insert into tbimages(name, imagePath, propertyid) values('" + imgName + "','" + imgPath + "','" + propertyid + "')";
            SqlCommand cmd4 = new SqlCommand(addImages, connection);
            cmd4.ExecuteNonQuery();
        }


        public int Addrentproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, DateTime availability, string type, string description, double weeklyrent, string furnished)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            string getPropertyid = "select propertyid from tbproperty where streetNo ='" + streetNo + "' and streetName = '" + streetname + "'";
            SqlCommand cmd2 = new SqlCommand(getPropertyid, connection);
            propertyid = Convert.ToInt32(cmd2.ExecuteScalar());

            string addrentproperty = "insert into tbrproperty(propertyid , Rweekly, furnishedstatus) values ('" + propertyid + "','" + weeklyrent + "','" + furnished + "')";
            SqlCommand cmd3 = new SqlCommand(addrentproperty, connection);
            cmd3.ExecuteNonQuery();

            return propertyid;


        }

        public int Addbuyproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, DateTime availability, string type, string description, int price)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            string getPropertyid = "select propertyid from tbproperty where streetNo ='" + streetNo + "' and streetName = '" + streetname + "'";
            SqlCommand cmd2 = new SqlCommand(getPropertyid, connection);
            int propertyid = Convert.ToInt32(cmd2.ExecuteScalar());

            string addrentproperty = "insert into tbbproperty(propertyid , price) values ('" + propertyid  + "','" + price + "')";
            SqlCommand cmd3 = new SqlCommand(addrentproperty, connection);
            cmd3.ExecuteNonQuery();

            return propertyid;

        }

        //public object searchProperty()
        //{

        //}
    }
}