namespace Inter.Server.Models.RootAscendant
{
    public class RootPersonData
    {
        public int Id { get; set; }
        public int? FatherId { get; set; }
        public int? MotherId { get; set; }
        public required string Name { get; set; }
        public required string Surname { get; set; }
        public DateTime BirthDate { get; set; }
        public required string IdentityNumber { get; set; }
        public int Generation { get; set; }
    }
}
