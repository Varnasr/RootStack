-- ============================================================
-- Health Dashboard Queries
-- Common analysis patterns for health indicators
-- ============================================================

-- 1. State-level health scorecard
-- Compare key health indicators across states
SELECT
    s.state_name,
    MAX(CASE WHEN iv.indicator_id = 'imr' THEN iv.value END) AS infant_mortality_rate,
    MAX(CASE WHEN iv.indicator_id = 'stunting' THEN iv.value END) AS stunting_pct,
    MAX(CASE WHEN iv.indicator_id = 'anaemia_women' THEN iv.value END) AS anaemia_women_pct,
    MAX(CASE WHEN iv.indicator_id = 'immunization' THEN iv.value END) AS immunization_pct
FROM indicator_values iv
JOIN states s ON iv.state_id = s.state_id
WHERE iv.indicator_id IN ('imr', 'stunting', 'anaemia_women', 'immunization')
GROUP BY s.state_name
ORDER BY infant_mortality_rate DESC;


-- 2. Worst-performing districts for stunting
-- Identify districts needing nutrition interventions
SELECT
    d.district_name,
    s.state_name,
    d.tier,
    iv.value AS stunting_pct,
    iv.source_detail
FROM indicator_values iv
JOIN districts d ON iv.district_id = d.district_id
JOIN states s ON d.state_id = s.state_id
WHERE iv.indicator_id = 'stunting'
ORDER BY iv.value DESC
LIMIT 10;


-- 3. IMR trend comparison: high-burden vs low-burden states
SELECT
    s.state_name,
    s.region,
    iv.year,
    iv.value AS imr,
    CASE
        WHEN iv.value > 30 THEN 'High burden'
        WHEN iv.value > 15 THEN 'Medium burden'
        ELSE 'Low burden'
    END AS burden_category
FROM indicator_values iv
JOIN states s ON iv.state_id = s.state_id
WHERE iv.indicator_id = 'imr'
ORDER BY iv.value DESC;


-- 4. Gender gap in health outcomes
-- States where male-female differences are largest
SELECT
    s.state_name,
    iv.indicator_id,
    i.indicator_name,
    iv.value AS overall,
    iv.value_male,
    iv.value_female,
    ABS(COALESCE(iv.value_male, 0) - COALESCE(iv.value_female, 0)) AS gender_gap
FROM indicator_values iv
JOIN states s ON iv.state_id = s.state_id
JOIN indicators i ON iv.indicator_id = i.indicator_id
WHERE iv.value_male IS NOT NULL AND iv.value_female IS NOT NULL
ORDER BY gender_gap DESC;
