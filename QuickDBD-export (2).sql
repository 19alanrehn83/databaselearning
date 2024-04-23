-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Genre] (
    [Genre_id] INT  NOT NULL ,
    [genre_name] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED (
        [Genre_id] ASC
    )
)

CREATE TABLE [Movies] (
    [Movie_ID] INT  NOT NULL ,
    [Title] varchar(1000)  NOT NULL ,
    [Budget] BIGINT  NOT NULL ,
    [Homepage] varchar(1000)  NOT NULL ,
    [Overview] varchar(1000)  NOT NULL ,
    [Popularity] DECIMAL(12,6)  NOT NULL ,
    [Release_date] VARCHAR(30)  NOT NULL ,
    [Revenue] BIGINT  NOT NULL ,
    [Runtime] INT  NOT NULL ,
    [Movie_status] varchar(50)  NOT NULL ,
    [Tagline] varchar(1000)  NOT NULL ,
    [Vote_average] DECIMAL(4,2)  NOT NULL ,
    [Vote_count] INT  NOT NULL ,
    [Genre_ID] INT  NOT NULL ,
    CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED (
        [Movie_ID] ASC
    )
)

CREATE TABLE [Plex_Server] (
    [PlexID] INT  NOT NULL ,
    [Movie_ID] INT  NOT NULL ,
    [Title] varchar(1000)  NOT NULL ,
    [Genre_id] INT  NOT NULL ,
    [genre_name] varchar(100)  NOT NULL ,
    [On_Plex] Boolean  NOT NULL ,
    CONSTRAINT [PK_Plex_Server] PRIMARY KEY CLUSTERED (
        [PlexID] ASC
    )
)

ALTER TABLE [Genre] WITH CHECK ADD CONSTRAINT [FK_Genre_Genre_id] FOREIGN KEY([Genre_id])
REFERENCES [Movies] ([Genre_ID])

ALTER TABLE [Genre] CHECK CONSTRAINT [FK_Genre_Genre_id]

ALTER TABLE [Genre] WITH CHECK ADD CONSTRAINT [FK_Genre_genre_name] FOREIGN KEY([genre_name])
REFERENCES [Plex_Server] ([genre_name])

ALTER TABLE [Genre] CHECK CONSTRAINT [FK_Genre_genre_name]

ALTER TABLE [Movies] WITH CHECK ADD CONSTRAINT [FK_Movies_Movie_ID_Title_Genre_ID] FOREIGN KEY([Movie_ID], [Title], [Genre_ID])
REFERENCES [Plex_Server] ([Movie_ID], [Title], [Genre_id])

ALTER TABLE [Movies] CHECK CONSTRAINT [FK_Movies_Movie_ID_Title_Genre_ID]

COMMIT TRANSACTION QUICKDBD