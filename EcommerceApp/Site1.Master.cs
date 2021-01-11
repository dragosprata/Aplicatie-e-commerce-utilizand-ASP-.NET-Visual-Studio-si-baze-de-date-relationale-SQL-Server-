using EcommerceApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp.View
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_id"] != null)
            {
                selectdata sd = new selectdata();
                HyperLink1.Text = sd.returnscalar("select ad_email from tbl_admin where ad_id=" + Session["admin_id"]);
                HyperLink1.NavigateUrl = "";
                HyperLink2.Text = "Admin Pannel";
                HyperLink2.NavigateUrl = "~/View/Admin/adminpannel.aspx";
            }
            else
            {
                HyperLink2.Text = "SignUp";
                HyperLink1.NavigateUrl = "~/View/Admin/WebForm1.aspx";
                HyperLink2.Text = "LogIn";
                HyperLink2.NavigateUrl = "~/View/Admin/login.aspx";
            }
        }
    }
}