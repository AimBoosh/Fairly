	CREATE PROC [dbo].[RelatedPersonalValues_Delete]
					@PersonalValueA int
					,@PersonalValueB int
	AS

/*------------ TEST CODE ------------

DECLARE @PersonalValueA int = 2
	,@PersonalValueB int = 4

EXECUTE [dbo].[RelatedPersonalValues_Delete]
					@PersonalValueA 
					,@PersonalValueB 

*/

	BEGIN

	DELETE FROM [dbo].[RelatedPersonalValues]

      	WHERE 	PersonalValueA = @PersonalValueA
	AND 	PersonalValueB = @PersonalValueB

	END
