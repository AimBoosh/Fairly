USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[EducationLevels_SelectAll]    Script Date: 7/12/2023 1:53:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Santiago España>
-- Create date: <04/14/2023>
-- Description: <EducationLevels_SelectAll>
-- Code Reviewer: Rasean Rhone

-- MODIFIED BY: Santiago España, Porfirio Alvarez
-- MODIFIED DATE: 04/14/2023, 7/12/2023
-- Code Reviewer: 
-- Note: Is Working!, Added ORDER BY ASC to alphabetize list of education level names.
-- =============================================

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
GO
