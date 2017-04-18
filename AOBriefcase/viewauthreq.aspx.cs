using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class viewauthreq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // viewdetail page view submenu button methods
        protected void btnSub1_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewdetail.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub2_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewcredentialing.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub3_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewauthreq.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub4_Click(object sender, EventArgs e)
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/PlaceholderPage.aspx?guid=" + btnViewGuid);
        }

        protected void fetchDLinfo()
        {
            Guid targetGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out targetGuid);
            string targetfile = Request.QueryString["Contract_PDF"];

            
        }

    }
}