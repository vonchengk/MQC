using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC
{
    public partial class Web : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["Username"]==null)
            {
                Response.Redirect("../Index.aspx");
            }
            else
             {
                 Name.InnerHtml = Session["Username"].ToString() + " 已登录";
             }
        }

        protected void Exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Index.aspx");
            Session.RemoveAll();
        }
    }
}