﻿CREATE FUNCTION [dbo].[CipherDetails](@UserId UNIQUEIDENTIFIER)
RETURNS TABLE
AS RETURN
SELECT
    C.[Id],
    C.[UserId],
    C.[OrganizationId],
    C.[Type],
    C.[Data],
    C.[CreationDate],
    C.[RevisionDate],
    CASE WHEN
        C.[Favorites] IS NULL
        OR JSON_VALUE(C.[Favorites], CONCAT('$."', @UserId, '"')) IS NULL
    THEN 0
    ELSE 1
    END [Favorite],
    CASE WHEN
        C.[Folders] IS NULL
    THEN NULL
    ELSE TRY_CONVERT(UNIQUEIDENTIFIER, JSON_VALUE(C.[Folders], CONCAT('$."', @UserId, '"')))
    END [FolderId]
FROM
    [dbo].[Cipher] C