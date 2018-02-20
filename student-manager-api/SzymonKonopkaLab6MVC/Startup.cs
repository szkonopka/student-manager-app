using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SzymonKonopkaLab6MVC.Startup))]
namespace SzymonKonopkaLab6MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
