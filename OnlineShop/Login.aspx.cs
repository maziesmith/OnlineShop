using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
using Model.EF;
namespace OnlineShop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserDao userDao = new UserDao();
            Model.EF.User userCurrent = userDao.CheckLogin(txtTaiKhoan.Value, txtMatKhau.Value);
            if (userCurrent != null)
            {
                Session["tk"] = userCurrent;
                Session["tkThanhVien"] = userCurrent.UserName;
                if(Request.QueryString["returnUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["returnUrl"], false);
                }
                else 
                Response.Redirect("/Admin/Pages/QLSanPham", false);
            }
            else
            {
                lblLoi.InnerText = "Sai tài khoản hoặc mật khẩu!";
            }
        }
    }
}