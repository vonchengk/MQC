using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.record
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindMain();
                BindCavity();
                BtnError.Visible = false;
            }
            else
            {
                BindCavity();
            }

        }
        public void BindMain()
        {
            LbBatch.Text = Batch;
            LbMaktx.Text = Maktx;
            LbMold.Text = Mold;
            LbDate.Text = Date.ToString("yyyy-MM-dd");
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var mainList = from m in db.Record
                               where m.Batch == Batch && m.Del == 0
                               select new { Customer = m.Customer, Standard = m.Standard,Ps=m.Ps };
                LbCustomer.Text = mainList.ToList()[0].Customer;
                LbStandard.Text = mainList.ToList()[0].Standard;
                TaPs.Value = mainList.ToList()[0].Ps;
            }
        }
        public void BindCavity()
        {
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var cavityList = new List<Add>();
                var tempList = from m in db.Record_Cavity
                               where m.Batch == Batch
                               select new Add { CavityNo = m.CavityNo, Stamp = m.Stamp };
                cavityList.AddRange(tempList.Distinct());
                GridView1.DataSource = cavityList;
                GridView1.DataBind();
            }
        }
        public void BindCheck(string cavityNo)
        {
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var temp = from m in db.Record_Cavity
                           where m.Batch == Batch && m.CavityNo == cavityNo
                           select new Add2 { CavityNo = m.CavityNo, RCId = m.Id, No = m.No, Type = m.Type, Content = m.Content, Tool = m.Tool, L_Limit = m.L_Limit, U_Limit = m.U_Limit, Result = m.Result };
                var list = temp.ToList();
                GridView2.DataSource = list;
#if !DEBUG
                GridView2.Columns[0].HeaderStyle.CssClass = "hidden";
                GridView2.Columns[0].ItemStyle.CssClass = "hidden";
                GridView2.Columns[1].HeaderStyle.CssClass = "hidden";
                GridView2.Columns[1].ItemStyle.CssClass = "hidden";
                GridView2.Columns[10].HeaderStyle.CssClass = "hidden";
                GridView2.Columns[10].ItemStyle.CssClass = "hidden";
#endif
                GridView2.DataBind();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Select")
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                CavityNo = GridView1.Rows[id].Cells[0].Text;
                LbCavity.Text = "型腔:" + CavityNo;
                BindCheck(CavityNo);
                GridView2.EditIndex = -1;
                GridView2.DataBind();
                BtnError.Visible = true;
            }
        }
        protected void BtnError_Click(object sender, EventArgs e)
        {
            CavityNo = GridView2.Rows[0].Cells[0].Text;
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var temp = from m in db.Record_Cavity
                           where m.Batch == Batch && m.CavityNo == CavityNo
                           select m;
                foreach (var i in temp)
                {
                    i.Stamp = "堵腔";
                }
                db.SubmitChanges();
                BindCavity();
            }
        }
        protected void BtnPs_Click(object sender, EventArgs e)
        {
            using(DbAppDataContext db =new DbAppDataContext())
            {
                Record data = db.Record.SingleOrDefault(c => c.Batch == Batch && c.Del == 0);
                data.ChangeDate = DateTime.Now;
                data.Ps = TaPs.Value.ToString();
                db.SubmitChanges();
            }
        }                                                    
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = (int)GridView2.DataKeys[e.NewEditIndex].Value;
            using(DbAppDataContext db= new DbAppDataContext())
            {
                var data = db.Record_Cavity.SingleOrDefault(c => c.Id == id);
                CavityNo = data.CavityNo.ToString();
                GridView2.EditIndex = e.NewEditIndex;
                BindCheck(CavityNo);
                if (data.Type.ToString() == "计量")
                {
                    ((DropDownList)GridView2.Rows[e.NewEditIndex].FindControl("DdlResult")).Visible = false;
                    TextBox tb = (TextBox)GridView2.Rows[e.NewEditIndex].FindControl("TbResult");
                    tb.Visible = true;
                    tb.Text = ((HiddenField)GridView2.Rows[e.NewEditIndex].FindControl("HidResult")).Value;
                }
                else
                {
                    ((TextBox)GridView2.Rows[e.NewEditIndex].FindControl("TbResult")).Visible = false;
                    DropDownList dd=((DropDownList)GridView2.Rows[e.NewEditIndex].FindControl("DdlResult"));
                    dd.Visible = true;
                    HiddenField hf = (HiddenField)GridView2.Rows[e.NewEditIndex].FindControl("HidResult");
                    dd.SelectedValue = hf.Value;
                }
            }
        }
        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
             int id = (int)GridView2.DataKeys[e.RowIndex].Value;
             using (DbAppDataContext db = new DbAppDataContext())
             {
                 GridView2.EditIndex = -1;
                 var data = db.Record_Cavity.SingleOrDefault(c => c.Id == id);
                 CavityNo = data.CavityNo.ToString();
                 BindCheck(CavityNo);
             }
           
        }
        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string strResult="";
            int id = (int)GridView2.DataKeys[e.RowIndex].Value;
            CavityNo = ((Label)GridView2.Rows[0].FindControl("Label1")).Text.ToString();
            bool run = true;
            using(DbAppDataContext db =new DbAppDataContext())
            {
                Record_Cavity data = db.Record_Cavity.SingleOrDefault(c => c.Id == id);
                if (data.Type == "计量")
                {
                    strResult = ((TextBox)GridView2.Rows[e.RowIndex].FindControl("TbResult")).Text.ToString();
                }
                else
                {
                    strResult = ((DropDownList)GridView2.Rows[e.RowIndex].FindControl("DdlResult")).Text;

                }
                
                if(run)
                {
                    data.Result = strResult;
                    db.SubmitChanges();
                    var temp = from m in db.Record_Cavity
                               where m.Batch == Batch && m.CavityNo == CavityNo
                               select m;
                    foreach (var item in temp)
                    {
                        if(item.Result.Length>0)
                        {
                            foreach (var item2 in temp)
                            {
                                item2.Stamp = "已编辑";
                            }
                            db.SubmitChanges();
                            break;
                        }
                    }
                    GridView2.EditIndex = -1;
                    BindCheck(data.CavityNo);
                    BindCavity();
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindCavity();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            CavityNo = GridView2.Rows[8].Cells[0].Text.ToString();
            BindCheck(CavityNo);
        }
    }


}