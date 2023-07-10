using Demo1.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Configuration;

namespace Demo1.DataAccess
{
	 public partial class DataAcccessClass
	{
		public class People
		{
            public static bool addPerson(PersonDTO pers)
            {
                bool retVal = false;

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlConnection myConn = new SqlConnection(connectionString);

                try
                {
                    DateTime currentDate = DateTime.Today;
                    DateTime dob = pers.dteDOB;
                    int age = (currentDate.Year) - (dob.Year);

                    if (dob > currentDate.AddYears(-age))
                    {
                        age--;
                    }

                    if (age >= 21)
                    {
                        SqlCommand myCommand = new SqlCommand();
                        myCommand.CommandType = CommandType.StoredProcedure;
                        myCommand.CommandText = "up_AddPerson";
                        myCommand.Parameters.Add("@firstname", SqlDbType.VarChar).Value = pers.firstName;
                        myCommand.Parameters.Add("@lastname", SqlDbType.VarChar).Value = pers.lastName;
                        myCommand.Parameters.Add("@dteDOB", SqlDbType.Date).Value = dob.Date;
                        myCommand.Parameters.Add("@txtEmailAddress", SqlDbType.VarChar).Value = pers.txtEmailAddress;
                        myCommand.Connection = myConn;
                        myConn.Open();
                        myCommand.ExecuteNonQuery();
                        retVal = true;
                    }
                    else
                    {
                        // Display the age on the web page
                        throw new Exception("Person is under 21 years old. Age: " + age);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Please make sure to use a valid date of birth (Must be over 21)");
                }
                finally
                {
                    myConn.Close();
                }

                return retVal;
            }



            public static bool up_DeletePerson(int personId)
            {
                bool retVal = false;

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlConnection myConn = new SqlConnection(connectionString);

                try
                {
                    SqlCommand myCommand = new SqlCommand();
                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "up_DeletePerson";
                    myCommand.Parameters.Add("@personId", SqlDbType.Int).Value = personId;
                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();
                    retVal = true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to delete person. Please try again or contact support.");
                }
                finally
                {
                    myConn.Close();
                }

                return retVal;
            }




            public static DataTable getAll()
            {
                DataTable retVal = null;

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlConnection myConn = new SqlConnection(connectionString);

                try
                {
                    SqlCommand myCommand = new SqlCommand();
                    SqlDataAdapter sda = new SqlDataAdapter();
                    retVal = new DataTable();

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "up_GetAllPerson";
                    myCommand.Connection = myConn;
                    myConn.Open();
                    sda.SelectCommand = myCommand;
                    sda.Fill(retVal);

                    // Add a column with a formatted date for sorting
                    retVal.Columns.Add("SortableDate", typeof(DateTime));
                    foreach (DataRow row in retVal.Rows)
                    {
                        DateTime dob = (DateTime)row["Date of Birth"];
                        row["SortableDate"] = dob.Date;
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Something went wrong. Please try again. If the problem persists, please contact our support team.");
                }
                finally
                {
                    myConn.Close();
                }

                return retVal;
            }


        }
	}
}