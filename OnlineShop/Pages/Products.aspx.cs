using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop.Pages
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Sản phẩm";
            if(Request.QueryString["categoryID"] != null)
            {
                long categoryID = long.Parse(Request.QueryString["categoryID"].ToString());
                lvProducts.DataSourceID = "objSourceProductByCategory";
                tieude.InnerText = "Sản phẩm "  + new CategoryDao().ViewDetail(categoryID).Name;
                Page.Title = "Sản phẩm " + new CategoryDao().ViewDetail(categoryID).Name;
            }
        }
    }
}