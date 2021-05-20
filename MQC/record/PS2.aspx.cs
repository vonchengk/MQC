using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.record
{
    public partial class PS2 : System.Web.UI.Page
    {
        static string batch;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                batch = Request.QueryString["batch"].ToString();
                LbBatch.InnerText = "批次号: " + batch;
                using (DbAppDataContext db = new DbAppDataContext())
                {
                    Record data = db.Record.SingleOrDefault(c => c.Batch == batch);
                    TxtPs.Value = data.Ps2;
                }
            }
        }

        protected void SubmitPs_Click(object sender, EventArgs e)
        {
            using(DbAppDataContext db = new DbAppDataContext())
            {
                Record data = db.Record.SingleOrDefault(c => c.Batch == batch);
                data.Ps2 = TxtPs.Value;
                db.SubmitChanges();
                Response.Write("<script>alert('成功');</script>");
            }
        }
    }
}