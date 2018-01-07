using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ContactDao
    {
        OnlineShopDbContext db = null;
        public ContactDao()
        {
            db = new OnlineShopDbContext();
        }

        public int InsertFeedBack(Feedback fb)
        {
            db.Feedbacks.Add(fb);
            db.SaveChanges();
            return fb.ID;
        }
        public void EditStatus(int ID)
        {
            Feedback model = db.Feedbacks.Find(ID);
            if(model != null)
            {
                model.Status = true;
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }
        public void DeleteFeedBack(int ID)
        {
            Feedback model = db.Feedbacks.Find(ID);
            if (model != null)
            {
                db.Feedbacks.Remove(model);
                db.SaveChanges();
            }
        }
    }
}
