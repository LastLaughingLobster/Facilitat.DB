CREATE PROCEDURE AddDefaultRoleToUser
		@UserId INT
AS
    DECLARE @ClientRoleId INT = (SELECT Id FROM Roles WHERE RoleName = 'Client');
    
    INSERT INTO UserRoles (UserId, RoleId)
    VALUES (@UserId, @ClientRoleId);
GO