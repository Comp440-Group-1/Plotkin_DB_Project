USE [s16guest34]
GO
/****** Object:  Table [dbo].[Release_Type]    Script Date: 5/5/2016 1:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Release_Type](
	[release_type_id] [int] IDENTITY(1,1) NOT NULL,
	[release_type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Release_Type] PRIMARY KEY CLUSTERED 
(
	[release_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
