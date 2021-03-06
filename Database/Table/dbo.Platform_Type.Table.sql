USE [s16guest34]
GO
/****** Object:  Table [dbo].[Platform_Type]    Script Date: 5/5/2016 1:35:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Platform_Type](
	[platform_type_id] [int] IDENTITY(1,1) NOT NULL,
	[platform_type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Platform_Type] PRIMARY KEY CLUSTERED 
(
	[platform_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
