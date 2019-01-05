using Samruddhi.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mysore
{
    public partial class Home : System.Web.UI.Page
    {
        string DeptID;
        DataTable dt = new DataTable();
        public string DeptName, District, DDLCode;
        
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton lnk = new LinkButton();
            lnk.Controls.Add(new ImageButton());
                  
            LoadData();
            if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("Login.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/Login.aspx");
        }

        private void LoadData()
        {          
            DeptID = Session["DeptID"] == null? "1": Session["DeptID"].ToString();
            con = Repository.GetConnection();
            con.Open();
            string commandtext = "Select DDOCode, DeptName,District from Deptartment where DeptId='" + DeptID + "' ";
            SqlCommand sqlCommandText = new SqlCommand(commandtext, con);
            SqlDataReader reader = sqlCommandText.ExecuteReader();
            while (reader.Read())
            {
                DDLCode = reader[0].ToString();
                DeptName = reader[1].ToString();
                District = reader[2].ToString();
            }
            reader.Close();
            con.Close();
        }
       
    }
}