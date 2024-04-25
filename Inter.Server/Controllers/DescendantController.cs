using Inter.Server.Data;
using Inter.Server.Models.Descendant;
using Microsoft.AspNetCore.Mvc;

namespace Inter.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DescendantController : ControllerBase
    {
        private readonly ILogger<DescendantController> _logger;

        public DescendantController(ILogger<DescendantController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetDescendants")]
        public async Task<IEnumerable<PersonData>> Get(string identityNumber, int maxGeneration)
        {
            MyGranddaddyContext db = new();

            OutputParameter<int?> fatherCount = new();

            var result = await db.Procedures.FamilyTreeGetAsync(identityNumber, fatherCount);

            var personData = result.Select(n => new PersonData()
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

            var data = PersonData.CreateFamilyTree(personData.Where(n => n.Generation <= maxGeneration).ToList(), fatherCount.Value > 0);

            return data;
        }
    }
}
