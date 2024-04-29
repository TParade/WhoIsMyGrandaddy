using Inter.Server.Data;
using Inter.Server.Models.RootAscendant;
using Microsoft.AspNetCore.Mvc;

namespace Inter.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RootAscendantController : ControllerBase
    {
        private readonly ILogger<RootAscendantController> _logger;

        public RootAscendantController(ILogger<RootAscendantController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetRootAscendant")]
        public async Task<IEnumerable<RootPersonData>> Get(string identityNumber)
        {
            try
            {
                MyGranddaddyContext db = new MyGranddaddyContext();

                var result = await db.Procedures.FamilyTreeRootGetAsync(identityNumber);

                var personData = result.Select(n => new RootPersonData()
                {
                    Id = n.Id.Value,
                    FatherId = n.FatherId,
                    MotherId = n.MotherId,
                    Name = n.Name,
                    Surname = n.Surname,
                    BirthDate = n.BirthDate.Value,
                    IdentityNumber = n.IdentityNumber,
                    Generation = n.Generation.Value,
                }).ToList();


                return personData;
            }
            catch (Exception ex)
            {

                _logger.LogError(ex, "Error retrieving data");
                return new List<RootPersonData>();
            }
        }
    }
}
