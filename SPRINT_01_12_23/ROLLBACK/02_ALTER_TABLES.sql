USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY

    ALTER TABLE Apartment
    DROP CONSTRAINT FK_Apartment_Tower;

    ALTER TABLE Apartment
    DROP CONSTRAINT FK_Apartment_Users;

    ALTER TABLE ScheduleOrder
    DROP CONSTRAINT FK_ScheduleOrder_Apartment;

    ALTER TABLE ScheduleOrder
    DROP CONSTRAINT FK_ScheduleOrder_Users;

    ALTER TABLE UserRoles
    DROP CONSTRAINT FK_UserRoles_Users;

    ALTER TABLE UserRoles
    DROP CONSTRAINT FK_UserRoles_Roles;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
