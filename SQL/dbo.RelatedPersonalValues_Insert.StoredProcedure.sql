USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[RelatedPersonalValues_Insert]    Script Date: 6/8/2023 2:55:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Porfirio Alvarez>
-- Create date: <06/05/2023>
-- Description: <Insert PROC for RelatedPersonalValues>
-- Code Reviewer: <>

-- MODIFIED BY: <>
-- MODIFIED DATE: <>
-- Code Reviewer: <>
-- Note: <>
-- =============================================

		CREATE PROC [dbo].[RelatedPersonalValues_Insert]
								@PersonalValueA int
								,@PersonalValueB int

		AS

/*------------ TEST CODE ------------

		DECLARE @PersonalValueA int = 3
				,@PersonalValueB int = 6
				
		EXECUTE [dbo].[RelatedPersonalValues_Insert]
								@PersonalValueA 
								,@PersonalValueB 

*/

		BEGIN

				INSERT INTO [dbo].[RelatedPersonalValues]
						   ([PersonalValueA]
						   ,[PersonalValueB])
					 VALUES
						   (@PersonalValueA
						   ,@PersonalValueB)


		END
GO
