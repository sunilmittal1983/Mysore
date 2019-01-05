using Samruddhi.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Samruddhi
{
    public partial class ChallanForm : System.Web.UI.Page
    {       
        SqlConnection con;

        public string insertcommandtext { get; set; }
        public string Challan_Ref { get; set; }


        public string Challan_creation_Date { get; set; } = "01/01/2019";

        public string Challan_Remit_Date { get; set; } = DateTime.Today.ToShortDateString().ToString();

        public string Remit_Date { get; set; }= DateTime.Today.ToShortDateString().ToString();

        public string Challan_Amount { get; set; }

        public string DeptName { get; set; }

        public string BankName { get; set; }

        public string BankNameEntry { get; set; }

        public string DemandDraftNumber { get; set; }

        public string Challan_Remitt_Name { get; set; }

        public string Date_of_Registration { get; set; } = DateTime.Today.ToShortDateString().ToString();

        public string Type_of_Doc { get; set; }

        public string Challan_Document_No { get; set; }

        public string Duty_HOA { get; set; }

        public string Cess_HOA { get; set; }

        public string Reg_HOA { get; set; }

        public string Marriage_HOA { get; set; }

        public string Scanning_HOA { get; set; }

        public string Mutation_HOA { get; set; }

        public string Misc_HOA { get; set; }

        public string RTI_HOA { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Challan_Ref = Request.QueryString.Count > 0 && Request.QueryString[0] != null? Request.QueryString[0].ToString():string.Empty;
            if(!string.IsNullOrEmpty(Challan_Ref))
                LoadChallanData();
            if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("Login.aspx");
        }
        private void LoadChallanData()
        {
            try
            {
                con = Repository.GetConnection();
                con.Open();
                string commandtext = @" Select Challan_Ref,

                                         Challan_creation_Date,

                                         Challan_Remit_Date,

                                         Challan_Remitt_Name,

                                         Head_of_Account,

                                         Challan_Amount,    

                                         BankName,

                                         BankNameEntry,

                                         DemandDraftNumber,

                                         Date_of_Registration,

                                         Type_of_Doc,

                                         Challan_Document_No  from Challan where Challan_Ref = '" + Challan_Ref + "'";
                SqlCommand sqlCommandText = new SqlCommand(commandtext, con);
                SqlDataReader reader = sqlCommandText.ExecuteReader();
                while (reader.Read())
                {
                    if (reader[4].ToString() == "0030-02-103-0-01-000")
                        Duty_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0030-02-102-0-03-000")
                        Cess_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0030-03-104-0-01-000")
                        Reg_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0070-01-800-0-02-000")
                        Marriage_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0030-03-800-0-02-000")
                        Scanning_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0029-00-106-0-03-000")
                        Mutation_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0030-03-800-0-01-000")
                        Misc_HOA = reader[5].ToString();
                    if (reader[4].ToString() == "0070-60-118-0-01-000")
                        RTI_HOA = reader[5].ToString();


                    Challan_Ref = reader[0].ToString();
                    Challan_creation_Date = reader[1].ToString();
                    Challan_Remit_Date = reader[2].ToString();
                    Challan_Remitt_Name = reader[3].ToString();
                    Challan_Amount = reader[5].ToString();
                    SelectBank.Items[SelectBank.SelectedIndex].Text = reader[6].ToString();
                    BankNameEntry = reader[7].ToString();
                    DemandDraftNumber = reader[8].ToString();
                    Date_of_Registration = reader[9].ToString();
                    typeofdoc.Items[typeofdoc.SelectedIndex].Text = reader[10].ToString();
                    Challan_Document_No = reader[11].ToString();
                }
                reader.Close();
            }
            catch (Exception ex) { throw ex; }

            finally
            {

                con.Close();
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/Login.aspx");
        }
        protected void Submit_Click1(object sender, EventArgs e)
        {
            try
            {
                con = Repository.GetConnection();
                con.Open();
                string ChallanRefNumber = String.Format("{0}", Request.Form["challanrefno"]);
                string ChallanCreationDate = String.Format("{0}", Request.Form["challancdate"]);
                string DateOfRemittance = String.Format("{0}", Request.Form["paydate"]);
                string RemittanceName = String.Format("{0}", Request.Form["remitname"]);
                string BankName = SelectBank.Items[SelectBank.SelectedIndex].Text.ToString();
                string BankNameEntry = String.Format("{0}", Request.Form["cbanknames"]);
                string DemandDraft = String.Format("{0}", Request.Form["ddno"]);
                string DateofReg = String.Format("{0}", Request.Form["regdate"]);
                string TypeofDoc = typeofdoc.Items[typeofdoc.SelectedIndex].Text.ToString();
                string DocumetNo = String.Format("{0}", Request.Form["docno"]);

                string Duty = String.Format("{0}", Request.Form["amt1"]);
                string CessonStamp = String.Format("{0}", Request.Form["amt2"]);
                string RegistrationFee = String.Format("{0}", Request.Form["amt3"]);
                string MarriageFee = String.Format("{0}", Request.Form["amt4"]);
                string ScanningFee = String.Format("{0}", Request.Form["amt5"]);
                string MutationFee = String.Format("{0}", Request.Form["amt6"]);
                string MiscellaneousFee = String.Format("{0}", Request.Form["amt7"]);
                string RTI = String.Format("{0}", Request.Form["amt8"]);
                var HeadOfAccount = Duty;
                var Total = Duty;
                //Duty = Duty.Trim() == string.Empty ? 0 : Duty;
                //if ((Convert.ToInt32(Duty) + Convert.ToInt32(CessonStamp) + Convert.ToInt32(RegistrationFee) + Convert.ToInt32(MarriageFee) + Convert.ToInt32(ScanningFee) + Convert.ToInt32(MutationFee) + Convert.ToInt32(MiscellaneousFee) + Convert.ToInt32(RTI)) <= 0)
                //{
                //    lsterrorMessage.Text = " None of the head account any value entered";
                //    lsterrorMessage.Visible = true;
                //    return;
                //}
                var deptId = "";
                if (Session["DepartmentName"] != null )
                    deptId = Session["DeptID"].ToString();
                    string commandtext = "delete from Challan where Challan_Ref = '"+ ChallanRefNumber+"'";
                SqlCommand sqlcomd = new SqlCommand(commandtext, con);
                sqlcomd.ExecuteNonQuery();

                if (Duty.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
                                   + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
                                   + "[Type_of_Doc], [Challan_Document_No]  ) "
                                   +
                                   "Values('" + ChallanRefNumber + "'," +
                                   "'" + ChallanCreationDate + "' ,' " +
                                   "" + DateOfRemittance + "'" +
                                   ",'" + RemittanceName + "'" +
                                   ",'" + "0030-02-103-0-01-000" + "'" +
                                   ",'" + Duty + "'" +
                                   ",'" + deptId + "'" +
                                   ",'" + BankName + "'" +
                                   ",'" + BankNameEntry + "'" +
                                   ",'" + DemandDraft + "'" +
                                   ",'" + DateofReg + "'" +
                                   ",'" + TypeofDoc + "'" +
                                   ",'" + DocumetNo + "')";                     
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (CessonStamp.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
                                   + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
                                   + "[Type_of_Doc], [Challan_Document_No]  ) "
                                   +
                                   "Values('" + ChallanRefNumber + "'," +
                                   "'" + ChallanCreationDate + "' ,' " +
                                   "" + DateOfRemittance + "'" +
                                   ",'" + RemittanceName + "'" +
                                   ", '0030-02-102-0-03-000'" +
                                   ",'" + CessonStamp + "'" +
                                   ",'" + deptId + "'" +
                                   ",'" + BankName + "'" +
                                   ",'" + BankNameEntry + "'" +
                                   ",'" + DemandDraft + "'" +
                                   ",'" + DateofReg + "'" +
                                   ",'" + TypeofDoc + "'" +
                                   ",'" + DocumetNo + "')";
                    
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (RegistrationFee.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
                                   + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
                                   + "[Type_of_Doc], [Challan_Document_No]  ) "
                                   +
                                   "Values('" + ChallanRefNumber + "'," +
                                   "'" + ChallanCreationDate + "' ,' " +
                                   "" + DateOfRemittance + "'" +
                                   ",'" + RemittanceName + "'" +
                                   ",'0030-03-104-0-01-000'" +
                                   ",'" + RegistrationFee + "'" +
                                   ",'" + deptId + "'" +
                                   ",'" + BankName + "'" +
                                   ",'" + BankNameEntry + "'" +
                                   ",'" + DemandDraft + "'" +
                                   ",'" + DateofReg + "'" +
                                   ",'" + TypeofDoc + "'" +
                                   ",'" + DocumetNo + "')";
                     
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (MarriageFee.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
               + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
               + "[Type_of_Doc], [Challan_Document_No]  ) "
               +
               "Values('" + ChallanRefNumber + "'," +
               "'" + ChallanCreationDate + "' ,' " +
               "" + DateOfRemittance + "'" +
               ",'" + RemittanceName + "'" +
               ",'0070-01-800-0-02-000'" +
               ",'" + MarriageFee + "'" +
               ",'" + deptId + "'" +
               ",'" + BankName + "'" +
               ",'" + BankNameEntry + "'" +
               ",'" + DemandDraft + "'" +
               ",'" + DateofReg + "'" +
               ",'" + TypeofDoc + "'" +
               ",'" + DocumetNo + "')";
                     
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (ScanningFee.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
               + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
               + "[Type_of_Doc], [Challan_Document_No]  ) "
               +
               "Values('" + ChallanRefNumber + "'," +
               "'" + ChallanCreationDate + "' ,' " +
               "" + DateOfRemittance + "'" +
               ",'" + RemittanceName + "'" +
               ",'0030-03-800-0-02-000'" +
               ",'" + ScanningFee + "'" +
               ",'" + deptId + "'" +
               ",'" + BankName + "'" +
               ",'" + BankNameEntry + "'" +
               ",'" + DemandDraft + "'" +
               ",'" + DateofReg + "'" +
               ",'" + TypeofDoc + "'" +
               ",'" + DocumetNo + "')";
                    
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (MutationFee.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
               + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
               + "[Type_of_Doc], [Challan_Document_No]  ) "
               +
               "Values('" + ChallanRefNumber + "'," +
               "'" + ChallanCreationDate + "' ,' " +
               "" + DateOfRemittance + "'" +
               ",'" + RemittanceName + "'" +
               ",'0029-00-106-0-03-000'" +
               ",'" + MutationFee + "'" +
               ",'" + deptId + "'" +
               ",'" + BankName + "'" +
               ",'" + BankNameEntry + "'" +
               ",'" + DemandDraft + "'" +
               ",'" + DateofReg + "'" +
               ",'" + TypeofDoc + "'" +
               ",'" + DocumetNo + "')";
                    
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (MiscellaneousFee.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
               + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
               + "[Type_of_Doc], [Challan_Document_No]  ) "
               +
               "Values('" + ChallanRefNumber + "'," +
               "'" + ChallanCreationDate + "' ,' " +
               "" + DateOfRemittance + "'" +
               ",'" + RemittanceName + "'" +
               ",    '0030-03-800-0-01-000'" +
               ",   '"+ MiscellaneousFee + "'" +
               ",'" + deptId + "'" +
               ",'" + BankName + "'" +
               ",'" + BankNameEntry + "'" +
               ",'" + DemandDraft + "'" +
               ",'" + DateofReg + "'" +
               ",'" + TypeofDoc + "'" +
               ",'" + DocumetNo + "')";
                     
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
                if (RTI.Trim() != string.Empty)
                {
                     insertcommandtext = "Insert into Challan([Challan_Ref],[Challan_creation_Date],[Challan_Remit_Date],[Challan_Remitt_Name],"
               + "[Head_of_Account],[Challan_Amount],[DeptName], [BankName],[BankNameEntry],[DemandDraftNumber],[Date_of_Registration],"
               + "[Type_of_Doc], [Challan_Document_No]  ) "
               +
               "Values('" + ChallanRefNumber + "'," +
               "'" + ChallanCreationDate + "' ,' " +
               "" + DateOfRemittance + "'" +
               ",'" + RemittanceName + "'" +
               ", '0070-60-118-0-01-000'" +
               ",'" + RTI + "'" +
               ",'" + deptId + "'" +
               ",'" + BankName + "'" +
               ",'" + BankNameEntry + "'" +
               ",'" + DemandDraft + "'" +
               ",'" + DateofReg + "'" +
               ",'" + TypeofDoc + "'" +
               ",'" + DocumetNo + "')";
                     
                     sqlcomd = new SqlCommand(insertcommandtext, con);
                    sqlcomd.ExecuteNonQuery();
                }
            }
            catch (Exception ex) { throw ex; }
            finally { con.Close();
                Button2_Click(sender, e);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {         
            Challan_Ref = string.Empty;
            Challan_creation_Date = string.Empty;
            Challan_Remit_Date = string.Empty;
            Challan_Remitt_Name = string.Empty;
            Challan_Amount = string.Empty;
            BankName = string.Empty;
            BankNameEntry = string.Empty;
            DemandDraftNumber = string.Empty;
            Date_of_Registration = string.Empty;
            Type_of_Doc = string.Empty;
            Challan_Document_No = string.Empty;
            Duty_HOA = string.Empty;
            Cess_HOA = string.Empty;
            Reg_HOA = string.Empty;
            Marriage_HOA = string.Empty;
            Scanning_HOA = string.Empty;
            Mutation_HOA = string.Empty;
            Misc_HOA = string.Empty;
            RTI_HOA = string.Empty;
            SelectBank.Items[SelectBank.SelectedIndex].Value = "0";
            typeofdoc.Items[typeofdoc.SelectedIndex].Value = "-";
        }       
    }
}