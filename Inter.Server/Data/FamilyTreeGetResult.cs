﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inter.Server.Data
{
    public partial class FamilyTreeGetResult
    {
        public int? Id { get; set; }
        public int? FatherId { get; set; }
        public int? MotherId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime? BirthDate { get; set; }
        public string IdentityNumber { get; set; }
        public int? Generation { get; set; }
    }
}
