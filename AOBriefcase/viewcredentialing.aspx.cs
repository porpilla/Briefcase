using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class viewcredentialing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Guid myguid = Guid.Empty;
            //if (Guid.TryParse(Request.QueryString["GUID"], out myguid))
            //{/*myguid = new Guid(Request.QueryString["GUID"]);*/
            //    if (myguid != null)
            //    {
            //        GetData(myguid);
            //        viewGUID.Text = myguid.ToString();
            //        //viewGUID2.Text = parameterGuid                                        
            //    }
            //    else
            //    {
            //        phNoViewDetail.Visible = true;
            //        phViewDetail.Visible = false;
            //    }
            //}
        }

        // viewdetail page view submenu button methods. In order to restore original logic, add "object sender, EventArgs e" into method input argument.
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