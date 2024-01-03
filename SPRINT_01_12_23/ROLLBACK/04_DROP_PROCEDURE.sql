IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'AddDefaultRoleToUser')
BEGIN
    DROP PROCEDURE AddDefaultRoleToUser
END