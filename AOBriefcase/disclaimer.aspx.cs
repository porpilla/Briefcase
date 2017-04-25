using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class disclaimer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Site1 MasterPage = (Site1)Page.Master;
            MasterPage.FindControl("NavigationBar").Visible = false;            
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            //btnAccept.PostBackUrl = "~/Webform1.aspx";
            Response.Redirect("~/Webform1.aspx");                        
        }

        protected void btnNoAccept_Click(object sender, EventArgs e)
        {
            //btnNoAccept.PostBackUrl = "http://www.arrowheadortho.com/";
            Response.Redirect("http://www.arrowheadortho.com/");
        }
    }
}