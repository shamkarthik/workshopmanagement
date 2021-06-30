
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/31/2021 17:06:08
-- Generated from EDMX file: C:\Users\55576\workspace\wms\WorkshopManagement_Team5\Workshop_Application\Workshop_Application\Models\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-Workshop_Application-20210531123947];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Material__Worksh__160F4887]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Material] DROP CONSTRAINT [FK__Material__Worksh__160F4887];
GO
IF OBJECT_ID(N'[dbo].[FK__Participa__Parti__2CF2ADDF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ParticipantWorkshop] DROP CONSTRAINT [FK__Participa__Parti__2CF2ADDF];
GO
IF OBJECT_ID(N'[dbo].[FK__Participa__Works__2DE6D218]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ParticipantWorkshop] DROP CONSTRAINT [FK__Participa__Works__2DE6D218];
GO
IF OBJECT_ID(N'[dbo].[FK__TrainerWo__Train__29221CFB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainerWorkshop] DROP CONSTRAINT [FK__TrainerWo__Train__29221CFB];
GO
IF OBJECT_ID(N'[dbo].[FK__TrainerWo__Works__2A164134]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainerWorkshop] DROP CONSTRAINT [FK__TrainerWo__Works__2A164134];
GO
IF OBJECT_ID(N'[dbo].[FK__Workshop__Catego__6E01572D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Workshop] DROP CONSTRAINT [FK__Workshop__Catego__6E01572D];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK__Participa__Parti__2CF2ADDF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ParticipantWorkshops] DROP CONSTRAINT [FK__Participa__Parti__2CF2ADDF];
GO
IF OBJECT_ID(N'[dbo].[FK__TrainerWo__Train__29221CFB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainerWorkshops] DROP CONSTRAINT [FK__TrainerWo__Train__29221CFB];
GO
IF OBJECT_ID(N'[dbo].[FK__Workshop__Catego__6E01572D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Workshops] DROP CONSTRAINT [FK__Workshop__Catego__6E01572D];
GO
IF OBJECT_ID(N'[dbo].[FK__Material__Worksh__160F4887]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Materials] DROP CONSTRAINT [FK__Material__Worksh__160F4887];
GO
IF OBJECT_ID(N'[dbo].[FK__Participa__Works__2DE6D218]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ParticipantWorkshops] DROP CONSTRAINT [FK__Participa__Works__2DE6D218];
GO
IF OBJECT_ID(N'[dbo].[FK__TrainerWo__Works__2A164134]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrainerWorkshops] DROP CONSTRAINT [FK__TrainerWo__Works__2A164134];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Materials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Materials];
GO
IF OBJECT_ID(N'[dbo].[ParticipantWorkshop]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ParticipantWorkshop];
GO
IF OBJECT_ID(N'[dbo].[TrainerWorkshop]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainerWorkshop];
GO
IF OBJECT_ID(N'[dbo].[Workshop]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Workshop];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] int  NOT NULL,
    [RoleId] int  NOT NULL,
    [ApplicationId] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NULL,
    [LastName] nvarchar(256)  NULL,
    [Gender] nvarchar(256)  NULL,
    [IsActive] tinyint  NULL,
    [Skillset] nvarchar(256)  NULL,
    [Experience] nvarchar(256)  NULL,
    [DOB] datetime  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int  NOT NULL,
    [CategoryName] varchar(50)  NULL
);
GO

-- Creating table 'Materials'
CREATE TABLE [dbo].[Materials] (
    [MaterialId] int  NOT NULL,
    [MaterialDesc] varchar(50)  NULL,
    [MaterialPath] varchar(50)  NULL,
    [WorkshopId] int  NULL
);
GO

-- Creating table 'ParticipantWorkshops'
CREATE TABLE [dbo].[ParticipantWorkshops] (
    [ParticipantWorkshopId] int  NOT NULL,
    [ParticipantId] int  NULL,
    [WorkshopId] int  NULL,
    [ParticipantAttended] tinyint  NULL
);
GO

-- Creating table 'TrainerWorkshops'
CREATE TABLE [dbo].[TrainerWorkshops] (
    [TrainerWorkshopID] int  NOT NULL,
    [TraineId] int  NULL,
    [WorkshopId] int  NULL
);
GO

-- Creating table 'Workshops'
CREATE TABLE [dbo].[Workshops] (
    [WorkshopId] int  NOT NULL,
    [WorkshopTitle] varchar(50)  NULL,
    [WorkshopDate] datetime  NULL,
    [WorkshopTime] varchar(50)  NULL,
    [WorkshopDuration] float  NULL,
    [WorkshopSeats] int  NULL,
    [CategoryId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [MaterialId] in table 'Materials'
ALTER TABLE [dbo].[Materials]
ADD CONSTRAINT [PK_Materials]
    PRIMARY KEY CLUSTERED ([MaterialId] ASC);
GO

-- Creating primary key on [ParticipantWorkshopId] in table 'ParticipantWorkshops'
ALTER TABLE [dbo].[ParticipantWorkshops]
ADD CONSTRAINT [PK_ParticipantWorkshops]
    PRIMARY KEY CLUSTERED ([ParticipantWorkshopId] ASC);
GO

-- Creating primary key on [TrainerWorkshopID] in table 'TrainerWorkshops'
ALTER TABLE [dbo].[TrainerWorkshops]
ADD CONSTRAINT [PK_TrainerWorkshops]
    PRIMARY KEY CLUSTERED ([TrainerWorkshopID] ASC);
GO

-- Creating primary key on [WorkshopId] in table 'Workshops'
ALTER TABLE [dbo].[Workshops]
ADD CONSTRAINT [PK_Workshops]
    PRIMARY KEY CLUSTERED ([WorkshopId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId'
CREATE INDEX [IX_FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]
ON [dbo].[AspNetUserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ParticipantId] in table 'ParticipantWorkshops'
ALTER TABLE [dbo].[ParticipantWorkshops]
ADD CONSTRAINT [FK__Participa__Parti__2CF2ADDF]
    FOREIGN KEY ([ParticipantId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Participa__Parti__2CF2ADDF'
CREATE INDEX [IX_FK__Participa__Parti__2CF2ADDF]
ON [dbo].[ParticipantWorkshops]
    ([ParticipantId]);
GO

-- Creating foreign key on [TraineId] in table 'TrainerWorkshops'
ALTER TABLE [dbo].[TrainerWorkshops]
ADD CONSTRAINT [FK__TrainerWo__Train__29221CFB]
    FOREIGN KEY ([TraineId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__TrainerWo__Train__29221CFB'
CREATE INDEX [IX_FK__TrainerWo__Train__29221CFB]
ON [dbo].[TrainerWorkshops]
    ([TraineId]);
GO

-- Creating foreign key on [CategoryId] in table 'Workshops'
ALTER TABLE [dbo].[Workshops]
ADD CONSTRAINT [FK__Workshop__Catego__6E01572D]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Workshop__Catego__6E01572D'
CREATE INDEX [IX_FK__Workshop__Catego__6E01572D]
ON [dbo].[Workshops]
    ([CategoryId]);
GO

-- Creating foreign key on [WorkshopId] in table 'Materials'
ALTER TABLE [dbo].[Materials]
ADD CONSTRAINT [FK__Material__Worksh__160F4887]
    FOREIGN KEY ([WorkshopId])
    REFERENCES [dbo].[Workshops]
        ([WorkshopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Material__Worksh__160F4887'
CREATE INDEX [IX_FK__Material__Worksh__160F4887]
ON [dbo].[Materials]
    ([WorkshopId]);
GO

-- Creating foreign key on [WorkshopId] in table 'ParticipantWorkshops'
ALTER TABLE [dbo].[ParticipantWorkshops]
ADD CONSTRAINT [FK__Participa__Works__2DE6D218]
    FOREIGN KEY ([WorkshopId])
    REFERENCES [dbo].[Workshops]
        ([WorkshopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Participa__Works__2DE6D218'
CREATE INDEX [IX_FK__Participa__Works__2DE6D218]
ON [dbo].[ParticipantWorkshops]
    ([WorkshopId]);
GO

-- Creating foreign key on [WorkshopId] in table 'TrainerWorkshops'
ALTER TABLE [dbo].[TrainerWorkshops]
ADD CONSTRAINT [FK__TrainerWo__Works__2A164134]
    FOREIGN KEY ([WorkshopId])
    REFERENCES [dbo].[Workshops]
        ([WorkshopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__TrainerWo__Works__2A164134'
CREATE INDEX [IX_FK__TrainerWo__Works__2A164134]
ON [dbo].[TrainerWorkshops]
    ([WorkshopId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------