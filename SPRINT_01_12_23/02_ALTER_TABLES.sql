-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY

	ALTER TABLE Apartment
    ADD CONSTRAINT FK_Apartment_Tower
    FOREIGN KEY (TowerId) REFERENCES Tower(Id);

    ALTER TABLE Apartment
    ADD CONSTRAINT FK_Apartment_Users
    FOREIGN KEY (UserId) REFERENCES Users(Id);

    ALTER TABLE ScheduleOrder
    ADD CONSTRAINT FK_ScheduleOrder_Apartment
    FOREIGN KEY (ApartmentID) REFERENCES Apartment(Id);

    ALTER TABLE ScheduleOrder
    ADD CONSTRAINT FK_ScheduleOrder_Users
    FOREIGN KEY (UserID) REFERENCES Users(Id);

    ALTER TABLE UserRoles
    ADD CONSTRAINT FK_UserRoles_Users
    FOREIGN KEY (UserId) REFERENCES Users(Id);

    ALTER TABLE UserRoles
    ADD CONSTRAINT FK_UserRoles_Roles
    FOREIGN KEY (RoleId) REFERENCES Roles(Id);


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

