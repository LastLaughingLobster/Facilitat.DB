-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY
    -- Dropping tables in the reverse order of creation due to dependencies
    IF OBJECT_ID('dbo.UserRoles', 'U') IS NOT NULL
        DROP TABLE UserRoles;

    IF OBJECT_ID('dbo.Roles', 'U') IS NOT NULL
        DROP TABLE Roles;
    
    IF OBJECT_ID('dbo.Appointments', 'U') IS NOT NULL
        DROP TABLE Appointments;

    IF OBJECT_ID('dbo.Answers', 'U') IS NOT NULL
        DROP TABLE Answers;

    IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
        DROP TABLE Users;

    IF OBJECT_ID('dbo.ServiceOrders', 'U') IS NOT NULL
        DROP TABLE ServiceOrders;

    IF OBJECT_ID('dbo.Questions', 'U') IS NOT NULL
        DROP TABLE Questions;

    IF OBJECT_ID('dbo.Templates', 'U') IS NOT NULL
        DROP TABLE Templates;

    -- If the statements are successful, commit the transaction
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
