﻿USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Degrees_SelectAll]    Script Date: 7/12/2023 1:53:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE PROC [dbo].[Degrees_SelectAll]

	as
/*------------ TEST CODE ------------

		EXECUTE dbo.Degrees_SelectAll

*/
	BEGIN

			SELECT [Id]
				  ,[Name]
			  FROM [dbo].[Degrees]
			  ORDER BY [Name] ASC

	END
GO
