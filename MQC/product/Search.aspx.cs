﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC.product
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Search_btn_Click(object sender, EventArgs e)
        {
            Matnr = TbMatnr.Value.ToString().Trim();
            Maktx = TbMaktx.Value.ToString().Trim();
            Customer = TbCustomer.Value.ToString().Trim();
            Standard = TbStandard.Value.ToString().Trim();
            Series = TbSeries.Value.ToString().Trim();
            Server.Transfer("Detail.aspx");
        }
       
    }
}