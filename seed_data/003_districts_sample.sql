-- ============================================================
-- Sample districts (high-priority for development analysis)
-- A representative set across states and tiers
-- ============================================================

INSERT INTO districts (district_id, district_name, state_id, tier, census_2011_pop, latitude, longitude) VALUES
-- Delhi NCR
('DL-central',     'Central Delhi',        'DL', 'Metro',      578671,  28.6353, 77.2250),
('DL-south',       'South Delhi',          'DL', 'Metro',      2731929, 28.5300, 77.2200),
('HR-gurgaon',     'Gurgaon',              'HR', 'Metro',      1514085, 28.4595, 77.0266),
('UP-noida',       'Gautam Buddh Nagar',   'UP', 'Urban',      1674714, 28.5355, 77.3910),

-- Bihar (high-focus)
('BR-patna',       'Patna',                'BR', 'Urban',      5838465, 25.6093, 85.1376),
('BR-muzaffarpur', 'Muzaffarpur',          'BR', 'Semi-Urban', 4801062, 26.1197, 85.3910),
('BR-gaya',        'Gaya',                 'BR', 'Semi-Urban', 4391418, 24.7914, 85.0002),

-- Jharkhand (tribal)
('JH-ranchi',      'Ranchi',               'JH', 'Urban',      2914253, 23.3569, 85.3340),
('JH-west-sing',   'West Singhbhum',       'JH', 'Tribal',     1502338, 22.3667, 85.8333),
('JH-khunti',      'Khunti',               'JH', 'Tribal',     531885,  23.0500, 85.2833),

-- Rajasthan
('RJ-jaipur',      'Jaipur',               'RJ', 'Metro',      6626178, 26.9124, 75.7873),
('RJ-barmer',      'Barmer',               'RJ', 'Rural',      2603751, 25.7521, 71.4236),

-- West Bengal
('WB-kolkata',     'Kolkata',              'WB', 'Metro',      4486679, 22.5726, 88.3639),
('WB-birbhum',    'Birbhum',              'WB', 'Semi-Urban', 3502404, 23.8570, 87.5500),
('WB-maldah',     'Maldah',               'WB', 'Rural',      3997970, 25.0108, 88.1410),

-- Karnataka
('KA-bengaluru',   'Bengaluru Urban',      'KA', 'Metro',      9621551, 12.9716, 77.5946),
('KA-chamaraj',    'Chamarajanagar',       'KA', 'Rural',      1020962, 11.9261, 76.9437),
('KA-ballari',     'Ballari',              'KA', 'Semi-Urban', 2532383, 15.1394, 76.9214),

-- Assam (Northeast)
('AS-kamrup',      'Kamrup Metropolitan',  'AS', 'Urban',      1260419, 26.1445, 91.7362),
('AS-dhubri',      'Dhubri',               'AS', 'Rural',      1948632, 26.0200, 89.9800),

-- Tamil Nadu
('TN-chennai',     'Chennai',              'TN', 'Metro',      4646732, 13.0827, 80.2707),
('TN-madurai',     'Madurai',              'TN', 'Urban',      3038252, 9.9252,  78.1198),

-- Madhya Pradesh
('MP-bhopal',      'Bhopal',               'MP', 'Metro',      2371061, 23.2599, 77.4126),
('MP-sheopur',     'Sheopur',              'MP', 'Tribal',     687861,  25.6671, 76.6986),

-- Maharashtra
('MH-mumbai',      'Mumbai',               'MH', 'Metro',      3085411, 19.0760, 72.8777),
('MH-pune',        'Pune',                 'MH', 'Metro',      9426959, 18.5204, 73.8567);
