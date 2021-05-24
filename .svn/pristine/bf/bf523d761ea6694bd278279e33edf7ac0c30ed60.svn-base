using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace MQC.check
{
    /// <summary>
    /// Server 的摘要说明
    /// </summary>
    public class Server : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string maktx = HttpContext.Current.Request["maktx"];
            context.Response.ContentType = "text/plain";
            using (DbAppDataContext db = new DbAppDataContext())
            {
                var list= from m in db.Check
                          where maktx==m.Maktx && m.Del==0
                          select new Mold{Name=m.Mold};
                var result = list.Distinct().ToList();
                JavaScriptSerializer jss =new JavaScriptSerializer();
                if(list!=null)
                {
                    string s = jss.Serialize(result);
                    context.Response.Write(s);
                }
                else
                {
                    context.Response.Write("");
                }
                
                
            }
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
    public class Mold
    {
        public string Name { get; set; }
    }
}