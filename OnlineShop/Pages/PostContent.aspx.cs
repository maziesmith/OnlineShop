using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop.Pages
{
    public partial class PostContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long id = long.Parse(Request.QueryString["id"].ToString());
            Page.Title = new ContentDao().GetByID(id).Name;
        }
    }
}