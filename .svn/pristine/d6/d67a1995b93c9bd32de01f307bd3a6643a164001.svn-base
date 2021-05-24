using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.send
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateBatch_Click(object sender, EventArgs e)
        {
            Maktx = TbMaktx.Value.Trim().ToUpper();
            Mold = TbMold.Value.Trim().ToUpper();
            bool run=true;
            List<Add> productlist = new List<Add>();
            List<Add> cavitylist = new List<Add>();
            List<Add> checklist = new List<Add>();
            run = IsNoRun(Maktx, out productlist, out cavitylist,out checklist);
            if(run==true)
            {
                using(DbAppDataContext db =new DbAppDataContext())
                {
                    var maxId = db.Record.Max(c => c.Id);
                    maxId += 1;
                    Record data = new Record();
                    data.Maktx = Maktx;
                    data.Mold = Mold;
                    data.Customer = productlist[0].Customer;
                    data.Standard = productlist[0].Standard;
                    string date= DateTime.Now.Year.ToString()+DateTime.Now.Month.ToString()+DateTime.Now.Day.ToString();
                    string[] strs = { Mold, Maktx, date, maxId.ToString() };
                    data.Batch = string.Join("_", strs);
                    data.CreateDate = DateTime.Now;
                    db.Record.InsertOnSubmit(data);
                    db.SubmitChanges();

                    string[] serial = cavitylist[0].SerialNo.Split('|');
                    for (int i = 0; i < cavitylist[0].Num;i++)
                    {
                        for(int j=0;j<checklist.Count;j++)
                        {
                            Record_Cavity dataCavity = new Record_Cavity();
                            dataCavity.Batch = string.Join("_", strs);
                            dataCavity.CavityNo = serial[i];
                            dataCavity.No = checklist[j].No;
                            dataCavity.Type = checklist[j].Type;
                            dataCavity.Content = checklist[j].Content;
                            dataCavity.Tool = checklist[j].Tool;
                            dataCavity.L_Limit = checklist[j].L_Limit2;
                            dataCavity.U_Limit = checklist[j].U_Limit2;
                            db.Record_Cavity.InsertOnSubmit(dataCavity);
                            db.SubmitChanges();
                        }
                       

                    }
                    Response.Write("<script>alert('成功')</script>");//创建成功
                }
            }
           
        }

        public bool IsNoRun(string maktx,out List<Add> list1,out List<Add> list2,out List<Add> list3)
        {
            bool run = true;
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var plist = from m in db.Product
                           where m.Maktx == Maktx && m.Del == 0
                           select new Add { Customer = m.Customer, Standard = m.Standard };
                list1 = plist.ToList();
                if (list1.Count == 0)
                {
                    Response.Write("<script>alert('没有找到该产品')</script>");//没有产品号
                    run = false;
                }
                var clist = from m in db.Cavity
                            where m.Maktx == Maktx && m.Mold == Mold
                            select new Add { Num = m.Num, SerialNo = m.SerialNo };
                list2 = clist.ToList();
                if(list2.Count==0)
                {
                    Response.Write("<script>alert('没有找到工装模具')</script>");//没有模具
                    run = false;
                }
                var checklist = from m in db.Check
                                where m.Maktx == Maktx && m.Mold == Mold && m.Del == 0
                                select new Add { No = m.No, Type = m.Type, Content = m.Content, Tool = m.Tool, L_Limit2 = m.L_Limit2,U_Limit2=m.U_Limit2 };
                list3 = checklist.ToList();
                if(list3.Count==0)
                {
                    Response.Write("<script>alert('没有找到检验项')</script>");
                    run = false;
                }
                return run;
            }
        }

    }
}