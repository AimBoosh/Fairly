USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[PersonalValueRankings_Select_ByUserIdV3]    Script Date: 7/10/2023 10:19:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Yongqiang Wang>
-- Create date: <04/27/2023>
-- Description: <SelectV3 proc by UserId for PersonalValueRankings>
-- Code Reviewer: 

-- MODIFIED BY: Porfirio Alvarez	
-- MODIFIED DATE: 7/10/2023
-- Code Reviewer:
-- Note: Changed Order By from pvr.[Sort] to pvr.[Rank]
-- =============================================

CREATE proc [dbo].[PersonalValueRankings_Select_ByUserIdV3]
					@userId int
as
/*	------------------ TEST CODE -------------------
	DECLARE @userId int = 208
	EXECUTE dbo.PersonalValueRankings_Select_ByUserIdV3
					@userId
*/
BEGIN

	SELECT	pv.[Id]
			,pv.[Name]
			,pvr.[Rank]
			,pvr.[DateCreated]
			,pvr.[DateModified]
			,pvr.[Sort]
	From dbo.Users as u inner join dbo.PersonalValueRankings as pvr
		on u.Id = pvr.UserId
		inner join dbo.PersonalValues as pv
		on pv.Id = pvr.PersonalValueId
	WHERE u.Id = @userId  
	Order By pvr.[Rank]   

END


GO
