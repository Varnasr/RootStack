# RootStack

**Foundational data schemas, seed data, and queries for the OpenStacks ecosystem.**

[![Part of OpenStacks](https://img.shields.io/badge/Part%20of-OpenStacks-blue)](https://openstacks.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> The database layer for OpenStacks — structured development data for India and South Asia.

---

## What This Is

RootStack provides a **SQLite database** with schemas, seed data, and ready-to-use queries covering three domains:

1. **Development Indicators** — Health, education, gender, and climate data at state and district level (NFHS-5, SRS, UDISE+, CPCB)
2. **Government Schemes** — Central and state schemes with budget allocation, spending, and coverage data
3. **Tools Catalog** — Registry of all scripts, notebooks, and templates across the OpenStacks ecosystem

## Quick Start

```bash
git clone https://github.com/Varnasr/RootStack.git
cd RootStack
bash scripts/setup.sh
```

This creates `rootstack.db` with all tables seeded. Then run queries:

```bash
# Health indicators across states
sqlite3 -header -column rootstack.db < queries/01_health_dashboard.sql

# Government scheme budgets and spending
sqlite3 -header -column rootstack.db < queries/02_policy_analysis.sql

# Cross-cutting analysis (climate-health, tribal districts, tools search)
sqlite3 -header -column rootstack.db < queries/03_cross_cutting.sql
```

### Prerequisites

- **SQLite 3** (pre-installed on most systems; `brew install sqlite3` on Mac, `apt install sqlite3` on Linux)

## What's Inside

```
RootStack/
├── schemas/                    # Table definitions (run in order)
│   ├── 001_geography.sql       # States and districts of India
│   ├── 002_sectors.sql         # Development sector taxonomy
│   ├── 003_indicators.sql      # Indicator definitions and values
│   ├── 004_policies.sql        # Government schemes and budgets
│   └── 005_tools_catalog.sql   # OpenStacks tools registry
│
├── seed_data/                  # Initial data (run in order)
│   ├── 001_sectors.sql         # 19 sectors and sub-sectors
│   ├── 002_states.sql          # 30 states and UTs
│   ├── 003_districts_sample.sql# 26 sample districts across tiers
│   ├── 004_indicators.sql      # 20 indicators with 51 data points
│   ├── 005_schemes.sql         # 16 major schemes with budgets
│   └── 006_tools_catalog.sql   # 32 tools across 4 stacks
│
├── queries/                    # Ready-to-use analysis queries
│   ├── 01_health_dashboard.sql # State scorecards, district rankings, gender gaps
│   ├── 02_policy_analysis.sql  # Budget overview, utilization, sector spending
│   └── 03_cross_cutting.sql    # Multi-sector profiles, climate-health nexus
│
├── scripts/
│   └── setup.sh                # One-command database creation
│
└── docs/
    └── data_dictionary.md      # Table descriptions, field conventions, sources
```

## Database Schema

```
states ──< districts
sectors ──< indicators ──< indicator_values >── districts
sectors ──< schemes ──< scheme_budgets
                    ──< scheme_coverage >── states/districts
stacks ──< tools >── sectors
```

### Current Data

| Table | Records | Source |
|-------|---------|--------|
| States | 30 | Census 2011 |
| Districts | 26 (sample) | Census 2011 |
| Sectors | 19 | OpenStacks taxonomy |
| Indicators | 20 definitions | NFHS-5, SRS, PLFS, CPCB |
| Indicator Values | 51 data points | Various (see data dictionary) |
| Schemes | 16 major schemes | Union Budget, Ministry reports |
| Budgets | 13 entries | Union Budget 2023-24 |
| Stacks | 4 registered | OpenStacks ecosystem |
| Tools | 32 cataloged | InsightStack, FieldStack, EquityStack |

## Example Output

**State health scorecard:**
```
State           IMR    Stunting  Anaemia
Uttar Pradesh   40.0   39.7%
Bihar           38.0   42.9%     63.5%
Madhya Pradesh  36.0   35.7%
Kerala           6.0   23.4%     36.3%
```

**Scheme budget utilization:**
```
Scheme                       Allocated (Cr)  Spent (Cr)  Utilization
Jal Jeevan Mission           70,000          62,000      88.6%
MGNREGA                      60,000          82,000      136.7%
National Health Mission      36,785          33,200      90.3%
NCAP (Clean Air)                460             350      76.1%
```

## How It Connects

RootStack is the data foundation of the [OpenStacks](https://openstacks.dev) ecosystem:

| Stack | Role | Link |
|-------|------|------|
| **RootStack** (this repo) | Database schemas & seed data | You are here |
| [BridgeStack](https://github.com/Varnasr/BridgeStack) | API backend (FastAPI) | Will consume RootStack data |
| [ViewStack](https://github.com/Varnasr/ViewStack) | Frontend UI | Will display via BridgeStack |
| [InsightStack](https://github.com/Varnasr/InsightStack) | MEL tools (Stata/Python/R) | Tools cataloged here |
| [FieldStack](https://github.com/Varnasr/FieldStack) | R notebooks for fieldwork | Tools cataloged here |
| [EquityStack](https://github.com/Varnasr/EquityStack) | Python data workflows | Tools cataloged here |

## Contributing

Contributions welcome — especially:

- **More district data** — Expand from 26 to all 766 districts
- **More indicators** — Add UDISE+ education data, PLFS employment data
- **More schemes** — State-level schemes, historical budget data
- **PostgreSQL port** — Adapt schemas for PostgreSQL deployment
- **Migration scripts** — Schema versioning for production use

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT — free to use, modify, and share. See [LICENSE](LICENSE).

---

**Created by [Varna Sri Raman](https://github.com/Varnasr)** — Development Economist & Social Researcher
