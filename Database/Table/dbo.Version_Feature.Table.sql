USE [s16guest34]
GO
/****** Object:  Table [dbo].[Version_Feature]    Script Date: 5/5/2016 1:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version_Feature](
	[version_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
	[is_deprecated] [bit] NOT NULL,
 CONSTRAINT [PK_Version_Feature] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Version_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Version_Feature_Feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[Feature] ([feature_id])
GO
ALTER TABLE [dbo].[Version_Feature] CHECK CONSTRAINT [FK_Version_Feature_Feature]
GO
ALTER TABLE [dbo].[Version_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Version_Feature_Version] FOREIGN KEY([version_id])
REFERENCES [dbo].[Version] ([version_id])
GO
ALTER TABLE [dbo].[Version_Feature] CHECK CONSTRAINT [FK_Version_Feature_Version]
GO
