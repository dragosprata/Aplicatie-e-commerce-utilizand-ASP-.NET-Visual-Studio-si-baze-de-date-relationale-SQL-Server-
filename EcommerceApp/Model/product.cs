using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommerceApp.Model
{
    public class product
    {
        public int pro_id { get; set; }

        public string pro_name { get; set; }

        public float pro_price { get; set; }

        public string pro_date { get; set; }

        public string pro_img { get; set; }

        public int pro_adminid_fk { get; set; }

        public int pro_catid_fk { get; set; }
    }
}