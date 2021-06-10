using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.check
{
    public partial class Add : System.Web.UI.Page
    {
        static string getMaktx,getmold;
        static double msg;
        double[] limit = new double[2];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Detail data;
                data = (Detail)Context.Handler;
                getMaktx = data.Maktx;
                getmold = data.Mold;
                TbMaktx.Value = getMaktx;
                TbMold.Value = getmold;
                using(DbAppDataContext db =new DbAppDataContext())
                {
                    //Check data= db.Check.(c=>c.Maktx==getMaktx && c.Mold==getmold && c.Id==db.Check.Max )
                    var data1 = db.Check.Where(c => c.Maktx == getMaktx && c.Mold == getmold);
                    if(data1!=null)
                    {
                        var maxData = data1.OrderByDescending(c => c.Id).FirstOrDefault();
                        msg = maxData.No;
                        LbMsg.Text = "当前最新序号为: " + msg;
                    }
                    else
                    {
                        LbMsg.Text = "";
                    }
                    
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            using(DbAppDataContext db =new DbAppDataContext())
            {
                Check data = new Check();
                data.No = double.Parse(TbNo.Value.ToString());
                data.Type = TbType1.Text.ToString();
                data.Content = TbContent.Value.ToString();
                data.Tool = TbTool.Value.ToString();
                data.L_Toler = GetToler(TbL_Toler.Value.ToString());
                data.U_Toler = GetToler(TbU_Toler.Value.ToString());
                limit = GetLimitData(TbL_Toler.Value.ToString(), TbL_Limit1.Value.ToString());
                data.L_Limit1 = limit[0];
                data.L_Limit2 = limit[1];
                limit = GetLimitData(TbU_Toler.Value.ToString(), TbU_Limit1.Value.ToString());
                data.U_Limit1 = limit[0];
                data.U_Limit2 = limit[1];
                data.Maktx = getMaktx;
                data.Mold = getmold;
                data.CreatDate = DateTime.Now;
                db.Check.InsertOnSubmit(data);
                db.SubmitChanges();
                Maktx = getMaktx;
                Mold = getmold;
                Server.Transfer("Detail.aspx");
            }
        }
        public double GetToler(string toler)
        {
            double result=0;
            if(toler.Length==0){}
            else
            {
                result = double.Parse(toler);
            }
             return result;
        }
        public double[] GetLimitData(string toler,string limit1)
        {
            double[] limit = new double[2];
            if(toler.Length==0)
            {
                toler = "0";
            }
            if(!String.IsNullOrEmpty(limit1))
            {
                limit[0] = double.Parse(limit1);
                limit[1] = double.Parse(limit1);
            }
            else
            {
                limit[1] = double.Parse(toler);
            }
            return limit;
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Maktx = getMaktx;
            Mold = getmold;
            Server.Transfer("Detail.aspx");
        }
    }
}