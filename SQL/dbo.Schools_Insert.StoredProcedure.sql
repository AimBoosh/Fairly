USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Schools_Insert]    Script Date: 7/12/2023 1:53:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --=============================================

 --Author: <Benson, Addam>
 --Create date: <2023-04-12>
 --Description: <Insert for Schools>
 --Code Reviewer: Kevin Rodriguez

 --MODIFIED BY: Porfirio Alvarez	
 --MODIFIED DATE: 7/11/2023
 --Code Reviewer: 
 --Note: Modified test code

 --=============================================

CREATE PROC [dbo].[Schools_Insert]
			@Name nvarchar(100)
			,@LocationId int
			,@LogoUrl nvarchar(100)
			,@CreatedBy int

			,@Id int OUTPUT

AS
/*
DECLARE 
			@Name nvarchar(100) = 'Other'
			,@LocationId int = 12
			,@LogoUrl nvarchar(100) = 'Nourl'
			,@CreatedBy int = 3
			,@Id int = 1

EXECUTE [dbo].[Schools_Insert]
			@Name
			,@LocationId
			,@LogoUrl 
			,@CreatedBy
			,@Id OUTPUT
			
*/

BEGIN


INSERT INTO [dbo].[Schools]
           ([Name]
           ,[LocationId]
		   ,[LogoUrl]
           ,[CreatedBy]
           ,[ModifiedBy]
		   )

	   VALUES
           (@Name
			,@LocationId
			,@LogoUrl
			,@CreatedBy
			,@CreatedBy
			)


	   SET @Id = SCOPE_IDENTITY()
END


GO
