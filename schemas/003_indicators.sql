-- ============================================================
-- RootStack: Development Indicators
-- Health, education, gender, climate indicators at district/state level
-- Matches data patterns from FieldStack and EquityStack
-- ============================================================

CREATE TABLE IF NOT EXISTS indicators (
    indicator_id    TEXT PRIMARY KEY,
    indicator_name  TEXT NOT NULL,
    sector_id       TEXT NOT NULL REFERENCES sectors(sector_id),
    unit            TEXT NOT NULL,           -- 'percent', 'ratio', 'count', 'index', 'currency_inr'
    direction       TEXT CHECK (direction IN ('higher_better', 'lower_better', 'neutral')),
    source          TEXT,                    -- e.g. 'NFHS-5', 'UDISE', 'Census 2011'
    frequency       TEXT,                    -- e.g. 'annual', 'quarterly', 'one-time'
    description     TEXT,
    created_at      TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS indicator_values (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    indicator_id    TEXT NOT NULL REFERENCES indicators(indicator_id),
    district_id     TEXT REFERENCES districts(district_id),
    state_id        TEXT REFERENCES states(state_id),
    year            INTEGER NOT NULL,
    quarter         INTEGER,                 -- NULL for annual, 1-4 for quarterly
    value           REAL NOT NULL,
    value_male      REAL,
    value_female    REAL,
    value_rural     REAL,
    value_urban     REAL,
    source_detail   TEXT,
    created_at      TEXT DEFAULT (datetime('now')),
    CHECK (district_id IS NOT NULL OR state_id IS NOT NULL)
);

CREATE INDEX idx_iv_indicator ON indicator_values(indicator_id);
CREATE INDEX idx_iv_district ON indicator_values(district_id);
CREATE INDEX idx_iv_state ON indicator_values(state_id);
CREATE INDEX idx_iv_year ON indicator_values(year);
