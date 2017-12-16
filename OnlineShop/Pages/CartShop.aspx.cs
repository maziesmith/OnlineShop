using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShop.Models;
using Model.Dao;
using Model.EF;
using System.Web.Script.Serialization;

namespace OnlineShop.Pages
{
    public partial class CartShop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<CartItem> cartshop = GetCartShop();
            if(Request.Params["action"] != null)
            {
                string action = Request.Params["action"].ToString();
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
                    Response.Redirect(Request.UrlReferrer.ToString(), false);
                }
                if(action == "update")
                {
                    var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(Request.Params["cartModel"].ToString());
                    foreach(CartItem item in jsonCart)
                    {
                        cartshop.Single(m => m.Product.ID == item.Product.ID).Quantity = item.Quantity;
                    }
                    Response.Clear();
                    Response.ContentType = "application/json; charset=utf-8";
                    Response.Write("{\"status\" : true}");
                    Response.End();
                }
                if(action == "delete")
                {
                    int productId = int.Parse(Request.QueryString["productId"].ToString());
                    CartItem cartDelete = cartshop.SingleOrDefault(m => m.Product.ID == productId);
                    if(cartDelete != null)
                    {
                        cartshop.Remove(cartDelete);
                    }
                }
                if(action == "deleteall")
                {
                    cartshop.Clear();

                }
            }
        }
        public List<CartItem> GetCartShop()
        {
            return Session["cartshop"] as List<CartItem>;
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                OrderDao orderDao = new OrderDao();
                long newOrderID = orderDao.Insert(new Order()
                {
                    ShipName = txtshipName.Value,
                    ShipMobile = txtMobile.Value,
                    ShipEmail = txtEmail.Value,
                    ShipAddress = txtAddress.Value,
                    Status = 0,
                    CreatedDate = DateTime.Now
                });
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                foreach(CartItem item in Session["cartshop"] as List<CartItem>)
                {
                    orderDetailDao.Insert(new OrderDetail()
                    {
                        OrderID = newOrderID,
                        ProductID = item.Product.ID,
                        Quantity = item.Quantity,
                        Price = item.Product.Price
                    });
                }
                
                Session["cartshop"] = new List<CartItem>();
                Response.Redirect("/Pages/CheckoutSuccess", false);
            }
        }
    }
}