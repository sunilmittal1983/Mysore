using Samruddhi.Utilities;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Samruddhi
{
    public partial class ChallanEdit : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("Login.aspx");            
        }    
       

        protected void Button2_Click(object sender, EventArgs e)
        {
            var challanno = String.Format("{0}", Request.Form["chrefno"]);
            Response.Redirect("ChallanForm.aspx?ChallanNumber =" + challanno);
        }
    }
}