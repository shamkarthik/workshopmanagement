using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Workshop_Application.Startup))]
namespace Workshop_Application
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
