using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.record
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchBatch_Click(object sender, EventArgs e)
        {
            Batch = TbBatch.Value.ToString().Trim().ToUpper();
            Func<string,bool>enable=IsNoRun;
            enable(Batch);
            if(IsNoRun(Batch))
            {
                Response.Redirect("Add.aspx?batch=" + Batch + "");
            }
        }

        public bool IsNoRun(string batch)
        {
            bool run = true;
            using(DbAppDataContext db =new DbAppDataContext())
            {
                Record data = db.Record.SingleOrDefault(c => c.Batch == Batch);
                if(data==null)
                {
                    Response.Write("<script>alert('不存在该批次')</script>");
                    run = false;
                }
            }
            return run;
        }
    }
}