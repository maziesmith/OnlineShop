using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
using System.Web.ModelBinding;

namespace OnlineShop.Admin.Pages.QLSanPham
{
    public partial class Info : System.Web.UI.Page
    {
        ProductDao productDao = new ProductDao();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmViewSanPham_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload f = frmViewSanPham.FindControl("fileHinhDaiDien") as FileUpload;
            if(f.HasFile && f.FileContent.Length > 0)
            {
                FileInfo fInfole = new FileInfo(f.FileName);
                string extend = fInfole.Extension;
                if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                {
                    string hinhDaiDienMoi = "/assets/client/images/" + DateTime.Now.Ticks.ToString() + extend;
                    objSourceSanPham.UpdateParameters["Image"].DefaultValue = hinhDaiDienMoi;
                    f.SaveAs(Server.MapPath("~"+ hinhDaiDienMoi));
                }
            }
            else
            {
                objSourceSanPham.UpdateParameters["Image"].DefaultValue = null;
            }
        }
    }
}