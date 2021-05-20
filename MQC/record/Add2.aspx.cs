using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.record
{
    public partial class Add2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Batch = Request.QueryString["Batch"].ToString();
            CavityNo = Request.QueryString["CavityNo"].ToString();
            using(DbAppDataContext db =new DbAppDataContext())
            {
                var temp = from m in db.Record_Cavity
                           where m.Batch==Batch && m.CavityNo==CavityNo
                           select new Add2 { RCId=m.Id,No = m.No, Type = m.Type, Content = m.Content, Tool = m.Tool, L_Limit = m.L_Limit, U_Limit = m.U_Limit, Result = m.Result };
                var list = temp.ToList();
                GridView1.DataSource = list;
                GridView1.DataBind();
            }
        }

        protected void BtnError_Click(object sender, EventArgs e)
        {
            using(DbAppDataContext db=new DbAppDataContext())
            {
                var temp = from m in db.Record_Cavity
                           where m.Batch == Batch && m.CavityNo == CavityNo
                           select m;
                foreach(var i in temp)
                {
                    i.Stamp = "堵腔"; 
                }
                db.SubmitChanges();
            }
        }
    }
}