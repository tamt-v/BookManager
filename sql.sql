USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetail] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NULL,
	[totalMoney] [float] NULL,
	[orderDay] [date] NULL,
	[paymentStatus] [bit] NULL,
	[statusOrder] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](10) NOT NULL,
	[productName] [varchar](200) NULL,
	[description] [varchar](500) NULL,
	[categoryID] [varchar](10) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[statusProduct] [bit] NULL,
	[createDay] [date] NULL,
	[image] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/8/2021 9:54:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[address] [varchar](200) NULL,
	[createDay] [date] NULL,
	[roleID] [varchar](10) NULL,
	[statusUser] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'NV', N'Novel')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'PS', N'Psychology')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'SH', N'Self-Help')
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (1, 1, N'P2', 1, 115000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (3, 1, N'P10', 1, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (4, 1, N'P5', 2, 200000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (5, 1, N'P10', 2, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (7, 2, N'P10', 2, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (9, 3, N'P10', 1, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (10, 3, N'P4', 2, 70000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (11, 3, N'P4', 1, 70000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (16, 6, N'P10', 2, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (17, 6, N'P3', 1, 110000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (18, 6, N'P2', 2, 1150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (19, 7, N'P1', 1, 65000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (20, 7, N'P10', 2, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (21, 15, N'P1', 2, 65000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (22, 15, N'P10', 2, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (23, 15, N'P4', 1, 70000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (35, 16, N'P1', 2, 65000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (36, 16, N'P10', 100, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (37, 19, N'P1', 5001, 65000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (38, 19, N'P10', 1, 150000)
INSERT [dbo].[tblOrderDetail] ([orderDetail], [orderID], [productID], [quantity], [price]) VALUES (40, 11, N'P1', 2, 65000)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (1, N'user1', 2065000, CAST(N'2021-07-03' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (2, N'tvtam', 365000, CAST(N'2021-07-13' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (3, N'trantam', 425000, CAST(N'2021-07-13' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (4, N'user1', 130000, CAST(N'2021-07-13' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (5, N'user1', 65000, CAST(N'2021-07-13' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (6, N'user1', 1475000, CAST(N'2021-07-13' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (7, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (8, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (9, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (10, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (11, N'trantam', 65000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (12, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (13, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (14, N'user1', 215000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (15, N'user1', 500000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (16, N'user1', 15130000, CAST(N'2021-07-14' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (17, N'user1', 15130000, CAST(N'2021-07-15' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (18, N'user1', 15130000, CAST(N'2021-07-15' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (19, N'user1', 215000, CAST(N'2021-07-15' AS Date), 1, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (20, N'user1', 65000, CAST(N'2021-07-15' AS Date), 0, 1)
INSERT [dbo].[tblOrders] ([orderID], [userID], [totalMoney], [orderDay], [paymentStatus], [statusOrder]) VALUES (21, N'trantam', 65000, CAST(N'2021-11-04' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P1', N'Tuoi tre dang gia bao nhieu', N'"You regret not taking a chance, no one has to lose sleep.
You go through boring days with a job you hate, people don''t mind.
Whether you die in the corner with unfinished dreams, it''s none of their business.
In the end, the decision is yours. It''s up to you if you want something or not.
So do what you love. Follow the voice of your heart. Live your life the way you think you should.
Because after all, no one cares."', N'SH', 65000, 500, 1, CAST(N'2021-07-01' AS Date), N'https://salt.tikicdn.com/media/catalog/product/t/u/tuoi-tre-dang-gia-bao-nhieu-u547-d20161012-t113832-888179.u3059.d20170616.t095744.390222.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P10', N'Di tim le song', N'Viktor Frankl''s Finding Reason in Life is one of the classics of our time. Usually, if a book has only one paragraph, an idea that has the power to change a person''s life, that alone is enough for us to read it over and over and give it a place on the shelf. his book. This book has many such passages.', N'PS', 150000, 282, 1, CAST(N'2021-07-02' AS Date), N'https://salt.tikicdn.com/ts/product/80/14/8b/61fb657f347d14d9d7bf6fe901001a8e.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P2', N'Danh thuc con nguoi phi thuong trong ban', N'Awaken the extraordinary person in you” is a book that helps readers discover their hidden value to create unexpected results. The book is written by Athony Robbins - a living witness, someone who has found the extraordinary in himself.', N'SH', 1150000, 196, 1, CAST(N'2021-07-01' AS Date), N'https://cf.shopee.vn/file/285791c81b205c7f0d214905e283f7a0')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P3', N'Dac nhan tam', N'Dale Carnegie''s Winning People''s Heart is the only self-help book that has consistently topped The New York Times'' best-selling books list for 10 consecutive years. Published in 1936, with sales of more than 15 million copies, up to now, the book has been translated into almost all languages, including Vietnam, and has received enthusiastic reception from readers. fake in most countries.', N'SH', 110000, 299, 1, CAST(N'2021-07-01' AS Date), N'https://salt.tikicdn.com/cache/w1200/ts/product/df/7d/da/d340edda2b0eacb7ddc47537cddb5e08.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P4', N'Dung bao gio di an mot minh', N'Do you want to take a shortcut?
You want firm steps to success?
The recipe for this, says connection guru Keith Ferrazzi, is getting to know people. Ferrazzi discovered at a young age that what sets the most successful people apart is the way they use the power of relationships - so that everyone wins.', N'SH', 70000, 484, 1, CAST(N'2021-07-01' AS Date), N'https://salt.tikicdn.com/media/catalog/product/i/m/img952.u3059.d20170616.t101947.301225.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P5', N'Thanh Guom Diet Quy', N'In the Taisho period, there was a kind-hearted coal-selling boy named Tanjiro. The peaceful days were over when the Devil came to slaughter his whole family, only his sister Nezuko survived but was turned into a Devil. With the determination to cure his sister, Tanjiro and Nezuko set out on a journey to find the whereabouts of the demon that killed his family!!', N'NV', 200000, 296, 1, CAST(N'2021-07-01' AS Date), N'https://cf.shopee.vn/file/c4ee4b1424bf24fe463bd7c251ab6ba0')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P6', N'Sword Art Online', N'Second day of final load experimentation in Underworld.
Kirito fell into the hands of the commander of the red army. While collapsing on the ground, he suddenly heard a voice calling. The call of a close friend who used to fight side by side, laugh with him...
SWORD ART ONLINE 018, true to its subtitle "Lasting", is the episode that closes the very long Alicization arc, and closes in the most beautiful, superficial and promising way.', N'NV', 199000, 400, 1, CAST(N'2021-07-01' AS Date), N'https://cdn0.fahasa.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/w/sword-art-online-progressive-005.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P7', N'Tokyo ghoul', N'Adapted from the manga of the same name written by artist Sui Ishida, it is not surprising that Tokyo Ghoul has received a lot of positive reviews from both experts and fans. In particular, the interweaving stories of human and demon love in the film will bring many emotions to viewers.', N'NV', 150000, 500, 1, CAST(N'2021-07-01' AS Date), N'https://salt.tikicdn.com/ts/product/f2/67/93/5bc78b03e12577f7f2076bdf5d2f8d15.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P8', N'5 centimet tren giay', N'5cm/s is not only the speed of falling cherry petals, but also the speed when we quietly pass each other''s lives, losing the most passionate feelings of love.', N'NV', 190000, 300, 1, CAST(N'2021-07-01' AS Date), N'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1528270713i/40404694._SS900_.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [price], [quantity], [statusProduct], [createDay], [image]) VALUES (N'P9', N'Nghich ly cua su lua chon', N'This is a valuable book for two reasons. First, it convincingly argues that we would live better with fewer choices, and that many of us are struggling to make the best choices. Second, the book also provides a fascinating introduction to current research trends in the psychology of choice and human life.', N'PS', 200000, 400, 1, CAST(N'2021-07-02' AS Date), N'https://salt.tikicdn.com/cache/w444/media/catalog/product/n/g/nghich-ly.u335.d20160609.t155215.jpg')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'admin', N'AD')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'admin', N'This is ADmin', N'123456', N'0123456789', N'HCM', CAST(N'2021-07-01' AS Date), N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'tamtran', N'tran van tam', N'123456', N'0987123456', N'tp Vung Tau', CAST(N'2021-07-13' AS Date), N'AD', 0)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'trantam', N'tam', N'123456', N'0123789123', N'VT', CAST(N'2021-07-13' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'tvtam', N'Tam', N'123456', N'0123123123', N'Xuyen Moc BR-VT', CAST(N'2021-07-13' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'user1', N'This is user1', N'123456', N'0123123122', N'HCM', CAST(N'2021-07-01' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [address], [createDay], [roleID], [statusUser]) VALUES (N'vantam', N'Van Tam', N'123456', N'0987123456', N'Vung Tau', CAST(N'2021-07-12' AS Date), N'US', 0)
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
