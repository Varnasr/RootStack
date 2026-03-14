-- ============================================================
-- OpenStacks Tools Catalog
-- Registry of actual tools across InsightStack, FieldStack, EquityStack
-- ============================================================

-- Register the stacks
INSERT INTO stacks (stack_id, stack_name, description, language, repo_url, homepage_url) VALUES
('insight',  'InsightStack',  'MEL tools, calculators, research documentation',              'Stata',   'https://github.com/Varnasr/InsightStack',  'https://openstacks.dev'),
('field',    'FieldStack',    'R notebooks and scripts for fieldwork and evaluation',         'R',       'https://github.com/Varnasr/FieldStack',    'https://openstacks.dev'),
('equity',   'EquityStack',   'Python/Jupyter workflows for development data',                'Python',  'https://github.com/Varnasr/EquityStack',   'https://openstacks.dev'),
('signal',   'SignalStack',   'Research Rundown newsletter and curated resources',             'Markdown','https://github.com/Varnasr/SignalStack',    'https://openstacks.dev');

-- InsightStack tools
INSERT INTO tools (tool_id, tool_name, stack_id, directory, description, sector_id, language, tool_type, difficulty, tags) VALUES
('ins-calculators',     'MEL Calculators',                  'insight', 'calculators/',             'Sample size, power analysis, cost-effectiveness calculators',    NULL,               'Stata',    'calculator',     'intermediate', 'sample-size,power,mel'),
('ins-stata-snippets',  'Stata Snippets',                   'insight', 'stata_snippets/',          'Reusable Stata code for data management and analysis',           NULL,               'Stata',    'script',         'intermediate', 'stata,data-management'),
('ins-spss',            'SPSS Scripts',                     'insight', 'spss_scripts/',            'SPSS syntax for survey analysis workflows',                      NULL,               'SPSS',     'script',         'intermediate', 'spss,survey'),
('ins-econometrics',    'Econometrics Templates',           'insight', 'econometrics/',            'RDD, DiD, HTE, and causal inference templates',                  NULL,               'Stata',    'notebook',       'advanced',     'econometrics,causal-inference,rdd,did'),
('ins-data-validation', 'Data Validation',                  'insight', 'data_validation/',         'Data cleaning and validation workflows',                         NULL,               'Python',   'script',         'beginner',     'data-quality,validation'),
('ins-observable',      'Observable Notebooks',             'insight', 'observable_notebooks/',    'Interactive data exploration notebooks',                         'health',           'JavaScript','notebook',      'intermediate', 'observable,interactive'),
('ins-excalidraw',      'Excalidraw Frameworks',            'insight', 'excalidraw_frameworks/',   'Visual frameworks and diagrams for program design',              NULL,               'JSON',     'template',       'beginner',     'diagrams,program-design'),
('ins-miro',            'Miro Templates',                   'insight', 'miro/',                    'Participatory workshop and analysis templates',                  NULL,               'JSON',     'template',       'beginner',     'facilitation,participatory'),
('ins-flourish',        'Flourish Charts',                  'insight', 'flourish_charts/',         'Data visualisation templates for Flourish',                      NULL,               'JSON',     'visualization',  'beginner',     'charts,flourish'),
('ins-powerbi',         'Power BI Reports',                 'insight', 'powerbi_reports/',         'Dashboard templates for Power BI',                               NULL,               'PBIX',     'visualization',  'intermediate', 'dashboard,powerbi'),
('ins-kumu',            'Kumu Maps',                        'insight', 'kumu_maps/',               'Network and systems mapping templates',                          NULL,               'JSON',     'visualization',  'intermediate', 'network,systems-thinking'),
('ins-vensim',          'Vensim Models',                    'insight', 'vensim/',                  'System dynamics models',                                         NULL,               'Vensim',   'template',       'advanced',     'system-dynamics,modelling'),
('ins-taguette',        'Taguette Coding',                  'insight', 'taguette_coding/',         'Qualitative coding workflows',                                   NULL,               'Python',   'workflow',       'intermediate', 'qualitative,coding'),
('ins-latex',           'LaTeX Templates',                  'insight', 'latex/',                   'Research report templates',                                      NULL,               'TeX',      'template',       'intermediate', 'latex,reports'),
('ins-writing',         'Writing Guides',                   'insight', 'writing_guides/',          'Style guides and writing templates',                             NULL,               'Markdown', 'guide',          'beginner',     'writing,style-guide'),
('ins-survey-codebook', 'Survey to Codebook',               'insight', 'survey_to_codebook/',      'Convert survey instruments to codebooks',                        NULL,               'Python',   'script',         'intermediate', 'survey,codebook'),

