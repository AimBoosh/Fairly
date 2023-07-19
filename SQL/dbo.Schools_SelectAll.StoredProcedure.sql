USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Schools_SelectAll]    Script Date: 7/12/2023 1:53:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================

 --Author: <Benson, Addam>
 --Create date: <2023-04-12>
 --Description: <SelectAll for Schools>
 --Code Reviewer: Kevin Rodriguez

 --MODIFIED BY: 
 --MODIFIED DATE:
 --Code Reviewer:
 --Note: 

 --=============================================

CREATE PROC [dbo].[Schools_SelectAll]
		

AS
/*
EXECUTE [dbo].[Schools_SelectAll]
*/

BEGIN

SELECT s.[Id]
      ,s.[Name]
	  ,l.[City]
	  ,st.[Name] as State


  FROM [dbo].[Schools] s INNER JOIN [dbo].[Locations] l
  ON s.LocationId = l.Id
  JOIN [dbo].[States] st
  ON st.Id = l.StateId
  ORDER BY s.[Name] ASC;


END


GO
