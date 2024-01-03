-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY

    CREATE TABLE Users (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        FirstName Varchar(255),
        LastName Varchar(255),
        PassWord Varchar(255),
        Email Varchar(255),
        Document Varchar(255)
    );

    CREATE TABLE Roles (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        RoleName Varchar(255)
    );
    
    CREATE TABLE UserRoles (
        UserId INT,
        RoleId INT,
        PRIMARY KEY (UserId, RoleId)
    );

    CREATE TABLE Tower (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255) NOT NULL,
		Address VARCHAR(500) NOT NULL
	);


    CREATE TABLE Apartment (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        TowerId INT,
        Number VARCHAR(50) NOT NULL,
        UserID INT
    );

    CREATE TABLE ScheduleOrder (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        ApartmentID INT,
        UserID INT,
        Title VARCHAR(255) NOT NULL,
        ScheduledTime DATETIME NOT NULL,
        EndTime DATETIME,
        ContractorName VARCHAR(255),
        Purpose TEXT,
        RecurrenceRule TEXT,
        RecurrenceException TEXT,
        IsAllDay BIT,
        Description TEXT,
		Status TINYINT;
    );

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
