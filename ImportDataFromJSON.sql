DECLARE @UserDetails VARCHAR(MAX)

-- You must set absolute path to your data.json file on your workstation!!!
SELECT @UserDetails = BulkColumn FROM OPENROWSET(BULK'C:\MyProjects\SocialNetwork\data.json', SINGLE_BLOB) JSON;

-- Insert into Users
SET IDENTITY_INSERT [dbo].[Users] ON

INSERT INTO dbo.[Users] (UserID, FirstName, LastName, Age, Gender)
SELECT id as UserID, firstName as FirstName, surname as LastName, age as Age, gender as Gender
    FROM
    OpenJson(@UserDetails)
    WITH (
		id int,
		firstName nvarchar(50),
		surname nvarchar(50),
		age int,
		gender nvarchar(50));

SET IDENTITY_INSERT [dbo].[Users] OFF

-- Insert into UsersFriends
INSERT INTO dbo.[UsersFriends] (UserID, FriendID)
SELECT id as UserID, FriendID
FROM
OpenJson(@UserDetails)
WITH (
	id int,
	friends NVARCHAR(MAX) AS JSON) AS a
	CROSS APPLY OPENJSON (a.friends) WITH (FriendID INT '$') AS b