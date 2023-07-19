USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Degrees_SelectAll]    Script Date: 7/12/2023 1:53:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Santiago España>
-- Create date: <04/14/2023>
-- Description: <Degrees_SelectAll>
-- Code Reviewer: Rasean Rhone

-- MODIFIED BY: Santiago España, Porfirio Alvarez
-- MODIFIED DATE: 04/14/2023, 7/12/2023
-- Code Reviewer: 
-- Note: Is Working!, Added ORDER BY ASC to alphabetize list of degree names.
-- =============================================

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
