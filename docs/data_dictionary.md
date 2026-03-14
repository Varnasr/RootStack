# RootStack Data Dictionary

## Tables Overview

| Table | Purpose | Key Fields |
|-------|---------|------------|
| `states` | Indian states and UTs | state_id, state_name, region, census_2011_pop |
| `districts` | Districts within states | district_id, district_name, state_id, tier |
| `sectors` | Development sector taxonomy | sector_id, sector_name, parent_id |
| `indicators` | Indicator definitions | indicator_id, indicator_name, unit, direction |
| `indicator_values` | Actual indicator data points | indicator_id, state_id/district_id, year, value |
| `schemes` | Government schemes and policies | scheme_id, scheme_name, ministry, sector_id |
| `scheme_budgets` | Budget allocation and spending | scheme_id, financial_year, allocated, spent |
| `scheme_coverage` | Scheme beneficiary coverage | scheme_id, state_id, beneficiaries, target |
| `stacks` | OpenStacks repository registry | stack_id, stack_name, repo_url |
| `tools` | Tools catalog across stacks | tool_id, stack_id, directory, language, tool_type |

## Key Relationships

```
states ──< districts
sectors ──< indicators ──< indicator_values >── districts
sectors ──< schemes ──< scheme_budgets
                    ──< scheme_coverage >── states/districts
stacks ──< tools >── sectors
```

## Data Sources

| Source | Coverage | Indicators |
|--------|----------|------------|
| NFHS-5 (2019-21) | State + District | Stunting, anaemia, immunization, ANC, delivery |
| SRS 2020 | State | IMR, MMR, sex ratio |
| PLFS 2022-23 | State | Female LFPR |
| UDISE+ | State + District | GER, dropout, PTR |
| Census 2011 | State + District | Population, literacy, area |
| IQAir/CPCB 2023 | State + City | PM2.5 annual mean |
| NDMA Risk Atlas | District | Flood risk, drought risk |
| Union Budget | National | Scheme budget allocation/spending |

## Field Conventions

- **IDs**: lowercase with hyphens (e.g., `JH-khunti`, `health_mch`)
- **Dates**: ISO 8601 strings (SQLite convention)
- **Money**: Crores INR for budgets
- **Rates**: Per 1000 or per 100,000 as indicated by unit
- **Percentages**: Stored as 0-100 (not 0-1)
- **Indices**: Stored as 0-1 range
