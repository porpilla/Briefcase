using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;

namespace AOBriefcase
{
    public partial class BillingRegistration : System.Web.UI.Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Default UserStore constructor uses the default connection string named: DefaultConnection
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);
            var user = new IdentityUser() { UserName = UserName.Text};
            var roleAssign = SelectedRole.Text;

            IdentityResult result = manager.Create(user, Password.Text);

            try
            {
                IdentityResult roleResult = manager.AddToRole(user.Id, roleAssign);

                if (roleResult.Succeeded)
                {
                    StatusMessage2.Text = string.Format("User was successfully assigned Role");
                }
                else
                {
                    StatusMessage2.Text = roleResult.Errors.FirstOrDefault();
                }
            }
            catch
            {
                throw;
            }

            if (result.Succeeded)
            {
                StatusMessage1.Text = string.Format("User {0} was created successfully!", user.UserName);
            }
            else
            {
                StatusMessage1.Text = result.Errors.FirstOrDefault();
            }

            // These methods are used for adding a new role through UI
            //var roleStore = new RoleStore<IdentityRole>();
            //var rManager = new RoleManager<IdentityRole>(roleStore);
            //var roleAssign = new IdentityRole() { Name = SelectedRole.Text };
            //IdentityResult roleResult = rManager.Create(roleAssign);
            //if (roleResult.Succeeded)
            //{
                //StatusMessage2.Text = string.Format("User was successfully assigned role: {0}");
            //}
            //else
            //{
                //StatusMessage2.Text = roleResult.Errors.FirstOrDefault();
            //}
        }
    }
}