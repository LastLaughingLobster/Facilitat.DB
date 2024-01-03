-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY

    INSERT INTO Roles (RoleName) VALUES ('Client');
    INSERT INTO Roles (RoleName) VALUES ('Employee');

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
