using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp.View.User
{
    public partial class productdetails : System.Web.UI.Page
    {
        private string connstring = ConfigurationManager.ConnectionStrings["ecom"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["view"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                SqlConnection connection = new SqlConnection(connstring);
                string sql = "select p.pro_id,p.pro_name,p.pro_posted_date,p.pro_price,p.pro_image,a.ad_email,a.ad_phone from tbl_product_items p inner join tbl_admin a on a.ad_id=p.pro_fk_ad where p.pro_id=" + Request.QueryString["view"].ToString();

                try
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Label1.Text = reader.GetValue(1).ToString();
                        Label2.Text = reader.GetValue(2).ToString();
                        Label3.Text = reader.GetValue(3).ToString();
                        Label4.Text = reader.GetValue(5).ToString();
                        Label5.Text = reader.GetValue(6).ToString();

                        Image1.ImageUrl = reader.GetValue(4).ToString();

                    }
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Alert('error')");
                    Response.Redirect("~/home.aspx");
                }
            }
        }
    }
}