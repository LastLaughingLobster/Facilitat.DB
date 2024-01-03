-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY
 
    DELETE FROM Roles WHERE RoleName = 'Client';
    DELETE FROM Roles WHERE RoleName = 'Employee';

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
