/*SPARES*/

/*------------------------------------------------------------------Country Subdivision Type table*/

/*Drawn from ISO-3166-2*/

USE [Atlas]
GO

CREATE TABLE [live].[ISOCountrySubdivisionType]
	(
		[id] int IDENTITY(1, 1) NOT NULL,
		[name] nvarchar(50) NOT NULL,
		[actv_yn] bit NOT NULL,
		[effe_stt_date] datetime2(2) GENERATED ALWAYS AS ROW START,
		[end_date] datetime2(2) GENERATED ALWAYS AS ROW END,
		PERIOD FOR SYSTEM_TIME ([effe_stt_date], [end_date]),

		CONSTRAINT [PK_live_ISOCountrySubdivisionType_id]
			PRIMARY KEY CLUSTERED ([id])
			WITH
				(
					PAD_INDEX = OFF,
					IGNORE_DUP_KEY = OFF,
					STATISTICS_NORECOMPUTE = OFF,
					ALLOW_ROW_LOCKS = ON,
					ALLOW_PAGE_LOCKS = ON
				)
			ON
				[PRIMARY],

		CONSTRAINT [AK_live_ISOCountrySubdivisionType_name] 
			UNIQUE([name])

	)
ON
	[PRIMARY]
WITH
	(SYSTEM_VERSIONING = ON (HISTORY_TABLE = [hist].[ISOCountrySubdivisionType]))
GO

/*------------------------------------------------------------------Country Subdivision Type table*/

USE [Atlas]
GO

SET IDENTITY_INSERT [live].[ISOCountrySubdivisionType] ON
GO

INSERT INTO 
	[Atlas].[live].[ISOCountrySubdivisionType] 
		([id], 
		[name],
		[actv_yn]) 
VALUES
	(1,		'City Corporation',				1),
	(2,		'Council Area',					1),
	(3,		'Country',						1),
	(4,		'District',						1),
	(5,		'London Borough',				1),
	(6,		'Metropolitan District',		1),
	(7,		'Nation',						1),
	(8,		'Province',						1),
	(9,		'Two-Tier County',				1),
	(10,	'Unitary Authority',			1),
	(11,	'County',						1)
GO

SET IDENTITY_INSERT [live].[ISOCountrySubdivisionType] OFF
GO


/*------------------------------------------------------------------Country Subdivision table*/

/*Drawn from ISO-3166-2*/

USE [Atlas]
GO

CREATE TABLE [live].[ISOCountrySubdivision]
	(
		[id] int IDENTITY(1, 1) NOT NULL,
		[name] nvarchar(255) NOT NULL,
		[3166-2_code] nvarchar(6) NOT NULL,
		[iso_country_subdivision_type_id] int NOT NULL,
		[parent_iso_country_subdivision_id] int NULL,
		[parent_iso_country_id] int NULL,
		[actv_yn] bit NOT NULL,
		[effe_stt_date] datetime2(2) GENERATED ALWAYS AS ROW START,
		[end_date] datetime2(2) GENERATED ALWAYS AS ROW END,
		PERIOD FOR SYSTEM_TIME ([effe_stt_date], [end_date]),

		CONSTRAINT [PK_live_ISOCountrySubdivision_id]
			PRIMARY KEY CLUSTERED ([id])
			WITH
				(
					PAD_INDEX = OFF,
					IGNORE_DUP_KEY = OFF,
					STATISTICS_NORECOMPUTE = OFF,
					ALLOW_ROW_LOCKS = ON,
					ALLOW_PAGE_LOCKS = ON
				)
			ON
				[PRIMARY],

		CONSTRAINT [AK_live_ISOCountrySubdivision_name] 
			UNIQUE([name]),

		CONSTRAINT [AK_live_ISOCountrySubdivision_parent_country_id]
			CHECK (NOT ([parent_iso_country_subdivision_id] IS NOT NULL AND [parent_iso_country_id] IS NOT NULL)),

		CONSTRAINT FK_live_ISOCountrySubdivision_iso_country_subdivision_type_id
			FOREIGN KEY ([iso_country_subdivision_type_id])
			REFERENCES [live].[ISOCountrySubdivisionType] ([id])
			ON DELETE NO ACTION
			ON UPDATE NO ACTION,

		CONSTRAINT FK_live_ISOCountrySubdivision_parent_iso_country_subdivision_id
			FOREIGN KEY ([parent_iso_country_subdivision_id])
			REFERENCES [live].[ISOCountrySubdivision] ([id])
			ON DELETE NO ACTION
			ON UPDATE NO ACTION,

		CONSTRAINT FK_live_ISOCountrySubdivision_parent_iso_country_id
			FOREIGN KEY ([parent_iso_country_id])
			REFERENCES [live].[ISOCountry] ([id])
			ON DELETE NO ACTION
			ON UPDATE NO ACTION

	)
