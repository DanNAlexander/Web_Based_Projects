//PROG1210
//Vanscoy

//Registration Page for new users

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


namespace PROG1210Web
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>();
            RoleManager<IdentityRole> roleMgr = new RoleManager<IdentityRole>(roleStore);


            if (!roleMgr.RoleExists("Admin"))
            {
                IdentityResult roleResult = roleMgr.Create(new IdentityRole("Admin"));
            }


            IdentityUser user = new IdentityUser(txtUser.Text);
            IdentityResult idResult = manager.Create(user,txtPass.Text);
            IdentityResult userResult = manager.AddToRole(user.Id, "Admin");

            if (userResult.Succeeded)
            {
                lblMessage.Text = "User " + user.UserName + " was created successfully!";
                
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(userIdentity);

                Response.Redirect("~/Welcome.aspx");

            }
            else
                lblMessage.Text = userResult.Errors.FirstOrDefault();

        }
    }
}