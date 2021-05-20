using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.cavity
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Search_btn_Click(object sender, EventArgs e)
        {
            Maktx = TbSearchMaktx.Value.ToString().Trim().ToUpper();
            Mold = TbSearchMold.Value.ToString().Trim().ToUpper();
            Server.Transfer("Detail.aspx");
        }

        protected void Create_btn_Click(object sender, EventArgs e)
        {
            Maktx = TbSearchMaktx.Value.ToString().Trim().ToUpper();
            Mold = TbSearchMold.Value.ToString().Trim().ToUpper();
            bool run = IsNoRun(Maktx, Mold);
            if (run == true)
            {
                Server.Transfer("Add.aspx");
            }
            
        }

        public bool IsNoRun(string maktx,string mold)
        {
            bool run = true;
            if(String.IsNullOrEmpty(maktx) && String.IsNullOrEmpty(mold))
            {
                Response.Redirect("Add.aspx");
                run=true;
            }
            else if(String.IsNullOrEmpty(maktx) || String.IsNullOrEmpty(mold))
            {
                LbMsg.Text = "如需复制，产品号和模具号都需要填写";
                DivMsg.Attributes["class"] = "has-error";
                run = false;
            }
            else
            {
                using(DbAppDataContext db =new DbAppDataContext())
                {
                    Cavity data = db.Cavity.SingleOrDefault(c => c.Maktx == maktx && c.Mold == mold);
                    if (data == null) 
                    {
                        LbMsg.Text = "没有找到所需复制的产品号和模具号";
                        DivMsg.Attributes["class"] = "has-error";
                        run = false;
                    }
                }
            }
            return run;
        }
    }
}