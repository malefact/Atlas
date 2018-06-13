/*Drop all database objects*/

USE [Atlas]
GO

DROP PROCEDURE [live].[Group_Insert]
GO

ALTER TABLE [live].[Group] DROP CONSTRAINT [FK_live_Group_group_type_id]
GO

ALTER TABLE [live].[Group] SET ( SYSTEM_VERSIONING = OFF )
GO

DROP TABLE [live].[Group]
GO

DROP TABLE [hist].[Group]
GO

DROP FUNCTION [live].[CheckGroup]
GO

DROP PROCEDURE [live].[GroupType_Insert]
GO

ALTER TABLE [live].[ISOCountrySubdivision] SET ( SYSTEM_VERSIONING = OFF )
GO

DROP TABLE [live].[ISOCountrySubdivision]
GO

DROP TABLE [hist].[ISOCountrySubdivision]
GO

ALTER TABLE [live].[ISOCountrySubdivisionType] SET ( SYSTEM_VERSIONING = OFF )
GO

DROP TABLE [live].[ISOCountrySubdivisionType]
GO

DROP TABLE [hist].[ISOCountrySubdivisionType]
GO

ALTER TABLE [live].[ISOCountry] SET ( SYSTEM_VERSIONING = OFF )
GO

DROP TABLE [live].[ISOCountry]
GO

DROP TABLE [hist].[ISOCountry]
GO

DROP SCHEMA IF EXISTS [hist]
GO

DROP SCHEMA IF EXISTS [live]
GO