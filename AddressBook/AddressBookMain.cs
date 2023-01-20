using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AddressBook
{
    public class AddressBookMain
    {
        public static string connectionString = "data source=(localdb)\\MSSQLLocalDB; initial catalog=AddressBook; integrated security=true";
        SqlConnection sqlconnection = new SqlConnection(connectionString);
        public int GetPerson()
        {
            try
            {
                using (this.sqlconnection)
                {
                    this.sqlconnection.Open();
                    List<Contact> PersonList = new List<Contact>();
                    SqlCommand command = new SqlCommand("spGetPerson", this.sqlconnection);
                    command.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    this.sqlconnection.Close();
                    int count = 0;
                    foreach (DataRow dr in table.Rows)
                    {
                        PersonList.Add(new Contact
                        {
                            FName = Convert.ToString(dr["FirstName"]),
                            LName = Convert.ToString(dr["LastName"]),
                            Address = Convert.ToString(dr["Address"]),
                            City = Convert.ToString(dr["City"]),
                            State = Convert.ToString(dr["State"]),
                            ZipCode = Convert.ToInt32(dr["ZipCode"]),
                            PhoneNumber = Convert.ToInt32(dr["PhoneNumber"]),
                            Email = Convert.ToString(dr["EmailAddress"])
                        });
                        count++;
                    }
                    return count;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
