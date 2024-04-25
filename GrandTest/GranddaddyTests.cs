using Inter.Server.Controllers;
using Inter.Server.Data;
using Inter.Server.Models.Descendant;
using Microsoft.EntityFrameworkCore;

namespace GrandTest
{
    public class GranddaddyTests
    {
        public GranddaddyTests()
        {
        }

        [Theory]
        [InlineData("11B964276A")]//Adam	Smith
        [InlineData("BC1B4BEDD8")]//Anne	Smith
        public async Task CanGetAllDescendants(string identityNumber)
        {
            var controller = new DescendantController(null);

            for (int i = 0; i < 3; i++)
            {
                var maxGen = 3 * (i + 1);
                var result = await controller.Get(identityNumber, maxGen);
                Assert.NotNull(result); //Check that result is not null

                Assert.True(result.Count() == 1, "There should be only one root.");
                //Check that all results are descendants of identity number entered
                var flatResult = Flatten(result.Single());
                Assert.True(flatResult.Max(n => n.Generation) <= maxGen, "The number of descandats exceed what was expected.");
            }
        }

        [Theory]
        [InlineData("1EF70E53C7")]//Mary	Smith
        [InlineData("5B304D9685")]//Benjamin	Smith
        public async Task CanGetRoot(string identityNumber)
        {
            var controller = new RootAscendantController(null);

            var result = await controller.Get(identityNumber);
            Assert.NotNull(result); //Check that result is not null
            Assert.NotEmpty(result);

            Assert.True(result.Count(r => r.Generation == 1) == 1, "Cannot have more than one searched person.");

            var rootCount = result.Count(r => r.MotherId == null && r.FatherId == null);
            Assert.True(rootCount > 0 && rootCount <= 2, "No root was found.");
        }

        private IEnumerable<PersonData> Flatten(PersonData root)
        {
            var result = new List<PersonData>();
            Flatten(root, result);
            return result;
        }

        private void Flatten(PersonData person, List<PersonData> result)
        {
            result.Add(person);
            foreach (var child in person.Children)
            {
                Flatten(child, result);
            }
        }
    }
}