-- FieldStack tools
('fld-regression',      'Regression Templates',             'field',   'regression/',              'OLS, logistic, interaction terms, multicollinearity checks',     NULL,               'R',        'notebook',       'intermediate', 'regression,statistics'),
('fld-evaluation',      'Evaluation Frameworks',            'field',   'evaluation/',              'Cost-effectiveness, SROI, evaluation design',                    NULL,               'R',        'notebook',       'advanced',     'evaluation,cea,sroi'),
('fld-survey-design',   'Survey Design',                    'field',   'survey-design/',           'Sampling frameworks, questionnaire design, power calculations',  NULL,               'R',        'notebook',       'intermediate', 'survey,sampling'),
('fld-qualitative',     'Qualitative Analysis',             'field',   'qualitative/',             'Qualitative coding and mixed methods templates',                 NULL,               'R',        'notebook',       'intermediate', 'qualitative,mixed-methods'),
('fld-custom-viz',      'Custom Visualisations',            'field',   'custom_viz/',              'Bullet charts, waterfall charts, maps, ggplot themes',           NULL,               'R',        'visualization',  'intermediate', 'ggplot,charts,maps'),
('fld-simulation',      'Simulation Scripts',               'field',   'simulation/',              'Monte Carlo and simulation for evaluation design',               NULL,               'R',        'script',         'advanced',     'simulation,monte-carlo'),
('fld-tidyverse',       'Tidyverse Recipes',                'field',   'tidyverse/',               'Data wrangling recipes using tidyverse',                         NULL,               'R',        'script',         'beginner',     'tidyverse,dplyr,tidyr'),
('fld-codebook',        'Codebook Templates',               'field',   'codebook_templates/',      'Codebook generation from survey instruments',                    NULL,               'R',        'template',       'beginner',     'codebook,documentation'),
('fld-auto-report',     'Automated Reporting',              'field',   'automated_reporting/',     'Quarto-based automated report generation',                       NULL,               'R',        'workflow',       'intermediate', 'quarto,reporting'),

-- EquityStack tools
('eq-cleaning',         'Data Cleaning Templates',          'equity',  'cleaning/',                'Pandas-based data cleaning and transformation',                  NULL,               'Python',   'script',         'beginner',     'pandas,cleaning'),
('eq-eda',              'Exploratory Data Analysis',        'equity',  'eda/',                     'EDA recipes and profile generation',                             NULL,               'Python',   'notebook',       'beginner',     'eda,exploration'),
('eq-modelling',        'Statistical Modelling',            'equity',  'modelling/',               'Regression, classification, and evaluation models',              NULL,               'Python',   'notebook',       'intermediate', 'modelling,sklearn,statsmodels'),
('eq-validation',       'Data Validation',                  'equity',  'validation/',              'Data quality checks and validation rules',                       NULL,               'Python',   'script',         'beginner',     'validation,quality'),
('eq-visualisation',    'Visualisation Templates',          'equity',  'visualisation/',           'Matplotlib, seaborn, plotly chart templates',                    NULL,               'Python',   'visualization',  'beginner',     'matplotlib,seaborn,plotly'),
('eq-social-sector',    'Social Sector Workflows',          'equity',  'social_sector/',           'Domain-specific analysis for health, education, gender',         'gender',           'Python',   'workflow',       'intermediate', 'health,education,gender,wee'),
('eq-io-helpers',       'I/O Helpers',                      'equity',  'io_helpers/',              'File reading/writing utilities for CSV, Excel, APIs',            NULL,               'Python',   'script',         'beginner',     'io,csv,excel');
