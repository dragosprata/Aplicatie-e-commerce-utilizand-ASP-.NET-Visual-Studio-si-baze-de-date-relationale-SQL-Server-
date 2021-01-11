using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EcommerceApp.Model
{
    public class insert
    {
        private string cs = ConfigurationManager.ConnectionStrings["ecom"].ConnectionString;
        public string signup_admin(admin a)
        {
            string k;
            SqlConnection con = new SqlConnection(cs);

            try
            {
                SqlCommand cmd = new SqlCommand("spinsert_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@ad_email", SqlDbType.NVarChar, 50).Value = a.email;
                cmd.Parameters.Add("@ad_password", SqlDbType.NVarChar, 50).Value = a.password;
                cmd.Parameters.Add("@ad_phone", SqlDbType.NVarChar, 50).Value = a.phone;

                SqlParameter para = new SqlParameter();
                para.SqlDbType = SqlDbType.Int;
                para.Direction = ParameterDirection.Output;
                para.ParameterName = "@id";
                cmd.Parameters.Add(para);

                con.Open();
                cmd.ExecuteNonQuery();
                k = para.Value.ToString();

            }
            catch (Exception)
            {

                k = "-1";
            }
            finally
            {
                con.Close();

            }
            return k;
        }

        public string insert_tblproduct(product p)
        {
            string k = "1";
            SqlConnection con = new SqlConnection(cs);

            try
            {
                SqlCommand cmd = new SqlCommand("sp_insert_product", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@pro_name", SqlDbType.NVarChar, 50).Value = p.pro_name;
                cmd.Parameters.Add("@pro_posted_date", SqlDbType.Date).Value = p.pro_date;
                cmd.Parameters.Add("@pro_price", SqlDbType.Float).Value = p.pro_price;
                cmd.Parameters.Add("@pro_image", SqlDbType.NVarChar).Value = p.pro_img;
                cmd.Parameters.Add("@pro_fk_ad", SqlDbType.Int).Value = p.pro_adminid_fk;
                cmd.Parameters.Add("@pro_fk_cat", SqlDbType.Int).Value = p.pro_catid_fk;

                SqlParameter para = new SqlParameter();
                para.SqlDbType = SqlDbType.Int;
                para.Direction = ParameterDirection.Output;
                para.ParameterName = "@pro_id";
                cmd.Parameters.Add(para);

                con.Open();
                cmd.ExecuteNonQuery();
                k = para.Value.ToString();
            }
            catch (Exception)
            {
                k = "-1";
            }
            finally
            {
                con.Close();
            }
            return k;
        }
    }
}