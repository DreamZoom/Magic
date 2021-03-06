USE [db_MedicalCrab]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/25/2015 21:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[RegTime] [datetime] NOT NULL,
	[SignDiscription] [nvarchar](500) NOT NULL,
	[UserImage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User] ([ID], [UserName], [Password], [Phone], [Email], [Address], [RegTime], [SignDiscription], [UserImage]) VALUES (N'67258c8e-87d3-4c3d-ab04-d079c6948fc2', N'dreamzoom', N'123456', N'18200465675', N'1036199213@qq.com', N'', CAST(0x0000A499000959AD AS DateTime), N'我有一剑，可斩漫天神佛；我有一镜，可窥人心鬼蜮。', N'/upload/handimage/wxllzf.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [Phone], [Email], [Address], [RegTime], [SignDiscription], [UserImage]) VALUES (N'9d9a55bb-1572-49cb-8e68-44ce8e0945c7', N'wxllzf', N'123456', N'18200465675', N'1036199213@qq.com', N'', CAST(0x0000A4980187EE71 AS DateTime), N'我喜欢打酱油，呵呵', N'/upload/handimage/wxllzf.jpg')
/****** Object:  Table [dbo].[PositionLog]    Script Date: 06/25/2015 21:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionLog](
	[ID] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Latitude] [decimal](18, 8) NOT NULL,
	[Longitude] [decimal](18, 8) NOT NULL,
	[Altitude] [decimal](18, 8) NOT NULL,
	[Accuracy] [decimal](18, 8) NOT NULL,
	[AltitudeAccuracy] [decimal](18, 8) NOT NULL,
	[Heading] [decimal](18, 8) NOT NULL,
	[Speed] [decimal](18, 8) NOT NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PositionLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'精度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'海拔高度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Altitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'精确度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Accuracy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'海拔精确度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'AltitudeAccuracy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移动方向' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Heading'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'移动速度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'Speed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PositionLog', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'0072777c-2141-413d-8c7e-9a83465633a2', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016B82A2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'023b7d47-239f-4974-9278-d0439605c486', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017BA9F9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'0272a0da-9e70-4baf-bdf4-ad428839e205', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B0BFAF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'04a437ad-c8ad-4277-a86b-6f9ddb28a028', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A1FD87 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'04b823d7-66e4-4e74-b80c-6fbaef36880d', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60169AA58 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'056b966b-d6d6-4b67-a989-a0fc98c6bad9', N'wxllzf', CAST(30.53387200 AS Decimal(18, 8)), CAST(104.04826200 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B20176C844 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'0573b5bf-20bf-438b-a2c1-fb1c569a3945', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A0979E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'05a333b7-beac-41ea-92ba-b11dd60573e5', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80163C210 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'079ed6a9-cb64-449a-b129-62081528af9f', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700ACEE66 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'081a95d0-fc96-42c0-8fa9-e8e2209c9609', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B56715 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'08770dd5-769e-439f-ba55-23450585fbdd', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009C32D3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'08c1208b-637b-488c-8411-8dcd5440e789', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01565629 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'0b3c8455-0f1d-4862-a516-d6bd0010486d', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60169D6CA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'0ce5694d-a590-4567-a00b-7cf887079b2c', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801649A38 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1444cbe1-936b-4380-8034-c33db99d7993', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015BDDE2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'14a39b23-277e-470c-ac8f-e68c45c81b14', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015CCAD5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'16341be4-11a9-468a-8bcd-ecafc48e237e', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A051E5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'169d4e6c-75b4-4dd2-bfe5-205afc7dd869', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016374A4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'16f9a013-619e-47e1-9888-6c0135bdd5f4', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009A31E2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'17ccccad-cb37-4d05-8405-fb0082e04e6f', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B014B2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'187deac0-0762-4035-9683-0bfea6ec26d8', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6017340BA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'18ffb474-d715-4d72-b23c-b2b47032b7ce', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009C1970 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'19524dd9-bac5-4bd2-8a6c-ad7c698bf9c4', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA017583C9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'19ce58df-0558-4859-9875-55e305c3ad40', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7008E51A9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'19fd44bf-2525-4f76-9155-eb09d0556fbf', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B2CC47 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'19fe3477-782f-46cf-9235-bd7a8df4a0b2', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0158B79B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1aa1caa8-4325-4865-9aaf-fafe8e23116f', N'wxllzf', CAST(30.53381900 AS Decimal(18, 8)), CAST(104.04822800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0160AB0D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1aa2955e-3eb0-44da-92fa-09373b7ce4cb', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016D2078 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1ab18006-c472-492d-ac4f-a7f42d79096d', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201780A7A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1ac21a2e-27bd-4879-a783-cb66371392a7', N'dreamzoom', CAST(30.53337500 AS Decimal(18, 8)), CAST(104.04769600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B8C256 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1ba45e15-d705-4d91-8b08-0d694292aa4c', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60160644C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1bfef2a3-37e8-4c01-9855-e8f32d704104', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01759DA9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1c96c590-36b2-40a0-a8d2-5b09682ff3d3', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015BCF4A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1cc679d0-60b2-4351-9ac5-d6e6c3ddf361', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015D80E4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'1d672c30-ada9-4c46-a420-650669177ba7', N'dreamzoom', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B60B2D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'202da242-03c7-4c81-be62-74b1a3ed12ef', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801769A75 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'20afdcd5-1696-4cb1-95db-449b439d7064', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009365F5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'214aa3f0-0594-4816-9681-5f4216e50af7', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01606A89 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'217d9639-a202-4c3d-addb-6387431ed099', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009C60AA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'218e922e-0c28-4f25-8284-7e101e00c34b', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017A5AB9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'247b6014-5556-49e9-8304-2861dd946159', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A601737185 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'251a43d0-3771-40b9-bc2c-e15999607e3a', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017AE5A2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'262f764f-a6a6-443c-b90a-8e9ec1be5965', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01565E38 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'27e342f0-65ce-48bf-868e-f64c4b8c41d1', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700ACD90F AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'27e6d05a-eab0-42e0-bc78-88ee10e99c01', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7008E68CD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'29ac964c-4863-4390-bbc0-378f4ea49e86', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016B9C6B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'2edc8013-a0cd-4b23-96dc-527816b4c57b', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801711E48 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3016520c-1000-4290-b143-32eb5b1296c7', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B0BADD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3093062d-04b9-4639-8f76-05e8facbb1f0', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201779628 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'30b52617-768a-4d1d-91ad-5ce284ef166e', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A227CF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'30dbfab9-6286-46a3-93a7-0ae8fa29e531', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A601610094 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3147ba4b-d534-4d29-bee1-5148b26bbd9e', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A5C371 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3208865e-eab8-4796-bb62-5970a5b0ef20', N'dreamzoom', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B602B5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'322a7591-f2f3-4825-bc4a-2766ecb8f087', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801645890 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'33e9a16d-301d-4f98-b09f-3bf9ef5723f0', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016BC338 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3428aa1a-9479-4bb7-aff1-35f5e7b3e5b9', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201795DF3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'353a3834-8f89-4449-8601-389250f99617', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015BE2CE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'35c47697-7aa7-48fc-874d-4454c9408afb', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B0B92A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3ce1d3cb-3e6d-4c46-8957-c97c3eff41ca', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01616371 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3de3a0fa-1644-47b9-94ef-574508351037', N'wxllzf', CAST(30.53413600 AS Decimal(18, 8)), CAST(104.04791300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A5017F8BF6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3e1c52ae-4a38-49ce-8611-ca798d9e37e5', N'wxllzf', CAST(30.53411800 AS Decimal(18, 8)), CAST(104.04831600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A20141066D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3e649271-68b2-4f33-8ed5-dc208d32b1d2', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009ECA3E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'3fb0e1bd-5500-4d15-8940-4341cef07420', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80162ACB2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4156c467-ab50-42e4-a07e-ed9826eb745c', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AF2E06 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'42b72633-02b8-4aba-b716-9faa1fc10fda', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01557543 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'42f7d499-cf87-442b-847d-1b13590cdbe5', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A26B31 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'43273067-292a-495b-880d-adebabb1dfcc', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B2A0CA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4403c064-7a69-4368-bb73-b3e668fbf8a1', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700ACD6EF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'440dab5a-94bd-40fb-abea-2c23dc005485', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A76F32 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'44a0e10a-ed80-4c2c-9472-40d407b4b78d', N'dreamzoom', CAST(30.53411700 AS Decimal(18, 8)), CAST(104.04825800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801758BAD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'472600da-e4be-4d3b-b9d0-375344b46f45', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60169F10C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4751eb32-40db-4518-bbae-7b326a936a90', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B70092FF4E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'485719f6-510c-4b8d-a929-03632d93c33b', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801764173 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'490a6cea-8b7b-46c5-b05f-54e7be1bd3dc', N'dreamzoom', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B62121 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'49473147-fd7b-4c28-ab2e-23606738dcb9', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80170B6E1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'496307aa-d2bd-47ac-8122-831960c8f67d', N'wxllzf', CAST(30.53419900 AS Decimal(18, 8)), CAST(104.04655300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB016167B7 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'49b91904-218f-4d06-926a-f415d3055bec', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01752988 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'49c75fbd-91a0-4440-aaa3-b5a0cd122e7b', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0158E9FF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4a6f4fe3-d07d-457e-8f20-42ce055a939f', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016385C3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4b1d7b5b-3ffd-4267-8337-14eb554bd1c4', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009B50BE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4d0534ef-4947-48a3-9559-ef4e40d7c972', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015F8B5D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4dd3b667-403f-4790-9066-207b40259b19', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA017536EC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4e964bda-e5a7-4220-866d-62ca56a3070b', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016374B0 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'4ea390e8-ca5f-4dcc-af01-dd8396b3dbb6', N'wxllzf', CAST(30.53411700 AS Decimal(18, 8)), CAST(104.04825800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4BC01682D41 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'510fb5f3-c0cc-4bca-8fc9-945dfbfb7a2b', N'dreamzoom', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B85797 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'51c10b51-7822-4bbc-a933-3dab57be29e2', N'wxllzf', CAST(30.53421400 AS Decimal(18, 8)), CAST(104.04703600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B20178E7AE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'530f0b62-39b3-4a3e-a811-70436fb7f390', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80176C471 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'535bd1c8-93b8-431d-9673-9687a1661ad3', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016A302F AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5429c7f1-fe63-487f-b4fa-6c7eaca33489', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700ACC6A6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'547db305-3ad1-4ef4-9f0d-3c6288a38245', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015BB441 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'56f84f1e-ce59-4839-94d0-d6611036eb52', N'wxllzf', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AEA98E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'572a48cd-3c95-440a-a5ab-dbffef66c4a2', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AF2256 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5917b3ff-9b14-4a7d-9a88-2d95b165d259', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009F87C1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5998a032-9e09-4e7f-b8bf-b8074abd19f2', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801641CF6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5a00f38d-7486-43e1-8abc-304eb7abe0dc', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015564E9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5af72d7d-b94b-4f31-9982-b2f98a159ffe', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6017388BF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5b3b726a-536d-432f-9eb1-9426672c9cf9', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016AED24 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5bdb85a9-1131-440f-942b-d143461329d0', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016B6EA8 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'5c6f8acf-8982-49a0-aa99-1ad4e0421c2d', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60169C26A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6114724c-3e0d-425b-91a7-9290c287c649', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7008E56C6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'61282810-38dd-49a3-8b4f-a69a534ceda2', N'wxllzf', CAST(30.53413700 AS Decimal(18, 8)), CAST(104.04830500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A2010F473E AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'63680982-bd6b-4d61-82ff-7f3d5863f635', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01572764 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6371026f-162b-4f0d-8a9e-f013bc7f046c', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009E86C4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'648b5289-38b8-42ec-8cd4-8ae56017aa87', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A601731E81 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'65094e6f-4503-4b64-b202-5cc5cdda95ef', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015F03E1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6544253d-182c-4339-b65c-05d008c30aac', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009B75E3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'65ff1b20-ebc4-491c-8ada-4ece50c1c352', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201785680 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'66366cba-705a-45e1-8ed1-e88c070c988a', N'wxllzf', CAST(30.53419900 AS Decimal(18, 8)), CAST(104.04655300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01616DA6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'677bdede-3e3a-446b-a879-28880d126ce6', N'wxllzf', CAST(30.53413600 AS Decimal(18, 8)), CAST(104.04791300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A5017F630D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6a0454af-ae5e-4816-a7da-e67c74686000', N'dreamzoom', CAST(30.53337500 AS Decimal(18, 8)), CAST(104.04769600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B886C5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6ae4ce50-d324-4560-8274-8e022e8b091a', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016413DE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6bc1ffb7-e0cf-416c-90ee-69b18ec3874a', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016F8BFE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6c0b1b11-81f2-4472-b881-884473f63ba3', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01590531 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6c3ed70b-7713-42d2-bf1e-a433fe972bf2', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801702FC9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'6f345305-ad3f-4568-a52f-46eefec2e9ea', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A5A481 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'70065242-0e8e-4031-98d2-497f1a94b9a8', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B6A540 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7271bac5-8635-4259-ad4f-6a94cd9b3085', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80162B34F AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'72e53c04-5d01-4240-addd-f7b0cbe9c7ca', N'dreamzoom', CAST(30.53397000 AS Decimal(18, 8)), CAST(104.04819600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B9B40B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'73e7721d-44a2-4ec4-8c4e-4558b24fa45b', N'wxllzf', CAST(30.53421400 AS Decimal(18, 8)), CAST(104.04703600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B20178EE50 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7442f073-1f75-4b46-a71b-cfffc80e64a2', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016A19D1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'74a8c54f-bb53-400e-be99-b6b653a588e4', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016BF4AA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'778cf8c2-5654-4b6a-a9f8-7d5c755080d2', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009F94D3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'77cdc21c-cf10-4ae9-bc7e-0660dcf8ebc4', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60161CF5B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'788b631c-ce7b-43f2-9ff1-c6ebfb10989d', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01758129 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'799c816a-1b1f-4bb5-a712-e90eb3aa1908', N'wxllzf', CAST(30.53411800 AS Decimal(18, 8)), CAST(104.04831600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A20140C5DE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7beac6d8-d8ea-467b-a9b1-8fd84d8cfd3e', N'wxllzf', CAST(30.53413600 AS Decimal(18, 8)), CAST(104.04791300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A5017FE8F8 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7d6581b1-390f-45e3-87d4-e5665c695632', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6017650FE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7de4c3ed-d20b-40c9-a5c6-91039d5b405d', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B3514C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7e6a3254-b320-49be-97b4-a01fbab8d9e1', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60172FD0E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'7ee6feef-86ce-451f-a5c3-cfc02a5823ae', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB01615FBB AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'80748f46-b2df-44b5-b9e1-003b1e2a9527', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801735301 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'8112976b-c199-42e7-ae88-4e9cb98e3f67', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801769A69 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'81fdf661-b246-4a59-b151-515a8c79bf5d', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017B19F6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'828fa65f-c436-46e5-9dc2-d7934f5cb7ca', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A4B029 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'82e563f4-68f3-4716-8497-e00615f51a7a', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017ABF32 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'8332d988-56e1-475c-b854-a4902daaf268', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AF6D5E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'83eb520f-e58f-488b-a0c9-c31a9211a5c9', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0158F111 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'8423202d-8b9c-45f2-8dfa-b366c8eba3b8', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016BC328 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'867b0adf-c052-47d7-b436-062c68715576', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016385C3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'8844bcba-f40d-4d13-a295-492360fcd7c7', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0154DD06 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'89b6a4d6-d583-4c77-a493-bb806a42f5df', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201797824 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'8fc97952-b30c-41ec-940b-e6af483c4a6e', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80173BEE5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'902d1724-0930-48a5-8f6b-646624b8842c', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801642D4C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'90a79ed8-c5f8-49fa-b6d3-b366b4080542', N'wxllzf', CAST(30.53411500 AS Decimal(18, 8)), CAST(104.04826500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B2017749DD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'91ece928-2d3d-4e30-a644-180bd8b29926', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016D7CA4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'93856fc8-b7a1-4ab4-9191-9433d6318b6d', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80174E5DA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'96145ff9-e59b-41f6-a40b-ae87bf8d3e1f', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016347DC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9644ed3a-d9e3-4911-ad71-b460fa38e897', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009AFCA4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'976fba18-5cee-4b10-a7b3-a74cc6b63c7e', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016BF4B7 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9798fb97-63d9-4da7-96dd-9902617d8989', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801649A40 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'97ae3306-4fe2-475f-8fda-9b8e592ba1ad', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B28E7B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9be1c480-1514-48c5-9ce6-342fe7bef964', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009A4EA5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9d9a55bb-1572-49cb-8e68-44ce8e0945c7', N'wxllzf', CAST(30.53415900 AS Decimal(18, 8)), CAST(104.04801100 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A200A9AAC9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9dd581dc-f662-42aa-83c0-26d56109dfe7', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0155D14C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9e7e23b9-6376-451d-8f5f-3f88281d670a', N'wxllzf', CAST(30.53421400 AS Decimal(18, 8)), CAST(104.04703600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B201790BAA AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'9eee5268-4fdf-46dd-a76c-6e100f9d0755', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A0D6E4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a06af97f-ae64-42bc-b8c1-130f16311788', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AF25C5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a1a28d5d-0641-4b9c-b0fa-23464b7ebb80', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6017540A0 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a2195cc1-fbdd-421a-b3a2-1c9deae1b375', N'wxllzf', CAST(30.53413700 AS Decimal(18, 8)), CAST(104.04830500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A2010EF710 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a3a88a38-d0f7-46a9-b325-35c5073b13c7', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016428E4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a492181a-3469-420d-bb71-d5bbe5658d18', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80163C210 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a5aa4814-82e1-4a09-9c06-39dd76ec9be3', N'wxllzf', CAST(30.53413700 AS Decimal(18, 8)), CAST(104.04830500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A20111D593 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a6530102-54aa-4b73-bba2-8b9ace891f14', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015B794D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a687dbe6-c279-4a0b-8b05-3f825eda4a9e', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700AF95DC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a8209c19-3456-46c6-b79e-5e3c745f9885', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80173756A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a87510f7-dd63-4940-b5f5-37627bbf97a8', N'wxllzf', CAST(30.53406900 AS Decimal(18, 8)), CAST(104.04653900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0160F0DF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'a9c7d733-1bc7-4cd6-873d-7c3ebf5dd870', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80175C6A5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'aa6a6b6d-6ca8-4d34-921c-d1dd29617db5', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A02249 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ab8ffd2f-e81b-473a-bed7-7164e65ed4e8', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801640E41 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ac856484-ff1d-49b4-ab00-b28b4fa9c7ca', N'wxllzf', CAST(30.53410000 AS Decimal(18, 8)), CAST(104.04791300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01761AD8 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'aca0cefa-5941-4542-8cf4-b4b87bf4d5f8', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015AEFF2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'afed4c99-2d9c-4215-bd4d-51288c11a4e4', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016E81C9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b099cc6f-09f1-4503-b338-df734a03aca3', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA017558C2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b0b08356-c9b1-4c0d-9e91-3f47ea56c204', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B65E24 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b3473fd8-99e8-43f7-920a-b6cc7aa46b9e', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016CFF06 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b39069e2-b45a-44b0-920d-fcf55d2231a1', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015FB79E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b5cf6481-b4a6-4548-b91d-4cb8722a473e', N'wxllzf', CAST(30.53406900 AS Decimal(18, 8)), CAST(104.04653900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0160E99E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b610e5ab-e163-4247-8635-a3d8f73d53cf', N'wxllzf', CAST(30.53407700 AS Decimal(18, 8)), CAST(104.04823300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009A9DC1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b6e0e2bb-d37c-41e8-b0a9-b8c5e9e59c79', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA0175811B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b768bdcf-f5ad-43b9-a1b2-777a63356c34', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A60167328A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b83178f2-1eb8-4a95-8ba3-e2d041ac9f3a', N'wxllzf', CAST(30.53425200 AS Decimal(18, 8)), CAST(104.04845700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A77941 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b888d7f2-bf2a-49fb-b28f-e2d77e3e14a9', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016C82BE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b93b363a-5759-4866-a811-b8ecfebb5fed', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80175C6A5 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'b9c99515-d7e6-4f50-a7e4-4b8b2f2004cf', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015FE364 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'bd778d29-232b-48c8-b53a-1788ea685dc6', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80170B6E1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'bdcc845c-9242-4495-b7a0-00e18bdbfa18', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0156DD77 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'be484a5f-92ab-4d88-9b2a-c6ce7ad78c7a', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016E5E6D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c004b2f9-ba44-408d-8ea8-8c71b377feb3', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017A922E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c0d5f991-7ca2-421f-a718-ebe3f038b32f', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009E8A4C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c1f7d5b0-5f77-4b2b-a91f-909a740aa15c', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009FD395 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c20bbdaa-63ee-4a8a-afd8-9f8f33f2c465', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01755CAF AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c34e916b-68b5-488a-84a8-8d5a67579b8e', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A669B2 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c537f9d9-3ed8-45e4-9af4-2e9f4c00b515', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80162F95C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c5c6412b-0b16-4418-89b2-39bb587a1dde', N'wxllzf', CAST(30.53423600 AS Decimal(18, 8)), CAST(104.04784900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AA01754588 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c6721a78-a926-4bb3-991a-37dd8f839386', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015DBCDB AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c9002343-8a85-49f6-92e3-53666724ad4b', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015B5C5D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'c942fd7c-776d-4b4e-9cf1-e50de58b6759', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016D45C4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ca00539b-7ba0-439b-b90b-98a72f384436', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B69E22 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ca31387d-a404-4d46-81c8-b6e9d0a6b2ef', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015A511D AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'cb044e3c-18dc-4c3a-a29b-c61857ad84db', N'dreamzoom', CAST(30.53337500 AS Decimal(18, 8)), CAST(104.04769600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B8D79B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'cc816cb2-9526-4a07-9709-5210f9422455', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015CA284 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ce6bcdcb-5c69-46c9-901e-8a401a70420e', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016BFAB1 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'cea4bcbc-9a8b-4c4e-bc51-a366140703ed', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016F71C4 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'cefa0c2d-1913-4d1d-8dcf-b5b7c9239a2e', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A76BE9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd04d96c6-4d72-4bb6-b3fe-1b2528ea2898', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016420EE AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd1342255-664f-4d06-ba16-1bcff391b85d', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801649E54 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd1a9bdf6-1e3c-4cd2-9a9f-de4b9898b4d3', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B70092B5D9 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd1c3b4a6-e760-40de-a07b-89f61dc35069', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80175C6AB AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd1f8cb0c-a167-418c-b19c-ff6906780511', N'wxllzf', CAST(30.53413600 AS Decimal(18, 8)), CAST(104.04791300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A5017ED1DB AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd2570e12-a8f3-4acc-932b-fce5b299f8b2', N'wxllzf', CAST(30.53421400 AS Decimal(18, 8)), CAST(104.04703600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B20178D4A3 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd3ede041-7243-4af1-ae66-aec13da9b117', N'wxllzf', CAST(30.53406900 AS Decimal(18, 8)), CAST(104.04653900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0160F7CC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd50fc1de-a728-4f2a-a4d6-c00eb5e24519', N'wxllzf', CAST(30.53404700 AS Decimal(18, 8)), CAST(104.04828900 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B6017A4DF6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd779be25-72fd-4e4e-b706-5cfbb535224b', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80176BDFC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd790a0af-5f1f-40b1-82f0-d20cb152bdc3', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015C3BF7 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd79ca01b-c3bd-4070-aeb5-a8ca66a04148', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801655D37 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd7efc89e-1829-4371-a771-3c43320da2f4', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80176C154 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'd8791a51-523d-4393-beca-48943f0c7dd8', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0156DE21 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'da468860-9ff5-4a49-8a13-13a44ebb354f', N'wxllzf', CAST(30.53381900 AS Decimal(18, 8)), CAST(104.04822800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB0160C0BC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'de4b15a2-65ff-4515-83a0-3740ab2a9772', N'wxllzf', CAST(30.53407700 AS Decimal(18, 8)), CAST(104.04823300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009A9B99 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'de7b436d-585e-4b01-823b-afc8fe34567e', N'dreamzoom', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B652B6 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'de8b5c7f-5e89-4aa8-bd56-03e5a9972458', N'dreamzoom', CAST(30.53418800 AS Decimal(18, 8)), CAST(104.04819300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(65.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700B6081E AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'df14f84d-007d-45b8-b97b-b1475135c185', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB016078EB AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e06c0152-c129-49e9-a81b-01bc787a015e', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801769A74 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e1613f09-3c5b-447c-9768-8e2a0ee1e106', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801640E41 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e32e809c-3ea3-4c39-81d5-f8afee382bc3', N'dreamzoom', CAST(30.53411700 AS Decimal(18, 8)), CAST(104.04825800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80164D917 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e3563aeb-fb5c-4790-a8d8-ee672b8d00a4', N'wxllzf', CAST(30.53411800 AS Decimal(18, 8)), CAST(104.04831600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A20140DC7A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e425249d-cae8-44b7-a671-9ec4513928ac', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A601731980 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e57beff9-09ab-4ffb-84c1-69ae4dd48e62', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016D2D37 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e6cebf71-86fd-461e-86b2-d149e2bbed6e', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016F2F20 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e786cae2-3eea-4daa-8cc7-25972eb7a367', N'wxllzf', CAST(30.53411400 AS Decimal(18, 8)), CAST(104.04828800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(66.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B700A5F97B AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'e8d61ebe-8de1-409a-a88e-6d35ed1eb825', N'dreamzoom', CAST(30.53411700 AS Decimal(18, 8)), CAST(104.04825800 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80175757A AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'eb041987-c4c0-4470-98da-083c6f44e276', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B70099FBF1 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ecc15072-2b47-4053-a264-30507642ac36', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801732A11 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ed770e02-27aa-45a4-9b50-31c4b171195c', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016C1FBC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'eed6d219-4384-4ae4-97f5-1c4052a5107f', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016EA432 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ef9c3eb8-ef45-4d37-ab38-c269818aadcc', N'wxllzf', CAST(30.53387200 AS Decimal(18, 8)), CAST(104.04826200 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(150.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B20176E765 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f0140a82-61fe-4c96-8fd0-6f5116c20887', N'wxllzf', CAST(30.53407300 AS Decimal(18, 8)), CAST(104.04837600 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B7009FD736 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f14ceb68-845a-42c7-8cb6-c6385a4becfc', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8017119DD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f2ae2112-7040-4fca-8c68-b211e9561e50', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B801702376 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f5ea8a4e-a521-413a-83d0-81a98ed18072', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015659DD AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f6290e74-6570-4204-bff4-f5c59f18ea51', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016D0F85 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f74546dc-290d-489a-ab60-018e75f4a2c6', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04825700 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015FEDA8 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f91ef88d-d0ee-49fc-a912-d8c373c5da2f', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6016EB22C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'f9cc9c50-a2ca-49d9-89f5-5e96bb210490', N'wxllzf', CAST(30.53407500 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4AB015F7134 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'fdec1bc1-906c-417f-9bf5-163ad9ea1c27', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B8016347D8 AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ff37fbef-877d-4f90-9875-897b67c69349', N'wxllzf', CAST(30.53407100 AS Decimal(18, 8)), CAST(104.04828500 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(500.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015C16DC AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ff3a4495-a704-4a75-9141-9f493985d14a', N'wxllzf', CAST(30.53414800 AS Decimal(18, 8)), CAST(104.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015FDB5C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ff3a4495-a704-4a75-9141-9f493985d14b', N'dreamzoom', CAST(30.53414800 AS Decimal(18, 8)), CAST(105.04825000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(300.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4A6015FDB5C AS DateTime))
INSERT [dbo].[PositionLog] ([ID], [UserName], [Latitude], [Longitude], [Altitude], [Accuracy], [AltitudeAccuracy], [Heading], [Speed], [AddTime]) VALUES (N'ff5f2510-80cb-4871-82cb-852c8c4dfcd4', N'dreamzoom', CAST(30.53411200 AS Decimal(18, 8)), CAST(104.04824300 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(100.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), CAST(0x0000A4B80174F6C6 AS DateTime))
/****** Object:  Table [dbo].[Message]    Script Date: 06/25/2015 21:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [nvarchar](128) NOT NULL,
	[Sender] [nvarchar](50) NOT NULL,
	[Reciver] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ContentType] [int] NOT NULL,
	[MsgType] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[ReciveTime] [datetime] NULL,
	[IsProc] [bit] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsRecived] [bit] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'00336df0-3c88-40e4-8a2f-c89c532431fe', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B9048E AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'045d6099-3ddc-4a21-afd8-5b3d57903ca9', N'dreamzoom', N'dreamzoom', N'呃呃墨迹了', 0, 0, CAST(0x0000A4B8017D141A AS DateTime), CAST(0x0000A4B8017D141A AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'04bc5fd2-0df9-4083-a733-f3159d103908', N'dreamzoom', N'dreamzoom', N'德芙', 0, 0, CAST(0x0000A4B8017CC964 AS DateTime), CAST(0x0000A4B8017CC964 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'0cdf4e99-3908-460d-befe-4f0ef7a8e815', N'dreamzoom', N'dreamzoom', N'，', 0, 0, CAST(0x0000A4B801660165 AS DateTime), CAST(0x0000A4B801660165 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'0e987498-9938-4890-9567-c71355cd8b43', N'wxllzf', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B700ACE22B AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'12494eea-fb77-4c3b-96a4-e4257bb1a1a8', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1B6 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'129c3d40-9028-4f1f-8f5f-df8a03f3b48f', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801630354 AS DateTime), CAST(0x0000A4B801630354 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'13952daf-93f5-4a03-8701-ed42a6a85dfa', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8DDBB AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'17e45456-8771-4641-af18-4bf94aa90cdc', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B903E5 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'195b6d40-07e2-492b-b82c-ec25e0d68103', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8FEBA AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1a3b7e8e-562e-4883-8987-c886d7f1c110', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8016F9022 AS DateTime), CAST(0x0000A4B8016F9022 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1aefbbfa-8e8d-42f8-ba35-f0d202c045af', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1CA AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1c220487-08cd-405a-930c-8644983e451d', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1CB AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1cd2cd96-7d82-4ade-8ca6-d72b09c5daea', N'dreamzoom', N'wxllzf', N'呵呵', 0, 0, CAST(0x0000A4BB017CBA90 AS DateTime), CAST(0x0000A4BC01684D35 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1dfa5b6d-ce55-4d47-bdb4-580ba9e14174', N'wxllzf', N'dreamzoom', N'大大', 0, 0, CAST(0x0000A4BC0168548C AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 0, 0, 0)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1ef1c832-6428-45f6-a44c-da380e6b8619', N'dreamzoom', N'dreamzoom', N'', 0, 0, CAST(0x0000A4B80165F3F5 AS DateTime), CAST(0x0000A4B80165F3F5 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'1f7c6151-ccbb-455d-a650-ecdef9c497a0', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8017033C3 AS DateTime), CAST(0x0000A4B8017033C3 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'24496838-8428-4c5e-afd3-a8800953b2aa', N'dreamzoom', N'wxllzf', N'把握', 0, 0, CAST(0x0000A4BB017E5782 AS DateTime), CAST(0x0000A4BC01684D28 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'28177c9d-1424-4f6a-9eb6-f135af4afaf4', N'wxllzf', N'wxllzf', N'哦！', 0, 0, CAST(0x0000A4BC01686F54 AS DateTime), CAST(0x0000A4BC01686F54 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'293d0e9f-f560-4dc1-8f35-3368a4e44272', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80173C44D AS DateTime), CAST(0x0000A4B80173C44D AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'294288f4-6ac6-440b-a55a-b334439d8678', N'dreamzoom', N'dreamzoom', N'呃呃呃呃', 0, 0, CAST(0x0000A4B8017C7720 AS DateTime), CAST(0x0000A4B8017C7720 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'297b5073-316b-4eda-b9cc-5d5730084115', N'wxllzf', N'dreamzoom', N'呵呵', 0, 0, CAST(0x0000A4B700AEAF06 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'2a14150c-9e49-4ce2-925c-07e19c3158c6', N'dreamzoom', N'dreamzoom', N'德芙', 0, 0, CAST(0x0000A4B8017CCFD6 AS DateTime), CAST(0x0000A4B8017CCFD6 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'2adcb3fd-2dd9-4b3a-b7cf-39dc0842e6fc', N'dreamzoom', N'dreamzoom', N'哈哈哈哈哈', 0, 0, CAST(0x0000A4B80164D023 AS DateTime), CAST(0x0000A4B80164D023 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'3380d0f2-f2cf-4d13-8fb4-fb3a98f2502a', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B90172 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'3735afb3-6ff4-4770-990f-3aef6027466d', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C9603 AS DateTime), CAST(0x0000A4B8017C9603 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'39bf8f6c-a09e-43ba-a108-e603db718ea0', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F3A25 AS DateTime), CAST(0x0000A4BC01684D39 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'3b53e5b8-247b-48e6-89e4-4957e89721b9', N'dreamzoom', N'dreamzoom', N'', 0, 0, CAST(0x0000A4B8017C8FE9 AS DateTime), CAST(0x0000A4B8017C8FE9 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'3ba4223c-3497-444a-bb34-8c04183b281b', N'dreamzoom', N'dreamzoom', N'大大大可口可乐了举强空间里弄弄头发饿得得瑟空间里', 0, 0, CAST(0x0000A4B80165AA58 AS DateTime), CAST(0x0000A4B80165AA58 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'3d35d374-0284-4bf1-8078-7dcc2e1b936f', N'dreamzoom', N'dreamzoom', N'啊啊😁', 0, 0, CAST(0x0000A4B700B9A523 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'406f4b58-25b1-47f5-bdc5-3c83a680bced', N'dreamzoom', N'dreamzoom', N'德芙', 0, 0, CAST(0x0000A4B8017CCF0F AS DateTime), CAST(0x0000A4B8017CCF0F AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'4c2b40d6-f1d9-494f-92da-f672a814fd70', N'dreamzoom', N'wxllzf', N'得得', 0, 0, CAST(0x0000A4B8016F770C AS DateTime), CAST(0x0000A4BC01684D39 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'4cb4d764-9118-4311-a8bb-a3641940274e', N'dreamzoom', N'dreamzoom', N'喔喔哦', 0, 0, CAST(0x0000A4B8017CE148 AS DateTime), CAST(0x0000A4B8017CE148 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'4e0ec237-dc52-4bc6-b5a0-1b1a70ec0f0c', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F8EF AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'4e1af732-0c07-43b0-8f43-4b68fc773c67', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801734911 AS DateTime), CAST(0x0000A4B801734911 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'4eb3f766-bcb6-4f8a-b95c-0d580fe8cf4d', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B900F9 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5215517e-1618-4687-bd73-b478c4ce98dd', N'wxllzf', N'wxllzf', N'哈哈', 0, 0, CAST(0x0000A4BC01683A6B AS DateTime), CAST(0x0000A4BC01683A6B AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'52aa341c-33fb-4464-9eeb-46c18f8001a0', N'dreamzoom', N'dreamzoom', N'的妹纸', 0, 0, CAST(0x0000A4B8017D1A0D AS DateTime), CAST(0x0000A4B8017D1A0D AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5963fffc-b776-4c8c-88b9-c44e84d11784', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8FED8 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5b5d96a6-2cbe-442e-9ac5-2b5b3b4bd254', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B80162F0F6 AS DateTime), CAST(0x0000A4BC01684D46 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5c3f7302-b209-4ec6-8430-30c972338751', N'dreamzoom', N'dreamzoom', N'看', 0, 0, CAST(0x0000A4BB017B67C7 AS DateTime), CAST(0x0000A4BB017B67C7 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5cc20295-4587-45c7-ba3c-1fdc72834cdf', N'dreamzoom', N'wxllzf', N'呃呃', 0, 0, CAST(0x0000A4B80170296F AS DateTime), CAST(0x0000A4BC01684D37 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5cc4eb34-57c0-4f34-b1a6-f24698a25816', N'dreamzoom', N'wxllzf', N'哈', 0, 0, CAST(0x0000A4BB017C417A AS DateTime), CAST(0x0000A4BC01684D36 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5d0fb0ce-b77f-4c9a-96a4-a337137bf7e4', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B901AB AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5e680cce-dd3d-4ea0-aede-8ec85698e7e4', N'dreamzoom', N'dreamzoom', N'呃呃弄弄考虑考虑空间里考虑考虑阿爸举强考虑考虑', 0, 0, CAST(0x0000A4B80170D958 AS DateTime), CAST(0x0000A4B80170D958 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'5ea16381-172d-4c82-92e1-ebb692b432df', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F35EC AS DateTime), CAST(0x0000A4BC01684D43 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'60d00c8c-ea65-4a39-bce9-dd64940d7e2c', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C925F AS DateTime), CAST(0x0000A4B8017C925F AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'62268d6f-0a43-441a-b477-f0dc112facf7', N'dreamzoom', N'wxllzf', N'呃呃', 0, 0, CAST(0x0000A4B801702743 AS DateTime), CAST(0x0000A4BC01684D38 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'64a56ded-f2d2-4cbc-b876-2813382ae4be', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80174EBB0 AS DateTime), CAST(0x0000A4B80174EBB0 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'6fad40ed-3bc9-497b-8169-c4115d356a48', N'dreamzoom', N'dreamzoom', N'操', 0, 0, CAST(0x0000A4B8017DCA1B AS DateTime), CAST(0x0000A4B8017DCA1B AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'6ff48eef-6fd1-4e52-bf80-5fc9271fc5fd', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80175ED81 AS DateTime), CAST(0x0000A4B80175ED81 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'7149870b-1012-4b61-9a55-6651d2adbd5f', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F33FF AS DateTime), CAST(0x0000A4BC01684D43 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'7239409e-0cfc-474c-a55c-cc106a0e3065', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B9015B AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'726bb636-519e-43a1-ab11-dc2bbcc66c13', N'dreamzoom', N'wxllzf', N'急急急', 0, 0, CAST(0x0000A4BB017CEAE4 AS DateTime), CAST(0x0000A4BC01684D34 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'73f19859-1edd-434e-a456-bcb1f8a4ad8e', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B9048E AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'777062d7-c88f-4488-8dfc-73bf411df6e7', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8017582BF AS DateTime), CAST(0x0000A4B8017582BF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'77e31354-aa6f-4bda-9b0a-762f72a68844', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B90386 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'799fa8a6-a3e1-4b07-a643-df67498249e0', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F395D AS DateTime), CAST(0x0000A4BC01684D3A AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'7f396524-4234-43f8-9ca5-40bec27f15db', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80170C4ED AS DateTime), CAST(0x0000A4B80170C4ED AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'8183722e-2ff0-43ec-af4e-832ccdadcf55', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8EDDF AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'8365578d-3312-49c5-99fc-0ad3c7f3cbbe', N'dreamzoom', N'dreamzoom', N'', 0, 0, CAST(0x0000A4B8017CDC09 AS DateTime), CAST(0x0000A4B8017CDC09 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'84d56714-f5cd-4d80-a68f-97bea3c50bf2', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1C8 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'850d2750-f8e6-4c83-916b-1f57711d5a24', N'dreamzoom', N'wxllzf', N'框架不会被', 0, 0, CAST(0x0000A4B80163D10E AS DateTime), CAST(0x0000A4BC01684D46 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'85318458-7620-47e9-9f3c-7c2f9ab4660a', N'dreamzoom', N'dreamzoom', N'哈哈哈哈哈', 0, 0, CAST(0x0000A4B80164A722 AS DateTime), CAST(0x0000A4B80164A722 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'8c7e43ae-b51f-4e43-a6ab-b5f972b19358', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801734A4D AS DateTime), CAST(0x0000A4B801734A4D AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'8d7cf186-941b-46a4-86f6-69bbb2b88a2f', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8E051 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'8dda18fe-ce94-4160-b634-fb859b93c5d0', N'wxllzf', N'wxllzf', N'哈哈', 0, 0, CAST(0x0000A4B700930D6D AS DateTime), CAST(0x0000A4B700930DFD AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'9283860a-7dd3-4c6c-81a3-43eab1ebd617', N'dreamzoom', N'dreamzoom', N'哈哈哈哈哈', 0, 0, CAST(0x0000A4B80164A90B AS DateTime), CAST(0x0000A4B80164A90B AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'947b5b4a-1471-48ce-80f1-be8631b54f9b', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8FB03 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'95e92615-d65a-4fb5-97de-fe34ab37ff54', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C9694 AS DateTime), CAST(0x0000A4B8017C9694 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'9638460c-1860-42f5-93c0-468f4c398aeb', N'dreamzoom', N'dreamzoom', N'饿得', 0, 0, CAST(0x0000A4B80179E327 AS DateTime), CAST(0x0000A4B80179E327 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'98c7fa8c-ed9d-443a-8c17-c18fdd72b053', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8FC7B AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'998b2a7b-21e0-418f-8cc4-cc68151d2f3d', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80170C264 AS DateTime), CAST(0x0000A4B80170C264 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'9eb912ed-72ed-42cd-8b4f-f4a2841b8aa5', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80162FECF AS DateTime), CAST(0x0000A4B80162FECF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'9f1427e2-2bb2-45a3-81cb-af2d61c6e325', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F389E AS DateTime), CAST(0x0000A4BC01684D43 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'9f4655d9-8354-4b10-b10f-c44251dd5ac3', N'dreamzoom', N'wxllzf', N'哈哈哈', 0, 0, CAST(0x0000A4BB016CBA86 AS DateTime), CAST(0x0000A4BC01684D36 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a0fdbeae-1a4f-482a-ab57-fd9b0faa93f1', N'dreamzoom', N'dreamzoom', N'大大大可口可乐了举强空间里弄弄头发爸爸举强紧急集合普通饿得得瑟空间里', 0, 0, CAST(0x0000A4B80165B3A9 AS DateTime), CAST(0x0000A4B80165B3A9 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a1b22757-35f7-42d2-bca2-7a5ff185aa94', N'dreamzoom', N'dreamzoom', N'路路通', 0, 0, CAST(0x0000A4B8017D6D48 AS DateTime), CAST(0x0000A4B8017D6D48 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a36070f1-04e2-4f6c-9585-e76557e481ef', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B90122 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a52e86b9-c37a-4135-a594-892b70710dd8', N'dreamzoom', N'dreamzoom', N'呃呃额额额额额', 0, 0, CAST(0x0000A4B801760EF6 AS DateTime), CAST(0x0000A4B801760EF6 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a59192a9-6c4f-4eab-b63a-8375adabc342', N'dreamzoom', N'dreamzoom', N'阿桔', 0, 0, CAST(0x0000A4B8017DB987 AS DateTime), CAST(0x0000A4B8017DB987 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a98f19e8-af19-4624-b24e-ff0c4c6a49e9', N'dreamzoom', N'dreamzoom', N'呃呃呃呃', 0, 0, CAST(0x0000A4B8017C7BF7 AS DateTime), CAST(0x0000A4B8017C7BF7 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'a9fc69d4-6bdb-466c-bf56-ea91be33c8b3', N'dreamzoom', N'dreamzoom', N'的', 0, 0, CAST(0x0000A4B80173851C AS DateTime), CAST(0x0000A4B80173851C AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'aa4ddcd8-a3e7-479a-8e1f-227ff4f0ef76', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8017BE679 AS DateTime), CAST(0x0000A4B8017BE679 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'afc6637f-7d57-4555-a20c-7fe8e67fdb5d', N'wxllzf', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B700A032B8 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b064fa27-3a2f-46e6-96cc-5ab3381b8c8a', N'dreamzoom', N'wxllzf', N'喔喔哦喔喔哦', 0, 0, CAST(0x0000A4B801650D23 AS DateTime), CAST(0x0000A4BC01684D44 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b153fc2d-493c-4c9e-a2a0-0cdaee38f6ed', N'wxllzf', N'wxllzf', N'哈哈', 0, 0, CAST(0x0000A4B700936E7D AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b548a30b-8c8e-43bf-9b3b-4f0fb2d3af5f', N'dreamzoom', N'dreamzoom', N'把链接框架不会被', 0, 0, CAST(0x0000A4B801639FC6 AS DateTime), CAST(0x0000A4B801639FC6 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b916d541-650e-4ce3-a043-dcd812650361', N'dreamzoom', N'dreamzoom', N'哈哈哈哈哈', 0, 0, CAST(0x0000A4B80164C5FD AS DateTime), CAST(0x0000A4B80164C5FD AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b93dc7fd-e1ac-4456-82d0-d65e52256296', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801757979 AS DateTime), CAST(0x0000A4B801757979 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'b9cf5477-e79d-4cb9-a19f-89a3654bf07a', N'dreamzoom', N'dreamzoom', N'后面是什么', 0, 0, CAST(0x0000A4BB016CD283 AS DateTime), CAST(0x0000A4BB016CD283 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'bb404f84-69a4-4018-9a95-bf51a380daed', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B9048C AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'bdc84116-50a4-49ab-88aa-b8e0319a7b17', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C94DE AS DateTime), CAST(0x0000A4B8017C94DE AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'bf89c24a-1c57-4c57-928a-f58f9c15c19e', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C9718 AS DateTime), CAST(0x0000A4B8017C9718 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c2515a8c-541d-4694-89aa-32817855f403', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1C6 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c2b4ba1d-b033-4adc-9366-028dd9b885e8', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B903BE AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c2feafdd-443f-49d5-bde0-b370e164d65b', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80177CB91 AS DateTime), CAST(0x0000A4B80177CB91 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c44019af-5208-476a-8b03-b06302a5e1b9', N'dreamzoom', N'wxllzf', N'哈哈哈', 0, 0, CAST(0x0000A4BB016CB1B5 AS DateTime), CAST(0x0000A4BC01684D36 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c633d863-49a0-4be8-920b-6cea626eff5f', N'dreamzoom', N'wxllzf', N'喔喔哦喔喔哦', 0, 0, CAST(0x0000A4B80164E107 AS DateTime), CAST(0x0000A4BC01684D45 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c6ed6a30-4f2a-4416-a503-e65fcbe5e0c7', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801703CCC AS DateTime), CAST(0x0000A4B801703CCC AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c7a2b5e1-3cdf-4db0-857a-6691774d7572', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B0C861 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'c97f4650-adf1-4758-a519-e32c1a4eed6b', N'dreamzoom', N'dreamzoom', N'啊啊😁', 0, 0, CAST(0x0000A4B700B91C9A AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'cbe0b354-f5b5-4b0b-8efb-5ca84f70ebca', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B801778FDE AS DateTime), CAST(0x0000A4B801778FDE AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd1fe5411-283f-49bd-9fb3-c67eebeb2cd0', N'dreamzoom', N'dreamzoom', N'呃呃呃呃', 0, 0, CAST(0x0000A4B8017BF0F3 AS DateTime), CAST(0x0000A4B8017BF0F3 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd3034315-fe9d-4554-bdc4-83e446c0a898', N'dreamzoom', N'wxllzf', N'的', 0, 0, CAST(0x0000A4BB017D7EF7 AS DateTime), CAST(0x0000A4BC01684D33 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd52eb655-1986-4abb-ae3c-9024d39c4282', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8016301BF AS DateTime), CAST(0x0000A4B8016301BF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd5703de7-15c1-4457-a15a-726a8f7a2098', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8FCAE AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd89d8ccf-1d14-41e1-8a4b-16409fbd6c10', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8017345BF AS DateTime), CAST(0x0000A4B8017345BF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'd9895da7-ccc8-4218-845c-9b344f2cf70f', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B8017035A9 AS DateTime), CAST(0x0000A4B8017035A9 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'dbb65c21-2204-4399-9ce9-9a2bc9416ab1', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1C9 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'dc5932f6-7ad2-4965-9190-198933efc4b1', N'dreamzoom', N'wxllzf', N'框架不会被', 0, 0, CAST(0x0000A4B80163D71C AS DateTime), CAST(0x0000A4BC01684D45 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'ddd8b5c3-8464-4f03-ba5a-a89b96179769', N'dreamzoom', N'dreamzoom', N'大大大可口可乐了举强空间里弄弄头发爸爸举强紧急集合普通饿得得瑟空间里', 0, 0, CAST(0x0000A4B80165B969 AS DateTime), CAST(0x0000A4B80165B969 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e11f9479-fa79-4410-a2dd-27e73a1afd32', N'dreamzoom', N'wxllzf', N'哈哈哈', 0, 0, CAST(0x0000A4B700AF9D01 AS DateTime), CAST(0x0000A4BC01684D48 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e2ff4ad1-00d1-4f97-abd1-ceafe7fc3b57', N'dreamzoom', N'wxllzf', N'框架', 0, 0, CAST(0x0000A4B700B08D1F AS DateTime), CAST(0x0000A4BC01684D48 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e375010e-b77e-49e8-abb9-f1185fd67fa6', N'dreamzoom', N'dreamzoom', N'把链接框架不会被', 0, 0, CAST(0x0000A4B80163A827 AS DateTime), CAST(0x0000A4B80163A827 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e3788952-7b76-4346-ab9f-fa9c0dcc555e', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B8017C96D4 AS DateTime), CAST(0x0000A4B8017C96D4 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e563a44d-dd73-4fa3-ab88-e6579e8e45e1', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8F1C5 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e5724b86-c85d-4af3-b15d-25d1ccb1c2f8', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B8ED08 AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'e8b1163e-5063-4a41-a91f-e41c12b113eb', N'dreamzoom', N'dreamzoom', N'呃呃呃呃', 0, 0, CAST(0x0000A4B8017C7E34 AS DateTime), CAST(0x0000A4B8017C7E34 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'eadd554b-fdf1-45eb-8959-547e212bd0f3', N'dreamzoom', N'wxllzf', N'饿得', 0, 0, CAST(0x0000A4B700B9B956 AS DateTime), CAST(0x0000A4BC01684D47 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'ec83f6b4-41be-4d3d-a6d0-5eff947b7c9b', N'dreamzoom', N'wxllzf', N'饿得', 0, 0, CAST(0x0000A4B80177F1B7 AS DateTime), CAST(0x0000A4BC01684D37 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'f10cf10c-1290-4a3e-92ff-748910954c2d', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B8016F39A1 AS DateTime), CAST(0x0000A4BC01684D3A AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'f1c009ac-2635-4951-82d6-3b6743c074ea', N'dreamzoom', N'dreamzoom', N'呃呃', 0, 0, CAST(0x0000A4B80170BE60 AS DateTime), CAST(0x0000A4B80170BE60 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'f3d471c9-980a-4114-aed1-50e352240824', N'dreamzoom', N'wxllzf', N'啊啊', 0, 0, CAST(0x0000A4B80162D19D AS DateTime), CAST(0x0000A4BC01684D46 AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'f52ee268-fd60-4df1-870f-48ef68ecf70a', N'dreamzoom', N'dreamzoom', N'啊啊', 0, 0, CAST(0x0000A4B700B0C42C AS DateTime), CAST(0x002D247F018B81FF AS DateTime), 1, 1, 1)
INSERT [dbo].[Message] ([ID], [Sender], [Reciver], [Content], [ContentType], [MsgType], [SendTime], [ReciveTime], [IsProc], [IsRead], [IsRecived]) VALUES (N'ff11683d-045b-40dd-ab57-1c5cd0532a39', N'dreamzoom', N'dreamzoom', N'呃呃弄弄考虑考虑空间里考虑考虑阿爸举强考虑考虑', 0, 0, CAST(0x0000A4B80170E2CA AS DateTime), CAST(0x0000A4B80170E2CA AS DateTime), 1, 1, 1)
/****** Object:  Table [dbo].[Friends]    Script Date: 06/25/2015 21:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[ID] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FriendName] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUserFriends]    Script Date: 06/25/2015 21:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUserFriends]
AS
SELECT     dbo.Friends.UserName, dbo.Friends.FriendName, dbo.Friends.GroupName, dbo.Friends.AddTime, dbo.[User].Phone, dbo.[User].Email, dbo.[User].Address, 
                      dbo.[User].RegTime, dbo.[User].SignDiscription, dbo.[User].UserImage
FROM         dbo.Friends INNER JOIN
                      dbo.[User] ON dbo.Friends.FriendName = dbo.[User].UserName
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 222
               Bottom = 210
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Friends"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserFriends'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserFriends'
GO
/****** Object:  View [dbo].[vNearUserPosition]    Script Date: 06/25/2015 21:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vNearUserPosition]
AS
SELECT     UserIf.ID, UserIf.UserName, UserIf.Phone, UserIf.Email, UserIf.Address, UserIf.RegTime, UserIf.SignDiscription, UserIf.UserImage, Position.Latitude, 
                      Position.Longitude, Position.Altitude, Position.Accuracy, Position.AltitudeAccuracy, Position.Heading, Position.Speed, Position.AddTime
FROM         dbo.[User] AS UserIf LEFT OUTER JOIN
                      dbo.PositionLog AS Position ON Position.UserName = UserIf.UserName AND Position.ID IN
                          (SELECT     LastID
                            FROM          (SELECT     UserName, MAX(ID) AS LastID
                                                    FROM          dbo.PositionLog
                                                    GROUP BY UserName) AS Temp)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserIf"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Position"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 219
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vNearUserPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vNearUserPosition'
GO
/****** Object:  View [dbo].[vGetUserPosition]    Script Date: 06/25/2015 21:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetUserPosition]
AS
SELECT     UserIf.ID, UserIf.UserName, UserIf.Phone, UserIf.Email, UserIf.Address, UserIf.RegTime, UserIf.SignDiscription, UserIf.UserImage, Position.Latitude, 
                      Position.Longitude, Position.Altitude, Position.Accuracy, Position.AltitudeAccuracy, Position.Heading, Position.Speed, Position.AddTime
FROM         dbo.[User] AS UserIf LEFT OUTER JOIN
                      dbo.PositionLog AS Position ON Position.UserName = UserIf.UserName AND Position.ID IN
                          (SELECT     LastID
                            FROM          (SELECT     UserName, MAX(ID) AS LastID
                                                    FROM          dbo.PositionLog
                                                    GROUP BY UserName) AS Temp)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[14] 4[50] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserIf"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Position"
            Begin Extent = 
               Top = 6
               Left = 234
               Bottom = 219
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetUserPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetUserPosition'
GO
/****** Object:  Default [DF_Friends_AddTime]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_Message_ContentType]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_ContentType]  DEFAULT ((0)) FOR [ContentType]
GO
/****** Object:  Default [DF_Message_MsgType]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_MsgType]  DEFAULT ((0)) FOR [MsgType]
GO
/****** Object:  Default [DF_Message_IsProc]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_IsProc]  DEFAULT ((0)) FOR [IsProc]
GO
/****** Object:  Default [DF_Message_IsRead]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
/****** Object:  Default [DF_Message_IsRecived]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_IsRecived]  DEFAULT ((0)) FOR [IsRecived]
GO
/****** Object:  Default [DF_PositionLog_AddTime]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[PositionLog] ADD  CONSTRAINT [DF_PositionLog_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_User_RegTime]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_RegTime]  DEFAULT (getdate()) FOR [RegTime]
GO
/****** Object:  Default [DF_User_SignDiscription]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_SignDiscription]  DEFAULT ('') FOR [SignDiscription]
GO
/****** Object:  Default [DF_User_Icon]    Script Date: 06/25/2015 21:06:15 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Icon]  DEFAULT ('') FOR [UserImage]
GO
