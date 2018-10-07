--Get Direct Friends
IF EXISTS ( SELECT * FROM  sys.objects WHERE object_id = OBJECT_ID(N'uspGetDirectFriends') AND type IN ( N'P', N'PC' ) )
begin
	drop procedure dbo.uspGetDirectFriends;
end

go

create procedure uspGetDirectFriends
(
	@UserId int
)

as
begin
	set nocount on;
	
	select u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.UsersFriends uf
		inner join dbo.Users u on uf.[FriendID] = u.[UserID]
	where uf.[UserID] = @UserId;
end

go

--Get Friends of friends
IF EXISTS ( SELECT * FROM  sys.objects WHERE object_id = OBJECT_ID(N'uspGetFriendsOfFriends') AND type IN ( N'P', N'PC' ) )
begin
	drop procedure dbo.uspGetFriendsOfFriends;
end

go

create procedure uspGetFriendsOfFriends
(
	@UserId int
)

as
begin
	set nocount on;

	select  u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.UsersFriends uf1
		inner join dbo.UsersFriends uf2 on uf1.[FriendID] = uf2.[UserID]
		inner join dbo.Users u on u.[UserID] = uf2.[FriendID] and u.UserID != @UserId
	where uf1.[UserID] = @UserId
	order by uf1.[FriendID];
end

go

--Get Suggested Friends
IF EXISTS ( SELECT * FROM  sys.objects WHERE object_id = OBJECT_ID(N'uspGetSuggestedFriends') AND type IN ( N'P', N'PC' ) )
begin
	drop procedure dbo.uspGetSuggestedFriends;
end

go

create procedure uspGetSuggestedFriends
(
	@UserId int
)

as
begin
	set nocount on;

	select u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.Users u
	inner join
	(
		select uf2.[FriendID]
		from dbo.UsersFriends uf1
			inner join dbo.UsersFriends uf2 on uf1.[FriendID] = uf2.[UserID]
		where uf1.[UserID] = @UserId
		group by uf2.[FriendID]
		having count(*) > 1
	) uf2 on uf2.[FriendID] = u.[UserID] and u.[UserID] != @UserId;
end