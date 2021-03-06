USE [s16guest34]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 5/5/2016 1:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Version](
	[version_id] [int] IDENTITY(1,1) NOT NULL,
	[commit_id] [int] NOT NULL,
	[version_num] [varchar](20) NOT NULL,
	[platform_type_id] [int] NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Commit] FOREIGN KEY([commit_id])
REFERENCES [dbo].[Commit] ([commit_id])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Commit]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Platform] FOREIGN KEY([platform_type_id])
REFERENCES [dbo].[Platform_Type] ([platform_type_id])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Platform]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Human-readable, separate from ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Version', @level2type=N'COLUMN',@level2name=N'version_num'
GO
