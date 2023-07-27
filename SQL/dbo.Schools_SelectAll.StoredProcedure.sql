	CREATE PROC [dbo].[Schools_SelectAll]
		
	AS
		
/*  -----TEST CODE-----
		
EXECUTE [dbo].[Schools_SelectAll]
		
*/

	BEGIN

	SELECT S.[Id]
      		,S.[Name]
	  	,L.[City]
	  	,ST.[Name] AS State

  	FROM [dbo].[Schools] S INNER JOIN [dbo].[Locations] L
  	ON S.LocationId = L.Id
  	JOIN [dbo].[States] ST
  	ON ST.Id = L.StateId
  	ORDER BY S.[Name] ASC;

	END
