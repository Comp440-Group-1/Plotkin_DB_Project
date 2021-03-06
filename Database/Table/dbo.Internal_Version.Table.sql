USE [s16guest34]
GO
/****** Object:  Table [dbo].[Internal_Version]    Script Date: 5/5/2016 1:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Internal_Version](
	[commit_id] [int] NOT NULL,
	[version_num] [varchar](20) NOT NULL,
	[release_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Internal_Release] PRIMARY KEY CLUSTERED 
(
	[commit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Internal_Version]  WITH CHECK ADD  CONSTRAINT [FK_Internal_Release_Commit] FOREIGN KEY([commit_id])
REFERENCES [dbo].[Commit] ([commit_id])
GO
ALTER TABLE [dbo].[Internal_Version] CHECK CONSTRAINT [FK_Internal_Release_Commit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds internal (non-customer) software release data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Internal_Version'
GO
