using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineShop.Models;
using Model.Dao;
namespace OnlineShop.Admin.Pages.QLSanPham
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int maSP = int.Parse(Request.QueryString["maSP"].ToString());
            ProductDao productDao = new ProductDao();
            productDao.Delete(maSP);
            Response.Redirect("/Admin/Pages/QLSanPham", false);
        }
    }
}