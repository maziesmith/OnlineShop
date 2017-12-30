using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop.Admin.Pages.QLSanPham
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmCreateSanPham_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (Page.IsValid)
            {
                FileUpload f = frmCreateSanPham.FindControl("fileHinhDaiDien") as FileUpload;
                if (f.HasFile && f.FileContent.Length > 0)
                {
                    FileInfo fInfo = new FileInfo(f.FileName);
                    string extend = fInfo.Extension;
                    if (extend == ".jpg" || extend == ".jpeg" || extend == ".png")
                    {
                        string hinhDaiDienMoi = "/assets/client/images/" + DateTime.Now.Ticks.ToString() + extend;
                        objSourceSanPham.InsertParameters["Image"].DefaultValue = hinhDaiDienMoi;
                        f.SaveAs(Server.MapPath("~" + hinhDaiDienMoi));
                    }
                }


            }
            Response.Redirect("/Admin/Pages/QLSanPham", false);
        }

    }
}