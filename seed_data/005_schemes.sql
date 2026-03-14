-- ============================================================
-- Major Indian government schemes with budget data
-- Sources: Union Budget, Ministry annual reports
-- ============================================================

INSERT INTO schemes (scheme_id, scheme_name, scheme_name_hi, ministry, sector_id, level, launch_year, status, description, beneficiary_type) VALUES
-- Health
('pmjay',       'Pradhan Mantri Jan Arogya Yojana (Ayushman Bharat)', 'प्रधानमंत्री जन आरोग्य योजना', 'Ministry of Health & Family Welfare', 'health', 'Central', 2018, 'Active', 'Health insurance cover of Rs 5 lakh per family per year for secondary and tertiary care', 'BPL families'),
('poshan',      'POSHAN Abhiyaan (PM Overarching Scheme for Holistic Nutrition)', 'पोषण अभियान', 'Ministry of Women & Child Development', 'health_nutrition', 'Central', 2018, 'Active', 'Reduce stunting, undernutrition, anaemia, and low birth weight', 'Children, pregnant women'),
('nrhm',        'National Health Mission',              'राष्ट्रीय स्वास्थ्य मिशन', 'Ministry of Health & Family Welfare', 'health', 'Central+State', 2013, 'Active', 'Strengthen healthcare delivery across rural and urban areas', 'All'),
('sbm',         'Swachh Bharat Mission',                'स्वच्छ भारत मिशन', 'Ministry of Jal Shakti', 'health_wash', 'Central', 2014, 'Active', 'Universal sanitation coverage, ODF status', 'All'),
('jjm',         'Jal Jeevan Mission',                   'जल जीवन मिशन', 'Ministry of Jal Shakti', 'health_wash', 'Central', 2019, 'Active', 'Functional household tap connection to every rural household', 'Rural households'),

-- Education
('samagra',     'Samagra Shiksha Abhiyan',              'समग्र शिक्षा अभियान', 'Ministry of Education', 'education', 'Central+State', 2018, 'Active', 'Integrated scheme for school education from pre-school to class 12', 'All students'),
('mdm',         'PM POSHAN (Mid-Day Meal)',             'पीएम पोषण', 'Ministry of Education', 'edu_primary', 'Central', 1995, 'Active', 'Free lunch in government and aided schools', 'Students class 1-8'),
('skill_india', 'Skill India Mission',                  'कौशल भारत मिशन', 'Ministry of Skill Development', 'edu_skills', 'Central', 2015, 'Active', 'Skill training and certification for youth', 'Youth 15-35'),

-- Gender
('bbbp',        'Beti Bachao Beti Padhao',              'बेटी बचाओ बेटी पढ़ाओ', 'Ministry of Women & Child Development', 'gender', 'Central', 2015, 'Active', 'Improve child sex ratio, education and empowerment of girls', 'Girls'),
('pmmy',        'Pradhan Mantri Mudra Yojana',          'प्रधानमंत्री मुद्रा योजना', 'Ministry of Finance', 'gender_wee', 'Central', 2015, 'Active', 'Micro-finance loans up to Rs 10 lakh for small enterprises', 'Micro-entrepreneurs'),
('nrlm',        'Deendayal Antyodaya Yojana - NRLM',   'दीनदयाल अंत्योदय योजना', 'Ministry of Rural Development', 'gender_wee', 'Central+State', 2011, 'Active', 'Organise rural poor women into SHGs for livelihood improvement', 'Rural women'),

-- Climate
('ncap',        'National Clean Air Programme',         'राष्ट्रीय स्वच्छ वायु कार्यक्रम', 'Ministry of Environment', 'climate_air', 'Central', 2019, 'Active', 'Reduce PM2.5 and PM10 by 40% by 2026 in 131 non-attainment cities', 'Urban population'),
('pmkusum',     'PM-KUSUM (Solar Energy)',              'पीएम-कुसुम', 'Ministry of New & Renewable Energy', 'climate_energy', 'Central', 2019, 'Active', 'Solar pumps and grid-connected solar plants for farmers', 'Farmers'),
('ndma_flood',  'NDMA Flood Management Programme',      'बाढ़ प्रबंधन कार्यक्रम', 'NDMA / Ministry of Home Affairs', 'climate_water', 'Central+State', 2007, 'Active', 'Flood forecasting, early warning, structural measures', 'Flood-prone areas'),

-- Livelihoods
('mgnrega',     'MGNREGA',                             'मनरेगा', 'Ministry of Rural Development', 'livelihoods', 'Central', 2005, 'Active', '100 days guaranteed wage employment per rural household per year', 'Rural households'),
('pmksy',       'PM Kisan Samman Nidhi',                'पीएम किसान सम्मान निधि', 'Ministry of Agriculture', 'livelihoods', 'Central', 2019, 'Active', 'Rs 6000 per year income support to farmer families', 'Small/marginal farmers');

-- Budget data (in crores INR)
INSERT INTO scheme_budgets (scheme_id, financial_year, budget_allocated, budget_revised, budget_spent, source) VALUES
('pmjay',   '2023-24', 7200,   7200,   6800,   'Union Budget 2023-24'),
('pmjay',   '2024-25', 7500,   NULL,   NULL,   'Union Budget 2024-25'),
('poshan',  '2023-24', 20263,  18000,  17500,  'Union Budget 2023-24'),
('nrhm',    '2023-24', 36785,  35000,  33200,  'Union Budget 2023-24'),
('sbm',     '2023-24', 7192,   7000,   6500,   'Union Budget 2023-24'),
('jjm',     '2023-24', 70000,  67000,  62000,  'Union Budget 2023-24'),
('samagra', '2023-24', 37453,  36000,  34500,  'Union Budget 2023-24'),
('mdm',     '2023-24', 11600,  11000,  10800,  'Union Budget 2023-24'),
('bbbp',    '2023-24', 200,    180,    170,    'Union Budget 2023-24'),
('mgnrega', '2023-24', 60000,  86000,  82000,  'Union Budget 2023-24'),
('pmksy',   '2023-24', 60000,  58000,  57000,  'Union Budget 2023-24'),
('ncap',    '2023-24', 460,    400,    350,    'Union Budget 2023-24'),
('nrlm',    '2023-24', 14129,  13500,  12800,  'Union Budget 2023-24');
