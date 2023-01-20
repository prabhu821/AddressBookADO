create Procedure spGetPerson
As begin
try
select * from BookAddress
End try
Begin Catch
SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec spGetPerson

Create Procedure spUpdatePerson(@ID bigint,@Address varchar(max),@Phonenumber bigint)
As begin
try
Update BookAddress set Phonenumber=@Phonenumber,Address=@Address where ID=@ID
End try
Begin Catch
SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec spUpdatePerson

Create Procedure spGetPersonDate(@Type varchar(max))
As begin
try
select * from BookAddress where Type=Type
End try
Begin Catch
SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec spGetPersonDate

Create Procedure spGetPersonCity(@City varchar(max))
As begin
try
select * from BookAddress where City=@City
End try
Begin Catch
SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec spGetPersonCity

create Procedure spAddPerson(@ID Bigint,@FirstName varchar(max),@LastName varchar(max),@Address varchar(max),@PhoneNumber bigint,@EmailAddress varchar(max),@City varchar(max),@State varchar(max),@Zipcode bigint,@DateAdded varchar(max))
As begin
try
insert into Address_Book values(@FirstName,@LastName,@Address,@PhoneNumber,@EmailAddress,@City,@State,@Zipcode,@DateAdded)
End try
Begin Catch
SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage
END CATCH

Exec spGetPersonCity
