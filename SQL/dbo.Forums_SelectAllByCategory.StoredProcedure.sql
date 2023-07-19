﻿USE [Fairly]
GO
/****** Object:  StoredProcedure [dbo].[Forums_SelectAllByCategory]    Script Date: 6/23/2023 6:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


   CREATE PROC [dbo].[Forums_SelectAllByCategory]
										
   AS

/*------------ TEST CODE ------------

EXECUTE [dbo].[Forums_SelectAllByCategory]
															
*/

   BEGIN

   SELECT	FC.Id,
			FC.[Name] AS ForumCategoryName,
			List = (
					SELECT F.[Name] FROM dbo.Forums AS F
					WHERE F.ForumCategoryId = FC.Id
					FOR JSON AUTO
					)
    FROM dbo.ForumCategories AS FC
    
	END
   

GO
