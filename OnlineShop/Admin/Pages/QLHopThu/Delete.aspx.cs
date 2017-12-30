using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model.Dao;
namespace OnlineShop.Admin.Pages.QLHopThu
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ContactDao contactDao = new ContactDao();
            var dsXoa = Request.Params["dsXoa[]"];
            List<int> IDs = new List<int>();
            dsXoa.ToString().Split(',').ToList().ForEach(item=> IDs.Add(int.Parse(item.Trim())));
            if (IDs.Count > 0)
            {
                foreach (int ID in IDs)
                {
                    contactDao.DeleteFeedBack(ID);
                }
            }
        }
    }
}