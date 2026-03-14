-- ============================================================
-- RootStack: Government Policies & Schemes
-- Central and state schemes with budget tracking
-- ============================================================

CREATE TABLE IF NOT EXISTS schemes (
    scheme_id           TEXT PRIMARY KEY,
    scheme_name         TEXT NOT NULL,
    scheme_name_hi      TEXT,
    ministry            TEXT NOT NULL,
    sector_id           TEXT REFERENCES sectors(sector_id),
    level               TEXT CHECK (level IN ('Central', 'State', 'Central+State')),
    launch_year         INTEGER,
    status              TEXT CHECK (status IN ('Active', 'Discontinued', 'Merged', 'Renamed')),
    description         TEXT,
    beneficiary_type    TEXT,                 -- e.g. 'Women', 'BPL', 'Farmers', 'All'
    website_url         TEXT,
    created_at          TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS scheme_budgets (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    scheme_id           TEXT NOT NULL REFERENCES schemes(scheme_id),
    financial_year      TEXT NOT NULL,        -- e.g. '2024-25'
    budget_allocated    REAL,                 -- in crores INR
    budget_revised      REAL,
    budget_spent        REAL,
    source              TEXT,
    created_at          TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS scheme_coverage (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    scheme_id           TEXT NOT NULL REFERENCES schemes(scheme_id),
    state_id            TEXT REFERENCES states(state_id),
    district_id         TEXT REFERENCES districts(district_id),
    financial_year      TEXT NOT NULL,
    beneficiaries       INTEGER,
    target              INTEGER,
    achievement_pct     REAL,
    source              TEXT,
    created_at          TEXT DEFAULT (datetime('now'))
);

CREATE INDEX idx_budgets_scheme ON scheme_budgets(scheme_id);
CREATE INDEX idx_coverage_scheme ON scheme_coverage(scheme_id);
CREATE INDEX idx_coverage_state ON scheme_coverage(state_id);
