/*Insert default values*/

/*------------------------------------------------------------------Country*/

USE [Atlas]
GO

INSERT INTO 
	[Atlas].[live].[ISOCountry] 
		([id], 
		[name], 
		[alpha-2], 
		[alpha-3], 
		[independent_yn],
		[actv_yn]) 
VALUES
	('4', 'Afghanistan', 'AF', 'AFG', 1, 1),
	('248', 'Åland Islands', 'AX', 'ALA', 0, 1),
	('8', 'Albania', 'AL', 'ALB', 1, 1),
	('12', 'Algeria', 'DZ', 'DZA', 1, 1),
	('16', 'American Samoa', 'AS', 'ASM', 0, 1),
	('20', 'Andorra', 'AD', 'AND', 1, 1),
	('24', 'Angola', 'AO', 'AGO', 1, 1),
	('660', 'Anguilla', 'AI', 'AIA', 0, 1),
	('10', 'Antarctica', 'AQ', 'ATA', 0, 1),
	('28', 'Antigua and Barbuda', 'AG', 'ATG', 1, 1),
	('32', 'Argentina', 'AR', 'ARG', 1, 1),
	('51', 'Armenia', 'AM', 'ARM', 1, 1),
	('533', 'Aruba', 'AW', 'ABW', 0, 1),
	('36', 'Australia', 'AU', 'AUS', 1, 1),
	('40', 'Austria', 'AT', 'AUT', 1, 1),
	('31', 'Azerbaijan', 'AZ', 'AZE', 1, 1),
	('44', 'Bahamas', 'BS', 'BHS', 1, 1),
	('48', 'Bahrain', 'BH', 'BHR', 1, 1),
	('50', 'Bangladesh', 'BD', 'BGD', 1, 1),
	('52', 'Barbados', 'BB', 'BRB', 1, 1),
	('112', 'Belarus', 'BY', 'BLR', 1, 1),
	('56', 'Belgium', 'BE', 'BEL', 1, 1),
	('84', 'Belize', 'BZ', 'BLZ', 1, 1),
	('204', 'Benin', 'BJ', 'BEN', 1, 1),
	('60', 'Bermuda', 'BM', 'BMU', 0, 1),
	('64', 'Bhutan', 'BT', 'BTN', 1, 1),
	('68', 'Bolivia (Plurinational State of)', 'BO', 'BOL', 1, 1),
	('535', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 0, 1),
	('70', 'Bosnia and Herzegovina', 'BA', 'BIH', 1, 1),
	('72', 'Botswana', 'BW', 'BWA', 1, 1),
	('74', 'Bouvet Island', 'BV', 'BVT', 0, 1),
	('76', 'Brazil', 'BR', 'BRA', 1, 1),
	('86', 'British Indian Ocean Territory', 'IO', 'IOT', 0, 1),
	('96', 'Brunei Darussalam', 'BN', 'BRN', 1, 1),
	('100', 'Bulgaria', 'BG', 'BGR', 1, 1),
	('854', 'Burkina Faso', 'BF', 'BFA', 1, 1),
	('108', 'Burundi', 'BI', 'BDI', 1, 1),
	('132', 'Cabo Verde', 'CV', 'CPV', 1, 1),
	('116', 'Cambodia', 'KH', 'KHM', 1, 1),
	('120', 'Cameroon', 'CM', 'CMR', 1, 1),
	('124', 'Canada', 'CA', 'CAN', 1, 1),
	('136', 'Cayman Islands', 'KY', 'CYM', 0, 1),
	('140', 'Central African Republic', 'CF', 'CAF', 1, 1),
	('148', 'Chad', 'TD', 'TCD', 1, 1),
	('152', 'Chile', 'CL', 'CHL', 1, 1),
	('156', 'China', 'CN', 'CHN', 1, 1),
	('162', 'Christmas Island', 'CX', 'CXR', 0, 1),
	('166', 'Cocos (Keeling) Islands', 'CC', 'CCK', 0, 1),
	('170', 'Colombia', 'CO', 'COL', 1, 1),
	('174', 'Comoros', 'KM', 'COM', 1, 1),
	('178', 'Congo', 'CG', 'COG', 1, 1),
	('180', 'Congo (Democratic Republic of the)', 'CD', 'COD', 1, 1),
	('184', 'Cook Islands', 'CK', 'COK', 0, 1),
	('188', 'Costa Rica', 'CR', 'CRI', 1, 1),
	('384', 'Côte d''Ivoire', 'CI', 'CIV', 1, 1),
	('191', 'Croatia', 'HR', 'HRV', 1, 1),
	('192', 'Cuba', 'CU', 'CUB', 1, 1),
	('531', 'Curaçao', 'CW', 'CUW', 0, 1),
	('196', 'Cyprus', 'CY', 'CYP', 1, 1),
	('203', 'Czechia', 'CZ', 'CZE', 1, 1),
	('208', 'Denmark', 'DK', 'DNK', 1, 1),
	('262', 'Djibouti', 'DJ', 'DJI', 1, 1),
	('212', 'Dominica', 'DM', 'DMA', 1, 1),
	('214', 'Dominican Republic', 'DO', 'DOM', 1, 1),
	('218', 'Ecuador', 'EC', 'ECU', 1, 1),
	('818', 'Egypt', 'EG', 'EGY', 1, 1),
	('222', 'El Salvador', 'SV', 'SLV', 1, 1),
	('226', 'Equatorial Guinea', 'GQ', 'GNQ', 1, 1),
	('232', 'Eritrea', 'ER', 'ERI', 1, 1),
	('233', 'Estonia', 'EE', 'EST', 1, 1),
	('231', 'Ethiopia', 'ET', 'ETH', 1, 1),
	('238', 'Falkland Islands (Malvinas)', 'FK', 'FLK', 0, 1),
	('234', 'Faroe Islands', 'FO', 'FRO', 0, 1),
	('242', 'Fiji', 'FJ', 'FJI', 1, 1),
	('246', 'Finland', 'FI', 'FIN', 1, 1),
	('250', 'France', 'FR', 'FRA', 1, 1),
	('254', 'French Guiana', 'GF', 'GUF', 0, 1),
	('258', 'French Polynesia', 'PF', 'PYF', 0, 1),
	('260', 'French Southern Territories', 'TF', 'ATF', 0, 1),
	('266', 'Gabon', 'GA', 'GAB', 1, 1),
	('270', 'Gambia', 'GM', 'GMB', 1, 1),
	('268', 'Georgia', 'GE', 'GEO', 1, 1),
	('276', 'Germany', 'DE', 'DEU', 1, 1),
	('288', 'Ghana', 'GH', 'GHA', 1, 1),
	('292', 'Gibraltar', 'GI', 'GIB', 0, 1),
	('300', 'Greece', 'GR', 'GRC', 1, 1),
	('304', 'Greenland', 'GL', 'GRL', 0, 1),
	('308', 'Grenada', 'GD', 'GRD', 1, 1),
	('312', 'Guadeloupe', 'GP', 'GLP', 0, 1),
	('316', 'Guam', 'GU', 'GUM', 0, 1),
	('320', 'Guatemala', 'GT', 'GTM', 1, 1),
	('831', 'Guernsey', 'GG', 'GGY', 0, 1),
	('324', 'Guinea', 'GN', 'GIN', 1, 1),
	('624', 'Guinea-Bissau', 'GW', 'GNB', 1, 1),
	('328', 'Guyana', 'GY', 'GUY', 1, 1),
	('332', 'Haiti', 'HT', 'HTI', 1, 1),
	('334', 'Heard Island and McDonald Islands', 'HM', 'HMD', 0, 1),
	('336', 'Holy See', 'VA', 'VAT', 1, 1),
	('340', 'Honduras', 'HN', 'HND', 1, 1),
	('344', 'Hong Kong', 'HK', 'HKG', 0, 1),
	('348', 'Hungary', 'HU', 'HUN', 1, 1),
	('352', 'Iceland', 'IS', 'ISL', 1, 1),
	('356', 'India', 'IN', 'IND', 1, 1),
	('360', 'Indonesia', 'ID', 'IDN', 1, 1),
	('364', 'Iran (Islamic Republic of)', 'IR', 'IRN', 1, 1),
	('368', 'Iraq', 'IQ', 'IRQ', 1, 1),
	('372', 'Ireland', 'IE', 'IRL', 1, 1),
	('833', 'Isle of Man', 'IM', 'IMN', 0, 1),
	('376', 'Israel', 'IL', 'ISR', 1, 1),
	('380', 'Italy', 'IT', 'ITA', 1, 1),
	('388', 'Jamaica', 'JM', 'JAM', 1, 1),
	('392', 'Japan', 'JP', 'JPN', 1, 1),
	('832', 'Jersey', 'JE', 'JEY', 0, 1),
	('400', 'Jordan', 'JO', 'JOR', 1, 1),
	('398', 'Kazakhstan', 'KZ', 'KAZ', 1, 1),
	('404', 'Kenya', 'KE', 'KEN', 1, 1),
	('296', 'Kiribati', 'KI', 'KIR', 1, 1),
	('408', 'Korea (Democratic People''s Republic of)', 'KP', 'PRK', 1, 1),
	('410', 'Korea (Republic of)', 'KR', 'KOR', 1, 1),
	('414', 'Kuwait', 'KW', 'KWT', 1, 1),
	('417', 'Kyrgyzstan', 'KG', 'KGZ', 1, 1),
	('418', 'Lao People''s Democratic Republic', 'LA', 'LAO', 1, 1),
	('428', 'Latvia', 'LV', 'LVA', 1, 1),
	('422', 'Lebanon', 'LB', 'LBN', 1, 1),
	('426', 'Lesotho', 'LS', 'LSO', 1, 1),
	('430', 'Liberia', 'LR', 'LBR', 1, 1),
	('434', 'Libya', 'LY', 'LBY', 1, 1),
	('438', 'Liechtenstein', 'LI', 'LIE', 1, 1),
	('440', 'Lithuania', 'LT', 'LTU', 1, 1),
	('442', 'Luxembourg', 'LU', 'LUX', 1, 1),
	('446', 'Macao', 'MO', 'MAC', 0, 1),
	('807', 'Macedonia (the former Yugoslav Republic of)', 'MK', 'MKD', 1, 1),
	('450', 'Madagascar', 'MG', 'MDG', 1, 1),
	('454', 'Malawi', 'MW', 'MWI', 1, 1),
	('458', 'Malaysia', 'MY', 'MYS', 1, 1),
	('462', 'Maldives', 'MV', 'MDV', 1, 1),
	('466', 'Mali', 'ML', 'MLI', 1, 1),
	('470', 'Malta', 'MT', 'MLT', 1, 1),
	('584', 'Marshall Islands', 'MH', 'MHL', 1, 1),
	('474', 'Martinique', 'MQ', 'MTQ', 0, 1),
	('478', 'Mauritania', 'MR', 'MRT', 1, 1),
	('480', 'Mauritius', 'MU', 'MUS', 1, 1),
	('175', 'Mayotte', 'YT', 'MYT', 0, 1),
	('484', 'Mexico', 'MX', 'MEX', 1, 1),
	('583', 'Micronesia (Federated States of)', 'FM', 'FSM', 1, 1),
	('498', 'Moldova (Republic of)', 'MD', 'MDA', 1, 1),
	('492', 'Monaco', 'MC', 'MCO', 1, 1),
	('496', 'Mongolia', 'MN', 'MNG', 1, 1),
	('499', 'Montenegro', 'ME', 'MNE', 1, 1),
	('500', 'Montserrat', 'MS', 'MSR', 0, 1),
	('504', 'Morocco', 'MA', 'MAR', 1, 1),
	('508', 'Mozambique', 'MZ', 'MOZ', 1, 1),
	('104', 'Myanmar', 'MM', 'MMR', 1, 1),
	('516', 'Namibia', 'NA', 'NAM', 1, 1),
	('520', 'Nauru', 'NR', 'NRU', 1, 1),
	('524', 'Nepal', 'NP', 'NPL', 1, 1),
	('528', 'Netherlands', 'NL', 'NLD', 1, 1),
	('540', 'New Caledonia', 'NC', 'NCL', 0, 1),
	('554', 'New Zealand', 'NZ', 'NZL', 1, 1),
	('558', 'Nicaragua', 'NI', 'NIC', 1, 1),
	('562', 'Niger', 'NE', 'NER', 1, 1),
	('566', 'Nigeria', 'NG', 'NGA', 1, 1),
	('570', 'Niue', 'NU', 'NIU', 0, 1),
	('574', 'Norfolk Island', 'NF', 'NFK', 0, 1),
	('580', 'Northern Mariana Islands', 'MP', 'MNP', 0, 1),
	('578', 'Norway', 'NO', 'NOR', 1, 1),
	('512', 'Oman', 'OM', 'OMN', 1, 1),
	('586', 'Pakistan', 'PK', 'PAK', 1, 1),
	('585', 'Palau', 'PW', 'PLW', 1, 1),
	('275', 'Palestine, State of', 'PS', 'PSE', 0, 1),
	('591', 'Panama', 'PA', 'PAN', 1, 1),
	('598', 'Papua New Guinea', 'PG', 'PNG', 1, 1),
	('600', 'Paraguay', 'PY', 'PRY', 1, 1),
	('604', 'Peru', 'PE', 'PER', 1, 1),
	('608', 'Philippines', 'PH', 'PHL', 1, 1),
	('612', 'Pitcairn', 'PN', 'PCN', 0, 1),
	('616', 'Poland', 'PL', 'POL', 1, 1),
	('620', 'Portugal', 'PT', 'PRT', 1, 1),
	('630', 'Puerto Rico', 'PR', 'PRI', 0, 1),
	('634', 'Qatar', 'QA', 'QAT', 1, 1),
	('638', 'Réunion', 'RE', 'REU', 0, 1),
	('642', 'Romania', 'RO', 'ROU', 1, 1),
	('643', 'Russian Federation', 'RU', 'RUS', 1, 1),
	('646', 'Rwanda', 'RW', 'RWA', 1, 1),
	('652', 'Saint Barthélemy', 'BL', 'BLM', 0, 1),
	('654', 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 0, 1),
	('659', 'Saint Kitts and Nevis', 'KN', 'KNA', 1, 1),
	('662', 'Saint Lucia', 'LC', 'LCA', 1, 1),
	('663', 'Saint Martin (French part)', 'MF', 'MAF', 0, 1),
	('666', 'Saint Pierre and Miquelon', 'PM', 'SPM', 0, 1),
	('670', 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1, 1),
	('882', 'Samoa', 'WS', 'WSM', 1, 1),
	('674', 'San Marino', 'SM', 'SMR', 1, 1),
	('678', 'Sao Tome and Principe', 'ST', 'STP', 1, 1),
	('682', 'Saudi Arabia', 'SA', 'SAU', 1, 1),
	('686', 'Senegal', 'SN', 'SEN', 1, 1),
	('688', 'Serbia', 'RS', 'SRB', 1, 1),
	('690', 'Seychelles', 'SC', 'SYC', 1, 1),
	('694', 'Sierra Leone', 'SL', 'SLE', 1, 1),
	('702', 'Singapore', 'SG', 'SGP', 1, 1),
	('534', 'Sint Maarten (Dutch part)', 'SX', 'SXM', 0, 1),
	('703', 'Slovakia', 'SK', 'SVK', 1, 1),
	('705', 'Slovenia', 'SI', 'SVN', 1, 1),
	('90', 'Solomon Islands', 'SB', 'SLB', 1, 1),
	('706', 'Somalia', 'SO', 'SOM', 1, 1),
	('710', 'South Africa', 'ZA', 'ZAF', 1, 1),
	('239', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 0, 1),
	('728', 'South Sudan', 'SS', 'SSD', 1, 1),
	('724', 'Spain', 'ES', 'ESP', 1, 1),
	('144', 'Sri Lanka', 'LK', 'LKA', 1, 1),
	('729', 'Sudan', 'SD', 'SDN', 1, 1),
	('740', 'Suriname', 'SR', 'SUR', 1, 1),
	('744', 'Svalbard and Jan Mayen', 'SJ', 'SJM', 0, 1),
	('748', 'Swaziland', 'SZ', 'SWZ', 1, 1),
	('752', 'Sweden', 'SE', 'SWE', 1, 1),
	('756', 'Switzerland', 'CH', 'CHE', 1, 1),
	('760', 'Syrian Arab Republic', 'SY', 'SYR', 1, 1),
	('158', 'Taiwan, Province of China[a]', 'TW', 'TWN', 0, 1),
	('762', 'Tajikistan', 'TJ', 'TJK', 1, 1),
	('834', 'Tanzania, United Republic of', 'TZ', 'TZA', 1, 1),
	('764', 'Thailand', 'TH', 'THA', 1, 1),
	('626', 'Timor-Leste', 'TL', 'TLS', 1, 1),
	('768', 'Togo', 'TG', 'TGO', 1, 1),
	('772', 'Tokelau', 'TK', 'TKL', 0, 1),
	('776', 'Tonga', 'TO', 'TON', 1, 1),
	('780', 'Trinidad and Tobago', 'TT', 'TTO', 1, 1),
	('788', 'Tunisia', 'TN', 'TUN', 1, 1),
	('792', 'Turkey', 'TR', 'TUR', 1, 1),
	('795', 'Turkmenistan', 'TM', 'TKM', 1, 1),
	('796', 'Turks and Caicos Islands', 'TC', 'TCA', 0, 1),
	('798', 'Tuvalu', 'TV', 'TUV', 1, 1),
	('800', 'Uganda', 'UG', 'UGA', 1, 1),
	('804', 'Ukraine', 'UA', 'UKR', 1, 1),
	('784', 'United Arab Emirates', 'AE', 'ARE', 1, 1),
	('826', 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', 1, 1),
	('840', 'United States of America', 'US', 'USA', 1, 1),
	('581', 'United States Minor Outlying Islands', 'UM', 'UMI', 0, 1),
	('858', 'Uruguay', 'UY', 'URY', 1, 1),
	('860', 'Uzbekistan', 'UZ', 'UZB', 1, 1),
	('548', 'Vanuatu', 'VU', 'VUT', 1, 1),
	('862', 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', 1, 1),
	('704', 'Viet Nam', 'VN', 'VNM', 1, 1),
	('92', 'Virgin Islands (British)', 'VG', 'VGB', 0, 1),
	('850', 'Virgin Islands (U.S.)', 'VI', 'VIR', 0, 1),
	('876', 'Wallis and Futuna', 'WF', 'WLF', 0, 1),
	('732', 'Western Sahara', 'EH', 'ESH', 0, 1),
	('887', 'Yemen', 'YE', 'YEM', 1, 1),
	('894', 'Zambia', 'ZM', 'ZMB', 1, 1),
	('716', 'Zimbabwe', 'ZW', 'ZWE', 1, 1)
GO


/*------------------------------------------------------------------Group Type*/

USE [Atlas]
GO

/*Root*/

INSERT INTO
	[Atlas].[live].[GroupType]
	(
		[node],
		[name],
		[actv_yn]
	)
VALUES
	(
		hierarchyid::GetRoot(),
		'Organisation',
		1
	)
GO

/*Other elements*/

EXEC [Atlas].[live].[GroupType_Insert]		1,		'Subsidiary',						1;
EXEC [Atlas].[live].[GroupType_Insert]		2,		'Division',							1;
EXEC [Atlas].[live].[GroupType_Insert]		3,		'Business Development Centre',		1;
EXEC [Atlas].[live].[GroupType_Insert]		3,		'Dealership',						1;
EXEC [Atlas].[live].[GroupType_Insert]		5,		'Department',						1;
GO


/*------------------------------------------------------------------Group*/

USE [Atlas]
GO

/*Root*/

INSERT INTO
	[Atlas].[live].[Group]
	(
		[node],
		[name],
		[group_type_id],
		[actv_yn]
	)
VALUES
	(
		hierarchyid::GetRoot(),
		'Lookers PLC',
		1,
		1
	)
GO

/*Other elements*/

EXEC [Atlas].[live].[Group_Insert]		1,		'Audi South Dublin',						3,		1;
EXEC [Atlas].[live].[Group_Insert]		1,		'Charles Hurst',							3,		1;
EXEC [Atlas].[live].[Group_Insert]		1,		'Lookers',									3,		1;
EXEC [Atlas].[live].[Group_Insert]		1,		'Taggarts',									3,		1;
EXEC [Atlas].[live].[Group_Insert]		1,		'UseDirect',								3,		1;
GO