ON
	[PRIMARY]
WITH
	(SYSTEM_VERSIONING = ON (HISTORY_TABLE = [hist].[ISOCountrySubdivision]))
GO

/*------------------------------------------------------------------Country Subdivision table*/

USE [Atlas]
GO

SET IDENTITY_INSERT [live].[ISOCountrySubdivision] ON
GO

INSERT INTO
	[Atlas].[live].[ISOCountrySubdivision]
		([id],
		[name],
		[3166-2_code],
		[iso_country_subdivision_type_id],
		[parent_iso_country_subdivision_id],
		[parent_iso_country_id],
		[actv_yn])
VALUES

	/*United Kingdom*/
	(69, 'England', 'GB-ENG', 3, NULL, 826, 1),
	(70, 'England and Wales', 'GB-EAW', 7, NULL, 826, 1),
	(79, 'Great Britain', 'GB-GBN', 7, NULL, 826, 1),
	(142, 'Northern Ireland', 'GB-NIR', 8, NULL, 826, 1),
	(167, 'Scotland', 'GB-SCT', 3, NULL, 826, 1),
	(202, 'United Kingdom', 'GB-UKM', 7, NULL, 826, 1),
	(205, 'Wales', 'GB-WLS', 3, NULL, 826, 1),
	(18, 'Blaenau Gwent', 'GB-BGW', 10, 205, NULL, 1),
	(24, 'Bridgend', 'GB-BGE', 10, 205, NULL, 1),
	(30, 'Caerphilly', 'GB-CAY', 10, 205, NULL, 1),
	(34, 'Cardiff', 'GB-CRF', 10, 205, NULL, 1),
	(35, 'Carmarthenshire', 'GB-CMN', 10, 205, NULL, 1),
	(38, 'Ceredigion', 'GB-CGN', 10, 205, NULL, 1),
	(42, 'Conwy', 'GB-CWY', 10, 205, NULL, 1),
	(48, 'Denbighshire', 'GB-DEN', 10, 205, NULL, 1),
	(75, 'Flintshire', 'GB-FLN', 10, 205, NULL, 1),
	(81, 'Gwynedd', 'GB-GWN', 10, 205, NULL, 1),
	(96, 'Isle of Anglesey', 'GB-AGY', 10, 205, NULL, 1),
	(119, 'Merthyr Tydfil', 'GB-MTY', 10, 205, NULL, 1),
	(126, 'Monmouthshire', 'GB-MON', 10, 205, NULL, 1),
	(128, 'Neath Port Talbot', 'GB-NTL', 10, 205, NULL, 1),
	(131, 'Newport', 'GB-NWP', 10, 205, NULL, 1),
	(149, 'Pembrokeshire', 'GB-PEM', 10, 205, NULL, 1),
	(155, 'Powys', 'GB-POW', 10, 205, NULL, 1),
	(160, 'Rhondda, Cynon, Taff', 'GB-RCT', 10, 205, NULL, 1),
	(193, 'Swansea', 'GB-SWA', 10, 205, NULL, 1),
	(199, 'Torfaen', 'GB-TOF', 10, 205, NULL, 1),
	(203, 'Vale of Glamorgan, The', 'GB-VGL', 10, 205, NULL, 1),
	(223, 'Wrexham', 'GB-WRX', 10, 205, NULL, 1),
	(1, 'Aberdeen City', 'GB-ABE', 2, 167, NULL, 1),
	(2, 'Aberdeenshire', 'GB-ABD', 2, 167, NULL, 1),
	(3, 'Angus', 'GB-ANS', 2, 167, NULL, 1),
	(6, 'Argyll and Bute', 'GB-AGB', 2, 167, NULL, 1),
	(41, 'Clackmannanshire', 'GB-CLK', 2, 167, NULL, 1),
	(56, 'Dumfries and Galloway', 'GB-DGY', 2, 167, NULL, 1),
	(57, 'Dundee City', 'GB-DND', 2, 167, NULL, 1),
	(60, 'East Ayrshire', 'GB-EAY', 2, 167, NULL, 1),
	(61, 'East Dunbartonshire', 'GB-EDU', 2, 167, NULL, 1),
	(62, 'East Lothian', 'GB-ELN', 2, 167, NULL, 1),
	(63, 'East Renfrewshire', 'GB-ERW', 2, 167, NULL, 1),
	(66, 'Edinburgh, City of', 'GB-EDH', 2, 167, NULL, 1),
	(67, 'Eilean Siar', 'GB-ELS', 2, 167, NULL, 1),
	(72, 'Falkirk', 'GB-FAL', 2, 167, NULL, 1),
	(74, 'Fife', 'GB-FIF', 2, 167, NULL, 1),
	(77, 'Glasgow City', 'GB-GLG', 2, 167, NULL, 1),
	(92, 'Highland', 'GB-HLD', 2, 167, NULL, 1),
	(95, 'Inverclyde', 'GB-IVC', 2, 167, NULL, 1),
	(124, 'Midlothian', 'GB-MLN', 2, 167, NULL, 1),
	(127, 'Moray', 'GB-MRY', 2, 167, NULL, 1),
	(134, 'North Ayrshire', 'GB-NAY', 2, 167, NULL, 1),
	(136, 'North Lanarkshire', 'GB-NLK', 2, 167, NULL, 1),
	(147, 'Orkney Islands', 'GB-ORK', 2, 167, NULL, 1),
	(150, 'Perth and Kinross', 'GB-PKN', 2, 167, NULL, 1),
	(159, 'Renfrewshire', 'GB-RFW', 2, 167, NULL, 1),
	(168, 'Scottish Borders, The', 'GB-SCB', 2, 167, NULL, 1),
	(171, 'Shetland Islands', 'GB-ZET', 2, 167, NULL, 1),
	(176, 'South Ayrshire', 'GB-SAY', 2, 167, NULL, 1),
	(178, 'South Lanarkshire', 'GB-SLK', 2, 167, NULL, 1),
	(185, 'Stirling', 'GB-STG', 2, 167, NULL, 1),
	(212, 'West Dunbartonshire', 'GB-WDU', 2, 167, NULL, 1),
	(213, 'West Lothian', 'GB-WLN', 2, 167, NULL, 1),
	(4, 'Antrim and Newtownabbey', 'GB-ANN', 4, 142, NULL, 1),
	(5, 'Ards and North Down', 'GB-AND', 4, 142, NULL, 1),
	(7, 'Armagh, Banbridge and Craigavon', 'GB-ABC', 4, 142, NULL, 1),
	(13, 'Belfast', 'GB-BFS', 4, 142, NULL, 1),
	(36, 'Causeway Coast and Glens', 'GB-CCG', 4, 142, NULL, 1),
	(51, 'Derry and Strabane', 'GB-DRS', 4, 142, NULL, 1),
	(73, 'Fermanagh and Omagh', 'GB-FMO', 4, 142, NULL, 1),
	(113, 'Lisburn and Castlereagh', 'GB-LBC', 4, 142, NULL, 1),
	(121, 'Mid Ulster', 'GB-MUL', 4, 142, NULL, 1),
	(122, 'Mid and East Antrim', 'GB-MEA', 4, 142, NULL, 1),
	(132, 'Newry, Mourne and Down', 'GB-NMD', 4, 142, NULL, 1),
	(8, 'Barking and Dagenham', 'GB-BDG', 5, 69, NULL, 1),
	(9, 'Barnet', 'GB-BNE', 5, 69, NULL, 1),
	(10, 'Barnsley', 'GB-BNS', 6, 69, NULL, 1),
	(11, 'Bath and North East Somerset', 'GB-BAS', 10, 69, NULL, 1),
	(12, 'Bedford', 'GB-BDF', 10, 69, NULL, 1),
	(14, 'Bexley', 'GB-BEX', 5, 69, NULL, 1),
	(15, 'Birmingham', 'GB-BIR', 6, 69, NULL, 1),
	(16, 'Blackburn with Darwen', 'GB-BBD', 10, 69, NULL, 1),
	(17, 'Blackpool', 'GB-BPL', 10, 69, NULL, 1),
	(19, 'Bolton', 'GB-BOL', 6, 69, NULL, 1),
	(20, 'Bournemouth', 'GB-BMH', 10, 69, NULL, 1),
	(21, 'Bracknell Forest', 'GB-BRC', 10, 69, NULL, 1),
	(22, 'Bradford', 'GB-BRD', 6, 69, NULL, 1),
	(23, 'Brent', 'GB-BEN', 5, 69, NULL, 1),
	(25, 'Brighton and Hove', 'GB-BNH', 10, 69, NULL, 1),
	(26, 'Bristol, City of', 'GB-BST', 10, 69, NULL, 1),
	(27, 'Bromley', 'GB-BRY', 5, 69, NULL, 1),
	(28, 'Buckinghamshire', 'GB-BKM', 9, 69, NULL, 1),
	(29, 'Bury', 'GB-BUR', 6, 69, NULL, 1),
	(31, 'Calderdale', 'GB-CLD', 6, 69, NULL, 1),
	(32, 'Cambridgeshire', 'GB-CAM', 9, 69, NULL, 1),
	(33, 'Camden', 'GB-CMD', 5, 69, NULL, 1),
	(37, 'Central Bedfordshire', 'GB-CBF', 10, 69, NULL, 1),
	(39, 'Cheshire East', 'GB-CHE', 10, 69, NULL, 1),
	(40, 'Cheshire West and Chester', 'GB-CHW', 10, 69, NULL, 1),
	(43, 'Cornwall', 'GB-CON', 10, 69, NULL, 1),
	(44, 'Coventry', 'GB-COV', 6, 69, NULL, 1),
	(45, 'Croydon', 'GB-CRY', 5, 69, NULL, 1),
	(46, 'Cumbria', 'GB-CMA', 9, 69, NULL, 1),
	(47, 'Darlington', 'GB-DAL', 10, 69, NULL, 1),
	(49, 'Derby', 'GB-DER', 10, 69, NULL, 1),
	(50, 'Derbyshire', 'GB-DBY', 9, 69, NULL, 1),
	(52, 'Devon', 'GB-DEV', 9, 69, NULL, 1),
	(53, 'Doncaster', 'GB-DNC', 6, 69, NULL, 1),
	(54, 'Dorset', 'GB-DOR', 9, 69, NULL, 1),
	(55, 'Dudley', 'GB-DUD', 6, 69, NULL, 1),
	(58, 'Durham County', 'GB-DUR', 10, 69, NULL, 1),
	(59, 'Ealing', 'GB-EAL', 5, 69, NULL, 1),
	(64, 'East Riding of Yorkshire', 'GB-ERY', 10, 69, NULL, 1),
	(65, 'East Sussex', 'GB-ESX', 9, 69, NULL, 1),
	(68, 'Enfield', 'GB-ENF', 5, 69, NULL, 1),
	(71, 'Essex', 'GB-ESS', 9, 69, NULL, 1),
	(76, 'Gateshead', 'GB-GAT', 6, 69, NULL, 1),
	(78, 'Gloucestershire', 'GB-GLS', 9, 69, NULL, 1),
	(80, 'Greenwich', 'GB-GRE', 5, 69, NULL, 1),
	(82, 'Hackney', 'GB-HCK', 5, 69, NULL, 1),
	(83, 'Halton', 'GB-HAL', 10, 69, NULL, 1),
	(84, 'Hammersmith and Fulham', 'GB-HMF', 5, 69, NULL, 1),
	(85, 'Hampshire', 'GB-HAM', 9, 69, NULL, 1),
	(86, 'Haringey', 'GB-HRY', 5, 69, NULL, 1),
	(87, 'Harrow', 'GB-HRW', 5, 69, NULL, 1),
	(88, 'Hartlepool', 'GB-HPL', 10, 69, NULL, 1),
	(89, 'Havering', 'GB-HAV', 5, 69, NULL, 1),
	(90, 'Herefordshire', 'GB-HEF', 10, 69, NULL, 1),
	(91, 'Hertfordshire', 'GB-HRT', 9, 69, NULL, 1),
	(93, 'Hillingdon', 'GB-HIL', 5, 69, NULL, 1),
	(94, 'Hounslow', 'GB-HNS', 5, 69, NULL, 1),
	(97, 'Isle of Wight', 'GB-IOW', 10, 69, NULL, 1),
	(98, 'Isles of Scilly', 'GB-IOS', 10, 69, NULL, 1),
	(99, 'Islington', 'GB-ISL', 5, 69, NULL, 1),
	(100, 'Kensington and Chelsea', 'GB-KEC', 5, 69, NULL, 1),
	(101, 'Kent', 'GB-KEN', 9, 69, NULL, 1),
	(102, 'Kingston upon Hull', 'GB-KHL', 10, 69, NULL, 1),
	(103, 'Kingston upon Thames', 'GB-KTT', 5, 69, NULL, 1),
	(104, 'Kirklees', 'GB-KIR', 6, 69, NULL, 1),
	(105, 'Knowsley', 'GB-KWL', 6, 69, NULL, 1),
	(106, 'Lambeth', 'GB-LBH', 5, 69, NULL, 1),
	(107, 'Lancashire', 'GB-LAN', 9, 69, NULL, 1),
	(108, 'Leeds', 'GB-LDS', 6, 69, NULL, 1),
	(109, 'Leicester', 'GB-LCE', 10, 69, NULL, 1),
	(110, 'Leicestershire', 'GB-LEC', 9, 69, NULL, 1),
	(111, 'Lewisham', 'GB-LEW', 5, 69, NULL, 1),
	(112, 'Lincolnshire', 'GB-LIN', 9, 69, NULL, 1),
	(114, 'Liverpool', 'GB-LIV', 6, 69, NULL, 1),
	(115, 'London, City of', 'GB-LND', 1, 69, NULL, 1),
	(116, 'Luton', 'GB-LUT', 10, 69, NULL, 1),
	(117, 'Manchester', 'GB-MAN', 6, 69, NULL, 1),
	(118, 'Medway', 'GB-MDW', 10, 69, NULL, 1),
	(120, 'Merton', 'GB-MRT', 5, 69, NULL, 1),
	(123, 'Middlesbrough', 'GB-MDB', 10, 69, NULL, 1),
	(125, 'Milton Keynes', 'GB-MIK', 10, 69, NULL, 1),
	(129, 'Newcastle upon Tyne', 'GB-NET', 6, 69, NULL, 1),
	(130, 'Newham', 'GB-NWM', 5, 69, NULL, 1),
	(133, 'Norfolk', 'GB-NFK', 9, 69, NULL, 1),
	(135, 'North East Lincolnshire', 'GB-NEL', 10, 69, NULL, 1),
	(137, 'North Lincolnshire', 'GB-NLN', 10, 69, NULL, 1),
	(138, 'North Somerset', 'GB-NSM', 10, 69, NULL, 1),
	(139, 'North Tyneside', 'GB-NTY', 6, 69, NULL, 1),
	(140, 'North Yorkshire', 'GB-NYK', 9, 69, NULL, 1),
	(141, 'Northamptonshire', 'GB-NTH', 9, 69, NULL, 1),
	(143, 'Northumberland', 'GB-NBL', 10, 69, NULL, 1),
	(144, 'Nottingham', 'GB-NGM', 10, 69, NULL, 1),
	(145, 'Nottinghamshire', 'GB-NTT', 9, 69, NULL, 1),
	(146, 'Oldham', 'GB-OLD', 6, 69, NULL, 1),
	(148, 'Oxfordshire', 'GB-OXF', 9, 69, NULL, 1),
	(151, 'Peterborough', 'GB-PTE', 10, 69, NULL, 1),
	(152, 'Plymouth', 'GB-PLY', 10, 69, NULL, 1),
	(153, 'Poole', 'GB-POL', 10, 69, NULL, 1),
	(154, 'Portsmouth', 'GB-POR', 10, 69, NULL, 1),
	(156, 'Reading', 'GB-RDG', 10, 69, NULL, 1),
	(157, 'Redbridge', 'GB-RDB', 5, 69, NULL, 1),
	(158, 'Redcar and Cleveland', 'GB-RCC', 10, 69, NULL, 1),
	(161, 'Richmond upon Thames', 'GB-RIC', 5, 69, NULL, 1),
	(162, 'Rochdale', 'GB-RCH', 6, 69, NULL, 1),
	(163, 'Rotherham', 'GB-ROT', 6, 69, NULL, 1),
	(164, 'Rutland', 'GB-RUT', 10, 69, NULL, 1),
	(165, 'Salford', 'GB-SLF', 6, 69, NULL, 1),
	(166, 'Sandwell', 'GB-SAW', 6, 69, NULL, 1),
	(169, 'Sefton', 'GB-SFT', 6, 69, NULL, 1),
	(170, 'Sheffield', 'GB-SHF', 6, 69, NULL, 1),
	(172, 'Shropshire', 'GB-SHR', 10, 69, NULL, 1),
	(173, 'Slough', 'GB-SLG', 10, 69, NULL, 1),
	(174, 'Solihull', 'GB-SOL', 6, 69, NULL, 1),
	(175, 'Somerset', 'GB-SOM', 9, 69, NULL, 1),
	(177, 'South Gloucestershire', 'GB-SGC', 10, 69, NULL, 1),
	(179, 'South Tyneside', 'GB-STY', 6, 69, NULL, 1),
	(180, 'Southampton', 'GB-STH', 10, 69, NULL, 1),
	(181, 'Southend-on-Sea', 'GB-SOS', 10, 69, NULL, 1),
	(182, 'Southwark', 'GB-SWK', 5, 69, NULL, 1),
	(183, 'St. Helens', 'GB-SHN', 6, 69, NULL, 1),
	(184, 'Staffordshire', 'GB-STS', 9, 69, NULL, 1),
	(186, 'Stockport', 'GB-SKP', 6, 69, NULL, 1),
	(187, 'Stockton-on-Tees', 'GB-STT', 10, 69, NULL, 1),
	(188, 'Stoke-on-Trent', 'GB-STE', 10, 69, NULL, 1),
	(189, 'Suffolk', 'GB-SFK', 9, 69, NULL, 1),
	(190, 'Sunderland', 'GB-SND', 6, 69, NULL, 1),
	(191, 'Surrey', 'GB-SRY', 9, 69, NULL, 1),
	(192, 'Sutton', 'GB-STN', 5, 69, NULL, 1),
	(194, 'Swindon', 'GB-SWD', 10, 69, NULL, 1),
	(195, 'Tameside', 'GB-TAM', 6, 69, NULL, 1),
	(196, 'Telford and Wrekin', 'GB-TFW', 10, 69, NULL, 1),
	(197, 'Thurrock', 'GB-THR', 10, 69, NULL, 1),
	(198, 'Torbay', 'GB-TOB', 10, 69, NULL, 1),
	(200, 'Tower Hamlets', 'GB-TWH', 5, 69, NULL, 1),
	(201, 'Trafford', 'GB-TRF', 6, 69, NULL, 1),
	(204, 'Wakefield', 'GB-WKF', 6, 69, NULL, 1),
	(206, 'Walsall', 'GB-WLL', 6, 69, NULL, 1),
	(207, 'Waltham Forest', 'GB-WFT', 5, 69, NULL, 1),
	(208, 'Wandsworth', 'GB-WND', 5, 69, NULL, 1),
	(209, 'Warrington', 'GB-WRT', 10, 69, NULL, 1),
	(210, 'Warwickshire', 'GB-WAR', 9, 69, NULL, 1),
	(211, 'West Berkshire', 'GB-WBK', 10, 69, NULL, 1),
	(214, 'West Sussex', 'GB-WSX', 9, 69, NULL, 1),
	(215, 'Westminster', 'GB-WSM', 5, 69, NULL, 1),
	(216, 'Wigan', 'GB-WGN', 6, 69, NULL, 1),
	(217, 'Wiltshire', 'GB-WIL', 10, 69, NULL, 1),
	(218, 'Windsor and Maidenhead', 'GB-WNM', 10, 69, NULL, 1),
	(219, 'Wirral', 'GB-WRL', 6, 69, NULL, 1),
	(220, 'Wokingham', 'GB-WOK', 10, 69, NULL, 1),
	(221, 'Wolverhampton', 'GB-WLV', 6, 69, NULL, 1),
	(222, 'Worcestershire', 'GB-WOR', 9, 69, NULL, 1),
	(224, 'York', 'GB-YOR', 10, 69, NULL, 1),

	/*Republic of Ireland*/
	(225, 'Connacht', 'IE-C', 8, NULL, 372, 1),
	(226, 'Leinster', 'IE-L', 8, NULL, 372, 1),
	(227, 'Munster', 'IE-M', 8, NULL, 372, 1),
	(228, 'Ulster', 'IE-U', 8, NULL, 372, 1),
	(229, 'Carlow', 'IE-CW', 11, 226, NULL, 1),
	(230, 'Cavan', 'IE-CN', 11, 228, NULL, 1),
	(231, 'Clare', 'IE-CE', 11, 227, NULL, 1),
	(232, 'Cork', 'IE-CO', 11, 227, NULL, 1),
	(233, 'Donegal', 'IE-DL', 11, 228, NULL, 1),
	(234, 'Dublin', 'IE-D', 11, 226, NULL, 1),
	(235, 'Galway', 'IE-G', 11, 225, NULL, 1),
	(236, 'Kerry', 'IE-KY', 11, 227, NULL, 1),
	(237, 'Kildare', 'IE-KE', 11, 226, NULL, 1),
	(238, 'Kilkenny', 'IE-KK', 11, 226, NULL, 1),
	(239, 'Laois', 'IE-LS', 11, 226, NULL, 1),
	(240, 'Leitrim', 'IE-LM', 11, 225, NULL, 1),
	(241, 'Limerick', 'IE-LK', 11, 227, NULL, 1),
	(242, 'Longford', 'IE-LD', 11, 226, NULL, 1),
	(243, 'Louth', 'IE-LH', 11, 226, NULL, 1),
	(244, 'Mayo', 'IE-MO', 11, 225, NULL, 1),
	(245, 'Meath', 'IE-MH', 11, 226, NULL, 1),
	(246, 'Monaghan', 'IE-MN', 11, 228, NULL, 1),
	(247, 'Offaly', 'IE-OY', 11, 226, NULL, 1),
	(248, 'Roscommon', 'IE-RN', 11, 225, NULL, 1),
	(249, 'Sligo', 'IE-SO', 11, 225, NULL, 1),
	(250, 'Tipperary', 'IE-TA', 11, 227, NULL, 1),
	(251, 'Waterford', 'IE-WD', 11, 227, NULL, 1),
	(252, 'Westmeath', 'IE-WH', 11, 226, NULL, 1),
	(253, 'Wexford', 'IE-WX', 11, 226, NULL, 1),
	(254, 'Wicklow', 'IE-WW', 11, 226, NULL, 1)
GO

SET IDENTITY_INSERT [live].[ISOCountrySubdivision] OFF
GO