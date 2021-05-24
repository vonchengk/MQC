using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.product
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            bool run = true;
            string customer = Customer.Text.Trim().ToString();
            string series = Series.Value.Trim().ToString();
            string standard = Standard.Value.Trim().ToString();
            string version = Version.Value.Trim().ToString();
            string[] maktx = Maktx.Value.Split('|');
            string[] matnr = Matnr.Value.Split('|');
            using(DbAppDataContext db =new DbAppDataContext())
            {
                run = IsNoRun(maktx);
                if(run==true)
                {
                    for (int i = 0; i < maktx.Length; i++)
                    {
                        run = IsNoRun(maktx);
                        if (run == true)
                        {
                            Product data = new Product();
                            data.Customer = customer;
                            data.Series = series;
                            data.Standard = standard;
                            data.Version = version;
                            data.Maktx = maktx[i].ToUpper().Trim();
                            data.Matnr = matnr[i].ToUpper().Trim();
                            data.CreateDate = DateTime.Now;
                            db.Product.InsertOnSubmit(data);
                            db.SubmitChanges();
                        }
                        else
                        {
                            Response.Write("<script> var temp='" + maktx[i] + "';alert(temp+'已存在,此数据将不会被导入');</script>");
                        }
                    }
                    Response.Write("<script>alert('成功');window.location='Search.aspx'</script>");
                }

            }
        }

        public  bool IsNoRun(string[] maktx)
        {
            bool run = true;
            using (DbAppDataContext db = new DbAppDataContext())
            {
                for (int j = 0; j < maktx.Length; j++)
                {
                    Product data = db.Product.SingleOrDefault(c => c.Maktx == maktx[j]);
                    if (data != null)
                    {
                        Response.Write("<script> var temp='" + maktx[j] + "';alert(temp+'已存在');</script>");
                        run = false;
                        break;
                    }
                }
                return run;
            }
        }
    }
}