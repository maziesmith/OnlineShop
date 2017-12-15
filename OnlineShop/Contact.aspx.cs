using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    ContactDao contactDao = new ContactDao();
                    contactDao.InsertFeedBack(new Model.EF.Feedback()
                    {
                        Name = txtName.Value,
                        Email = txtEmail.Value,
                        Phone = txtMobile.Value,
                        Status = false,
                        Address = txtAddress.Value,
                        Content = txtContent.Value,
                        CreatedDate = DateTime.Now
                    });
                    lblThongbao.Visible = true;
                    lblThongbao.CssClass = "text-success";
                    lblThongbao.Text = "Gửi thành công.";
                }
            }
            catch
            {
                lblThongbao.Visible = true;
                lblThongbao.CssClass = "text-danger";
                lblThongbao.Text = "Xảy ra lỗi!";
            }
        }
    }
}