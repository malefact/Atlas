/*Create tables*/

USE Atlas
GO

/*Schemas for live tables and their system-versioned history tables*/

CREATE SCHEMA [live]
GO

CREATE SCHEMA [hist]
GO


/*------------------------------------------------------------------Country table*/

/*Drawn from ISO-3166-1*/

/*Table*/

USE [Atlas]
GO

CREATE TABLE [live].[ISOCountry]
	(
		[id] int NOT NULL,
		[name] nvarchar(255) NOT NULL,
		[alpha-2] nvarchar(2) NOT NULL,
		[alpha-3] nvarchar(3) NOT NULL,
		[independent_yn] bit NOT NULL,
		[actv_yn] bit NOT NULL,
		[effe_stt_date] datetime2(2) GENERATED ALWAYS AS ROW START,
		[end_date] datetime2(2) GENERATED ALWAYS AS ROW END,
		PERIOD FOR SYSTEM_TIME ([effe_stt_date], [end_date]),

		CONSTRAINT [PK_live_Country_id]
			PRIMARY KEY CLUSTERED ([id])
			WITH
				(
					PAD_INDEX = OFF,
					IGNORE_DUP_KEY = OFF,
					STATISTICS_NORECOMPUTE = OFF,
					ALLOW_ROW_LOCKS = ON,
					ALLOW_PAGE_LOCKS = ON
				)
			ON
				[PRIMARY],

		CONSTRAINT [AK_live_Country_name] 
			UNIQUE([name]),

		CONSTRAINT [AK_live_Country_alpha-2] 
			UNIQUE([alpha-2]),

		CONSTRAINT [AK_live_Country_alpha-3] 
			UNIQUE([alpha-3])
	)
ON
	[PRIMARY]
WITH
	(SYSTEM_VERSIONING = ON (HISTORY_TABLE = [hist].[ISOCountry]))
GO

/*View*/

CREATE VIEW
	[Atlas].[live].[vISOCountry]
AS
SELECT
	c.[id],
	c.[name],
	c.[alpha-2],
	c.[alpha-3],
	c.[independent_yn],
	c.[actv_yn],
	c.[effe_stt_date],
	c.[end_date]
FROM
	[Atlas].[live].[ISOCountry] c
GO


/*------------------------------------------------------------------Group Type table*/

USE [Atlas]
GO

/*Table*/

CREATE TABLE
	[live].[GroupType]
	(
		[node] hierarchyid,
		[level] AS node.GetLevel(),
		[text_node] AS node.ToString(),
		[id] int IDENTITY(1, 1) UNIQUE NOT NULL,
		/*A Group g1 of a given Group Type t1 must have either no parent Group or a parent Group g2 whose 
		Group Type t2 is a parent or ancestor of t2*/
		[name] nvarchar(255) NOT NULL,
		[actv_yn] bit NOT NULL,
		/*Only active group types should be available for instantiating new groups*/
		[effe_stt_date] datetime2(2) GENERATED ALWAYS AS ROW START,
		[end_date] datetime2(2) GENERATED ALWAYS AS ROW END,
		PERIOD FOR SYSTEM_TIME ([effe_stt_date], [end_date]),

		CONSTRAINT PK_live_GroupType_node PRIMARY KEY CLUSTERED ([node])
		WITH
			(
				PAD_INDEX = OFF,
				IGNORE_DUP_KEY = OFF,
				STATISTICS_NORECOMPUTE = OFF,
				ALLOW_ROW_LOCKS = ON,
				ALLOW_PAGE_LOCKS = ON
			)
			ON
				[PRIMARY],

		CONSTRAINT AK_live_GroupType_name UNIQUE([name])

	)
ON
	[PRIMARY]
WITH
	(SYSTEM_VERSIONING = ON (HISTORY_TABLE = [hist].[GroupType]))
GO

/*View*/

CREATE VIEW
	[live].[vGroupType]
AS
SELECT
	t.[node],
	t.[level],
	t.[text_node],
	t.[id],
	t.[name],
	t.[actv_yn],
	t.[effe_stt_date],
	t.[end_date]
FROM
	[Atlas].[live].[GroupType] t
GO

/*Index for performance*/

CREATE UNIQUE INDEX IX_GroupType
	ON [live].[GroupType]([level], [node]);  
GO

/*Stored procedure to insert nodes after the root node has been inserted*/

CREATE PROCEDURE
	[live].[GroupType_Insert]
	(
		@id int,				/*Surrogate id of the new node's parent*/
		@name nvarchar(255),
		@actv_yn bit
	)   
AS   
BEGIN
	DECLARE @parent hierarchyid;
	DECLARE @lc hierarchyid;
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION;

		SELECT
			@parent = t.[node]
		FROM
			[Atlas].[live].[GroupType] t
		WHERE
			t.[id] = @id;

		SELECT
			@lc = MAX([node])   
		FROM
			[Atlas].[live].[GroupType]   
		WHERE
			[node].GetAncestor(1) = @parent;

		INSERT INTO
			[Atlas].[live].[GroupType]
			(
				[node],
				[name],
				[actv_yn]
			)  
		VALUES
			(
				@parent.GetDescendant(@lc, NULL),
				@name,
				@actv_yn);
   COMMIT  
