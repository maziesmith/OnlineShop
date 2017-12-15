using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShop.Models;
using Model.Dao;
using Model.EF;
namespace OnlineShop.Pages
{
    public partial class CartShop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<CartItem> cartshop = GetCartShop();
            if(Request.QueryString["action"] != null)
            {
                string action = Request.QueryString["action"].ToString();
                if(action == "add")
                {
                    int productId = int.Parse(Request.QueryString["productId"].ToString());
                    int quantity = int.Parse(Request.QueryString["quantity"].ToString());
                    CartItem cartItem = cartshop.SingleOrDefault(m => m.Product.ID == productId);
                    if (cartItem != null)
                    {
                        cartItem.Quantity += quantity;
                    }
                    else
                    {
                        Product product = new ProductDao().ViewDetail(productId);
                        CartItem newCartItem = new CartItem()
                        {
                            Product = product,
                            Quantity = quantity
                        };
                        cartshop.Add(newCartItem);
                    }
                }
            }
        }
        public List<CartItem> GetCartShop()
        {
            return Session["cartshop"] as List<CartItem>;
        }
    }
}