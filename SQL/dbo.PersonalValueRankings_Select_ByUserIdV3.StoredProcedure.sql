	CREATE proc [dbo].[PersonalValueRankings_Select_ByUserIdV3]
							@userId INT
	AS
/*	------------------ TEST CODE -------------------
	DECLARE @userId int = 208
	EXECUTE dbo.PersonalValueRankings_Select_ByUserIdV3
							@userId
*/
	BEGIN

	SELECT	PV.[Id]
		,PV.[Name]
		,PVR.[Rank]
		,PVR.[DateCreated]
		,PVR.[DateModified]
		,PVR.[Sort]
		
	FROM dbo.Users AS U INNER JOIN dbo.PersonalValueRankings AS PVT
		ON U.Id = PVR.UserId
		INNER JOIN dbo.PersonalValues AS PV
		ON PV.Id = PVR.PersonalValueId
		
	WHERE U.Id = @userId  
	ORDER BY PVR.[Rank]   

	END



