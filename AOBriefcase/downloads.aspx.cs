using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AOBriefcase
{
    public partial class downloads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid getGuid = Guid.Empty;
            Guid.TryParse(Request.QueryString["GUID"], out getGuid);

            string filename = Request.QueryString["filename"];
        }
    }
}