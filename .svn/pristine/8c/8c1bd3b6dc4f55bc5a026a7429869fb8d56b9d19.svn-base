using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.check
{
    public partial class Detail : System.Web.UI.Page
    {
        static string getMaktx,getMold;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.FilePath.ToString() == "/check/Search.aspx")
                {
                    Search data;
                    data = (Search)Context.Handler;
                    getMaktx = data.Maktx;
                    getMold = data.Mold;
                    Bind();
                }
                else
                {
                    Add data;
                    data = (Add)Context.Handler;
                    getMaktx = data.Maktx;
                    getMold = data.Mold;
                    Bind();
                }
               
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Maktx = getMaktx;
            Mold = getMold;
            Server.Transfer("Add.aspx");
        }
        public void Bind()
        {
            using(DbAppDataContext db =new DbAppDataContext())
            {
                var dtlist = from m in db.Check
                             where m.Maktx == getMaktx && m.Mold==getMold && m.Del == 0
                             select new Detail { CheckId = m.Id, No = m.No, Type = m.Type, Tool = m.Tool, Maktx = m.Maktx, Mold=m.Mold, Content = m.Content, L_Toler = (double)m.L_Toler, U_Toler = (double)m.U_Toler, L_Limit1 = (double)m.L_Limit1, U_Limit1 = (double)m.U_Limit1, L_Limit2 = (double)m.L_Limit2, U_Limit2 = (double)m.U_Limit2 };
                if (dtlist.ToList().Count == 0)
                {
                    DivGrid.InnerHtml = "<p>没有检验项</p>"; GridView1.Visible = false;
                }
                else
                {
                    GridView1.Visible = true;
                    var dtlist1 = dtlist.ToList();
                    GridView1.DataSource = dtlist.ToList();
#if !DEBUG
                GridView1.Columns[0].HeaderStyle.CssClass = "hidden";
                GridView1.Columns[0].ItemStyle.CssClass = "hidden";
#endif
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Check data = db.Check.SingleOrDefault(c => c.Id == int.Parse(id));
                data.Del = 1;
                data.ChangeDate = DateTime.Now;
                db.SubmitChanges();
                Bind();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string strLowT,strUpT,strL_Toler,strU_Toler,strNo;
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            bool run=true;
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Check data = db.Check.SingleOrDefault(c => c.Id == int.Parse(id)); 
                strNo= ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbNo")).Text.ToString().Trim();
                data.Type=((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbType")).Text.ToString().Trim();
                data.Tool = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbTool")).Text.ToString().Trim();
                strL_Toler = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbL_Toler")).Text.ToString().Trim();
                strU_Toler = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbU_Toler")).Text.ToString().Trim();
                strLowT = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbL_Limit1")).Text.ToString().Trim();
                strUpT = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbU_Limit1")).Text.ToString().Trim();
                run = IsNoRun(strU_Toler, strU_Toler, strLowT, strUpT,strNo);

                if (run == true)
                {
                    data.No = double.Parse(strNo);
                    data.L_Toler = double.Parse(strL_Toler);
                    data.L_Limit2 = double.Parse(strL_Toler);
                    data.U_Toler = double.Parse(strU_Toler);
                    data.U_Limit2 = double.Parse(strU_Toler); 
                    if (!String.IsNullOrEmpty(strLowT) && strLowT != "0")
                    {
                        data.L_Limit1 = double.Parse(strLowT);
                        data.L_Limit2 = double.Parse(strLowT);
                    }
                    else
                    {
                        data.L_Limit1 = 0;
                    }
                    if (!String.IsNullOrEmpty(strUpT) && strUpT != "0")
                    {
                        data.U_Limit1 = double.Parse(strUpT);
                        data.U_Limit2 = double.Parse(strUpT);
                    }
                    else
                    {
                        data.U_Limit1 = 0;
                    }
                    data.ChangeDate = DateTime.Now;
                    db.SubmitChanges();
                    GridView1.EditIndex = -1;
                    Bind();
                }

            }
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }

        public bool IsNoRun(string ltoler,string utoler,string llimit,string ulimit,string no)
        {
            double s;
            bool run = true;
            string[] str = { ltoler, utoler, llimit, ulimit, no };
            foreach(var i in str)
            {
                run = double.TryParse(i, out s);
                if (run == false) { Response.Write("<script>alert('序号，公差值，特采必须是数字');</script>"); break; }
               
            }
            return run;
        }
    }
}