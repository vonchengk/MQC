﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.check
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Search_btn_Click(object sender, EventArgs e)
        {

            using(DbAppDataContext db =new DbAppDataContext())
            {
                Maktx = TbSearchMaktx.Value.ToString().Trim().ToUpper();
                Mold = TbMold.Value.ToString().Trim().ToUpper();
                if (String.IsNullOrEmpty(Mold))
                {
                    Mold = Request.Params.Get("Select").ToString();
                        //SelMold.Items[SelMold.SelectedIndex].Value.ToString();
                }
                Server.Transfer("Detail.aspx");
            }
        }

    }
}