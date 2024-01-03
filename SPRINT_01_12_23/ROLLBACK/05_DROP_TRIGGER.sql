IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_AfterInsertUser')
BEGIN
    DROP TRIGGER trg_AfterInsertUser
END