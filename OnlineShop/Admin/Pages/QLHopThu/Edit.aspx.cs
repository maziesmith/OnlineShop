using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop.Admin.Pages.QLHopThu
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = int.Parse(Request.QueryString["ID"].ToString());
            ContactDao contactDao = new ContactDao();
            contactDao.EditStatus(ID);
            Response.Redirect("/Admin/Pages/QLHopThu", false);
        }
    }
}