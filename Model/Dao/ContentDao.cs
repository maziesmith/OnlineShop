using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using System.Web;

namespace Model.Dao
{
    public class ContentDao
    {
        OnlineShopDbContext db = null;
        public ContentDao()
        {
            db = new OnlineShopDbContext();
        }
        public List<Content> GetList()
        {
            return db.Contents.OrderByDescending(m => m.ID).ToList();
        }
        public Content GetByID(long id)
        {
            return db.Contents.Find(id);
        }

      
    }
}
