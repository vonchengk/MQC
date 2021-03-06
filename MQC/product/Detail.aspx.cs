using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.product
{
    public partial class Detail : System.Web.UI.Page
    {
        static string matnr, maktx, series, standard, customer;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                Search data;
                data = (Search)Context.Handler;
                matnr = data.Matnr;
                maktx = data.Maktx;
                series = data.Series;
                standard = data.Standard;
                customer = data.Customer;
                Bind();
            }

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }
        public void Bind()
        {
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var dtlist = from m in db.Product
                             where m.Matnr.Contains(matnr) && m.Maktx.Contains(maktx) && m.Series.Contains(series) && m.Standard.Contains(standard) && m.Customer.Contains(customer) && m.Del == 0
                             select new Search { Pid = m.ID, Matnr = m.Matnr, Maktx = m.Maktx, Series = m.Series, Standard = m.Standard, Customer = m.Customer, Version = m.Version };
                GridView1.DataSource = dtlist.ToList();
#if !DEBUG
                GridView1.Columns[0].HeaderStyle.CssClass = "hidden";
                GridView1.Columns[0].ItemStyle.CssClass = "hidden";
#endif
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Product data = db.Product.SingleOrDefault(c => c.ID == int.Parse(id));
                data.Del = 1;
                data.ChangeDate = DateTime.Now;
                db.SubmitChanges();
                Bind();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            using (DbAppDataContext db = new DbAppDataContext())
            {
                Product data = db.Product.SingleOrDefault(c => c.ID == int.Parse(id));
                data.Matnr = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TxtMatnr")).Text.ToString().Trim().ToUpper();
                //data.Maktx = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TxtMaktx")).Text.ToString().Trim();
                data.Series = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TxtSeries")).Text.ToString().Trim();
                data.Standard = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TxtStandard")).Text.ToString().Trim();
                data.Version = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TxtVersion")).Text.ToString().Trim();
                data.Customer = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DdlCustomer")).SelectedValue;
                data.ChangeDate = DateTime.Now;
                db.SubmitChanges();
                GridView1.EditIndex = -1;
                Bind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }
    }

}