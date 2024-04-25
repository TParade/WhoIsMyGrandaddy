﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Inter.Server.Data;

public partial class Person
{
    public int Id { get; set; }

    public int? FatherId { get; set; }

    public int? MotherId { get; set; }

    public string Name { get; set; }

    public string Surname { get; set; }

    public DateTime BirthDate { get; set; }

    public string IdentityNumber { get; set; }

    public virtual Person Father { get; set; }

    public virtual ICollection<Person> InverseFather { get; set; } = new List<Person>();

    public virtual ICollection<Person> InverseMother { get; set; } = new List<Person>();

    public virtual Person Mother { get; set; }
}