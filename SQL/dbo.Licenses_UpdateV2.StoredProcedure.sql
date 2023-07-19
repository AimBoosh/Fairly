USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Licenses_UpdateV2]    Script Date: 6/30/2023 6:32:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Ronell Agustin
-- Create date: 06/09/2023
-- Description: Update Licenses records VERSION 2 UPGRADED TABLE
-- Code Reviewer: [PULLED FROM Licenses_SelectAll]

-- Notes:
-- [06/09/2023] -> Initial Create

-- MODIFIED BY: <Porfirio Alvarez>
-- MODIFIED DATE: <6/30/2023>
-- Code Reviewer: <>
-- Note: <changed @DateVerified from = NULL to just date>
-- =============================================

CREATE proc [dbo].[Licenses_UpdateV2]
			@LicenseStateId int
			,@LicenseNumber nvarchar(50)
			,@CreatedBy int
			,@DateVerified date
			,@IsActive bit
			,@LicenseName nvarchar(50)
			,@ExpirationDate date
			,@FileId int
			,@Id int


as

/*
Select *
From dbo.Licenses


Declare		@LicenseStateId int = 3
			,@LicenseNumber nvarchar(50) = 'V2testUpdate for Peer Review'
			,@CreatedBy int = 3
			,@DateVerified date
			,@IsActive bit = 1
			,@LicenseName nvarchar(50) = '111'
			,@ExpirationDate date = '01-01-2023'
			,@FileId int = 1
			,@Id int = 10


Execute [dbo].[Licenses_UpdateV2]
			@LicenseStateId
			,@LicenseNumber
			,@CreatedBy
			,@DateVerified
			,@IsActive
			,@LicenseName
			,@ExpirationDate
			,@FileId
			,@Id

Select *
From dbo.Licenses

*/

BEGIN


UPDATE [dbo].[Licenses]
SET			[LicenseStateId] = @LicenseStateId
			,[LicenseNumber] = @LicenseNumber
			,[CreatedBy] = @CreatedBy
			,[DateVerified] = COALESCE(@DateVerified, NULL)
			,[IsActive] = @IsActive
			,[LicenseName] = @LicenseName
			,[ExpirationDate] = @ExpirationDate
			,[FileId] = @FileId


WHERE		[Id] = @Id


END
GO
