using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;

namespace ValueService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .ConfigureLogging(builder => builder.AddFile(options => {
                    options.FileName = "diagnostics-";
                    options.LogDirectory = "/var/log/value-service";
                    options.FileSizeLimit = 2 * 1024 * 1024;
                })) 
                .UseStartup<Startup>()
                .Build();
    }
}
