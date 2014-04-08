namespace Project
{
    using Owin;

    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
			// todo we should actually have some requests we can handle
            app.UseHandler((req, res) => res.WriteAsync("HI!"));
        }
    }
}