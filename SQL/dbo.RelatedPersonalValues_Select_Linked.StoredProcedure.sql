	CREATE PROC [dbo].[RelatedPersonalValues_Select_Linked]
							@Id int
														

	AS

/*------------ TEST CODE ------------

EXECUTE [dbo].[RelatedPersonalValues_Select_Linked]
				@Id = 3
										
*/

	BEGIN
				

	SELECT [PV].[Id]
		,[PV].[Name]

	FROM [dbo].[RelatedPersonalValues] AS RPV
	JOIN [dbo].[PersonalValues] AS PV ON RPV.PersonalValueB = PV.Id
	WHERE RPV.PersonalValueA = @Id

	END
