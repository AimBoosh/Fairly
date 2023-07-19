USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[RelatedPersonalValues_SelectAll]    Script Date: 6/9/2023 12:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Porfirio Alvarez>
-- Create date: <06/06/2023>
-- Description: <Select_All PROC for RelatedPersonalValues>
-- Code Reviewer: <>

-- MODIFIED BY: <>
-- MODIFIED DATE: <>
-- Code Reviewer: <>
-- Note: <>
-- =============================================

	CREATE PROC [dbo].[RelatedPersonalValues_SelectAll]
										

	AS

/*------------ TEST CODE ------------

EXECUTE [dbo].[RelatedPersonalValues_SelectAll]
									
*/

	BEGIN

			SELECT RPV.[PersonalValueA] AS IdA
					,PVA.Name
					,RPV.[PersonalValueB] AS IdB
					,PVB.Name

			FROM [dbo].[RelatedPersonalValues] AS RPV 
			INNER JOIN [dbo].[PersonalValues] AS PVA ON RPV.PersonalValueA = PVA.Id
			INNER JOIN [dbo].[PersonalValues] AS PVB ON RPV.PersonalValueB = PVB.Id
			ORDER BY PVA.Name, PVB.Name
   
	END


GO
