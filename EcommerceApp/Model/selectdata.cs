using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EcommerceApp.Model
{
    public class selectdata
    {
        private string cs = ConfigurationManager.ConnectionStrings["ecom"].ConnectionString;

        public string returnscalar(string q)
        {
            string s;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(q, con);
            con.Open();
            try
            {
                s = cmd.ExecuteScalar().ToString();
            }
            catch (Exception)
            {
                s = "-1";
            }
            finally
            {
                con.Close();
            }
            return s;
        }
    }
}