END
GO


/*------------------------------------------------------------------Group table*/

USE [Atlas]
GO

/*Table*/

CREATE TABLE
	[live].[Group]
	(
		[node] hierarchyid,
		[level] AS node.GetLevel(),
		[text_node] AS node.ToString(),
		[id] int IDENTITY(1, 1) NOT NULL,
		[global_id] uniqueidentifier NOT NULL DEFAULT NEWID(),
		[name] nvarchar(255) NOT NULL,
		[group_type_id] int NOT NULL,
		/*Null if no parent*/
		[actv_yn] bit NOT NULL,
		/*Only active groups should be available for assigning new members and org structure placement*/
		[effe_stt_date] datetime2(2) GENERATED ALWAYS AS ROW START,
		[end_date] datetime2(2) GENERATED ALWAYS AS ROW END,
		PERIOD FOR SYSTEM_TIME ([effe_stt_date], [end_date]),

		CONSTRAINT PK_live_Group_node PRIMARY KEY CLUSTERED ([node])
		WITH
			(
				PAD_INDEX = OFF,
				IGNORE_DUP_KEY = OFF,
				STATISTICS_NORECOMPUTE = OFF,
				ALLOW_ROW_LOCKS = ON,
				ALLOW_PAGE_LOCKS = ON
			)
			ON
				[PRIMARY],

		CONSTRAINT AK_live_Group_name UNIQUE([name]),

		CONSTRAINT FK_live_Group_group_type_id
			FOREIGN KEY ([group_type_id])
			REFERENCES [live].[GroupType] ([id])
			ON DELETE CASCADE
			ON UPDATE CASCADE

	)
ON
	[PRIMARY]
WITH
	(SYSTEM_VERSIONING = ON (HISTORY_TABLE = [hist].[Group]))
GO

/*View*/

CREATE VIEW
	[live].[vGroup]
AS
SELECT
	g.[node],
	g.[level],
	g.[text_node],
	g.[id],
	g.[global_id],
	g.[name],
	g.[group_type_id],
	g.[actv_yn],
	g.[effe_stt_date],
	g.[end_date]
FROM
	[Atlas].[live].[Group] g
GO

/*Index for performance*/

CREATE UNIQUE INDEX IX_Group
	ON [live].[Group]([level], [node]);  
GO

/*Stored procedure to insert nodes after the root node has been inserted*/

CREATE PROCEDURE
	[live].[Group_Insert]
	(
		@id int,				/*Surrogate id of the new node's parent*/
		@name nvarchar(255),
		@group_type_id int,
		@actv_yn bit
	)   
AS   
BEGIN
	DECLARE @parent hierarchyid;
	DECLARE @lc hierarchyid;
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION;

		SELECT
			@parent = g.[node]
		FROM
			[Atlas].[live].[Group] g
		WHERE
			g.[id] = @id;

		SELECT
			@lc = MAX([node])   
		FROM
			[Atlas].[live].[Group]   
		WHERE
			[node].GetAncestor(1) = @parent;

		INSERT INTO
			[Atlas].[live].[Group]
			(
				[node],
				[name],
				[group_type_id],
				[actv_yn]
			)  
		VALUES
			(
				@parent.GetDescendant(@lc, NULL),
				@name,
				@group_type_id,
				@actv_yn);
   COMMIT  
END
GO

/*Function to ensure a Group's Group Type level is strictly greater than that of its parent*/

CREATE FUNCTION
	[live].[Group_Check]
	(
		@node hierarchyid,
		@id int,
		@global_id uniqueidentifier,
		@name nvarchar(255),
		@group_type_id int,
		@actv_yn bit,
		@effe_stt_date datetime2(2),
		@end_date datetime2(2)
	)
RETURNS
	int
AS
BEGIN
	DECLARE @proposed_level int;
	DECLARE @proposed_parent_level int;

	SELECT
		@proposed_level = t.[level]
	FROM
		[live].[GroupType] t
	WHERE
		t.[id] = @group_type_id;
		
	SELECT
		@proposed_parent_level = t.[level]
	FROM
		[live].[Group] g
	INNER JOIN
		[live].[GroupType] t
	ON
		g.[group_type_id] = t.[id]
	WHERE
		g.[node] = @node.GetAncestor(1);

	RETURN (CASE WHEN (@proposed_level > COALESCE(@proposed_parent_level, -1)) THEN 1 ELSE 0 END)

END
GO

/*Apply function as check constraint*/

ALTER TABLE
	[Atlas].[live].[Group]
ADD CONSTRAINT
	CHK_live_Group_Group_Check
CHECK
	([live].[Group_Check]
		(
			[node],
			[id],
			[global_id],
			[name],
			[group_type_id],
			[actv_yn],
			[effe_stt_date],
			[end_date])
		= 1)
GO