	CREATE PROC [dbo].[EducationLevels_SelectAll]

	as
/*------------ TEST CODE ------------

		EXECUTE dbo.EducationLevels_SelectAll

*/
	BEGIN

		SELECT [Id]
			,[Name]
		
		FROM [dbo].[EducationLevels]
		ORDER BY [Name] ASC

	END
