using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSub1_Click()
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewdetail.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub2_Click()
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewcredentialing.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub3_Click()
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/viewauthreq.aspx?guid=" + btnViewGuid);
        }
        protected void btnSub4_Click()
        {
            Guid btnViewGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out btnViewGuid);
            Response.Redirect("~/BillingOnly/viewbilling.aspx?guid=" + btnViewGuid);
        }

        protected void subNavi_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Text == "Contract Details")
            {
                btnSub1_Click();
            }
            if (e.Item.Text == "Provider Credentialing")
            {
                btnSub2_Click();
            }
            if (e.Item.Text == "Authorization Requirements")
            {
                btnSub3_Click();
            }
            if (e.Item.Text == "Business Office Details")
            {
                btnSub4_Click();
            }
        }
    }
}