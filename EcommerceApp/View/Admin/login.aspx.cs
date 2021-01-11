using EcommerceApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp.View.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pwdfromdb;
            selectdata sd = new selectdata();
            string c = sd.returnscalar("select COUNT(ad_id) from tbl_admin where ad_email='" + txtEmail.Text + "'");
            if (c != "0")
            {
                pwdfromdb = sd.returnscalar("select ad_password from tbl_admin  where ad_email='" + txtEmail.Text + "'");
                if (txtpassword.Text.Equals(pwdfromdb))
                {
                    Session["admin_id"] = sd.returnscalar("select ad_id from tbl_admin  where ad_email='" + txtEmail.Text + "'");
                    Response.Redirect("~/home.aspx?");
                }
                else
                {
                    Label1.Text = "Invalid Password!";
                }

            }
            else
            {
                Label1.Text = "This Email is not registered!";
            }
        }
    }
}