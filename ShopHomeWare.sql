create database [ShopHomeWare]
USE [ShopHomeWare]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Image] [varchar](255) NULL,
	[Address] [nvarchar](100) NULL,
	[TelePhone] [char](10) NULL,
	[Reset_password] [varchar](50) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_FeedBacks] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBacks]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FeedBacks_1] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NULL,
	[Discription] [nvarchar](100) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[CreateDay] [date] NOT NULL,
	[TelePhone] [varchar](12) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](30) NULL,
	[Total] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[Discount] [float] NULL,
	[Image1] [nvarchar](50) NULL,
	[Image2] [nvarchar](50) NOT NULL,
	[Image3] [nvarchar](50) NOT NULL,
	[Image4] [nvarchar](50) NOT NULL,
	[Image5] [nvarchar](50) NOT NULL,
	[EnteredDay] [date] NOT NULL,
	[Discription] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NULL,
	[HotSale] [varchar](20) NOT NULL,
	[OldPrice] [int] NULL,
	[Author] [nvarchar](50) NULL,
	[Publishing] [nvarchar](50) NULL,
	[Provider] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products1] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statitic]    Script Date: 7/18/2024 5:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statitic](
	[OrderId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[id] [int] NULL,
	[slDoanhthu] [bigint] NOT NULL,
	[slOrder] [bigint] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'Admin', N'123123', N'Admin', N'admin@gmail.com', N'Screenshot 2024-03-19 171042.png', N'50 Nguyễn Thị Thập, Hòa Minh, Liên Chiểu, Đà Nẵng.', N'0798473625', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'lananh02', N'123123', N'Nguyễn Thị Lan Anh', N'lananh02@gmail.com', N'khanhquynh.jpg', N'24 Đống Đa, Thuận Phước, Đà Nẵng', N'0969493305', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'nchuongxn', N'nguyenchuong123', N'chuong', N'nguyenchuong22062002@gmail.com', N'noimage2.png', NULL, N'0917425622', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Image], [Address], [TelePhone], [Reset_password]) VALUES (N'thucskin202', N'18ffb1025a2', N'Thức Nguyễn Văn', N'thucskin202@gmail.com', N'noimage2.png', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (143, N'Admin', N'DIRE')
GO
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2006, N'Ti Vi')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2007, N'Tủ Lạnh')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2008, N'Máy Giặc')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2009, N'Nồi Chiên')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2010, N'Bếp Điện')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2012, N'Quạt')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2013, N'Lò Vi Sóng')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (224, 227, 31, 16490000, 34, 2, N'Duyệt', 21766800)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (225, 227, 27, 15890000, 37, 1, N'Duyệt', 10010700)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Price], [Discount], [Quantity], [Discription], [Amount]) VALUES (226, 227, 33, 10090000, 10, 1, N'Duyệt', 9081000)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [Username], [CreateDay], [TelePhone], [Address], [Name], [Email], [Total], [Status]) VALUES (227, N'Admin', CAST(N'2024-07-18' AS Date), N'0956956565', N'3 Tân Lập 1, Thuận Phước, Đà Nẵng', N'Admin', N'admin@gamil.com', 58990000, N'Đã giao hàng')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (26, N'Smart Tivi NanoCell LG 4K 55 inch 55NANO76SQA', 120, 11990000, 47, N'Screenshot 2024-07-18 150306.png', N'Screenshot 2024-07-18 150321.png', N'Screenshot 2024-07-18 150354.png', N'Screenshot 2024-07-18 150337.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Smart Tivi NanoCell LG 4K 55 inch 55NANO76SQA

Loại tivi: Smart TV NanoCell55 inch4K
Hệ điều hành: webOS 22

Ứng dụng phổ biến:
YouTube KidsYouTubeVTVcab ONVieONTV 360Trình duyệt webSpotifyPOPS KidsNhaccuatuiNetflixMyTVGalaxy Play (Fim+)FPT PlayClip TV
Công nghệ hình ảnh: Tương thích HEVCTương thích bộ mã hóa Video decoder (VP9, AV1) Nâng cấp độ phân giải 4K AI UpscalingNâng cấp hình ảnh AI Picture Pro 4KHLGHDR10 Pro HDR Dynamic Tone Mapping. Giảm độ trễ chơi game. Auto Low Latency Mode (ALLM)Dải màu rộng Nano ColorChế độ hình ảnh phù hợp nội dung. Chế độ game HGiGActive HDR.
Điều khiển bằng giọng nói

Tìm kiếm giọng nói trên YouTube bằng tiếng ViệtNhận diện giọng nói LG Voice RecognitionLG Voice Search - tìm kiếm bằng giọng nói tiếng ViệtGoogle Assistant (Chưa có tiếng Việt)Alexa (Chưa có tiếng Việt)
Remote thông minh: Magic Remote
Chiếu hình từ điện thoại lên TV Screen ShareAirPlay 2
Kích thước: Ngang 123.5 cm - Cao 78.8 cm - Dày 28.5 cm

Năm ra mắt: 2022
Hãng: Panasonic', 2006, N'hot-icon.gif', 22000000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (27, N'Smart Tivi LG 4K 65 inch 65UQ8000PSC', 70, 15890000, 37, N'Screenshot 2024-07-18 150904.png', N'Screenshot 2024-07-18 150910.png', N'Screenshot 2024-07-18 150917.png', N'Screenshot 2024-07-18 150927.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Smart Tivi LG 4K 65 inch 65UQ8000PSC

Loại tivi: Smart Tivi65 inch4K
Hệ điều hành: webOS 22
Ứng dụng phổ biến:
YouTube KidsYouTubeVTVcab ONVieONTV 360Trình duyệt webSpotifyPOPS KidsNhaccuatuiNetflixMyTVGalaxy Play (Fim+)FPT PlayClip TV
Công nghệ hình ảnh: Tương thích HEVCTương thích bộ mã hóa Video decoder (VP9, AV1) Nâng cấp độ phân giải 4K AI UpscalingHLGHDR10 ProHDR Dynamic Tone Mapping. Giảm độ trễ chơi game Auto Low Latency Mode (ALLM)FilmMaker ModeChế độ hình ảnh phù hợp nội dung. Chế độ game HGiGActive HDR
Điều khiển bằng giọng nói

Tìm kiếm giọng nói trên YouTube bằng tiếng Việt. Nhận diện giọng nói LG Voice RecognitionLG Voice Search - tìm kiếm bằng giọng nói tiếng ViệtGoogle Assistant (Chưa có tiếng Việt)Alexa (Chưa có tiếng Việt)
Remote thông minh: Magic Remote
Chiếu hình từ điện thoại lên TV Screen ShareAirPlay 2
Kích thước: Ngang 145.4 cm - Cao 90.9 cm - Dày 34 cm

Năm ra mắt: 2022
Hãng: LG. ', 2006, N'hot-icon.gif', 25400000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (30, N'Tủ lạnh Panasonic Inverter 550 lít', 454, 22990000, 23, N'Screenshot 2024-07-18 151400.png', N'Screenshot 2024-07-18 151415.png', N'Screenshot 2024-07-18 151422.png', N'Screenshot 2024-07-18 151432.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Tủ lạnh Panasonic Inverter 550 lít Multi Door NR-DZ601VGKV

Kiểu tủ: Multi Door
Dung tích sử dụng: 550 lít - 4 - 5 người
Công nghệ tiết kiệm điện
Multi ControlInverterCảm biến thông minh Econavi
Công nghệ làm lạnh: Làm lạnh vòng cung Panorama
Công nghệ kháng khuẩn khử mùi:
Công nghệ diệt khuẩn Blue Ag+ với tinh thể bạc Ag+ và ánh sáng xanh
Công nghệ bảo quản thực phẩm: Ngăn trữ đông tinh thể bạc Ag Hygiene ZoneNgăn rau củ kép Fresh SafeNgăn cấp đông mềm thế hệ mới Prime Fresh+
Tiện ích: Ngăn đông mềm trữ thịt cá không cần rã đôngMặt gương sang trọng, dễ vệ sinhLàm đông nhanhInverter tiết kiệm năng lượng
Kích thước - Khối lượng: Cao 184.7 cm - Rộng 79.1 cm - Sâu 78 cm - Nặng 100 kg

Nơi sản xuất: Việt Nam
Năm ra mắt: 2021
Hãng: Panasonic. ', 2007, N'pngegg.png', 30090000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (31, N'Tủ lạnh LG Inverter 470 lít Multi Door GR-B50BL', 450, 16490000, 34, N'Screenshot 2024-07-18 152005.png', N'Screenshot 2024-07-18 152020.png', N'Screenshot 2024-07-18 152025.png', N'Screenshot 2024-07-18 152035.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Tủ lạnh LG Inverter 470 lít Multi Door GR-B50BL

Kiểu tủ:

Multi Door
Dung tích sử dụng:

470 lít - 4 - 5 người
Công nghệ tiết kiệm điện

Smart Inverter
Công nghệ làm lạnh:

Luồng khí lạnh đa chiều Multi Air Flow
Công nghệ bảo quản thực phẩm:

Ngăn rau củ Fresh Zone
Tiện ích

Chế độ cấp đông nhanhBảng điều khiển bên ngoài
Kích thước - Khối lượng, Cao 185 cm - Rộng 83.3 cm - Sâu 67.8 cm - Nặng 87 kg
Nơi sản xuất: Trung Quốc
Năm ra mắt: 2023
Hãng: LG', 2007, N'pngegg.png', 24990000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (32, N'Máy giặt Panasonic Inverter giặt 9.5 kg', 230, 12990000, 10, N'Screenshot 2024-07-18 152415.png', N'Screenshot 2024-07-18 152406.png', N'Screenshot 2024-07-18 152436.png', N'Screenshot 2024-07-18 152415.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Máy giặt Panasonic Inverter giặt 9.5 kg - sấy tiện ích 2 kg NA-V95FC1LVT

Loại máy: Cửa trướcLồng ngangCó Inverter
Khối lượng giặt: Giặt 9.5 Kg - Sấy tiện ích 2 KgTừ 5 - 7 người
Kiểu động cơ: Truyền động gián tiếp (dây Curoa)
Công nghệ giặt: Hệ thống ActiveFoamGiặt nước nóng StainMaster+Cảm biến EconaviCông nghệ AI Smart Wash
Tiện ích: Tự động vệ sinh lồng giặtKhóa trẻ emHẹn giờ giặtCó sấy
Bảng điều khiển: Song ngữ Anh - Việt có nút nhấn, cảm ứng và màn hình hiển thị
Chất liệu lồng giặt
Thép không gỉ
Kích thước - Khối lượng: Cao 84.5 cm - Ngang 58.5 cm - Sâu 61 cm - Nặng 69 kg
Hãng: Panasonic. ', 2008, N'pngegg.png', 13990000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (33, N'Máy giặt Samsung Inverter 12 kg WA12CG5745BVSV', 540, 10090000, 10, N'Screenshot 2024-07-18 152729.png', N'Screenshot 2024-07-18 152739.png', N'Screenshot 2024-07-18 152748.png', N'Screenshot 2024-07-18 152758.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Thông số kỹ thuật Máy giặt Samsung Inverter 12 kg WA12CG5745BVSV

Loại máy:

Cửa trênLồng đứngCó Inverter
Khối lượng giặt:

12 KgTrên 7 người
Kiểu động cơ:

Truyền động trực tiếp bền & êm
Công nghệ giặt:

VRT Plus ™ giảm rung ồn đến 30%Công nghệ Intensive Wash tăng khả năng thẩm thấu xà phòng vào quần áoBong bóng siêu mịn Eco BubbleCông nghệ Deep Softener Lưu giữ hương thơmChế độ giặt Super SpeedBộ lọc xơ vải Magic Filter
Tiện ích:

Tự động vệ sinh lồng giặt Eco Tub CleanTự khởi động lại khi có điệnKhóa trẻ emHệ thống vắt khô Air TurboHẹn giờ giặtHoạt động được ở áp lực nước thấp từ 1mCửa đóng êm Soft Closing DoorChẩn đoán sự cố thông minh qua ứng dụng điện thoại Smart Check
Bảng điều khiển:

Song ngữ Anh - Việt có màn hình hiển thị
Chất liệu lồng giặt

Thép không gỉ
Kích thước - Khối lượng: Cao 105.9 cm - Ngang 61 cm - Sâu 64 cm - Nặng 39 kg
Hãng: Samsung.', 2008, N'pngegg.png', 13090000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (34, N'Lò chiên không dầu Ferroli FAF-12M 12 lít', 340, 1490000, 53, N'Screenshot 2024-07-18 153105.png', N'Screenshot 2024-07-18 153115.png', N'Screenshot 2024-07-18 153056.png', N'Screenshot 2024-07-18 153045.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Dung tích tổng:

12 lít
Dung tích sử dụng:

12 lít
Điều chỉnh:

80 - 200°C0 - 60 phút
Phụ kiện chính:

Xiên nướng gàTay cầmKhay xiên quayKhay nướngGiỏ chiên2 vỉ nướng
Chất liệu nồi:

Vỏ nhựa ABS Khoang lò thép mạ kẽm
Công nghệ, công suất:

Thanh nhiệt điện trở1800W
Chức năng nấu:

Chiên, nướng thực phẩm
Bảng điều khiển:

Nút xoay
Tiện ích:

Đèn trong khoang lòQuạt đối lưuNắp kính trong suốt, quan sát được quá trình nấuCó đèn báo hoạt động
Năm ra mắt: 2023
Thương hiệu của: Ý
Hãng: Ferroli.', 2009, N'hot-icon.gif', 3190000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (35, N'Nồi chiên không dầu Sunhouse SHD4086W 4.5 lít', 450, 990000, 63, N'Screenshot 2024-07-18 153314.png', N'Screenshot 2024-07-18 153333.png', N'Screenshot 2024-07-18 153343.png', N'Screenshot 2024-07-18 153358.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Dung tích tổng: 4.5 lít
Dung tích sử dụng: 4 lít
Điều chỉnh: 80 - 200°C0 - 60 phút
Phụ kiện chính: Rổ chiên
Chất liệu nồi: Vỏ bằng nhựa PPLòng nồi thép phủ chống dính
Công nghệ, công suất: Rapid Air1500W
Chức năng nấu: Chiên, nướng thực phẩm
Bảng điều khiển: Cảm ứng có màn hình hiển thị
Tiện ích: Tự động ngắt khi kéo lòng nồiTự ngắt khi quá nhiệtTay cầm bọc nhựa cách nhiệtCó thể vệ sinh bằng máy rửa chén5 chương trình nấu ăn cài đặt sẵn

Năm ra mắt: 2020
Thương hiệu của: Việt Nam
Hãng: Sunhouse.', 2009, N'hot-icon.gif', 2830000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (36, N'Bếp từ đôi lắp âm Rapido RI4000DS', 634, 3490000, 63, N'Screenshot 2024-07-18 153810.png', N'Screenshot 2024-07-18 153821.png', N'Screenshot 2024-07-18 153837.png', N'Screenshot 2024-07-18 153753.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại bếp: Bếp từ đôi, Bếp âm cần lắp CB
Công suất vùng nấu: Trái: 2000/2200W - Phải: 2000W
Chất liệu mặt bếp: Kính Ceramic - Schott Ceran (Đức)
Bảng điều khiển: Cảm ứng
Loại nồi nấu: Chỉ sử dụng loại nồi có đế nhiễm từ
Tính năng an toàn: Tự nhận diện kích cỡ đáy nồiKhóa bảng điều khiểnCảnh báo mặt bếp nóng
Tiện ích: Có hẹn giờChức năng làm nóng nhanhBảng điều khiển cảm ứng trượt
Kích thước lỗ đá: Ngang 69.5 cm - Dọc 41 cm

Thương hiệu của: Đức
Hãng: Rapido.', 2010, N'hot-icon.gif', 9590000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (37, N'Bếp từ đôi lắp âm Hafele HC-I2732A', 340, 10990000, 35, N'Screenshot 2024-07-18 154222.png', N'Screenshot 2024-07-18 154234.png', N'Screenshot 2024-07-18 154211.png', N'Screenshot 2024-07-18 154244.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại bếp: Bếp từ đôi, Bếp âm cần lắp CB
Công suất vùng nấu: Trái: 2000/2200W - Phải: 2000/2200W
Chất liệu mặt bếp: Kính Ceramic - Schott Ceran (Đức)
Bảng điều khiển: Cảm ứng
Loại nồi nấu: Chỉ sử dụng loại nồi có đế nhiễm từ
Tính năng an toàn: Tự tắt bếp khi nước tràn đến bảng điều khiểnTự nhận diện kích cỡ đáy nồiTính năng dừng bếp tạm thời. Khóa bảng điều khiểnCảnh báo mặt bếp nóngCảnh báo khi không có nồi
Tiện ích: Công nghệ Inverter tiết kiệm điệnCó hẹn giờChức năng làm nóng nhanhBảng điều khiển cảm ứng trượt
Kích thước lỗ đá: Ngang 68 cm - Dọc 38 cm

Thương hiệu của: Đức
Hãng: Hafele.', 2010, N'hot-icon.gif', 16990000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (38, N'Quạt lửng Senko 7 cánh LTS1636 65W', 340, 469000, 20, N'Screenshot 2024-07-18 154720.png', N'Screenshot 2024-07-18 154730.png', N'Screenshot 2024-07-18 154701.png', N'Screenshot 2024-07-18 154750.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại quạt: Quạt lửng - 65W - 3 mức gió
Đường kính quạt: 7 cánh - 39 cm
Chế độ gió: Gió thường
Bảng điều khiển: Nút xoay
Loại motor: Bạc thau
Tiện ích: Điều chỉnh được chiều caoLồng quạt có khe hở nan quạt nhỏ. Công tắc và các phần bảo vệ mối nối dây làm bằng chất liệu chống cháy
Kích thước, khối lượng: Ngang 41 cm - Cao 85 - 97 cm - Sâu 41 cm - Nặng 4.4 kg

Thương hiệu của: Việt Nam
Năm ra mắt: 2017
Hãng: Senko. ', 2012, N'pngegg.png', 590000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (39, N'Quạt sạc điện Sunhouse 3 cánh SHD7115 15W', 340, 990000, 30, N'Screenshot 2024-07-18 155052.png', N'Screenshot 2024-07-18 155040.png', N'Screenshot 2024-07-18 155107.png', N'Screenshot 2024-07-18 155126.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại quạt: Quạt sạc điện - 15W - 3 mức gió
Đường kính quạt: 3 cánh - 28 cm
Chế độ gió: Gió thường
Bảng điều khiển: Nút nhấn
Loại motor: Bạc đạn
Tiện ích: Lồng quạt có khe hở nan quạt nhỏ. Có đèn LEDCó đèn báo khi sạc
Kích thước, khối lượng: Ngang 26 cm - Cao 50.5 cm - Sâu 26 cm - Nặng 2.1 kg

Thương hiệu của: Việt Nam
Năm ra mắt: 2021
Hãng: Sunhouse.', 2012, N'pngegg.png', 1420000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (40, N'Lò vi sóng Toshiba MWP-MM20P(BK) 20 lít', 287, 1350000, 28, N'Screenshot 2024-07-18 155439.png', N'Screenshot 2024-07-18 155508.png', N'Screenshot 2024-07-18 155457.png', N'Screenshot 2024-07-18 155520.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại lò: Lò vi sóng không nướng
Dung tích: 20 lít
Công suất vi sóng: 700W
Chất liệu khoang lò: Thép không gỉ
Chức năng chính: Rã đông, hâm
Bảng điều khiển: Nút vặn
Tiện ích: Khoang lò có đènHẹn giờ lên tới 35 phútChuông báo khi nấu xong
Thương hiệu của: Nhật Bản
Hãng: Toshiba.', 2013, N'pngegg.png', 1890000, NULL, NULL, NULL)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Quantity], [UnitPrice], [Discount], [Image1], [Image2], [Image3], [Image4], [Image5], [EnteredDay], [Discription], [CategoryId], [HotSale], [OldPrice], [Author], [Publishing], [Provider]) VALUES (41, N'Lò vi sóng Electrolux EMM20K22W 20 lít', 320, 1690000, 15, N'Screenshot 2024-07-18 160149.png', N'Screenshot 2024-07-18 160157.png', N'Screenshot 2024-07-18 160210.png', N'Screenshot 2024-07-18 160218.png', N'5sao.png', CAST(N'2024-07-18' AS Date), N'Loại lò: Lò vi sóng không nướng
Dung tích: 20 lít
Công suất vi sóng: 800W
Chất liệu khoang lò: Thép phủ sơn chống dính
Chức năng chính: Rã đông, hâm, nấu
Bảng điều khiển: Nút vặn
Tiện ích: Khoang lò có đènHẹn giờChuông báo khi nấu xong

Thương hiệu của: Thụy Điển
Hãng: Electrolux', 2013, N'pngegg.png', 1990000, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'CUST', N'Customers')
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'DIRE', N'Directors')
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK23fux5pe6yss1vck8iv9juegn]    Script Date: 7/18/2024 5:48:34 PM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UK23fux5pe6yss1vck8iv9juegn] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKef7fbpy09qu6267gf071q71we]    Script Date: 7/18/2024 5:48:34 PM ******/
ALTER TABLE [dbo].[Authorities] ADD  CONSTRAINT [UKef7fbpy09qu6267gf071q71we] UNIQUE NONCLUSTERED 
(
	[Username] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Products]
GO
ALTER TABLE [dbo].[FeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_FeedBacks_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[FeedBacks] CHECK CONSTRAINT [FK_FeedBacks_Accounts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_OrderDetails] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetails] ([OrderDetailId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_OrderDetails]
GO
ALTER TABLE [dbo].[Statitic]  WITH CHECK ADD  CONSTRAINT [FK_Statitic_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Statitic] CHECK CONSTRAINT [FK_Statitic_Orders]
GO
