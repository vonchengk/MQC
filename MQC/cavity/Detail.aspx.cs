using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.cavity
{
    public partial class Detail : System.Web.UI.Page
    {
        static string  getMaktx, getMold;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.FilePath.ToString() == "/cavity/Search.aspx")
                {
                    Search data;
                    data = (Search)Context.Handler;
                    getMaktx = data.Maktx;
                    getMold = data.Mold;
                }
                else
                {
                    Add data;
                    data = (Add)Context.Handler;
                    getMaktx = data.Maktx;
                    getMold = data.Mold;
                }
            }
            Bind();
        }
        public void Bind()
        {
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var dtlist = from m in db.Cavity
                             where m.Maktx.Contains(getMaktx) && m.Mold.Contains(getMold) && m.Del == 0
                             select new Search { Cid = Convert.ToString(m.Id), Mold = m.Mold, Maktx = m.Maktx, Num = m.Num, Ps = m.PS };
                GridView1.DataSource = dtlist.ToList();
#if !DEBUG
                GridView1.Columns[0].HeaderStyle.CssClass = "hidden";
                GridView1.Columns[0].ItemStyle.CssClass = "hidden";
#endif
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Cavity data = db.Cavity.SingleOrDefault(c => c.Id == int.Parse(id));
                data.Del = 1;
                db.SubmitChanges();
                Bind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Select")
            {
                int row = Convert.ToInt32(e.CommandArgument.ToString());
                Cid = GridView1.Rows[row].Cells[0].Text;
                Maktx = getMaktx;
                Mold = getMold;
                Server.Transfer("Add.aspx");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }

    }
}