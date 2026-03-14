-- ============================================================
-- Development indicators with real values
-- Sources: NFHS-5, UDISE+, AQICN, Census 2011
-- ============================================================

-- Define indicators
INSERT INTO indicators (indicator_id, indicator_name, sector_id, unit, direction, source, frequency, description) VALUES
-- Health
('imr',             'Infant Mortality Rate',            'health_mch',       'per_1000',     'lower_better',     'SRS',          'annual',   'Deaths per 1000 live births under age 1'),
('mmr',             'Maternal Mortality Ratio',         'health_mch',       'per_100000',   'lower_better',     'SRS',          'annual',   'Maternal deaths per 100,000 live births'),
('stunting',        'Stunting (under 5)',               'health_nutrition', 'percent',      'lower_better',     'NFHS-5',       'periodic', 'Percentage of children under 5 who are stunted'),
('wasting',         'Wasting (under 5)',                'health_nutrition', 'percent',      'lower_better',     'NFHS-5',       'periodic', 'Percentage of children under 5 who are wasted'),
('anaemia_women',   'Anaemia (women 15-49)',            'health_nutrition', 'percent',      'lower_better',     'NFHS-5',       'periodic', 'Percentage of women 15-49 with anaemia'),
('anc_4visits',     'ANC 4+ visits',                    'health_mch',       'percent',      'higher_better',    'NFHS-5',       'periodic', 'Mothers who had 4+ antenatal care visits'),
('institutional_delivery', 'Institutional Delivery',    'health_mch',       'percent',      'higher_better',    'NFHS-5',       'periodic', 'Births in health facility'),
('immunization',    'Full Immunization (12-23 months)', 'health_mch',       'percent',      'higher_better',    'NFHS-5',       'periodic', 'Children 12-23 months fully immunized'),
('sanitation',      'Household Toilet Access',          'health_wash',      'percent',      'higher_better',    'NFHS-5',       'periodic', 'Households with improved sanitation'),

-- Education
('literacy_rate',   'Literacy Rate',                    'education',        'percent',      'higher_better',    'Census',       'decennial','Population 7+ who can read and write'),
('ger_primary',     'Gross Enrolment Ratio (Primary)',  'edu_primary',      'percent',      'higher_better',    'UDISE+',       'annual',   'Enrolment in classes 1-5 as % of age group'),
('ger_secondary',   'Gross Enrolment Ratio (Secondary)','edu_secondary',    'percent',      'higher_better',    'UDISE+',       'annual',   'Enrolment in classes 9-10 as % of age group'),
('dropout_secondary','Dropout Rate (Secondary)',        'edu_secondary',    'percent',      'lower_better',     'UDISE+',       'annual',   'Students dropping out at secondary level'),
('ptr',             'Pupil-Teacher Ratio',              'education',        'ratio',        'lower_better',     'UDISE+',       'annual',   'Number of students per teacher'),

-- Gender
('sex_ratio',       'Sex Ratio at Birth',               'gender',           'per_1000',     'higher_better',    'SRS',          'annual',   'Females per 1000 males at birth'),
('female_lfp',      'Female Labour Force Participation','gender_wee',       'percent',      'higher_better',    'PLFS',         'annual',   'Women 15+ in labour force'),
('women_bank_acct', 'Women with Bank Account',          'gender_wee',       'percent',      'higher_better',    'NFHS-5',       'periodic', 'Women 15-49 with own bank account'),

-- Climate
('pm25_annual',     'Annual Mean PM2.5',                'climate_air',      'ug_per_m3',    'lower_better',     'CPCB/WAQI',    'annual',   'Annual mean PM2.5 concentration'),
('flood_risk',      'Flood Risk Index',                 'climate_water',    'index',        'lower_better',     'NDMA',         'periodic', 'Composite flood vulnerability score 0-1'),
('drought_risk',    'Drought Risk Index',               'climate_water',    'index',        'lower_better',     'NDMA',         'periodic', 'Composite drought vulnerability score 0-1');

