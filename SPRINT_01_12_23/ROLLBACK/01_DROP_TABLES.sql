-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY
    -- Drop tables in the reverse order of creation due to dependencies
    IF OBJECT_ID('dbo.ScheduleOrder', 'U') IS NOT NULL
        DROP TABLE ScheduleOrder;

    IF OBJECT_ID('dbo.Apartment', 'U') IS NOT NULL
        DROP TABLE Apartment;

    IF OBJECT_ID('dbo.Tower', 'U') IS NOT NULL
        DROP TABLE Tower;

    IF OBJECT_ID('dbo.UserRoles', 'U') IS NOT NULL
        DROP TABLE UserRoles;

    IF OBJECT_ID('dbo.Roles', 'U') IS NOT NULL
        DROP TABLE Roles;

    IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
        DROP TABLE Users;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- If there is an error, roll back the transaction
    ROLLBACK TRANSACTION;
    
    -- Log the error details if necessary
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
