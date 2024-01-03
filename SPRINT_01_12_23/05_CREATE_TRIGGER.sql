-- SQL Server --

CREATE TRIGGER trg_AfterInsertUser ON Users
AFTER INSERT
AS
    
    DECLARE @UserId INT;

    SELECT @UserId = Id FROM inserted;

    EXEC AddDefaultRoleToUser @UserId;
GO