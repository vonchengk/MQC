using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MQC
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DivMsg.Visible = false;
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            string username = UserName.Value.Trim();
            string password = Password.Value.Trim();
            byte[] passwordBytes = System.Text.Encoding.UTF8.GetBytes(password);
            byte[] hashBytes=new System.Security.Cryptography.SHA256Managed().ComputeHash(passwordBytes);
            string hashString = Convert.ToBase64String(hashBytes);
            using (DbAppDataContext db = new DbAppDataContext())
            {
                User data = db.User.SingleOrDefault(c => c.UserName == username && c.Password == hashString);
                if(data!=null)
                {
                    DivMsg.Visible = false;
                    Session.Remove("UserName");
                    Session["Username"] = username;
                    Session["Level"] = data.Level;
                    Response.Redirect("product/Search.aspx");
                }
                else
                {
                    DivMsg.Visible = true;
                }
            }
        }
    }
}