using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AOBriefcase
{
    public partial class AttachmentInterface : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAuthUpload_Click(object sender, EventArgs e)
        {
            if (AuthUpload1.HasFile)
            {
                string fileName = Path.GetFileName(AuthUpload1.PostedFile.FileName);
                string AuthMapPath = "~/App_Data/Attachments/Authorizations/";
                AuthUpload1.PostedFile.SaveAs(Server.MapPath(AuthMapPath) + fileName);
                InsertAuthFilepath(fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void btnAuthClear_Click(object sender, EventArgs e)
        {
            DeleteAuthFile();
            ClearAuthDBEntry();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btnBillUpload_Click(object sender, EventArgs e)
        {
            if (BillUpload1.HasFile)
            {
                string fileName = Path.GetFileName(BillUpload1.PostedFile.FileName);
                string BillMapPath = "~/App_Data/Attachments/Billing/";
                BillUpload1.PostedFile.SaveAs(Server.MapPath(BillMapPath) + fileName);
                InsertBillFilepath(fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void btnBillClear_Click(object sender, EventArgs e)
        {
            DeleteBillFile();
            ClearBillDBEntry();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void IndexSelected(object sender, EventArgs e)
        {
            selectionInfo.Visible = true;
            AuthDoc.Visible = true;
            BillDoc.Visible = true;

            if (VerifyExistingAuthFile() != null)
            {
                btnAuthClear.Visible = true;
                btnAuthUpload.Visible = false;
            }
            else
            {
                btnAuthClear.Visible = false;
                btnAuthUpload.Visible = true;
            }
            if (VerifyExistingBillFile() != null)
            {
                btnBillClear.Visible = true;
                btnBillUpload.Visible = false;
            }
            else
            {
                btnBillClear.Visible = false;
                btnBillUpload.Visible = true;
            }

            int referenceIndex = GridView1.SelectedIndex;
            string guidIndex = GridView1.DataKeys[referenceIndex].Value.ToString();
            selectionInfo.Text = "You will be uploading attachments to: " + guidIndex;
        }

        // In order for file deletion methods to work, NETWORK SERVICES user must be enabled on /Attachments directory
        protected void DeleteAuthFile()
        {
            var AuthFileName = VerifyExistingAuthFile();
            var AuthFilePath = Server.MapPath("~/App_Data/Attachments/Authorizations/") + AuthFileName;
            File.Delete(AuthFilePath);
        }

        protected void DeleteBillFile()
        {
            var BillFileName = VerifyExistingBillFile();
            var BillFilePath = Server.MapPath("~/App_Data/Attachments/Billing/") + BillFileName;
            File.Delete(BillFilePath);
        }


        protected string VerifyExistingAuthFile()
        {
            string AuthFileName = "debug";
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("SELECT [Contract_PDF] FROM [Contract_Demographics] WHERE [GUID]=@SelectedIndex", sqlcon);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                ChosenIndex.Value = guidIndex;// GridView1.SelectedIndex + 1;
                cmd.Parameters.Add(ChosenIndex);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (!reader.IsDBNull(reader.GetOrdinal("Contract_PDF")))
                        {
                            AuthFileName = reader.GetString(reader.GetOrdinal("Contract_PDF"));
                        }
                        else
                        {
                            AuthFileName = null;
                        }
                    }
                    return AuthFileName;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected string VerifyExistingBillFile()
        {
            string BillFileName = "debug";
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("SELECT [Billing_PDF] FROM [Contract_Demographics] WHERE [GUID]=@SelectedIndex", sqlcon);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                ChosenIndex.Value = guidIndex;// GridView1.SelectedIndex + 1;
                cmd.Parameters.Add(ChosenIndex);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (!reader.IsDBNull(reader.GetOrdinal("Billing_PDF")))
                        {
                            BillFileName = reader.GetString(reader.GetOrdinal("Billing_PDF"));
                        }
                        else
                        {
                            BillFileName = null;
                        }
                    }
                    return BillFileName;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally
            {
                sqlcon.Close();
            }
        }


        private void InsertAuthFilepath(string filepath)
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateAuthFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                param.Value = filepath;
                ChosenIndex.Value = guidIndex;
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Error when inserting filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        private void InsertBillFilepath(string filepath)
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateBillFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                param.Value = filepath;
                ChosenIndex.Value = guidIndex;
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Error when inserting filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        private void ClearAuthDBEntry()
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateAuthFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                param.IsNullable = true;
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                param.Value = DBNull.Value;
                ChosenIndex.Value = guidIndex;
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Error when removing filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }

        protected void ClearBillDBEntry()
        {
            SqlConnection sqlcon = new SqlConnection(GetConnection());

            int referenceIndex = GridView1.SelectedIndex;
            Guid guidIndex = Guid.Parse(GridView1.DataKeys[referenceIndex].Value.ToString());

            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand("spUpdateBillFilePath", sqlcon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@filepath", SqlDbType.VarChar);
                param.IsNullable = true;
                SqlParameter ChosenIndex = new SqlParameter("@SelectedIndex", SqlDbType.UniqueIdentifier);
                param.Value = DBNull.Value;
                ChosenIndex.Value = guidIndex;
                cmd.Parameters.Add(ChosenIndex);
                cmd.Parameters.Add(param);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string msg = "Error when removing filepath";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlcon.Close();
            }
        }


        private string GetConnection()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

    }


}