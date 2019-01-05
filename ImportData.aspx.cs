using Samruddhi.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web.Security;

namespace Samruddhi
{
    public partial class ImportData : System.Web.UI.Page
    {        
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            //    Response.Redirect("Login.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/Login.aspx");
        }
        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string csvPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
                DataTable dt = new DataTable();
                List<string> ListOfHeadAccount = new List<string>
                {
                    "0030~02~103~0~01~000",
                    "0030~02~102~0~03~000",
                    "0030~02~102~0~02~000",
                    "0030~02~102~0~01~000",
                    "0030~03~104~0~01~000",
                    "0070~01~800~0~02~000",
                    "0030~03~800~0~02~000",
                    "0029~00~106~0~03~000",
                    "0030~03~800~0~01~000",
                    "0070~60~118~0~01~000"
                };
                dt.Columns.AddRange(new DataColumn[9] 
                {
                    new DataColumn("ChallanId", typeof(string)),
                    new DataColumn("Challan_Create_Date", typeof(string)),
                    new DataColumn("Challan_Payment_Date",typeof(string)),
                    new DataColumn("Challan_ScrollDate",typeof(string)),
                    new DataColumn("Challan_number",typeof(string)),
                    new DataColumn("Challan_RefNo",typeof(string)),
                    new DataColumn("Challan_Remitter_Name",typeof(string)),
                    new DataColumn("Challan_Amount",typeof(string)),
                    new DataColumn("Head_of_Account",typeof(string))
                }) ;
                var headofaccount = string.Empty;
                //Read the contents of CSV file.
                string csvData = File.ReadAllText(csvPath);
                //Execute a loop over the rows.
                foreach (string row in csvData.Split('\n'))
                {
                    int slno;                   
                    var isNumeric = int.TryParse(row.Split(',')[0].ToString(), out slno);
                    if(!isNumeric)
                     if (!ListOfHeadAccount.Contains(row.Split(',')[0].ToString())) continue;
                    if (ListOfHeadAccount.Contains(row.Split(',')[0].ToString()))
                    { headofaccount = row.Split(',')[0].ToString(); continue; }
                    if (isNumeric)
                    {
                        if (!string.IsNullOrEmpty(row))
                        {
                            dt.Rows.Add();
                            int i = 0;
                            var rowchanged = row;
                            if (rowchanged.Split(',')[7].Split('"').Length > 1)
                            {
                                if (rowchanged.Split('"').Length > 1 && rowchanged.Split('"').Length < 4)
                                    rowchanged = rowchanged.Split('"')[1].Replace(',', 'f');
                                else if (rowchanged.Split('"').Length > 1 && rowchanged.Split('"').Length > 3)
                                    rowchanged = rowchanged.Split('"')[rowchanged.Split('"').Length - 2].Replace(',', 'f');
                                else
                                    rowchanged = rowchanged.Split(',')[7].Replace(',', 'f');
                            }
                            else
                                rowchanged = rowchanged.Split(',')[7];
                            
                            //Execute a loop over the columns.
                            foreach (string cell in row.Split(','))
                            {
                                if (i == 7)
                                {
                                    dt.Rows[dt.Rows.Count - 1][7] = rowchanged.Replace('f', ',');
                                    dt.Rows[dt.Rows.Count - 1][8] = headofaccount;
                                }
                                else if (i >= 8)
                                {
                                    dt.Rows[dt.Rows.Count - 1][8] = headofaccount;
                                }
                                else
                                    dt.Rows[dt.Rows.Count - 1][i] = cell;
                                i++;
                            }
                        }
                    }
                }        
                try
                {
                    con = Repository.GetConnection();
                    con.Open();
                    StringBuilder str = new StringBuilder();
                    foreach(DataRow dr in dt.Rows)
                    {
                        str.Append("INSERT INTO [dbo].[ImportTreasury] ([ChallanId],    [Challan_Create_Date],    [Challan_Payment_Date],    [Challan_ScrollDate],    [Challan_number],    [Challan_RefNo],    [Challan_Remitter_Name],  [Challan_Amount],    [Head_of_Account] ) ");
                        str.Append("Values ('" + dr[0] + "','" + dr[1] + "','" + dr[2] + "','" + dr[3] + "','" + dr[4] + "','" + dr[5] + "','" + dr[6] + "','" + dr[7] + "','" + dr[8] + "')");
                        SqlCommand sqlcomd = new SqlCommand(str.ToString(), con);
                        sqlcomd.ExecuteNonQuery();
                        str = new StringBuilder();
                    }        
                }
                catch (Exception ex) { throw ex; }
                finally { con.Close(); }
            }
            else
            {
               
            }
        }
    }
}