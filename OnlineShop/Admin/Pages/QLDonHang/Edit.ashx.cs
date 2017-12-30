using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.Dao;
namespace OnlineShop.Admin.Pages.QLDonHang
{
    /// <summary>
    /// Summary description for Edit
    /// </summary>
    public class Edit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            OrderDao orderDao = new OrderDao();
            long ID = long.Parse(context.Request.QueryString["ID"]);
            orderDao.Edit(ID);
            context.Response.Redirect(context.Request.UrlReferrer.ToString(), false);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}