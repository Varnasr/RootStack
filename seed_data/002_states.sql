-- ============================================================
-- Indian states and UTs with basic metadata
-- Source: Census 2011, updated boundaries
-- ============================================================

INSERT INTO states (state_id, state_name, state_name_hi, region, state_type, capital, area_sq_km, census_2011_pop) VALUES
('AP', 'Andhra Pradesh',       'आन्ध्र प्रदेश',     'South',     'State', 'Amaravati',        162968, 49386799),
('AR', 'Arunachal Pradesh',    'अरुणाचल प्रदेश',    'Northeast', 'State', 'Itanagar',         83743,  1383727),
('AS', 'Assam',                'असम',               'Northeast', 'State', 'Dispur',           78438,  31205576),
('BR', 'Bihar',                'बिहार',              'East',      'State', 'Patna',            94163,  104099452),
('CG', 'Chhattisgarh',         'छत्तीसगढ़',          'Central',   'State', 'Raipur',           135192, 25545198),
('GA', 'Goa',                  'गोवा',              'West',      'State', 'Panaji',           3702,   1458545),
('GJ', 'Gujarat',              'गुजरात',             'West',      'State', 'Gandhinagar',      196024, 60439692),
('HR', 'Haryana',              'हरियाणा',            'North',     'State', 'Chandigarh',       44212,  25351462),
('HP', 'Himachal Pradesh',     'हिमाचल प्रदेश',     'North',     'State', 'Shimla',           55673,  6864602),
('JH', 'Jharkhand',            'झारखण्ड',            'East',      'State', 'Ranchi',           79716,  32988134),
('KA', 'Karnataka',            'कर्नाटक',            'South',     'State', 'Bengaluru',        191791, 61095297),
('KL', 'Kerala',               'केरल',              'South',     'State', 'Thiruvananthapuram',38852,  33406061),
('MP', 'Madhya Pradesh',       'मध्य प्रदेश',       'Central',   'State', 'Bhopal',           308252, 72626809),
('MH', 'Maharashtra',          'महाराष्ट्र',          'West',      'State', 'Mumbai',           307713, 112374333),
('MN', 'Manipur',              'मणिपुर',             'Northeast', 'State', 'Imphal',           22327,  2855794),
('ML', 'Meghalaya',            'मेघालय',             'Northeast', 'State', 'Shillong',         22429,  2966889),
('MZ', 'Mizoram',              'मिज़ोरम',            'Northeast', 'State', 'Aizawl',           21081,  1097206),
('NL', 'Nagaland',             'नागालैण्ड',          'Northeast', 'State', 'Kohima',           16579,  1978502),
('OD', 'Odisha',               'ओडिशा',             'East',      'State', 'Bhubaneswar',      155707, 41974218),
('PB', 'Punjab',               'पंजाब',              'North',     'State', 'Chandigarh',       50362,  27743338),
('RJ', 'Rajasthan',            'राजस्थान',            'West',      'State', 'Jaipur',           342239, 68548437),
('SK', 'Sikkim',               'सिक्किम',            'Northeast', 'State', 'Gangtok',          7096,   610577),
('TN', 'Tamil Nadu',           'तमिल नाडु',         'South',     'State', 'Chennai',          130058, 72147030),
('TG', 'Telangana',            'तेलंगाना',            'South',     'State', 'Hyderabad',        112077, 35003674),
('TR', 'Tripura',              'त्रिपुरा',            'Northeast', 'State', 'Agartala',         10486,  3673917),
('UP', 'Uttar Pradesh',        'उत्तर प्रदेश',      'North',     'State', 'Lucknow',          240928, 199812341),
('UK', 'Uttarakhand',          'उत्तराखण्ड',         'North',     'State', 'Dehradun',         53483,  10086292),
('WB', 'West Bengal',          'पश्चिम बंगाल',      'East',      'State', 'Kolkata',          88752,  91276115),
('DL', 'Delhi',                'दिल्ली',              'North',     'UT',    'New Delhi',        1484,   16787941),
('JK', 'Jammu & Kashmir',      'जम्मू और कश्मीर',   'North',     'UT',    'Srinagar',         42241,  12541302);
