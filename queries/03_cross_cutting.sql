-- ============================================================
-- Cross-Cutting Analysis Queries
-- Combine indicators, geography, and policies
-- ============================================================

-- 1. Multi-sector district profile
-- Everything we know about a single district
SELECT
    d.district_name,
    s.state_name,
    d.tier,
    d.census_2011_pop,
    i.indicator_name,
    sec.sector_name,
    iv.value,
    i.unit,
    i.direction,
    iv.year,
    iv.source_detail
FROM indicator_values iv
JOIN districts d ON iv.district_id = d.district_id
JOIN states s ON d.state_id = s.state_id
JOIN indicators i ON iv.indicator_id = i.indicator_id
JOIN sectors sec ON i.sector_id = sec.sector_id
WHERE d.district_id = 'JH-khunti'
ORDER BY sec.sector_name, i.indicator_name;


-- 2. Climate-health nexus
-- States with both high air pollution AND high health burden
SELECT
    s.state_name,
    MAX(CASE WHEN iv.indicator_id = 'pm25_annual' THEN iv.value END) AS pm25,
    MAX(CASE WHEN iv.indicator_id = 'imr' THEN iv.value END) AS imr,
    MAX(CASE WHEN iv.indicator_id = 'stunting' THEN iv.value END) AS stunting,
    MAX(CASE WHEN iv.indicator_id = 'anaemia_women' THEN iv.value END) AS anaemia
FROM indicator_values iv
JOIN states s ON iv.state_id = s.state_id
GROUP BY s.state_name
HAVING pm25 IS NOT NULL AND imr IS NOT NULL
ORDER BY pm25 DESC;


-- 3. Tribal district vulnerability dashboard
-- Indicators for tribal-tier districts
SELECT
    d.district_name,
    s.state_name,
    i.indicator_name,
    iv.value,
    i.unit,
    i.direction
FROM indicator_values iv
JOIN districts d ON iv.district_id = d.district_id
JOIN states s ON d.state_id = s.state_id
JOIN indicators i ON iv.indicator_id = i.indicator_id
WHERE d.tier = 'Tribal'
ORDER BY d.district_name, i.indicator_name;


-- 4. Find tools relevant to a sector
-- What OpenStacks tools are available for health work?
SELECT
    t.tool_name,
    st.stack_name,
    t.language,
    t.tool_type,
    t.difficulty,
    t.description,
    t.directory
FROM tools t
JOIN stacks st ON t.stack_id = st.stack_id
LEFT JOIN sectors sec ON t.sector_id = sec.sector_id
WHERE t.sector_id = 'health'
   OR t.tags LIKE '%health%'
ORDER BY st.stack_name, t.tool_name;


-- 5. Regional inequality snapshot
-- Average indicator values by region
SELECT
    s.region,
    i.indicator_name,
    ROUND(AVG(iv.value), 1) AS avg_value,
    ROUND(MIN(iv.value), 1) AS min_value,
    ROUND(MAX(iv.value), 1) AS max_value,
    COUNT(*) AS num_states
FROM indicator_values iv
JOIN states s ON iv.state_id = s.state_id
JOIN indicators i ON iv.indicator_id = i.indicator_id
WHERE iv.indicator_id IN ('imr', 'stunting', 'female_lfp', 'pm25_annual')
GROUP BY s.region, i.indicator_name
ORDER BY i.indicator_name, avg_value DESC;
