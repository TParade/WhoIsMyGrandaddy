using Inter.Server.Models.RootAscendant;

namespace Inter.Server.Models.Descendant
{
    public class PersonData : RootPersonData
    {
        public List<PersonData> Children { get; set; } = new List<PersonData>();


        // Recursive method to create Person objects from SQL result set
        internal static List<PersonData> CreateFamilyTree(List<PersonData> persons, bool isFather)
        {
            var rootPersons = persons.Where(p => p.Generation == 1).ToList();
            foreach (var rootPerson in rootPersons)
            {
                PopulateChildren(rootPerson, persons, isFather);
            }
            return rootPersons;
        }

        private static void PopulateChildren(PersonData parent, List<PersonData> persons, bool isFather)
        {
            var children = new List<PersonData>();
            children = isFather ?
                        persons.Where(p => p.FatherId == parent.Id).ToList() :
                        persons.Where(p => p.MotherId == parent.Id).ToList();

            foreach (var child in children)
            {
                parent.Children.Add(child);
                PopulateChildren(child, persons, isFather);
            }
        }
    }
}
