using Microsoft.AspNetCore.Mvc;

namespace ValueService.Controllers
{
    [Route("api/status")]
    public class StatusController : Controller
    {
        [HttpGet]
        public string Get()
        {
            return "OK";
        }
    }
}
