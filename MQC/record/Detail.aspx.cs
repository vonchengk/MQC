using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace MQC.record
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Bind(0);
            }
        }
        public void Bind(int status)
        {
             using(DbAppDataContext db =new DbAppDataContext())
                {
                    var list = from m in db.Record
                               where m.Status == status && m.Del == 0
                               select new { Rid = m.Id, Batch = m.Batch, Maktx = m.Maktx, Customer = m.Customer,Status=m.Status};
                    var result = list.ToList();
                    GridView1.DataSource = result;
#if !DEBUG
                    GridView1.Columns[1].HeaderStyle.CssClass = "hidden";
                    GridView1.Columns[1].ItemStyle.CssClass = "hidden";
                    GridView1.Columns[6].HeaderStyle.CssClass = "hidden";
                    GridView1.Columns[6].ItemStyle.CssClass = "hidden";
#endif
                    BtnStart.Visible = false;
                    BtnReturn.Visible = false;
                    BtnEnd.Visible = false;
                    GridView1.Columns[5].Visible = false;
                    ShowObject(status);
                    GridView1.DataBind();
                }
        }
        public void ShowObject(int status)
        {
            if (status == 0)
            {
                BtnStart.Visible = true;
            }
            else if (status == 1)
            {
                GridView1.Columns[5].Visible = true;
                BtnReturn.Visible = true;
                BtnEnd.Visible = true;
            }
            else if(status==2)
            {

            }
            else if(status==3)
            {

            }
        }
        protected void WaitCheck_Click(object sender, EventArgs e)
        {  
            Bind(0);
            ClearClass(LiWait);
        }
        protected void Checking_Click(object sender, EventArgs e)
        {
            Bind(1);
            ClearClass(LiCheck);
        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Bind(2);
            ClearClass(LiReturn);
        }
        protected void Complete_Click(object sender, EventArgs e)
        {
            Bind(3);
            ClearClass(LiEnd);
        }
        public void ClearClass(HtmlGenericControl LiActive)
        {
            LiWait.Attributes.Remove("class");
            LiCheck.Attributes.Remove("class");
            LiReturn.Attributes.Remove("class");
            LiEnd.Attributes.Remove("class");
            LiActive.Attributes.Add("class", "active");

        }


        protected void BtnStart_Click(object sender, EventArgs e)
        {
            ChangeStatus(GridView1, 0, 1);
        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            ChangeStatus(GridView1, 1, 2);
        }

        protected void BtnEnd_Click(object sender, EventArgs e)
        {
            ChangeStatus(GridView1, 1, 3);
        }

        public void ChangeStatus(GridView GridView1,int nowStatus,int toStatus)
        {
            bool cbx = false;
            int  rid;
            for(int i=0;i<GridView1.Rows.Count;i++)
            {
                cbx = ((CheckBox)GridView1.Rows[i].FindControl("CheckBox1")).Checked;
                if(cbx)
                {
                    rid = int.Parse(((Label)GridView1.Rows[i].FindControl("Label1")).Text);
                    using(DbAppDataContext db =new DbAppDataContext())
                    {
                        Record data = db.Record.SingleOrDefault(c => c.Id == rid);
                        data.Status = toStatus;
                        db.SubmitChanges();
                    }
                }
            }
            Bind(nowStatus);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if(e.CommandName=="Select")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                string batch = ((Label)GridView1.Rows[id].FindControl("LbBatch")).Text;
                Response.Redirect("Add.aspx?batch=" + batch + "");
            }
            if(e.CommandName=="PS2")
            {
                GridViewRow drv = ((GridViewRow)(((LinkButton)(e.CommandSource)).Parent.Parent));
                int id = Convert.ToInt32(drv.RowIndex.ToString());
                string batch = ((Label)GridView1.Rows[id].FindControl("LbBatch")).Text;
                Response.Write("<script>window.open('PS2.aspx?batch=" + batch + "','备注','height=500px,width=800px,top=100px,left=200px');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Status = int.Parse(GridView1.Rows[0].Cells[6].Text.ToString());
            GridView1.PageIndex = e.NewPageIndex;
            Bind(Status);
        }
    }
}