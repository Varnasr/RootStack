-- ============================================================
-- RootStack: OpenStacks Tools Catalog
-- Registry of all tools, scripts, and resources across stacks
-- ============================================================

CREATE TABLE IF NOT EXISTS stacks (
    stack_id        TEXT PRIMARY KEY,
    stack_name      TEXT NOT NULL,
    description     TEXT,
    language        TEXT,                    -- primary language: 'R', 'Python', 'Stata', etc.
    repo_url        TEXT NOT NULL,
    homepage_url    TEXT,
    created_at      TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS tools (
    tool_id         TEXT PRIMARY KEY,
    tool_name       TEXT NOT NULL,
    stack_id        TEXT NOT NULL REFERENCES stacks(stack_id),
    directory       TEXT NOT NULL,           -- path within repo, e.g. 'regression/'
    description     TEXT,
    sector_id       TEXT REFERENCES sectors(sector_id),
    language        TEXT,                    -- 'R', 'Python', 'Stata', 'SPSS', 'Excel', etc.
    tool_type       TEXT CHECK (tool_type IN (
        'notebook', 'script', 'template', 'calculator',
        'dataset', 'visualization', 'workflow', 'guide'
    )),
    difficulty      TEXT CHECK (difficulty IN ('beginner', 'intermediate', 'advanced')),
    tags            TEXT,                    -- comma-separated
    file_count      INTEGER,
    created_at      TEXT DEFAULT (datetime('now'))
);

CREATE INDEX idx_tools_stack ON tools(stack_id);
CREATE INDEX idx_tools_sector ON tools(sector_id);
CREATE INDEX idx_tools_type ON tools(tool_type);
