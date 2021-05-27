using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.cavity
{
    public partial class Add : System.Web.UI.Page
    {
        static string id,getMaktx,getMold;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                 if (Request.FilePath.ToString() == "/cavity/Add.aspx")
                 {
                     Create.Visible = true;
                     Update.Visible = false;
                 }
                 else if(Request.FilePath.ToString() == "/cavity/Search.aspx")
                 {
                     Search data;
                     data = (Search)Context.Handler;
                     getMaktx = data.Maktx;
                     getMold = data.Mold;
                     using (DbAppDataContext db = new DbAppDataContext())
                     {
                         var dtlist = from m in db.Cavity
                                      where m.Maktx==getMaktx && m.Mold==getMold
                                      select new Search { Cid = m.Id.ToString(), Mold = m.Mold, Num = m.Num, Maktx = m.Maktx, SerialNo = m.SerialNo, Ps = m.PS };
                         var list = dtlist.ToList();
                         TbMaktx.Value = list[0].Maktx;
                         TbMold.Value = list[0].Mold;
                         TbNum.Value = list[0].Num.ToString();
                         TbPs.Value = list[0].Ps;
                         TxtSerial.Value = list[0].SerialNo;
                     }
                     Create.Visible = true;
                     Update.Visible = false;
                 }
                 else
                 {
                     Detail data;
                     data = (Detail)Context.Handler;
                     id = data.Cid;
                     getMaktx = data.Maktx;
                     getMold = data.Mold;
                     using(DbAppDataContext db =new DbAppDataContext())
                     {
                         var dtlist = from m in db.Cavity
                                      where m.Id == int.Parse(id)
                                      select new Search { Cid = m.Id.ToString(), Mold = m.Mold, Num = m.Num, Maktx = m.Maktx, SerialNo = m.SerialNo, Ps = m.PS };
                         var list = dtlist.ToList();
                         TbMaktx.Value = list[0].Maktx;
                         TbMold.Value = list[0].Mold;
                         TbNum.Value = list[0].Num.ToString();
                         TbPs.Value = list[0].Ps;
                         TxtSerial.Value = list[0].SerialNo;
                     }
                     TbMaktx.Disabled = true;
                     TbMold.Disabled = true;
                     Create.Visible = false;
                     Update.Visible = true;
                 }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            bool run = true;
            maktx = TbMaktx.Value.ToString().Trim();
            mold = TbMold.Value.ToString().Trim();
            using(DbAppDataContext db =new DbAppDataContext())
            {
                run = IsNoRun(maktx, mold);
                if(run==true)
                {
                    Cavity data = new Cavity();
                    data.Mold = mold;
                    data.Maktx = maktx;
                    data.Num = int.Parse(TbNum.Value.ToString().Trim());
                    data.PS = TbPs.Value.ToString().Trim();
                    data.SerialNo = TxtSerial.Value.ToString().Trim();
                    db.Cavity.InsertOnSubmit(data);
                    db.SubmitChanges();
                    Response.Write("<script>alert('创建完成');window.location='Detail.aspx'</script>");
                }
                
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Cavity data = db.Cavity.SingleOrDefault(c => c.Id == int.Parse(id));
                data.Num = int.Parse(TbNum.Value.ToString().Trim());
                data.PS = TbPs.Value.ToString().Trim();
                data.SerialNo = TxtSerial.Value.ToString().Trim();
                db.SubmitChanges();
                Maktx = getMaktx;
                Mold = getMold;
                Server.Transfer("Detail.aspx");
            }
        }

        public bool IsNoRun(string a,string b)
        {
            bool result = true;
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Cavity searchData = db.Cavity.SingleOrDefault(c => c.Maktx == a && c.Mold == b && c.Del == 0);
                if (searchData != null)
                {
                    Response.Write("<script> var temp1='" + a + "'; var temp2 ='" + b + "';alert('产品编号：'+temp1+'  模具号：'+temp2+'已存在');</script>");
                    result = false;
                }
            }
            return result;
        }
    }
}