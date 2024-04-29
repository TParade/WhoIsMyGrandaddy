declare @i int = 1;
declare @NumGenerations int = 15;
declare @FatherId int
      , @MotherId int;
declare @IIFatherId int
      , @IIMotherId int;
declare @Surname varchar(20) = 'Gen15';

while @NumGenerations > 0
    begin
        insert into [Site].[Person]
        (
            [FatherId]
          , [MotherId]
          , [Name]
          , [Surname]
          , [BirthDate]
          , [IdentityNumber]
        )
        values (@IIFatherId, @IIMotherId, 'Father.' + cast(@i as varchar(20)), @Surname
              , dateadd(year, 20 * (@i - 1), '1900-01-01')
              , substring(replace(cast(newid() as varchar(max)), '-', ''), 1, 10))

        set @FatherId = scope_identity()

        insert into [Site].[Person]
        (
            [FatherId]
          , [MotherId]
          , [Name]
          , [Surname]
          , [BirthDate]
          , [IdentityNumber]
        )
        values (@IIFatherId, @IIMotherId, 'Mother.' + cast(@i as varchar(20)), @Surname
              , dateadd(year, 20 * (@i - 1), '1900-01-01')
              , substring(replace(cast(newid() as varchar(max)), '-', ''), 1, 10))

        set @MotherId = scope_identity()

        set @IIFatherId = @FatherId

        set @IIMotherId = @MotherId


        set @NumGenerations = @NumGenerations - 1;
        set @i = @i + 1;
    end;

	SELECT * FROM [Site].[Person] as [P]