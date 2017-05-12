using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace AOBriefcase
{
    public partial class ProviderEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            if (this.Page.IsPostBack)
            {
                editHeaders.Visible = false;
            }
        }

        protected void btnSub1_Click()
        {
            Response.Redirect("~/AdminOnly/DBEdit.aspx");
        }
        protected void btnSub2_Click()
        {
            Response.Redirect("~/AdminOnly/ProviderEdit.aspx");
        }
        protected void btnSub3_Click()
        {
            Response.Redirect("~/AdminOnly/BillingRegistration.aspx");
        }
        protected void btnSub4_Click()
        {
            Response.Redirect("~/AdminOnly/AttachmentInterface.aspx");
        }

        protected void subNavi_MenuItem_Click(object sender, MenuEventArgs e)
        {
            if (e.Item.Text == "Configure Contracts")
            {
                btnSub1_Click();
            }
            if (e.Item.Text == "Configure Providers")
            {
                btnSub2_Click();
            }
            if (e.Item.Text == "Configure Billing Users")
            {
                btnSub3_Click();
            }
            if (e.Item.Text == "Configure Attachments")
            {
                btnSub4_Click();
            }
        }
    }
}