-- Sample indicator values (realistic data based on NFHS-5, UDISE+, CPCB)
INSERT INTO indicator_values (indicator_id, state_id, year, value, value_male, value_female, source_detail) VALUES
-- IMR by state (SRS 2020)
('imr', 'BR', 2020, 38, 36, 40, 'SRS 2020'),
('imr', 'UP', 2020, 40, 38, 43, 'SRS 2020'),
('imr', 'KL', 2020, 6,  7,  5,  'SRS 2020'),
('imr', 'TN', 2020, 13, 13, 13, 'SRS 2020'),
('imr', 'MP', 2020, 36, 34, 39, 'SRS 2020'),
('imr', 'RJ', 2020, 32, 30, 35, 'SRS 2020'),
('imr', 'MH', 2020, 16, 16, 16, 'SRS 2020'),
('imr', 'DL', 2020, 14, 14, 14, 'SRS 2020'),

-- Stunting by state (NFHS-5)
('stunting', 'BR', 2021, 42.9, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'UP', 2021, 39.7, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'MP', 2021, 35.7, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'KL', 2021, 23.4, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'TN', 2021, 25.0, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'MH', 2021, 35.2, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'KA', 2021, 35.4, NULL, NULL, 'NFHS-5 2019-21'),
('stunting', 'GJ', 2021, 39.0, NULL, NULL, 'NFHS-5 2019-21'),

-- Anaemia in women (NFHS-5)
('anaemia_women', 'BR', 2021, 63.5, NULL, NULL, 'NFHS-5 2019-21'),
('anaemia_women', 'JH', 2021, 65.3, NULL, NULL, 'NFHS-5 2019-21'),
('anaemia_women', 'WB', 2021, 62.3, NULL, NULL, 'NFHS-5 2019-21'),
('anaemia_women', 'KL', 2021, 36.3, NULL, NULL, 'NFHS-5 2019-21'),
('anaemia_women', 'TN', 2021, 53.2, NULL, NULL, 'NFHS-5 2019-21'),
('anaemia_women', 'DL', 2021, 55.0, NULL, NULL, 'NFHS-5 2019-21'),

-- Female LFPR by state (PLFS 2022-23)
('female_lfp', 'BR', 2023, 10.2, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'UP', 2023, 19.8, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'TN', 2023, 36.2, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'KL', 2023, 28.4, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'RJ', 2023, 35.1, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'MH', 2023, 31.6, NULL, NULL, 'PLFS 2022-23'),
('female_lfp', 'KA', 2023, 27.3, NULL, NULL, 'PLFS 2022-23'),

-- PM2.5 annual mean (CPCB/IQAir 2023)
('pm25_annual', 'DL', 2023, 92.6,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'BR', 2023, 76.2,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'UP', 2023, 81.4,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'HR', 2023, 68.3,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'WB', 2023, 59.7,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'MH', 2023, 38.2,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'KL', 2023, 22.1,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'TN', 2023, 31.4,  NULL, NULL, 'IQAir 2023'),
('pm25_annual', 'KA', 2023, 29.8,  NULL, NULL, 'IQAir 2023');

-- District-level indicator values
INSERT INTO indicator_values (indicator_id, district_id, year, value, source_detail) VALUES
-- Stunting at district level
('stunting', 'JH-khunti',     2021, 48.2, 'NFHS-5 District Factsheet'),
('stunting', 'JH-west-sing',  2021, 45.6, 'NFHS-5 District Factsheet'),
('stunting', 'KA-chamaraj',   2021, 38.0, 'NFHS-5 District Factsheet'),
('stunting', 'BR-patna',      2021, 35.1, 'NFHS-5 District Factsheet'),
('stunting', 'WB-birbhum',    2021, 41.3, 'NFHS-5 District Factsheet'),
('stunting', 'WB-maldah',     2021, 39.8, 'NFHS-5 District Factsheet'),
('stunting', 'AS-dhubri',     2021, 44.7, 'NFHS-5 District Factsheet'),

-- Flood and drought risk at district level
('flood_risk',   'WB-birbhum',   2022, 0.40, 'NDMA Risk Atlas'),
('flood_risk',   'WB-maldah',    2022, 0.30, 'NDMA Risk Atlas'),
('drought_risk', 'WB-birbhum',   2022, 0.49, 'NDMA Risk Atlas'),
('drought_risk', 'WB-maldah',    2022, 0.13, 'NDMA Risk Atlas'),
('flood_risk',   'AS-dhubri',    2022, 0.72, 'NDMA Risk Atlas'),
('drought_risk', 'RJ-barmer',    2022, 0.81, 'NDMA Risk Atlas');
