using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShop.UControls
{
    public partial class HeaderCart : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<CartItem> GetCartShop()
        {
            return Session["cartshop"] as List<CartItem>;
        }
    }
}