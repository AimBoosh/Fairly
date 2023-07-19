USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[RelatedPersonalValues_Delete]    Script Date: 6/8/2023 2:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Porfirio Alvarez>
-- Create date: <06/05/2023>
-- Description: <Delete PROC for RelatedPersonalValues>
-- Code Reviewer: <>

-- MODIFIED BY: <>
-- MODIFIED DATE: <>
-- Code Reviewer: <>
-- Note: <>
-- =============================================

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

      WHERE PersonalValueA = @PersonalValueA
	  AND PersonalValueB = @PersonalValueB

END


GO
