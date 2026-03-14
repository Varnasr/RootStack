-- ============================================================
-- Sector taxonomy matching OpenStacks focus areas
-- ============================================================

INSERT INTO sectors (sector_id, sector_name, description, parent_id) VALUES
-- Top-level sectors
('health',      'Health',               'Public health, nutrition, maternal & child health',    NULL),
('education',   'Education',            'Primary, secondary, higher education, skills',         NULL),
('gender',      'Gender Equity',        'Women''s empowerment, gender-based violence, WEE',     NULL),
('climate',     'Climate & Environment','Climate resilience, air quality, natural resources',    NULL),
('governance',  'Governance',           'Public finance, accountability, institutional reform',  NULL),
('livelihoods', 'Livelihoods',          'Employment, agriculture, rural development',           NULL),

-- Health sub-sectors
('health_mch',      'Maternal & Child Health',  'Antenatal care, immunization, nutrition',      'health'),
('health_nutrition', 'Nutrition',               'Malnutrition, stunting, wasting, anaemia',     'health'),
('health_wash',     'WASH',                     'Water, sanitation, and hygiene',               'health'),
('health_ncd',      'Non-Communicable Diseases','Diabetes, hypertension, mental health',        'health'),

-- Education sub-sectors
('edu_primary',     'Primary Education',        'Classes 1-5, foundational literacy',           'education'),
('edu_secondary',   'Secondary Education',      'Classes 6-12, learning outcomes',              'education'),
('edu_skills',      'Skills & Vocational',      'Skill India, vocational training',             'education'),

-- Gender sub-sectors
('gender_wee',      'Women''s Economic Empowerment', 'SHGs, microfinance, employment',          'gender'),
('gender_gbv',      'Gender-Based Violence',    'Domestic violence, trafficking, legal aid',     'gender'),
('gender_political','Political Participation',  'Panchayat representation, leadership',          'gender'),

-- Climate sub-sectors
('climate_air',     'Air Quality',              'AQI monitoring, pollution control',             'climate'),
('climate_water',   'Water Resources',          'Groundwater, flood risk, drought',              'climate'),
('climate_energy',  'Clean Energy',             'Solar, renewable transitions',                  'climate');
