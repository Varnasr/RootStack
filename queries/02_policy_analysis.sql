-- ============================================================
-- Policy & Scheme Analysis Queries
-- Budget tracking, coverage, and effectiveness
-- ============================================================

-- 1. Scheme budget overview
-- All schemes with their latest budget allocation and spending
SELECT
    sc.scheme_name,
    sc.ministry,
    sec.sector_name,
    sb.financial_year,
    sb.budget_allocated AS allocated_cr,
    sb.budget_spent AS spent_cr,
    ROUND(sb.budget_spent * 100.0 / NULLIF(sb.budget_allocated, 0), 1) AS utilization_pct
FROM schemes sc
JOIN scheme_budgets sb ON sc.scheme_id = sb.scheme_id
LEFT JOIN sectors sec ON sc.sector_id = sec.sector_id
WHERE sb.financial_year = '2023-24'
ORDER BY sb.budget_allocated DESC;


-- 2. Top schemes by budget size
SELECT
    sc.scheme_name,
    sc.level,
    SUM(sb.budget_allocated) AS total_allocated_cr,
    SUM(sb.budget_spent) AS total_spent_cr,
    ROUND(SUM(sb.budget_spent) * 100.0 / NULLIF(SUM(sb.budget_allocated), 0), 1) AS avg_utilization
FROM schemes sc
JOIN scheme_budgets sb ON sc.scheme_id = sb.scheme_id
GROUP BY sc.scheme_id
ORDER BY total_allocated_cr DESC;


-- 3. Sector-wise government spending
SELECT
    sec.sector_name,
    COUNT(DISTINCT sc.scheme_id) AS num_schemes,
    SUM(sb.budget_allocated) AS total_allocated_cr,
    SUM(sb.budget_spent) AS total_spent_cr
FROM sectors sec
JOIN schemes sc ON sec.sector_id = sc.sector_id
JOIN scheme_budgets sb ON sc.scheme_id = sb.scheme_id
WHERE sb.financial_year = '2023-24'
GROUP BY sec.sector_name
ORDER BY total_allocated_cr DESC;


-- 4. Under-utilised schemes (budget allocated but poorly spent)
SELECT
    sc.scheme_name,
    sb.financial_year,
    sb.budget_allocated AS allocated_cr,
    sb.budget_spent AS spent_cr,
    ROUND(sb.budget_spent * 100.0 / NULLIF(sb.budget_allocated, 0), 1) AS utilization_pct
FROM schemes sc
JOIN scheme_budgets sb ON sc.scheme_id = sb.scheme_id
WHERE sb.budget_spent IS NOT NULL
  AND sb.budget_allocated > 0
  AND (sb.budget_spent * 100.0 / sb.budget_allocated) < 80
ORDER BY utilization_pct ASC;


-- 5. Schemes targeting women and gender equity
SELECT
    sc.scheme_name,
    sc.description,
    sc.beneficiary_type,
    sb.budget_allocated AS latest_budget_cr
FROM schemes sc
LEFT JOIN scheme_budgets sb ON sc.scheme_id = sb.scheme_id
    AND sb.financial_year = '2023-24'
WHERE sc.sector_id LIKE 'gender%'
   OR sc.beneficiary_type LIKE '%Women%'
   OR sc.beneficiary_type LIKE '%Girl%'
ORDER BY sb.budget_allocated DESC;
