USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[RelatedPersonalValues_Select_Linked]    Script Date: 6/8/2023 2:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- -- =============================================
-- Author: <Porfirio Alvarez>
-- Create date: <06/06/2023>
-- Description: <Select_Linked PROC for RelatedPersonalValues>
-- Code Reviewer: <>

-- MODIFIED BY: <>
-- MODIFIED DATE: <>
-- Code Reviewer: <>
-- Note: <>
-- =============================================

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



GO
