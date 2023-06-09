USE [KDTB_1JO]
GO
/****** Object:  StoredProcedure [dbo].[ITEMMASTER_S]    Script Date: 2023-03-29 오후 4:23:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<황준영>
-- Create date: <2023-03-28>
-- Description:	<품목 정보 조회>
-- =============================================
CREATE PROCEDURE [dbo].[ITEMMASTER_S]
	@PLANTCODE VARCHAR(30),
	@ITEMTYPE VARCHAR(30),
	@ITEMNAME VARCHAR(30),
	@ITEMCODE VARCHAR(30)
AS
BEGIN
	SELECT PLANTCODE,ITEMCODE,ITEMNAME,ITEMTYPE 
	  FROM [2022_DC_EDU_KDTB]..TB_ItemMaster
	 WHERE PLANTCODE LIKE '%' + @PLANTCODE + '%'
	   AND ITEMTYPE  LIKE '%' + @ITEMTYPE + '%'
	   AND ITEMNAME  LIKE '%' + @ITEMNAME + '%'
	   AND ITEMCODE  LIKE '%' + @ITEMCODE + '%'
  GROUP BY PLANTCODE,ITEMCODE, ITEMNAME, ITEMTYPE
END
GO
/****** Object:  StoredProcedure [dbo].[ITEMMASTER_S2]    Script Date: 2023-03-29 오후 4:23:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<황준영>
-- Create date: <2023-03-28>
-- Description:	<품목 정보 조회>
-- =============================================
CREATE PROCEDURE [dbo].[ITEMMASTER_S2]
	@PLANTCODE VARCHAR(30),
	@ITEMTYPE VARCHAR(30),
	@ITEMNAME VARCHAR(30),
	@ITEMCODE VARCHAR(30),
	@USEFLAG VARCHAR(30)
AS
BEGIN
	SELECT PLANTCODE,ITEMCODE,ITEMNAME,ITEMTYPE,BASEUNIT,UNITCOST,UNITWGT,ITEMSPEC,INSPFLAG
	  FROM [2022_DC_EDU_KDTB]..TB_ItemMaster
	 WHERE PLANTCODE LIKE '%' + @PLANTCODE + '%'
	   AND ITEMTYPE  LIKE '%' + @ITEMTYPE + '%'
	   AND ITEMNAME  LIKE '%' + @ITEMNAME + '%'
	   AND ITEMCODE  LIKE '%' + @ITEMCODE + '%'
	   AND USEFLAG   LIKE '%' + @USEFLAG + '%'
  ORDER BY PLANTCODE
END
GO


USE [KDTB_2JO]
GO
/****** Object:  Table [dbo].[ALRAM]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRAM](
	[ID] [varchar](20) NULL,
	[DATETIME] [datetime] NULL,
	[MESSAGE] [varchar](200) NULL,
	[ALRAMFLAG] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGININFO]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGININFO](
	[IP] [varchar](20) NULL,
	[ID] [varchar](20) NOT NULL,
	[LOGINTIME] [datetime] NOT NULL,
	[LOGOUTTIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MESSENGER]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESSENGER](
	[ID] [varchar](20) NULL,
	[DATETIME] [datetime] NULL,
	[CONTENTS] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CODE]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CODE](
	[UPR_CD] [varchar](20) NOT NULL,
	[UPR_CD_NM] [varchar](50) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](20) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CODE_DTL]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CODE_DTL](
	[UPR_CD] [varchar](20) NOT NULL,
	[LWR_CD] [varchar](20) NOT NULL,
	[LWR_CD_NM] [varchar](200) NULL,
	[CD_VAL1] [nvarchar](50) NULL,
	[CD_VAL2] [nvarchar](50) NULL,
	[CD_VAL3] [nvarchar](50) NULL,
	[CD_VAL4] [nvarchar](50) NULL,
	[CD_VAL5] [nvarchar](50) NULL,
	[CD_VAL6] [nvarchar](50) NULL,
	[CD_VAL7] [nvarchar](50) NULL,
	[CD_VAL8] [nvarchar](50) NULL,
	[CD_VAL9] [nvarchar](50) NULL,
	[CD_VAL10] [nvarchar](50) NULL,
	[SORT_NO] [int] NULL,
	[REMARK] [varchar](200) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](20) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_FORM]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_FORM](
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[FORM] [varchar](50) NULL,
	[FIND] [int] NULL,
	[SV] [int] NULL,
	[DLT] [int] NULL,
	[NEW] [int] NULL,
	[RT] [int] NULL,
	[EX] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MENU]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MENU](
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[PART] [varchar](20) NULL,
	[MENU] [varchar](50) NULL,
	[TITLE] [varchar](50) NULL,
	[DATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PART]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PART](
	[PART_NO] [varchar](100) NOT NULL,
	[PART_NM] [varchar](200) NOT NULL,
	[OBTAIN] [varchar](20) NULL,
	[QUALITY] [varchar](100) NULL,
	[PART_SPEC] [varchar](100) NOT NULL,
	[UNIT] [varchar](20) NOT NULL,
	[MTRL_TYPE] [varchar](20) NULL,
	[MTRL_NO] [varchar](20) NULL,
	[REMARK] [varchar](500) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](20) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](20) NULL,
	[PMKG] [int] NULL,
 CONSTRAINT [PK_TB_PART] PRIMARY KEY CLUSTERED 
(
	[PART_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PLANT]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PLANT](
	[PLANT_CD] [varchar](10) NOT NULL,
	[PLANT_NM] [varchar](30) NULL,
	[REMARK] [varchar](500) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](20) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](20) NULL,
 CONSTRAINT [PK_TB_PLANT] PRIMARY KEY CLUSTERED 
(
	[PLANT_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCT_PLAN]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCT_PLAN](
	[PLANTCODE] [varchar](50) NULL,
	[PLANNO] [varchar](50) NULL,
	[ITEMCODE] [varchar](50) NULL,
	[UNITCODE] [varchar](50) NULL,
	[CHK] [varchar](50) NULL,
	[WORKCENTERCODE] [varchar](50) NULL,
	[ORDERNO] [varchar](50) NULL,
	[ORDERTEMP] [datetime] NULL,
	[ORDERWORKER] [varchar](50) NULL,
	[ORDERCLOSEFLAG] [char](1) NULL,
	[ORDERCLOSEDATE] [datetime] NULL,
	[MAKEDATE] [datetime] NULL,
	[MAKER] [varchar](50) NULL,
	[EDITDATE] [datetime] NULL,
	[EDITOR] [varchar](50) NULL,
	[PLANQTY] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROG_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROG_D](
	[BIZ_MENU_CODE] [varchar](10) NOT NULL,
	[SUB_MENU_CODE] [varchar](10) NOT NULL,
	[DLL_NAME] [varchar](50) NOT NULL,
	[SCREEN_ID] [varchar](20) NOT NULL,
	[SCREEN_NAME] [varchar](100) NULL,
	[DISPLAY_SEQ] [decimal](4, 0) NULL,
	[USE_YN] [char](1) NULL,
	[BTNFIND] [char](1) NULL,
	[BTNEXCEL] [char](1) NULL,
	[BTNCLEAR] [char](1) NULL,
	[BTNSAVE] [char](1) NULL,
	[BTNDELETE] [char](1) NULL,
	[BTNPRINT] [char](1) NULL,
	[BTNSCPRINT] [char](1) NULL,
	[IMAGEURI] [varchar](100) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROG_M]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROG_M](
	[BIZ_MENU_CODE] [varchar](4) NOT NULL,
	[SUB_MENU_CODE] [nvarchar](50) NOT NULL,
	[DISPLAY_SEQ] [decimal](4, 0) NULL,
	[BIZ_MENU_NAME] [varchar](30) NULL,
	[SUB_MENU_NAME] [nvarchar](50) NULL,
	[ISEXPAND] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROG_N]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROG_N](
	[NATION] [varchar](20) NOT NULL,
	[CONTROL_NAME] [varchar](50) NOT NULL,
	[LANGUAGE] [varchar](100) NULL,
	[USE_YN] [char](1) NULL,
	[DESCRIPTION] [varchar](200) NULL,
	[REMARK] [varchar](200) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROG_P]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROG_P](
	[USER_ID] [varchar](20) NOT NULL,
	[BIZ_MENU_CODE] [varchar](20) NOT NULL,
	[SUB_MENU_CODE] [varchar](20) NOT NULL,
	[DLL_NAME] [varchar](50) NOT NULL,
	[SCREEN_ID] [varchar](20) NOT NULL,
	[USE_GRANT_FLAG] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USER]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USER](
	[USER_ID] [varchar](20) NOT NULL,
	[USER_NM] [varchar](20) NULL,
	[USER_PWD] [varchar](20) NULL,
	[BIZ_GROUP] [varchar](10) NULL,
	[COMP_CD] [varchar](10) NULL,
	[DEPT_CD] [varchar](10) NULL,
	[POSITION] [varchar](10) NULL,
	[GRADE_CD] [varchar](10) NULL,
	[HP_NO] [varchar](20) NULL,
	[RETIREMENT] [char](1) NULL,
	[RETIREMENT_DATE] [varchar](10) NULL,
	[LOGIN_DATE] [smalldatetime] NULL,
	[IP_ADDRESS] [varchar](30) NULL,
	[COMPUTE_NAME] [varchar](50) NULL,
	[RMK] [varchar](100) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](20) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](20) NULL,
	[SETSKINSTYLE] [varchar](30) NULL,
	[WB_CD] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USER_R]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USER_R](
	[ID] [varchar](20) NOT NULL,
	[NAME] [varchar](20) NOT NULL,
	[PHONE] [varchar](30) NOT NULL,
	[SEX] [varchar](10) NOT NULL,
	[PART] [varchar](20) NOT NULL,
	[RANK] [varchar](20) NOT NULL,
	[FCOUNT] [int] NULL,
	[PICTURE] [image] NULL,
	[PW] [varchar](20) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_WB]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_WB](
	[PLANT_CD] [varchar](10) NOT NULL,
	[WC_CD] [varchar](10) NOT NULL,
	[WB_CD] [varchar](10) NOT NULL,
	[WB_NM] [varchar](30) NULL,
	[LINE_TYPE] [varchar](20) NULL,
	[REMARK] [varchar](500) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_WC]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_WC](
	[PLANT_CD] [varchar](10) NOT NULL,
	[WC_CD] [varchar](10) NOT NULL,
	[WC_NM] [varchar](30) NULL,
	[WC_TYPE] [varchar](20) NULL,
	[REMARK] [varchar](500) NULL,
	[USE_YN] [char](1) NULL,
	[CREATION_DATE] [smalldatetime] NULL,
	[CREATION_BY] [varchar](10) NULL,
	[UPDATE_DATE] [smalldatetime] NULL,
	[UPDATE_BY] [varchar](10) NULL,
 CONSTRAINT [PK_TB_WC] PRIMARY KEY CLUSTERED 
(
	[PLANT_CD] ASC,
	[WC_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_USER_R] ADD  CONSTRAINT [DF_TB_USER_ID]  DEFAULT ((0)) FOR [ID]
GO
ALTER TABLE [dbo].[TB_USER_R] ADD  CONSTRAINT [DF_TB_USER_FCOUNT]  DEFAULT ((0)) FOR [FCOUNT]
GO
/****** Object:  StoredProcedure [dbo].[Alram_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-16
-- Description:	알람 일괄 삭제
-- =============================================
CREATE   PROCEDURE [dbo].[Alram_D]
	@ID VARCHAR(20),  -- 아이디
	@DATE VARCHAR(40) -- 날짜

	

AS
BEGIN

	  DELETE ALRAM
	  WHERE ID = @ID
	  AND DATETIME BETWEEN @DATE+' 00:00:00'  AND @DATE+ ' 23:59:59'

	
END
GO
/****** Object:  StoredProcedure [dbo].[Alram_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-15
-- Description:	알람 저장
-- =============================================
CREATE   PROCEDURE [dbo].[Alram_I]
	@ID         VARCHAR(20),
	@DATETIME   VARCHAR(40),
	@MESSAGE    VARCHAR(200),
	@ALRAMFLAG  VARCHAR(20)
AS
BEGIN
	 INSERT INTO ALRAM
	             (ID,DATETIME, MESSAGE,ALRAMFLAG)
		   VALUES(@ID,@DATETIME, @MESSAGE, @ALRAMFLAG)
	 
	
END
GO
/****** Object:  StoredProcedure [dbo].[Alram_s]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-15
-- Description:	알람 조회
-- =============================================
CREATE    PROCEDURE [dbo].[Alram_s]
	@ID VARCHAR(20),
	@ST VARCHAR(40)
	--@ET VARCHAR(40)
AS
BEGIN
	SELECT DATETIME,
		   MESSAGE,
		   ALRAMFLAG
	  FROM ALRAM WITH(NOLOCK)
	 WHERE ID = @ID
	   AND DATETIME BETWEEN  @ST +' 00:00:00' AND @ST +' 23:59:59'
  ORDER BY DATETIME ASC
	  --AND  DATETIME BETWEEN  @ST +' 00:00:00' AND @ET +' 23:59:59'


	
END
GO
/****** Object:  StoredProcedure [dbo].[Alram_s1]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-16
-- Description:	알람 울리는 기능
-- =============================================
CREATE    PROCEDURE [dbo].[Alram_s1]
	@ID VARCHAR(20),
	@ND datetime
	
AS
BEGIN
	SELECT MESSAGE
	  FROM ALRAM WITH(NOLOCK)
	 WHERE ID = @ID
	   AND DATETIME = @ND
       AND ALRAMFLAG = 'Y'
	  


END
GO
/****** Object:  StoredProcedure [dbo].[Create_I1]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-13
-- Description:	회원가입 저장
-- =============================================
CREATE   PROCEDURE [dbo].[Create_I1]

@ID         VARCHAR(30), -- 아이디
@PW         VARCHAR(30), -- 패스워드   
@NAME       VARCHAR(30), -- 이름
@PHONE      VARCHAR(30), -- 휴대폰번호
@SEX 		VARCHAR(30), -- 성별
@PART 		VARCHAR(30), -- 부서
@RANK		VARCHAR(30) -- 직급


--@LANG    VARCHAR(10) = 'KO'

AS
BEGIN

	INSERT INTO TB_USER_R
	             (ID, PW, NAME ,PHONE, SEX,
				  PART, RANK)
		   VALUES(@ID, @PW, @NAME ,@PHONE, @SEX,
				  @PART, @RANK)
	  
	
END
GO
/****** Object:  StoredProcedure [dbo].[Create_S1]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-13
-- Description:	아이디 중복
-- =============================================
CREATE   PROCEDURE [dbo].[Create_S1]
	@ID VARCHAR(20)
AS
BEGIN
	SELECT ID
	  FROM TB_USER_R WITH(NOLOCK)
	 WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[FORM_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-17
-- Description:	FORM 등록
-- =============================================
CREATE PROCEDURE [dbo].[FORM_D]
	@FORM VARCHAR(30)

AS
BEGIN
	DELETE FROM TB_FORM
		WHERE FORM = @FORM
END
GO
/****** Object:  StoredProcedure [dbo].[FORM_IP]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-17
-- Description:	FORM 등록
-- =============================================
CREATE PROCEDURE [dbo].[FORM_IP]
	@TYPE VARCHAR(30),
	@TITLE VARCHAR(30),
	@FORM VARCHAR(30),
	@FIND INT,
	@SV	  INT,
	@DLT  INT,
	@NEW  INT,
	@RT   INT,
	@EX   INT
AS
BEGIN
	IF (@TYPE = 'I')
	BEGIN
	INSERT INTO TB_FORM(TITLE,FORM,FIND,SV,DLT,NEW,RT) VALUES(@TITLE,@FORM,@FIND,@SV,@DLT,@NEW,@RT)
	END
	ELSE IF (@TYPE = 'U')
	BEGIN
	UPDATE TB_FORM
	   SET FORM = @FORM
	      ,FIND = @FIND
		  ,SV   = @SV
		  ,DLT  = @DLT
		  ,NEW  = @NEW
		  ,RT   = @RT
		  ,EX   = @EX
	 WHERE TITLE = @TITLE
	 END
END
GO
/****** Object:  StoredProcedure [dbo].[FORM_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	화면 로드
-- =============================================
CREATE PROCEDURE [dbo].[FORM_S]
	@TITLE VARCHAR(50)
AS
BEGIN
	SELECT FORM
		  ,FIND
		  ,NEW
		  ,DLT
		  ,SV
		  ,RT
		  ,EX
	  FROM TB_FORM WITH(NOLOCK)
	 WHERE TITLE = @TITLE
END

GO
/****** Object:  StoredProcedure [dbo].[Login_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-13
-- Description:	Login
-- =============================================
CREATE PROCEDURE [dbo].[Login_S]
	@ID VARCHAR(20),
	@PW VARCHAR(20)
AS
BEGIN
	SELECT ID
	  FROM TB_USER_R WITH(NOLOCK)
	 WHERE ID = @ID
	  AND PW = @PW


	UPDATE TB_USER_R
	   SET FCOUNT  =  0
	 WHERE ID = @ID
	   AND PW = @PW
END
GO
/****** Object:  StoredProcedure [dbo].[Login_S1]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-14
-- Description:	로그인 실패기록
-- =============================================
CREATE   PROCEDURE [dbo].[Login_S1]
	@ID VARCHAR(20)
AS
BEGIN
	SELECT FCOUNT
	  FROM TB_USER_R WITH(NOLOCK)
	 WHERE ID = @ID
	  
END
GO
/****** Object:  StoredProcedure [dbo].[Login_U]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-14
-- Description:	회원가입 틀렸을때 비밀번호 
-- =============================================
CREATE     PROCEDURE [dbo].[Login_U]
	@ID VARCHAR(20)
	
AS
BEGIN
	UPDATE TB_USER_R
	   SET FCOUNT  =  FCOUNT + 1
     WHERE ID      = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[LoginList_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-14
-- Description:	로그인 했을때 기록 
-- =============================================
CREATE    PROCEDURE [dbo].[LoginList_I]
	@ID VARCHAR(20),
	@IP VARCHAR(20)
	
AS
BEGIN
	

	 INSERT INTO LOGININFO
	             (IP,ID, LOGINTIME)
		   VALUES(@IP,@ID, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[LoginList_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-14
-- Description:	로그인 이력 조회 
-- =============================================
CREATE PROCEDURE [dbo].[LoginList_S]
	@ID    VARCHAR(20),
	@NAME  VARCHAR(20),
	@START VARCHAR(20),
	@END   VARCHAR(20)
	
AS
BEGIN
	SELECT A.IP,
		   A.ID,
		   B.NAME,
		   A.LOGINTIME,
		   A.LOGOUTTIME
	  FROM LOGININFO A WITH(NOLOCK)  LEFT JOIN TB_USER_R B WITH(NOLOCK)
											ON A.ID = B.ID
     WHERE A.ID  LIKE '%' + @ID  + '%'
	   AND B.NAME  LIKE '%' + @NAME + '%'
	   AND A.LOGINTIME   BETWEEN @START+' 00:00:00'  AND @END+ ' 23:59:59'
  ORDER BY A.LOGINTIME DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[LoginList_S2]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-14
-- Description:	자동 로그인 확인
-- =============================================
CREATE PROCEDURE [dbo].[LoginList_S2]
	@IP    VARCHAR(20)
	
AS
BEGIN
	SELECT ID
	  FROM LOGININFO WITH(NOLOCK)
     WHERE IP = @IP
	   AND LOGOUTTIME IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[LoginList_U]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-14
-- Description:	로그아웃 했을때 기록 
-- =============================================
CREATE    PROCEDURE [dbo].[LoginList_U]
	@ID VARCHAR(20)
	
AS
BEGIN
	

	UPDATE LOGININFO
	   SET LOGOUTTIME  =  GETDATE()
     WHERE ID          = @ID
	   AND LOGOUTTIME is null
	 
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	화면 등록 삭제
-- =============================================
CREATE PROCEDURE [dbo].[MENU_D]
	@PART  VARCHAR(20),
	@TITLE VARCHAR(30),
	@NUM  INT
AS
BEGIN
	DELETE TB_MENU
	 WHERE PART = @PART
	   AND NUM = @NUM
	if (SELECT count(*) FROM TB_FORM WHERE TITLE = @TITLE) = 1 return

	DELETE TB_FORM
	 WHERE TITLE = @TITLE
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	화면 등록
-- =============================================
CREATE PROCEDURE [dbo].[MENU_I]
	@PART VARCHAR(20),
	@MENU VARCHAR(50),
	@TITLE VARCHAR(50)
AS
BEGIN
	INSERT INTO TB_MENU(PART,MENU,TITLE,DATE)
			VALUES (@PART,@MENU,@TITLE,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	메뉴 조회
-- =============================================
CREATE PROCEDURE [dbo].[MENU_S]
	@ID VARCHAR(20)
AS
BEGIN
	
	SELECT MENU,
		   TITLE
	  FROM TB_MENU
	 WHERE PART = (SELECT PART
					 FROM TB_USER_R
				    WHERE ID = @ID)
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_S1]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	메뉴 리스트 조회
-- =============================================
CREATE PROCEDURE [dbo].[MENU_S1]
	@PART  VARCHAR(20),
	@MENU  VARCHAR(50),
	@TITLE VARCHAR(50)

AS
BEGIN
	SELECT *
	  FROM TB_MENU
	 WHERE PART LIKE  '%' + @PART + '%'
	   AND MENU LIKE  '%' + @MENU + '%'
	   AND TITLE LIKE '%' + @TITLE + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[MENU_U]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-16
-- Description:	화면 등록 수정
-- =============================================
CREATE PROCEDURE [dbo].[MENU_U]
	@PART VARCHAR(20),
	@MENU VARCHAR(50),
	@TITLE VARCHAR(50),
	@DATE VARCHAR(50)
AS
BEGIN
	UPDATE TB_MENU
	   SET MENU = @MENU
	      ,TITLE = @TITLE
		  ,DATE = GETDATE()
	 WHERE PART = @PART
	   AND DATE = CONVERT(DATETIME,@DATE)
END
GO
/****** Object:  StoredProcedure [dbo].[MESSENGER_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-16
-- Description:	메세지 보내기
-- =============================================
CREATE   PROCEDURE [dbo].[MESSENGER_I]
	@ID         VARCHAR(20),
	@DATETIME   VARCHAR(40),
	@CONTENTS   VARCHAR(200)
AS
BEGIN
	 INSERT INTO MESSENGER
	             (ID,DATETIME,CONTENTS)
		   VALUES(@ID,@DATETIME, @CONTENTS)
	 
	
END
GO
/****** Object:  StoredProcedure [dbo].[MESSENGER_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-16
-- Description:	메신저 조회
-- =============================================
CREATE      PROCEDURE [dbo].[MESSENGER_S] 
	@DATETIME VARCHAR(40)
	
AS
BEGIN
	SELECT B.NAME,
	       B.PART,
		   B.RANK,
		   A.DATETIME,
		   A.CONTENTS
	  FROM MESSENGER A WITH(NOLOCK) LEFT JOIN TB_USER_R B WITH(NOLOCK)
	                                               ON A.ID = B.ID
	 WHERE DATETIME BETWEEN @DATETIME +' 00:00:00' AND @DATETIME +' 23:59:59'
  ORDER BY DATETIME ASC   --DESC ASC


  
	  


	
END
GO
/****** Object:  StoredProcedure [dbo].[PART_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-28
-- Description:	조회화면
-- =============================================
CREATE    PROCEDURE [dbo].[PART_S]
	
	@PART_NO     VARCHAR(50),
	@PART_NM     VARCHAR(50),
	@LWR_CD_NM   VARCHAR(50),
	@LWR_CD_NM2  VARCHAR(50),
	@USE_YN      VARCHAR(50)


AS
BEGIN
	SELECT A.PART_NO
	      ,A.PART_NM
		  ,DBO.FUN_CODE_NAME('OBTAIN',A.OBTAIN) AS OBTAIN_NM
	      --,C.LWR_CD_NM AS OBTAIN_NM
		   ,DBO.FUN_CODE_NAME('QUALITY',A.QUALITY) AS QUALITY
	      --,D.LWR_CD_NM AS QUALITY
	      ,A.PART_SPEC
	      ,A.UNIT
		  ,DBO.FUN_CODE_NAME('MTRL_NO',A.MTRL_NO) AS MTRL_NO_NM
	      --,E.LWR_CD_NM AS MTRL_TYPE
		  ,DBO.FUN_CODE_NAME('MTRL_TYPE',A.MTRL_TYPE) AS MTRL_TYPE
	      --,     B.LWR_CD_NM AS MTRL_NO_NM
	      ,A.REMARK
	      ,A.USE_YN
	      ,A.CREATION_DATE
	      ,A.CREATION_BY
	      ,A.UPDATE_DATE
	      ,A.UPDATE_BY
	      ,A.PMKG
	      ,A.MTRL_NO    AS   MTRL_NO2         
	      ,A.OBTAIN     AS   OBTAIN_NM2       
	      ,A.QUALITY    AS   QUALITY2         
	      ,A.MTRL_TYPE  AS   MTRL_TYPE2       
	
	  FROM TB_PART  A WITH(NOLOCK) 
	                          
	 WHERE A.PART_NO     LIKE '%'+ @PART_NO +'%'  
	   AND ISNULL(A.PART_NM,'')     LIKE '%'+ @PART_NM+'%'  
	   AND ISNULL(A.MTRL_TYPE,'')   LIKE '%'+ @LWR_CD_NM+'%'  
	   AND ISNULL(A.MTRL_NO,'')   LIKE '%'+ @LWR_CD_NM2+'%'
	   AND ISNULL(A.USE_YN,'')      LIKE '%'+ @USE_YN+'%'  

	 
END




GO
/****** Object:  StoredProcedure [dbo].[PLANT_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공장 화면
-- =============================================
CREATE   PROCEDURE [dbo].[PLANT_S]
	
	@PLANT     VARCHAR(50),
	@WORKCODE  VARCHAR(50),
	@WORKNAME  VARCHAR(50),
	@USE       VARCHAR(50)

AS
BEGIN
	SELECT B.PLANT_CD,
	B.WC_NM,
	B.USE_YN,
	B.CREATION_BY,
	B.UPDATE_BY,
	B.WC_CD,
	A.PLANT_NM
	FROM dbo.TB_PLANT A WITH(NOLOCK) LEFT JOIN  dbo.TB_WC B WITH(NOLOCK)
	ON(A.PLANT_CD = B.PLANT_CD)
	WHERE A.PLANT_CD LIKE '%'+@PLANT+'%'  
      AND B.WC_CD    LIKE '%'+@WORKCODE+'%'
	  AND B.WC_NM    LIKE '%'+@WORKNAME+'%'
	  AND B.USE_YN   LIKE '%'+@USE+'%'

	 
END


GO
/****** Object:  StoredProcedure [dbo].[PRODUCT_PLAN_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-30
-- Description:	생산계획 삭제
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCT_PLAN_D]
	@PLANTCODE VARCHAR(50),
	@PLANNO VARCHAR(50)
AS
BEGIN
	DELETE FROM TB_PRODUCT_PLAN 
	WHERE PLANTCODE = @PLANTCODE 
	  AND PLANNO = @PLANNO
END
GO
/****** Object:  StoredProcedure [dbo].[PRODUCT_PLAN_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-30
-- Description:	생산계획 저장
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCT_PLAN_I] 
	@CHK            VARCHAR(50),
	@WORKCENTERCODE VARCHAR(50),
	@ID             VARCHAR(30),
	@ORDERCLOSEFLAG INT,
	@PLANTCODE VARCHAR(50),
	@PLANNO VARCHAR(50),
	@ITEMCODE VARCHAR(50)
AS
BEGIN
	
	DECLARE @LD_NOWDATE DATETIME    
	       ,@LS_NOWDATE VARCHAR(10) 
		   ,@ORDERNO VARCHAR(20) 
		   ,@_PLANNO VARCHAR(20)
		   ,@COUNT INT
	    SET @LD_NOWDATE = GETDATE()
		SET @LS_NOWDATE = CONVERT(VARCHAR,@LD_NOWDATE,23)

		SELECT TOP 1 @ORDERNO = ORDERNO
		FROM TB_PRODUCT_PLAN
		WHERE MAKEDATE = REPLACE(@LS_NOWDATE,'-','')

		SET @ORDERNO = CONVERT(VARCHAR,CONVERT(INT,@ORDERNO) + 1)

		SELECT TOP 1 @_PLANNO = PLANNO 
		FROM TB_PRODUCT_PLAN
		WHERE MAKEDATE = REPLACE(@LS_NOWDATE,'-','')

		SET @_PLANNO = CONVERT(VARCHAR,CONVERT(INT,@_PLANNO) + 1)
	if (@CHK = 'True')
	BEGIN
	UPDATE TB_PRODUCT_PLAN
	   SET CHK = @CHK
	      ,WORKCENTERCODE = @WORKCENTERCODE
		  ,ORDERNO = ISNULL(@ORDERNO, REPLACE(@LS_NOWDATE,'-','') + '0')
		  ,ORDERTEMP = GETDATE()
		  ,ORDERWORKER = @ID
		  ,ORDERCLOSEFLAG = @ORDERCLOSEFLAG
		  ,ORDERCLOSEDATE = @LS_NOWDATE
		  ,EDITDATE = @LS_NOWDATE
		  ,EDITOR = @ID
	WHERE PLANTCODE = @PLANTCODE
	  AND PLANNO = @PLANNO
	IF(@@ROWCOUNT = 0)
	BEGIN
		INSERT INTO TB_PRODUCT_PLAN (PLANTCODE,PLANNO,ITEMCODE,UNITCODE,CHK,MAKEDATE , MAKER)
								VALUES (@PLANTCODE,ISNULL(@_PLANNO,REPLACE(@LS_NOWDATE,'-','') + '0') , @ITEMCODE, 'EA', 0,  REPLACE(@LS_NOWDATE,'-',''), @ID)
	END
	END
	ELSE
	BEGIN
		UPDATE TB_PRODUCT_PLAN
	   SET CHK = @CHK
	      ,WORKCENTERCODE = ''
		  ,ORDERNO = ''
		  ,ORDERTEMP = ''
		  ,ORDERWORKER = ''
		  ,ORDERCLOSEFLAG = 'False'
		  ,ORDERCLOSEDATE = ''
		  ,EDITDATE = ''
		  ,EDITOR = @ID
	WHERE PLANTCODE = @PLANTCODE
	  AND PLANNO = @PLANNO
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PRODUCT_PLAN_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		황준영
-- Create date: 2023-03-29
-- Description:	생산계획 조회
-- =============================================
CREATE PROCEDURE [dbo].[PRODUCT_PLAN_S] 
	@PLANTCODE VARCHAR(50),
	@ORDERNO VARCHAR(50),
	@WORKCENTERCODE VARCHAR(50),
	@ITEMCODE VARCHAR(50),
	@ORDERCLOSEFLAG VARCHAR(50)
AS
BEGIN
	SELECT PLANTCODE
		  ,PLANNO
		  ,ITEMCODE
		  ,UNITCODE
		  ,CHK
		  ,WORKCENTERCODE
		  ,ORDERNO
		  ,ORDERTEMP
		  ,ORDERWORKER
		  ,ORDERCLOSEFLAG
		  ,ORDERCLOSEDATE
		  ,MAKEDATE
		  ,MAKER
		  ,EDITDATE
		  ,EDITOR
	FROM TB_PRODUCT_PLAN WITH(NOLOCK)
   WHERE PLANTCODE      LIKE '%' + @PLANTCODE	   + '%'
     AND ISNULL(WORKCENTERCODE,'') LIKE '%' + @WORKCENTERCODE + '%'
	 AND ITEMCODE       LIKE '%' + @ITEMCODE	   + '%'
	 AND ISNULL(ORDERCLOSEFLAG,'') LIKE '%' + @ORDERCLOSEFLAG + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[Profil_PwCheck_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		김수환
-- Create date: 2023-03-16
-- Description:	프로필 수정 전 비밀번호 확인
-- =============================================

CREATE PROCEDURE [dbo].[Profil_PwCheck_S] 

@ID			VARCHAR(20), -- 아이디	
@PW         VARCHAR(20)

AS
BEGIN
	
	    SELECT COUNT(*) AS CHECKFLAG
	      FROM TB_USER_R WITH(NOLOCK)
		 WHERE ID = @ID
		   AND PW = @PW

END

GO
/****** Object:  StoredProcedure [dbo].[Profil_U]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		김수환
-- Create date: 2023-03-16
-- Description:	프로파일수정
-- =============================================
CREATE PROCEDURE [dbo].[Profil_U] 
	
@ID         VARCHAR(30), -- 아이디  
@NAME       VARCHAR(30), -- 이름
@PHONE      VARCHAR(30), -- 휴대폰번호
@SEX 		VARCHAR(30), -- 성별
@PART 		VARCHAR(30), -- 부서
@RANK		VARCHAR(30), -- 직급
@PW			VARCHAR(30)	 -- 비밀번호
--@LANG    VARCHAR(10) = 'KO'

AS
BEGIN
	
	IF (SELECT COUNT(*)
	      FROM TB_USER_R WITH(NOLOCK)
		 WHERE ID = @ID) <> 1
	BEGIN
		RETURN;
	END	

	UPDATE TB_USER_R
	   SET NAME = @NAME
		 ,PHONE = @PHONE
		   ,SEX = @SEX
		   ,PW  = @PW
	   WHERE ID = @ID
	
END
GO
/****** Object:  StoredProcedure [dbo].[TB_PART_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-29
-- Description:	품번 삭제
-- =============================================
CREATE      PROCEDURE [dbo].[TB_PART_D]
	@PART_NO VARCHAR(20)  -- 공장코드
	
	

AS
BEGIN

	  DELETE TB_PART
	   WHERE PART_NO = @PART_NO
END

GO
/****** Object:  StoredProcedure [dbo].[TB_PART_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공정 리스트 수정
-- =============================================
CREATE     PROCEDURE [dbo].[TB_PART_I]


@PART_NO      VARCHAR(30),      
@PART_NM	  VARCHAR(30),		
@OBTAIN	      VARCHAR(30),		  
@QUALITY	  VARCHAR(30),		
@PART_SPEC	  VARCHAR(30),		
@UNIT		  VARCHAR(30),		
@MTRL_TYPE	  VARCHAR(30),
@MTRL_NO	  VARCHAR(30),
@REMARK		  VARCHAR(30),		
@USE_YN		  VARCHAR(30),		
@PMKG		  VARCHAR(30)



AS
BEGIN

	UPDATE TB_PART
	   SET PART_NM        =  @PART_NM, 
	       OBTAIN        =  @OBTAIN,
		   QUALITY       =  @QUALITY,
		   PART_SPEC 	 =  @PART_SPEC,
		   UNIT 	     =  @UNIT,
		   MTRL_TYPE 	 =  @MTRL_TYPE,
		   MTRL_NO 	     =  @MTRL_NO,
		   REMARK 	     =  @REMARK,
		   USE_YN 	     =  @USE_YN
     WHERE PART_NO       =  @PART_NO  
	IF (@@ROWCOUNT = 0)
	BEGIN
	  INSERT INTO TB_PART(PART_NO,	PART_NM,	OBTAIN,	    QUALITY,	PART_SPEC,	UNIT,	MTRL_TYPE,	    MTRL_NO,	REMARK,	    USE_YN,	    PMKG)
			 VALUES     (@PART_NO,	@PART_NM,	@OBTAIN,	@QUALITY,	@PART_SPEC,	@UNIT,	@MTRL_TYPE ,	@MTRL_NO,	@REMARK,	@USE_YN,	@PMKG)
	END
	
END






GO
/****** Object:  StoredProcedure [dbo].[TB_WB_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공정관리 삭제
-- =============================================
CREATE       PROCEDURE [dbo].[TB_WB_D]
	@PLANTCODE VARCHAR(20),  -- 공장코드
	@WORKCODE VARCHAR(40), -- 작업장코드
	@WOBKCODE VARCHAR(40), -- ??
	@USE      VARCHAR(40)
	


	
	

AS
BEGIN

	  DELETE TB_WB
	   WHERE PLANT_CD = @PLANTCODE
	   AND WC_CD = @WORKCODE
	   AND WB_CD = @WOBKCODE
	   AND USE_YN = @USE
END

GO
/****** Object:  StoredProcedure [dbo].[TB_WB_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공정 리스트 수정
-- =============================================
CREATE   PROCEDURE [dbo].[TB_WB_I]


@PLANTCODE    VARCHAR(30),        --공장코드
@WORKCODE	  VARCHAR(30),		  --작업장코드
@WORBNAME	  VARCHAR(30),		  --공정 명
@WORBCODE	  VARCHAR(30),		  --공정 코드
@LINETYPE	  VARCHAR(30),		  --공정 구분명
@REMARK		  VARCHAR(30),		  --비고
@USEYN		  VARCHAR(30)		  --사용유무






AS
BEGIN

	UPDATE TB_WB
	   SET WB_NM         =  @WORBNAME, 
	       LINE_TYPE     =  @LINETYPE,
		   REMARK        =  @REMARK,
		   USE_YN 	     =  @USEYN
     WHERE PLANT_CD      =  @PLANTCODE  
	   AND WC_CD         =  @WORKCODE
	   AND WB_CD         =  @WORBCODE
	IF (@@ROWCOUNT = 0)
	BEGIN
	  INSERT INTO TB_WB(PLANT_CD ,   WC_CD ,    WB_CD ,    WB_NM,      LINE_TYPE, REMARK,   USE_YN)
			 VALUES     (@PLANTCODE, @WORKCODE, @WORBCODE, @WORBNAME,  @LINETYPE, @REMARK,  @USEYN)
	END
	
END




GO
/****** Object:  StoredProcedure [dbo].[TB_WB_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공정 조회
-- =============================================
CREATE     PROCEDURE [dbo].[TB_WB_S]
	
	@PLANT     VARCHAR(50),
	@WORKCODE  VARCHAR(50),
	@LINE_TYPE  VARCHAR(50),
	@USE       VARCHAR(50)

AS
BEGIN
	--SELECT  A.WB_CD, A.LINE_TYPE, A.PLANT_CD, B.PLANT_NM, C.WC_CD, C.WC_NM, A.WB_NM, D.LWR_CD_NM AS LINE_TYPE_NM, A.REMARK, A.USE_YN, A. CREATION_DATE, A.CREATION_BY, A.UPDATE_BY 
	--		  FROM TB_WB A WITH(NOLOCK) LEFT JOIN TB_PLANT B WITH(NOLOCK) 
	--		                                   ON A.PLANT_CD = B.PLANT_CD 
	--		                            LEFT JOIN TB_WC     C WITH(NOLOCK)
	--		                                   ON A.WC_CD    = C.WC_CD    
	--		                            LEFT JOIN TB_CODE_DTL D WITH(NOLOCK)
	--		                                   ON D.UPR_CD = 'LINE_TYPE'  
	--		                                  AND A.LINE_TYPE = D.LWR_CD  
	--WHERE A.PLANT_CD      LIKE '%'+@PLANT+'%'  
 --     AND ISNULL(C.WC_CD,'')         LIKE '%'+@WORKCODE+'%'
	--  AND ISNULL(D.LWR_CD_NM,'')     LIKE '%'+@LINE_TYPE+'%'
	--  AND A.USE_YN        LIKE '%'+@USE+'%'


	
	
	SELECT  A.WB_CD, 
			A.LINE_TYPE, 
			A.PLANT_CD, 
			B.PLANT_NM, 
			C.WC_CD, 
			C.WC_NM, 
			A.WB_NM, 
			D.LWR_CD_NM AS LINE_TYPE_NM,
			A.REMARK, 
			A.USE_YN,
			A. CREATION_DATE, 
			A.CREATION_BY, 
			A.UPDATE_BY 
			FROM TB_WB A WITH(NOLOCK) LEFT JOIN TB_PLANT B WITH(NOLOCK) 
			                                 ON A.PLANT_CD = B.PLANT_CD 
			                          LEFT JOIN TB_WC     C WITH(NOLOCK)
			                                 ON A.WC_CD    = C.WC_CD 
											AND A.PLANT_CD = C.PLANT_CD
			                          LEFT JOIN TB_CODE_DTL D WITH(NOLOCK)
			                                 ON D.UPR_CD = 'LINE_TYPE'  
			                                AND A.LINE_TYPE = D.LWR_CD  

	WHERE A.PLANT_CD      LIKE '%'+@PLANT+'%'  
      AND ISNULL(C.WC_CD,'')         LIKE '%'+@WORKCODE+'%'
	  AND ISNULL(D.LWR_CD_NM,'')     LIKE '%'+@LINE_TYPE+'%'
	  AND A.USE_YN        LIKE '%'+@USE+'%'
	ORDER BY A.PLANT_CD,C.WC_CD


END




	
      


GO
/****** Object:  StoredProcedure [dbo].[TB_WC_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	공정관리 삭제
-- =============================================
CREATE       PROCEDURE [dbo].[TB_WC_D]
	@PLANTCODE VARCHAR(20),  -- 공장코드
	@WORKCODE VARCHAR(40) -- 작업장코드


	
	

AS
BEGIN

	  DELETE TB_WC 
	   WHERE PLANT_CD = @PLANTCODE
	   AND WC_CD = @WORKCODE
END

GO
/****** Object:  StoredProcedure [dbo].[TB_WC_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-22
-- Description:	작업장 리스트 수정
-- =============================================
CREATE     PROCEDURE [dbo].[TB_WC_I]

@PLANTCODE VARCHAR(30), -- 공장코드 
@WORKCODE  VARCHAR(30), -- 작업장 코드 
@WORKNAME  VARCHAR(30), -- 작업장 이름
@USE_YN    VARCHAR(30)  -- 사용유무

--@LANG    VARCHAR(10) = 'KO'






AS
BEGIN

	UPDATE TB_WC
	   SET WC_NM         =  @WORKNAME, 
		   USE_YN 	     =  @USE_YN
     WHERE PLANT_CD      =  @PLANTCODE  
	   AND WC_CD         =  @WORKCODE
	IF (@@ROWCOUNT = 0)
	BEGIN
	  INSERT INTO TB_WC (PLANT_CD , WC_CD , WC_NM , USE_YN)
			 VALUES     (@PLANTCODE, @WORKCODE, @WORKNAME, @USE_YN)
	END
	
END


GO
/****** Object:  StoredProcedure [dbo].[USERLIST_D]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-13
-- Description:	로그인 리스트 삭제
-- =============================================
CREATE   PROCEDURE [dbo].[USERLIST_D]
	@ID VARCHAR(20)  -- 아이디

	

AS
BEGIN

	  DELETE TB_USER_R
	  WHERE ID = @ID
	  
	
END
GO
/****** Object:  StoredProcedure [dbo].[USERLIST_I]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-13
-- Description:	로그인 리스트 수정
-- =============================================
CREATE   PROCEDURE [dbo].[USERLIST_I]

@ID         VARCHAR(30), -- 아이디
@PW         VARCHAR(30), -- 패스워드   
@NAME       VARCHAR(30), -- 이름
@PHONE      VARCHAR(30), -- 휴대폰번호
@SEX 		VARCHAR(30), -- 성별
@PART 		VARCHAR(30), -- 부서
@RANK		VARCHAR(30), -- 직급
@FCOUNT		VARCHAR(30) -- 비밀번호 오류 횟수

--@LANG    VARCHAR(10) = 'KO'

AS
BEGIN

	 UPDATE TB_USER_R
	   SET PW      =  @PW,    
		   NAME    =  @NAME,  
		   PHONE   =  @PHONE, 
		   SEX 	   =  @SEX, 	
		   PART    =  @PART, 	
		   RANK    =  @RANK,	
		   FCOUNT  =  @FCOUNT
     WHERE ID      = @ID	
	  
	
END
GO
/****** Object:  StoredProcedure [dbo].[USERLIST_S]    Script Date: 2023-03-30 오후 12:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		박성진
-- Create date: 2023-03-13
-- Description:	로그인 리스트 조회
-- =============================================
CREATE PROCEDURE [dbo].[USERLIST_S]

  @NAME VARCHAR(20),   -- 이름
  @PART VARCHAR(20),   -- 부서
  @RANK VARCHAR(20)    -- 직급

AS
BEGIN
	SELECT ID,
		   PW,
		   NAME,
		   PHONE,
		   SEX,
		   PART,
		   RANK,
		   FCOUNT
	  FROM TB_USER_R
	 WHERE NAME LIKE '%' + @NAME + '%'
	   AND PART LIKE '%' + @PART + '%'
	   AND RANK LIKE '%' + @RANK + '%'
	
END
GO