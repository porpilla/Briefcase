using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AOBriefcase
{
    public partial class downloads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid getGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out getGuid);

            string filename = String.Empty;
            filename = Request.QueryString["file"];            

            if (filename==null)
            {
                filename = "DEBUG: querystring was not correctly pulled.";
                errorMessage.Text = "Error: " + filename;
            }
            else
            {                
                FileDownload(filename);
            }

            guidPull.Text = "GUID: " + getGuid.ToString();
            filenamePull.Text = "Source: " + filename.ToString();

        }

        protected void FileDownload(string file)
        {
            string filename = file;
            string filepath = Server.MapPath("~/App_Data/Attachments/Authorizations/") + filename;
            FileInfo fileinfo = new FileInfo(filepath);

            if (fileinfo.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileinfo.Name);
                Response.AddHeader("Content-Length", fileinfo.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.Flush();
                Response.TransmitFile(fileinfo.FullName);
                Response.End();
            }
        }
    }
}