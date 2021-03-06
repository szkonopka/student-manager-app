USE [SzymonKonopkaLab5]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 17.12.2017 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](63) NULL,
	[DayLength] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 17.12.2017 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grades](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumberEquivalent] [int] NULL,
	[LetterEquivalent] [varchar](2) NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 17.12.2017 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[GradeID] [int] NULL,
 CONSTRAINT [PK_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 17.12.2017 16:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](63) NOT NULL,
	[Surname] [varchar](63) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[City] [varchar](63) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([ID], [Name], [DayLength]) VALUES (1, N'Arytmetyka komputerowa', 30)
INSERT [dbo].[Courses] ([ID], [Name], [DayLength]) VALUES (2, N'Bazy danych', 20)
INSERT [dbo].[Courses] ([ID], [Name], [DayLength]) VALUES (3, N'Analiza matematyczna', 45)
INSERT [dbo].[Courses] ([ID], [Name], [DayLength]) VALUES (4, N'Programowanie obiektowe', 30)
INSERT [dbo].[Courses] ([ID], [Name], [DayLength]) VALUES (5, N'Zaawans. aspekty JAVY', 45)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (1, 1, N'F')
INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (2, 2, N'E')
INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (3, 3, N'D')
INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (4, 4, N'C')
INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (5, 5, N'B')
INSERT [dbo].[Grades] ([ID], [NumberEquivalent], [LetterEquivalent]) VALUES (7, 6, N'A')
SET IDENTITY_INSERT [dbo].[Grades] OFF
SET IDENTITY_INSERT [dbo].[StudentCourses] ON 

INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (1, 1, 1, 4)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (2, 1, 2, 5)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (3, 1, 3, 5)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (4, 1, 4, 3)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (5, 2, 2, 4)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (6, 2, 3, 3)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (7, 2, 4, 5)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (9, 3, 1, 3)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (10, 3, 4, 5)
INSERT [dbo].[StudentCourses] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (11, 3, 5, 5)
SET IDENTITY_INSERT [dbo].[StudentCourses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (1, N'Piotr', N'Konopka', CAST(N'1996-05-01' AS Date), N'Racibórz')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (2, N'Grzegorz', N'Sikpiński', CAST(N'1989-04-21' AS Date), N'Racibórz')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (3, N'Adam', N'Kowalski', CAST(N'1995-03-12' AS Date), N'Warszawa')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (6, N'Marta', N'Kozłowska', CAST(N'1994-12-03' AS Date), N'Gdańsk')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (8, N'Marian', N'Dąbek', CAST(N'1991-05-07' AS Date), N'Lubin')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (9, N'Marek', N'Zeee', CAST(N'1902-01-11' AS Date), N'Zabrze')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (10, N'Tomasz', N'Gwiazda', CAST(N'1980-02-02' AS Date), N'Lubin')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (11, N'Andżela', N'Chruśniak', CAST(N'1990-07-03' AS Date), N'Gdynia')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (12, N'Eeeeee', N'Eeeeee', CAST(N'1967-12-12' AS Date), N'Tatooine')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (13, N'Marta', N'Eeeeee', CAST(N'1990-01-01' AS Date), N'Tatooine')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (14, N'Szymonek', N'Konopka', CAST(N'1996-05-07' AS Date), N'Wrocław')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (15, N'Grzegorz', N'Sablewski', CAST(N'1999-01-01' AS Date), N'Racibórz')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (16, N'Szymek', N'Konopka', CAST(N'1996-07-05' AS Date), N'Wrocław')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (17, N'Marcin', N'Gortat', CAST(N'1979-03-03' AS Date), N'Los Angeles')
INSERT [dbo].[Students] ([ID], [Name], [Surname], [DateOfBirth], [City]) VALUES (18, N'Miłosz', N'Biernat', CAST(N'1995-12-03' AS Date), N'Zawalne')
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Courses]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Grades] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grades] ([ID])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Grades]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Students]
GO
