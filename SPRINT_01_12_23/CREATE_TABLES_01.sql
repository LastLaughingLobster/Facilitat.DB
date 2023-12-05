-- SQL Server --
USE Facilitat;
GO

BEGIN TRANSACTION;

BEGIN TRY

	CREATE TABLE Templates (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		Name VARCHAR(255),
		Description Varchar(255)
	);

	CREATE TABLE Questions (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		TemplateId INT,
		QuestionText Varchar(255),
		FOREIGN KEY (TemplateId) REFERENCES Templates(Id)
	);
	
	CREATE TABLE ServiceOrders (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		ServiceOrderCode VARCHAR(255),
		DateCreated DATE,
		Status VARCHAR(255)
	);

	CREATE TABLE Users (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		FirstName Varchar(255),
		LastName Varchar(255),
		PassWord Varchar(255),
		Email Varchar(255),
		Document Varchar(255)
	)

	CREATE TABLE Answers (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		QuestionId INT,
		ServiceOrderId INT,
		UserId INT,
		AnswerText Varchar(255),
		FOREIGN KEY (QuestionId) REFERENCES Questions(Id),
		FOREIGN KEY (ServiceOrderId) REFERENCES ServiceOrders(Id),
		FOREIGN KEY (UserId) REFERENCES Users(Id)
	);

	CREATE TABLE Appointments (
		Id INT IDENTITY(1,1) PRIMARY KEY,
		Title VARCHAR(255),
		DateStart DATE,
		DateEnd DATE,
		UserId INT,
		FOREIGN KEY (UserId) REFERENCES Users(Id)
	);

    CREATE TABLE Roles (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        RoleName Varchar(255)
    );
    
    CREATE TABLE UserRoles (
        UserId INT,
        RoleId INT,
        PRIMARY KEY (UserId, RoleId),
        FOREIGN KEY (UserId) REFERENCES Users(Id),
        FOREIGN KEY (RoleId) REFERENCES Roles(Id)
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
