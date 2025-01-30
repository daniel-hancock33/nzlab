CREATE TABLE  AGGR_TIME_PROD_OM_FACT
(
     CURRENT_YEAR              smallint                  not null,
     QUARTER_KEY               integer                   not null,
     PRODUCT_LINE_CODE         integer                   not null,
     PRODUCT_TYPE_KEY          integer                   not null,
     ORDER_METHOD_KEY          integer                   not null,
     QUANTITY                  integer                   not null,
     SALE_TOTAL                numeric(19,2)             not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE AGGR_TIME_PROD_OM_FACT ADD PRIMARY KEY (QUARTER_KEY, PRODUCT_TYPE_KEY, ORDER_METHOD_KEY);

CREATE TABLE  BURST_TABLE
(
     RECIPIENTS                character varying(150),
     COUNTRY_CODE              integer
)
DISTRIBUTE ON RANDOM
;

CREATE TABLE  BURST_TABLE2
(
     RECIPIENTS                character varying(300),
     RECIPIENT_NAME            character varying(150),
     PRODUCT_LINE_CODE         integer
)
DISTRIBUTE ON RANDOM
;

CREATE TABLE  DIST_INVENTORY_FACT
(
     MONTH_KEY                 integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     BRANCH_KEY                integer                   not null,
     PRODUCT_KEY               integer                   not null,
     OPENING_INVENTORY         integer                   not null,
     QUANTITY_SHIPPED          integer                   not null,
     ADDITIONS                 integer                   not null,
     UNIT_COST                 numeric(19,2),
     CLOSING_INVENTORY         integer                   not null,
     AVERAGE_UNIT_COST         numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE DIST_INVENTORY_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, BRANCH_KEY, PRODUCT_KEY);

CREATE TABLE  DIST_PRODUCT_FORECAST_FACT
(
     MONTH_KEY                 integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     BASE_PRODUCT_KEY          integer                   not null,
     BRANCH_KEY                integer                   not null,
     UNIT_COST                 numeric(19,2),
     UNIT_PRICE                numeric(19,2),
     EXPECTED_VOLUME           integer
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE DIST_PRODUCT_FORECAST_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, BRANCH_KEY, BASE_PRODUCT_KEY);

CREATE TABLE  DIST_RETURNED_ITEMS_FACT
(
     DAY_KEY                   integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     BRANCH_KEY                integer                   not null,
     EMPLOYEE_KEY              integer                   not null,
     RETAILER_SITE_KEY         integer                   not null,
     PRODUCT_KEY               integer                   not null,
     ORDER_METHOD_KEY          integer                   not null,
     SALES_ORDER_KEY           integer                   not null,
     RETURN_REASON_KEY         integer                   not null,
     RETURN_QUANTITY           integer                   not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD PRIMARY KEY (DAY_KEY, ORGANIZATION_KEY, BRANCH_KEY, EMPLOYEE_KEY, RETAILER_SITE_KEY, PRODUCT_KEY, ORDER_METHOD_KEY, RETURN_REASON_KEY, SALES_ORDER_KEY);

CREATE TABLE  DIST_RETURN_REASON_DIM
(
     RETURN_REASON_KEY         integer                   not null,
     RETURN_REASON_CODE        integer                   not null,
     REASON_DESCRIPTION_EN     character varying(120)    not null,
     REASON_DESCRIPTION_AR     character varying(120)    not null,
     REASON_DESCRIPTION_CS     character varying(120)    not null,
     REASON_DESCRIPTION_DA     character varying(120)    not null,
     REASON_DESCRIPTION_DE     character varying(120)    not null,
     REASON_DESCRIPTION_EL     character varying(120)    not null,
     REASON_DESCRIPTION_ES     character varying(120)    not null,
     REASON_DESCRIPTION_FI     character varying(120)    not null,
     REASON_DESCRIPTION_FR     character varying(120)    not null,
     REASON_DESCRIPTION_HR     character varying(120)    not null,
     REASON_DESCRIPTION_HU     character varying(120)    not null,
     REASON_DESCRIPTION_ID     character varying(120)    not null,
     REASON_DESCRIPTION_IT     character varying(120)    not null,
     REASON_DESCRIPTION_JA     character varying(120)    not null,
     REASON_DESCRIPTION_KK     character varying(120)    not null,
     REASON_DESCRIPTION_KO     character varying(120)    not null,
     REASON_DESCRIPTION_MS     character varying(120)    not null,
     REASON_DESCRIPTION_NL     character varying(120)    not null,
     REASON_DESCRIPTION_NO     character varying(120)    not null,
     REASON_DESCRIPTION_PL     character varying(120)    not null,
     REASON_DESCRIPTION_PT     character varying(120)    not null,
     REASON_DESCRIPTION_RO     character varying(120)    not null,
     REASON_DESCRIPTION_RU     character varying(120)    not null,
     REASON_DESCRIPTION_SC     character varying(120)    not null,
     REASON_DESCRIPTION_SL     character varying(120)    not null,
     REASON_DESCRIPTION_SV     character varying(120)    not null,
     REASON_DESCRIPTION_TC     character varying(120)    not null,
     REASON_DESCRIPTION_TH     character varying(120)    not null,
     REASON_DESCRIPTION_TR     character varying(120)    not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE DIST_RETURN_REASON_DIM ADD PRIMARY KEY (RETURN_REASON_KEY);

CREATE TABLE  EMP_EMPLOYEE_DIM
(
     EMPLOYEE_KEY              integer                   not null,
     MANAGER_CODE1             integer,
     MANAGER1                  character varying(168),
     MANAGER_MB1               character varying(168),
     MANAGER_CODE2             integer,
     MANAGER2                  character varying(168),
     MANAGER_MB2               character varying(168),
     MANAGER_CODE3             integer,
     MANAGER3                  character varying(168),
     MANAGER_MB3               character varying(168),
     MANAGER_CODE4             integer,
     MANAGER4                  character varying(168),
     MANAGER_MB4               character varying(168),
     MANAGER_CODE5             integer,
     MANAGER5                  character varying(168),
     MANAGER_MB5               character varying(168),
     MANAGER_CODE6             integer,
     MANAGER6                  character varying(168),
     MANAGER_MB6               character varying(168),
     EMPLOYEE_CODE             integer,
     EMPLOYEE_NAME             character varying(168),
     FIRST_NAME                character varying(75),
     LAST_NAME                 character varying(90),
     EMPLOYEE_NAME_MB          character varying(168),
     FIRST_NAME_MB             character varying(75),
     LAST_NAME_MB              character varying(90),
     MANAGER_CODE              integer,
     ORGANIZATION_CODE         character varying(30),
     ADDRESS1                  character varying(120),
     ADDRESS2                  character varying(120),
     ADDRESS1_MB               character varying(120),
     ADDRESS2_MB               character varying(120),
     CITY                      character varying(60),
     CITY_MB                   character varying(60),
     PROV_STATE                character varying(60),
     PROV_STATE_MB             character varying(60),
     POSTAL_ZONE               character varying(30),
     BRANCH_CODE               integer,
     BIRTH_DATE                timestamp,
     GENDER_CODE               smallint,
     WORK_PHONE                character varying(90),
     EXTENSION                 character varying(30),
     FAX                       character varying(60),
     EMAIL                     character varying(120),
     DATE_HIRED                timestamp,
     TERMINATION_CODE          integer,
     TERMINATION_DATE          timestamp,
     POSITION_START_DATE       timestamp,
     POSITION_CODE             integer,
     EMPLOYEE_LEVEL            smallint,
     ACTIVE_INDICATOR          smallint,
     RECORD_START_DATE         timestamp,
     RECORD_END_DATE           timestamp,
     MANAGER_KEY               integer
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_EMPLOYEE_DIM ADD PRIMARY KEY (EMPLOYEE_KEY);

CREATE TABLE  EMP_EXPENSE_FACT
(
     DAY_KEY                   integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     POSITION_KEY              integer                   not null,
     EMPLOYEE_KEY              integer                   not null,
     EXPENSE_TYPE_KEY          integer                   not null,
     ACCOUNT_KEY               integer                   not null,
     EXPENSE_UNIT_QUANTITY     double precision,
     EXPENSE_TOTAL             numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_EXPENSE_FACT ADD PRIMARY KEY (EMPLOYEE_KEY, POSITION_KEY, ORGANIZATION_KEY, DAY_KEY, EXPENSE_TYPE_KEY);

CREATE TABLE  EMP_EXPENSE_PLAN_FACT
(
     MONTH_KEY                 integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     EXPENSE_TYPE_KEY          integer                   not null,
     ACCOUNT_KEY               character varying(105),
     EXPENSE_PLAN_TOTAL        numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_EXPENSE_PLAN_FACT ADD PRIMARY KEY (EXPENSE_TYPE_KEY, MONTH_KEY, ORGANIZATION_KEY);

CREATE TABLE  EMP_EXPENSE_TYPE_DIM
(
     EXPENSE_TYPE_KEY          integer                   not null,
     EXPENSE_GROUP_CODE        integer                   not null,
     EXPENSE_TYPE_CODE         integer                   not null,
     EXPENSE_UNIT_CODE         integer                   not null,
     EXPENSE_GROUP_EN          character varying(90),
     EXPENSE_TYPE_EN           character varying(150),
     EXPENSE_GROUP_DE          character varying(90),
     EXPENSE_TYPE_DE           character varying(150),
     EXPENSE_GROUP_FR          character varying(90),
     EXPENSE_TYPE_FR           character varying(150),
     EXPENSE_GROUP_JA          character varying(90),
     EXPENSE_TYPE_JA           character varying(150),
     EXPENSE_GROUP_AR          character varying(90),
     EXPENSE_TYPE_AR           character varying(150),
     EXPENSE_GROUP_CS          character varying(90),
     EXPENSE_TYPE_CS           character varying(150),
     EXPENSE_GROUP_DA          character varying(90),
     EXPENSE_TYPE_DA           character varying(150),
     EXPENSE_GROUP_EL          character varying(90),
     EXPENSE_TYPE_EL           character varying(150),
     EXPENSE_GROUP_ES          character varying(90),
     EXPENSE_TYPE_ES           character varying(150),
     EXPENSE_GROUP_FI          character varying(90),
     EXPENSE_TYPE_FI           character varying(150),
     EXPENSE_GROUP_HR          character varying(90),
     EXPENSE_TYPE_HR           character varying(150),
     EXPENSE_GROUP_HU          character varying(90),
     EXPENSE_TYPE_HU           character varying(150),
     EXPENSE_GROUP_ID          character varying(90),
     EXPENSE_TYPE_ID           character varying(150),
     EXPENSE_GROUP_IT          character varying(90),
     EXPENSE_TYPE_IT           character varying(150),
     EXPENSE_GROUP_KK          character varying(90),
     EXPENSE_TYPE_KK           character varying(150),
     EXPENSE_GROUP_KO          character varying(90),
     EXPENSE_TYPE_KO           character varying(150),
     EXPENSE_GROUP_MS          character varying(90),
     EXPENSE_TYPE_MS           character varying(150),
     EXPENSE_GROUP_NL          character varying(90),
     EXPENSE_TYPE_NL           character varying(150),
     EXPENSE_GROUP_NO          character varying(90),
     EXPENSE_TYPE_NO           character varying(150),
     EXPENSE_GROUP_PL          character varying(90),
     EXPENSE_TYPE_PL           character varying(150),
     EXPENSE_GROUP_PT          character varying(90),
     EXPENSE_TYPE_PT           character varying(150),
     EXPENSE_GROUP_RO          character varying(90),
     EXPENSE_TYPE_RO           character varying(150),
     EXPENSE_GROUP_RU          character varying(90),
     EXPENSE_TYPE_RU           character varying(150),
     EXPENSE_GROUP_SC          character varying(90),
     EXPENSE_TYPE_SC           character varying(150),
     EXPENSE_GROUP_SL          character varying(90),
     EXPENSE_TYPE_SL           character varying(150),
     EXPENSE_GROUP_SV          character varying(90),
     EXPENSE_TYPE_SV           character varying(150),
     EXPENSE_GROUP_TC          character varying(90),
     EXPENSE_TYPE_TC           character varying(150),
     EXPENSE_GROUP_TH          character varying(90),
     EXPENSE_TYPE_TH           character varying(150),
     EXPENSE_GROUP_TR          character varying(90),
     EXPENSE_TYPE_TR           character varying(150)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_EXPENSE_TYPE_DIM ADD PRIMARY KEY (EXPENSE_TYPE_KEY);

CREATE TABLE  EMP_EXPENSE_UNIT_LOOKUP
(
     EXPENSE_UNIT_CODE         integer                   not null,
     EXPENSE_UNIT_EN           character varying(60),
     EXPENSE_UNIT_DE           character varying(60),
     EXPENSE_UNIT_FR           character varying(60),
     EXPENSE_UNIT_JA           character varying(60),
     EXPENSE_UNIT_AR           character varying(60),
     EXPENSE_UNIT_CS           character varying(60),
     EXPENSE_UNIT_DA           character varying(60),
     EXPENSE_UNIT_EL           character varying(60),
     EXPENSE_UNIT_ES           character varying(60),
     EXPENSE_UNIT_FI           character varying(60),
     EXPENSE_UNIT_HR           character varying(60),
     EXPENSE_UNIT_HU           character varying(60),
     EXPENSE_UNIT_ID           character varying(60),
     EXPENSE_UNIT_IT           character varying(60),
     EXPENSE_UNIT_KK           character varying(60),
     EXPENSE_UNIT_KO           character varying(60),
     EXPENSE_UNIT_MS           character varying(60),
     EXPENSE_UNIT_NL           character varying(60),
     EXPENSE_UNIT_NO           character varying(60),
     EXPENSE_UNIT_PL           character varying(60),
     EXPENSE_UNIT_PT           character varying(60),
     EXPENSE_UNIT_RO           character varying(60),
     EXPENSE_UNIT_RU           character varying(60),
     EXPENSE_UNIT_SC           character varying(60),
     EXPENSE_UNIT_SL           character varying(60),
     EXPENSE_UNIT_SV           character varying(60),
     EXPENSE_UNIT_TC           character varying(60),
     EXPENSE_UNIT_TH           character varying(60),
     EXPENSE_UNIT_TR           character varying(60)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_EXPENSE_UNIT_LOOKUP ADD PRIMARY KEY (EXPENSE_UNIT_CODE);

CREATE TABLE  EMP_POSITION_DIM
(
     POSITION_KEY              integer                   not null,
     POSITION_CODE1            integer                   not null,
     POSITION_CODE2            integer                   not null,
     POSITION_CODE3            integer                   not null,
     POSITION_CODE             integer                   not null,
     POSITION_PARENT           integer,
     MIN_SALARY                numeric(19,2),
     MAX_SALARY                numeric(19,2),
     PAID_HOURLY               integer,
     POSITION_LEVEL            smallint                  not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_POSITION_DIM ADD PRIMARY KEY (POSITION_KEY);

CREATE TABLE  EMP_POSITION_LOOKUP
(
     POSITION_CODE             integer                   not null,
     POSITION_EN               character varying(210),
     POSITION_DE               character varying(210),
     POSITION_FR               character varying(210),
     POSITION_JA               character varying(210),
     POSITION_AR               character varying(210),
     POSITION_CS               character varying(210),
     POSITION_DA               character varying(210),
     POSITION_EL               character varying(210),
     POSITION_ES               character varying(210),
     POSITION_FI               character varying(210),
     POSITION_HR               character varying(210),
     POSITION_HU               character varying(210),
     POSITION_ID               character varying(210),
     POSITION_IT               character varying(210),
     POSITION_KK               character varying(210),
     POSITION_KO               character varying(210),
     POSITION_MS                    character varying(210),
     POSITION_NL                    character varying(210),
     POSITION_NO                    character varying(210),
     POSITION_PL                    character varying(210),
     POSITION_PT                    character varying(210),
     POSITION_RO                    character varying(210),
     POSITION_RU                    character varying(210),
     POSITION_SC                    character varying(210),
     POSITION_SL                    character varying(210),
     POSITION_SV                    character varying(210),
     POSITION_TC                    character varying(210),
     POSITION_TH                    character varying(210),
     POSITION_TR                    character varying(210)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_POSITION_LOOKUP ADD PRIMARY KEY (POSITION_CODE);

CREATE TABLE  EMP_POSITION_SUMMARY_FACT
(
     DAY_KEY                        integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     POSITION_COUNT                 integer,
     PLANNED_POSITION_COUNT         integer,
     INTERNAL_HIRES                 integer,
     EXTERNAL_HIRES                 integer,
     TERMINATIONS                   integer
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_POSITION_SUMMARY_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, POSITION_KEY, DAY_KEY);

CREATE TABLE  EMP_RANKING_DIM
(
     EMPLOYEE_RANKING_KEY           integer                   not null,
     RANKING_CODE                   integer                   not null,
     RANKING_DESCRIPTION_EN         character varying(90)     not null,
     RANKING_DESCRIPTION_DE         character varying(90)     not null,
     RANKING_DESCRIPTION_FR         character varying(90)     not null,
     RANKING_DESCRIPTION_JA         character varying(90)     not null,
     RANKING_DESCRIPTION_AR         character varying(90)     not null,
     RANKING_DESCRIPTION_CS         character varying(90)     not null,
     RANKING_DESCRIPTION_DA         character varying(90)     not null,
     RANKING_DESCRIPTION_EL         character varying(90)     not null,
     RANKING_DESCRIPTION_ES         character varying(90)     not null,
     RANKING_DESCRIPTION_FI         character varying(90)     not null,
     RANKING_DESCRIPTION_HR         character varying(90)     not null,
     RANKING_DESCRIPTION_HU         character varying(90)     not null,
     RANKING_DESCRIPTION_ID         character varying(90)     not null,
     RANKING_DESCRIPTION_IT         character varying(90)     not null,
     RANKING_DESCRIPTION_KK         character varying(90)     not null,
     RANKING_DESCRIPTION_KO         character varying(90)     not null,
     RANKING_DESCRIPTION_MS         character varying(90)     not null,
     RANKING_DESCRIPTION_NL         character varying(90)     not null,
     RANKING_DESCRIPTION_NO         character varying(90)     not null,
     RANKING_DESCRIPTION_PL         character varying(90)     not null,
     RANKING_DESCRIPTION_PT         character varying(90)     not null,
     RANKING_DESCRIPTION_RO         character varying(90)     not null,
     RANKING_DESCRIPTION_RU         character varying(90)     not null,
     RANKING_DESCRIPTION_SC         character varying(90)     not null,
     RANKING_DESCRIPTION_SL         character varying(90)     not null,
     RANKING_DESCRIPTION_SV         character varying(90)     not null,
     RANKING_DESCRIPTION_TC         character varying(90)     not null,
     RANKING_DESCRIPTION_TH         character varying(90)     not null,
     RANKING_DESCRIPTION_TR         character varying(90)     not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_RANKING_DIM ADD PRIMARY KEY (EMPLOYEE_RANKING_KEY);

CREATE TABLE  EMP_RANKING_FACT
(
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     EMPLOYEE_KEY                   integer                   not null,
     DAY_KEY                        integer                   not null,
     EMPLOYEE_RANKING_KEY           integer                   not null,
     RANKING_CODE                   integer                   not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_RANKING_FACT ADD PRIMARY KEY (EMPLOYEE_KEY, POSITION_KEY, ORGANIZATION_KEY, DAY_KEY, EMPLOYEE_RANKING_KEY);

CREATE TABLE  EMP_RECRUITMENT_DIM
(
     RECRUITMENT_MEDIUM_KEY         integer                   not null,
     RECRUITMENT_MEDIUM_CODE        integer                   not null,
     RECRUITMENT_TYPE_CODE          integer                   not null,
     RECRUITMENT_MEDIUM_NAME_EN     character varying(150),
     RECRUITMENT_TYPE_EN            character varying(120),
     RECRUITMENT_MEDIUM_NAME_DE     character varying(150),
     RECRUITMENT_TYPE_DE            character varying(120),
     RECRUITMENT_MEDIUM_NAME_FR     character varying(150),
     RECRUITMENT_TYPE_FR            character varying(120),
     RECRUITMENT_MEDIUM_NAME_JA     character varying(150),
     RECRUITMENT_TYPE_JA            character varying(120),
     RECRUITMENT_MEDIUM_NAME_AR     character varying(150),
     RECRUITMENT_TYPE_AR            character varying(120),
     RECRUITMENT_MEDIUM_NAME_CS     character varying(150),
     RECRUITMENT_TYPE_CS            character varying(120),
     RECRUITMENT_MEDIUM_NAME_DA     character varying(150),
     RECRUITMENT_TYPE_DA            character varying(120),
     RECRUITMENT_MEDIUM_NAME_EL     character varying(150),
     RECRUITMENT_TYPE_EL            character varying(120),
     RECRUITMENT_MEDIUM_NAME_ES     character varying(150),
     RECRUITMENT_TYPE_ES            character varying(120),
     RECRUITMENT_MEDIUM_NAME_FI     character varying(150),
     RECRUITMENT_TYPE_FI            character varying(120),
     RECRUITMENT_MEDIUM_NAME_HR     character varying(150),
     RECRUITMENT_TYPE_HR            character varying(120),
     RECRUITMENT_MEDIUM_NAME_HU     character varying(150),
     RECRUITMENT_TYPE_HU            character varying(120),
     RECRUITMENT_MEDIUM_NAME_ID     character varying(150),
     RECRUITMENT_TYPE_ID            character varying(120),
     RECRUITMENT_MEDIUM_NAME_IT     character varying(150),
     RECRUITMENT_TYPE_IT            character varying(120),
     RECRUITMENT_MEDIUM_NAME_KK     character varying(150),
     RECRUITMENT_TYPE_KK            character varying(120),
     RECRUITMENT_MEDIUM_NAME_KO     character varying(150),
     RECRUITMENT_TYPE_KO            character varying(120),
     RECRUITMENT_MEDIUM_NAME_MS     character varying(150),
     RECRUITMENT_TYPE_MS            character varying(120),
     RECRUITMENT_MEDIUM_NAME_NL     character varying(150),
     RECRUITMENT_TYPE_NL            character varying(120),
     RECRUITMENT_MEDIUM_NAME_NO     character varying(150),
     RECRUITMENT_TYPE_NO            character varying(120),
     RECRUITMENT_MEDIUM_NAME_PL     character varying(150),
     RECRUITMENT_TYPE_PL            character varying(120),
     RECRUITMENT_MEDIUM_NAME_PT     character varying(150),
     RECRUITMENT_TYPE_PT            character varying(120),
     RECRUITMENT_MEDIUM_NAME_RO     character varying(150),
     RECRUITMENT_TYPE_RO            character varying(120),
     RECRUITMENT_MEDIUM_NAME_RU     character varying(150),
     RECRUITMENT_TYPE_RU            character varying(120),
     RECRUITMENT_MEDIUM_NAME_SC     character varying(150),
     RECRUITMENT_TYPE_SC            character varying(120),
     RECRUITMENT_MEDIUM_NAME_SL     character varying(150),
     RECRUITMENT_TYPE_SL            character varying(120),
     RECRUITMENT_MEDIUM_NAME_SV     character varying(150),
     RECRUITMENT_TYPE_SV            character varying(120),
     RECRUITMENT_MEDIUM_NAME_TC     character varying(150),
     RECRUITMENT_TYPE_TC            character varying(120),
     RECRUITMENT_MEDIUM_NAME_TH     character varying(150),
     RECRUITMENT_TYPE_TH            character varying(120),
     RECRUITMENT_MEDIUM_NAME_TR     character varying(150),
     RECRUITMENT_TYPE_TR            character varying(120)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_RECRUITMENT_DIM ADD PRIMARY KEY (RECRUITMENT_MEDIUM_KEY);

CREATE TABLE  EMP_RECRUITMENT_FACT
(
     POST_DAY_KEY                   integer                   not null,
     RECRUITMENT_MEDIUM_KEY         integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     BRANCH_KEY                     integer                   not null,
     POSITION_KEY                   integer                   not null,
     POSITION_POSTING_DATE          timestamp,
     POSITION_FILLED_DATE           timestamp,
     POSITION_START_DATE            timestamp,
     DAYS_TO_FILL                   integer
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_RECRUITMENT_FACT ADD PRIMARY KEY (RECRUITMENT_MEDIUM_KEY, ORGANIZATION_KEY, POSITION_KEY, BRANCH_KEY, POST_DAY_KEY);

CREATE TABLE  EMP_RECRUITMENT_LEAD_FACT
(
     POST_DAY_KEY                   integer                   not null,
     BRANCH_KEY                     integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     RECRUITMENT_MEDIUM_KEY         integer                   not null,
     RECRUITMENT_LEADS              integer                   not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD PRIMARY KEY (POST_DAY_KEY, BRANCH_KEY, ORGANIZATION_KEY, POSITION_KEY, RECRUITMENT_MEDIUM_KEY);

CREATE TABLE  EMP_SUCCESSION_FACT
(
     DAY_KEY                        integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     EMPLOYEE_KEY                   integer                   not null,
     SUCCESSOR_EMPLOYEE_KEY         integer                   not null,
     SUCCESSOR_POSITION_KEY         integer                   not null,
     SUCCESSOR_STATUS_KEY           integer                   not null,
     PERCENT_READY                  double precision          not null,
     TARGET_PERCENT_READY           double precision          not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SUCCESSION_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, POSITION_KEY, EMPLOYEE_KEY, DAY_KEY, SUCCESSOR_STATUS_KEY, SUCCESSOR_EMPLOYEE_KEY, SUCCESSOR_POSITION_KEY);



CREATE TABLE  EMP_SUCCESSION_STATUS_DIM
(
     SUCCESSOR_STATUS_KEY           integer                   not null,
     SUCCESSOR_STATUS_CODE          integer,
     SUCCESSOR_STATUS_EN            character varying(90),
     SUCCESSOR_STATUS_DE            character varying(90),
     SUCCESSOR_STATUS_FR            character varying(90),
     SUCCESSOR_STATUS_JA            character varying(90),
     SUCCESSOR_STATUS_AR            character varying(90),
     SUCCESSOR_STATUS_CS            character varying(90),
     SUCCESSOR_STATUS_DA            character varying(90),
     SUCCESSOR_STATUS_EL            character varying(90),
     SUCCESSOR_STATUS_ES            character varying(90),
     SUCCESSOR_STATUS_FI            character varying(90),
     SUCCESSOR_STATUS_HR            character varying(90),
     SUCCESSOR_STATUS_HU            character varying(90),
     SUCCESSOR_STATUS_ID            character varying(90),
     SUCCESSOR_STATUS_IT            character varying(90),
     SUCCESSOR_STATUS_KK            character varying(90),
     SUCCESSOR_STATUS_KO            character varying(90),
     SUCCESSOR_STATUS_MS            character varying(90),
     SUCCESSOR_STATUS_NL            character varying(90),
     SUCCESSOR_STATUS_NO            character varying(90),
     SUCCESSOR_STATUS_PL            character varying(90),
     SUCCESSOR_STATUS_PT            character varying(90),
     SUCCESSOR_STATUS_RO            character varying(90),
     SUCCESSOR_STATUS_RU            character varying(90),
     SUCCESSOR_STATUS_SC            character varying(90),
     SUCCESSOR_STATUS_SL            character varying(90),
     SUCCESSOR_STATUS_SV            character varying(90),
     SUCCESSOR_STATUS_TC            character varying(90),
     SUCCESSOR_STATUS_TH            character varying(90),
     SUCCESSOR_STATUS_TR            character varying(90)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SUCCESSION_STATUS_DIM ADD PRIMARY KEY (SUCCESSOR_STATUS_KEY);



CREATE TABLE  EMP_SUMMARY_FACT
(
     DAY_KEY                        integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     EMPLOYEE_KEY                   integer                   not null,
     SALARY                         numeric(19,2),
     PAY_INCREASE                   double precision,
     BONUS                          double precision,
     VACATION_DAYS_TAKEN            double precision,
     SICK_DAYS_TAKEN                double precision
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SUMMARY_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, EMPLOYEE_KEY, POSITION_KEY, DAY_KEY);



CREATE TABLE  EMP_SURVEY_FACT
(
     DAY_KEY                        integer                   not null,
     ORGANIZATION_KEY               integer                   not null,
     POSITION_KEY                   integer                   not null,
     EMPLOYEE_TOPIC_KEY             integer                   not null,
     EMPLOYEE_TOPIC_SCORE           double precision          not null,
     SATISFACTION_KEY               integer                   not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SURVEY_FACT ADD PRIMARY KEY (DAY_KEY, ORGANIZATION_KEY, POSITION_KEY, EMPLOYEE_TOPIC_KEY);



CREATE TABLE  EMP_SURVEY_TARG_FACT
(
     MONTH_KEY                      integer                   not null,
     EMPLOYEE_TOPIC_KEY             integer                   not null,
     EMPLOYEE_TOPIC_TARGET          double precision,
     EMPLOYEE_SURVEY_BENCHMARK      double precision
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SURVEY_TARG_FACT ADD PRIMARY KEY (EMPLOYEE_TOPIC_KEY, MONTH_KEY);



CREATE TABLE  EMP_SURVEY_TOPIC_DIM
(
     EMPLOYEE_TOPIC_KEY             integer                   not null,
     EMPLOYEE_TOPIC_CODE            integer                   not null,
     EMPLOYEE_TOPIC_EN              character varying(120),
     EMPLOYEE_TOPIC_DE              character varying(120),
     EMPLOYEE_TOPIC_FR              character varying(120),
     EMPLOYEE_TOPIC_JA              character varying(120),
     EMPLOYEE_TOPIC_AR              character varying(120),
     EMPLOYEE_TOPIC_CS              character varying(120),
     EMPLOYEE_TOPIC_DA              character varying(120),
     EMPLOYEE_TOPIC_EL              character varying(120),
     EMPLOYEE_TOPIC_ES              character varying(120),
     EMPLOYEE_TOPIC_FI              character varying(120),
     EMPLOYEE_TOPIC_HR              character varying(120),
     EMPLOYEE_TOPIC_HU              character varying(120),
     EMPLOYEE_TOPIC_ID              character varying(120),
     EMPLOYEE_TOPIC_IT              character varying(120),
     EMPLOYEE_TOPIC_KK              character varying(120),
     EMPLOYEE_TOPIC_KO              character varying(120),
     EMPLOYEE_TOPIC_MS              character varying(120),
     EMPLOYEE_TOPIC_NL              character varying(120),
     EMPLOYEE_TOPIC_NO              character varying(120),
     EMPLOYEE_TOPIC_PL              character varying(120),
     EMPLOYEE_TOPIC_PT              character varying(120),
     EMPLOYEE_TOPIC_RO              character varying(120),
     EMPLOYEE_TOPIC_RU              character varying(120),
     EMPLOYEE_TOPIC_SC              character varying(120),
     EMPLOYEE_TOPIC_SL              character varying(120),
     EMPLOYEE_TOPIC_SV              character varying(120),
     EMPLOYEE_TOPIC_TC              character varying(120),
     EMPLOYEE_TOPIC_TH              character varying(120),
     EMPLOYEE_TOPIC_TR              character varying(120)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_SURVEY_TOPIC_DIM ADD PRIMARY KEY (EMPLOYEE_TOPIC_KEY);



CREATE TABLE  EMP_TERMINATION_LOOKUP
(
     TERMINATION_CODE               integer                   not null,
     TERMINATION_REASON_EN          character varying(120),
     TERMINATION_REASON_DE          character varying(120),
     TERMINATION_REASON_FR          character varying(120),
     TERMINATION_REASON_JA          character varying(120),
     TERMINATION_REASON_AR          character varying(120),
     TERMINATION_REASON_CS          character varying(120),
     TERMINATION_REASON_DA          character varying(120),
     TERMINATION_REASON_EL          character varying(120),
     TERMINATION_REASON_ES          character varying(120),
     TERMINATION_REASON_FI          character varying(120),
     TERMINATION_REASON_HR          character varying(120),
     TERMINATION_REASON_HU          character varying(120),
     TERMINATION_REASON_ID          character varying(120),
     TERMINATION_REASON_IT          character varying(120),
     TERMINATION_REASON_KK          character varying(120),
     TERMINATION_REASON_KO          character varying(120),
     TERMINATION_REASON_MS          character varying(120),
     TERMINATION_REASON_NL          character varying(120),
     TERMINATION_REASON_NO          character varying(120),
     TERMINATION_REASON_PL          character varying(120),
     TERMINATION_REASON_PT          character varying(120),
     TERMINATION_REASON_RO          character varying(120),
     TERMINATION_REASON_RU          character varying(120),
     TERMINATION_REASON_SC          character varying(120),
     TERMINATION_REASON_SL          character varying(120),
     TERMINATION_REASON_SV          character varying(120),
     TERMINATION_REASON_TC          character varying(120),
     TERMINATION_REASON_TH          character varying(120),
     TERMINATION_REASON_TR          character varying(120)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_TERMINATION_LOOKUP ADD PRIMARY KEY (TERMINATION_CODE);



CREATE TABLE  EMP_TRAINING_DIM
(
     TRAINING_KEY                   integer                   not null,
     COURSE_CODE                    integer                   not null,
     COURSE_COST                  numeric(19,2),
     COURSE_DAYS                  double precision,
     COURSE_NAME_EN               character varying(150),
     COURSE_NAME_DE               character varying(150),
     COURSE_NAME_FR               character varying(150),
     COURSE_NAME_JA               character varying(150),
     COURSE_NAME_AR               character varying(150),
     COURSE_NAME_CS               character varying(150),
     COURSE_NAME_DA               character varying(150),
     COURSE_NAME_EL               character varying(150),
     COURSE_NAME_ES               character varying(150),
     COURSE_NAME_FI               character varying(150),
     COURSE_NAME_HR               character varying(150),
     COURSE_NAME_HU               character varying(150),
     COURSE_NAME_ID               character varying(150),
     COURSE_NAME_IT               character varying(150),
     COURSE_NAME_KK               character varying(150),
     COURSE_NAME_KO               character varying(150),
     COURSE_NAME_MS               character varying(150),
     COURSE_NAME_NL               character varying(150),
     COURSE_NAME_NO               character varying(150),
     COURSE_NAME_PL               character varying(150),
     COURSE_NAME_PT               character varying(150),
     COURSE_NAME_RO               character varying(150),
     COURSE_NAME_RU               character varying(150),
     COURSE_NAME_SC               character varying(150),
     COURSE_NAME_SL               character varying(150),
     COURSE_NAME_SV               character varying(150),
     COURSE_NAME_TC               character varying(150),
     COURSE_NAME_TH               character varying(150),
     COURSE_NAME_TR               character varying(150)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_TRAINING_DIM ADD PRIMARY KEY (TRAINING_KEY);



CREATE TABLE  EMP_TRAINING_FACT
(
     ORGANIZATION_KEY             integer                   not null,
     POSITION_KEY                 integer                   not null,
     EMPLOYEE_KEY                 integer                   not null,
     DAY_KEY                      integer                   not null,
     EXPENSE_TYPE_KEY             integer                   not null,
     TRAINING_KEY                 integer                   not null,
     COURSE_COST                  numeric(19,2),
     COURSE_DAYS                  double precision
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE EMP_TRAINING_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, POSITION_KEY, EMPLOYEE_KEY, DAY_KEY, EXPENSE_TYPE_KEY, TRAINING_KEY);



CREATE TABLE  FIN_ACCOUNT_CLASS_LOOKUP
(
     ACCOUNT_CLASS_CODE           integer                   not null,
     ACCOUNT_CLASS_EN             character varying(150)    not null,
     ACCOUNT_CLASS_AR             character varying(150)    not null,
     ACCOUNT_CLASS_CS             character varying(150)    not null,
     ACCOUNT_CLASS_DA             character varying(150)    not null,
     ACCOUNT_CLASS_DE             character varying(150)    not null,
     ACCOUNT_CLASS_EL             character varying(150)    not null,
     ACCOUNT_CLASS_ES             character varying(150)    not null,
     ACCOUNT_CLASS_FI             character varying(150)    not null,
     ACCOUNT_CLASS_FR             character varying(150)    not null,
     ACCOUNT_CLASS_HR             character varying(150)    not null,
     ACCOUNT_CLASS_HU             character varying(150)    not null,
     ACCOUNT_CLASS_ID             character varying(150)    not null,
     ACCOUNT_CLASS_IT             character varying(150)    not null,
     ACCOUNT_CLASS_JA             character varying(150)    not null,
     ACCOUNT_CLASS_KK             character varying(150)    not null,
     ACCOUNT_CLASS_KO             character varying(150)    not null,
     ACCOUNT_CLASS_MS             character varying(150)    not null,
     ACCOUNT_CLASS_NL             character varying(150)    not null,
     ACCOUNT_CLASS_NO             character varying(150)    not null,
     ACCOUNT_CLASS_PL             character varying(150)    not null,
     ACCOUNT_CLASS_PT             character varying(150)    not null,
     ACCOUNT_CLASS_RO             character varying(150)    not null,
     ACCOUNT_CLASS_RU             character varying(150)    not null,
     ACCOUNT_CLASS_SC             character varying(150)    not null,
     ACCOUNT_CLASS_SL             character varying(150)    not null,
     ACCOUNT_CLASS_SV             character varying(150)    not null,
     ACCOUNT_CLASS_TC             character varying(150)    not null,
     ACCOUNT_CLASS_TH             character varying(150)    not null,
     ACCOUNT_CLASS_TR             character varying(150)    not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_ACCOUNT_CLASS_LOOKUP ADD PRIMARY KEY (ACCOUNT_CLASS_CODE);



CREATE TABLE  FIN_ACCOUNT_DIM
(
     ACCOUNT_KEY                  integer                   not null,
     ACCOUNT_CODE1                character varying(105),
     ACCOUNT_CODE2                character varying(105),
     ACCOUNT_CODE3                character varying(105),
     ACCOUNT_CODE4                character varying(105),
     ACCOUNT_CODE5                character varying(105),
     ACCOUNT_CODE6                character varying(105),
     ACCOUNT_CODE7                character varying(105),
     ACCOUNT_CODE8                character varying(105),
     ACCOUNT_CODE9                character varying(105),
     ACCOUNT_CODE10               character varying(105),
     ACCOUNT_CODE11               character varying(105),
     ACCOUNT_CODE12               character varying(105),
     ACCOUNT_CODE13               character varying(105),
     ACCOUNT_CODE14               character varying(105),
     ACCOUNT_CODE15               character varying(105),
     ACCOUNT_CODE16               character varying(105),
     ACCOUNT_CODE                 character varying(105),
     ACCOUNT_PARENT               character varying(105),
     DEBIT_OR_CREDIT              character(3),
     ACCOUNT_TYPE_CODE            character(3),
     ACCOUNT_CLASS_CODE           integer,
     ACCOUNT_LEVEL                integer,
     AGGREGATION_SIGN             character(3)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_ACCOUNT_DIM ADD PRIMARY KEY (ACCOUNT_KEY);



CREATE TABLE  FIN_ACCOUNT_NAME_LOOKUP
(
     ACCOUNT_CODE                 character varying(105)    not null,
     ACCOUNT_NAME_EN              character varying(360),
     ACCOUNT_NAME_DE              character varying(360),
     ACCOUNT_NAME_FR              character varying(360),
     ACCOUNT_NAME_JA              character varying(360),
     ACCOUNT_NAME_AR              character varying(360),
     ACCOUNT_NAME_CS              character varying(360),
     ACCOUNT_NAME_DA              character varying(360),
     ACCOUNT_NAME_EL              character varying(360),
     ACCOUNT_NAME_ES              character varying(360),
     ACCOUNT_NAME_FI              character varying(360),
     ACCOUNT_NAME_HR              character varying(360),
     ACCOUNT_NAME_HU              character varying(360),
     ACCOUNT_NAME_ID              character varying(360),
     ACCOUNT_NAME_IT              character varying(360),
     ACCOUNT_NAME_KK              character varying(360),
     ACCOUNT_NAME_KO              character varying(360),
     ACCOUNT_NAME_MS              character varying(360),
     ACCOUNT_NAME_NL              character varying(360),
     ACCOUNT_NAME_NO              character varying(360),
     ACCOUNT_NAME_PL              character varying(360),
     ACCOUNT_NAME_PT              character varying(360),
     ACCOUNT_NAME_RO              character varying(360),
     ACCOUNT_NAME_RU              character varying(360),
     ACCOUNT_NAME_SC              character varying(360),
     ACCOUNT_NAME_SL              character varying(360),
     ACCOUNT_NAME_SV              character varying(360),
     ACCOUNT_NAME_TC              character varying(360),
     ACCOUNT_NAME_TH              character varying(360),
     ACCOUNT_NAME_TR              character varying(360)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_ACCOUNT_NAME_LOOKUP ADD PRIMARY KEY (ACCOUNT_CODE);



CREATE TABLE  FIN_ACCOUNT_TYPE_LOOKUP
(
     ACCOUNT_TYPE_CODE            character(3)              not null,
     ACCOUNT_TYPE_EN              character varying(300)    not null,
     ACCOUNT_TYPE_AR              character varying(300)    not null,
     ACCOUNT_TYPE_CS              character varying(300)    not null,
     ACCOUNT_TYPE_DA              character varying(300)    not null,
     ACCOUNT_TYPE_DE              character varying(300)    not null,
     ACCOUNT_TYPE_EL              character varying(300)    not null,
     ACCOUNT_TYPE_ES              character varying(300)    not null,
     ACCOUNT_TYPE_FI              character varying(300)    not null,
     ACCOUNT_TYPE_FR              character varying(300)    not null,
     ACCOUNT_TYPE_HR              character varying(300)    not null,
     ACCOUNT_TYPE_HU              character varying(300)    not null,
     ACCOUNT_TYPE_ID              character varying(300)    not null,
     ACCOUNT_TYPE_IT              character varying(300)    not null,
     ACCOUNT_TYPE_JA              character varying(300)    not null,
     ACCOUNT_TYPE_KK              character varying(300)    not null,
     ACCOUNT_TYPE_KO              character varying(300)    not null,
     ACCOUNT_TYPE_MS              character varying(300)    not null,
     ACCOUNT_TYPE_NL              character varying(300)    not null,
     ACCOUNT_TYPE_NO              character varying(300)    not null,
     ACCOUNT_TYPE_PL              character varying(300)    not null,
     ACCOUNT_TYPE_PT              character varying(300)    not null,
     ACCOUNT_TYPE_RO              character varying(300)    not null,
     ACCOUNT_TYPE_RU              character varying(300)    not null,
     ACCOUNT_TYPE_SC              character varying(300)    not null,
     ACCOUNT_TYPE_SL              character varying(300)    not null,
     ACCOUNT_TYPE_SV              character varying(300)    not null,
     ACCOUNT_TYPE_TC              character varying(300)    not null,
     ACCOUNT_TYPE_TH              character varying(300)    not null,
     ACCOUNT_TYPE_TR              character varying(300)    not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_ACCOUNT_TYPE_LOOKUP ADD PRIMARY KEY (ACCOUNT_TYPE_CODE);



CREATE TABLE  FIN_FINANCE_FACT
(
     SUBMISSION_KEY               integer                   not null,
     ORGANIZATION_KEY             integer                   not null,
     ACCOUNT_KEY                  integer                   not null,
     MONTH_KEY                    integer                   not null,
     AMOUNT_YEAR_TO_DATE          numeric(19,2),
     AMOUNT_MONTH                 numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_FINANCE_FACT ADD PRIMARY KEY (SUBMISSION_KEY, ORGANIZATION_KEY, ACCOUNT_KEY, MONTH_KEY);



CREATE TABLE  FIN_SUBM_CURRENCY_LOOKUP
(
     SUBMISSION_CURRENCY_CODE     character varying(9)      not null,
     SUBMISSION_CURRENCY_EN       character varying(90)     not null,
     SUBMISSION_CURRENCY_AR       character varying(90)     not null,
     SUBMISSION_CURRENCY_CS       character varying(90)     not null,
     SUBMISSION_CURRENCY_DA       character varying(90)     not null,
     SUBMISSION_CURRENCY_DE       character varying(90)     not null,
     SUBMISSION_CURRENCY_EL       character varying(90)     not null,
     SUBMISSION_CURRENCY_ES       character varying(90)     not null,
     SUBMISSION_CURRENCY_FI       character varying(90)     not null,
     SUBMISSION_CURRENCY_FR       character varying(90)     not null,
     SUBMISSION_CURRENCY_HR       character varying(90)     not null,
     SUBMISSION_CURRENCY_HU       character varying(90)     not null,
     SUBMISSION_CURRENCY_ID       character varying(90)     not null,
     SUBMISSION_CURRENCY_IT       character varying(90)     not null,
     SUBMISSION_CURRENCY_JA       character varying(90)     not null,
     SUBMISSION_CURRENCY_KK       character varying(90)     not null,
     SUBMISSION_CURRENCY_KO       character varying(90)     not null,
     SUBMISSION_CURRENCY_MS       character varying(90)     not null,
     SUBMISSION_CURRENCY_NL       character varying(90)     not null,
     SUBMISSION_CURRENCY_NO       character varying(90)     not null,
     SUBMISSION_CURRENCY_PL       character varying(90)     not null,
     SUBMISSION_CURRENCY_PT       character varying(90)     not null,
     SUBMISSION_CURRENCY_RO       character varying(90)     not null,
     SUBMISSION_CURRENCY_RU       character varying(90)     not null,
     SUBMISSION_CURRENCY_SC       character varying(90)     not null,
     SUBMISSION_CURRENCY_SL       character varying(90)     not null,
     SUBMISSION_CURRENCY_SV       character varying(90)     not null,
     SUBMISSION_CURRENCY_TC       character varying(90)     not null,
     SUBMISSION_CURRENCY_TH       character varying(90)     not null,
     SUBMISSION_CURRENCY_TR       character varying(90)     not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_SUBM_CURRENCY_LOOKUP ADD PRIMARY KEY (SUBMISSION_CURRENCY_CODE);



CREATE TABLE  FIN_SUBM_DIM
(
     SUBMISSION_KEY               integer                   not null,
     SUBMISSION_CODE              character varying(60)     not null,
     SUBMISSION_NAME_EN           character varying(240)    not null,
     SUBMISSION_NAME_AR           character varying(240),
     SUBMISSION_NAME_CS           character varying(240),
     SUBMISSION_NAME_DA           character varying(240),
     SUBMISSION_NAME_DE           character varying(240),
     SUBMISSION_NAME_EL           character varying(240),
     SUBMISSION_NAME_ES           character varying(240),
     SUBMISSION_NAME_FI           character varying(240),
     SUBMISSION_NAME_FR           character varying(240),
     SUBMISSION_NAME_HR           character varying(240),
     SUBMISSION_NAME_HU           character varying(240),
     SUBMISSION_NAME_ID           character varying(240),
     SUBMISSION_NAME_IT           character varying(240),
     SUBMISSION_NAME_JA           character varying(240),
     SUBMISSION_NAME_KK           character varying(240),
     SUBMISSION_NAME_KO           character varying(240),
     SUBMISSION_NAME_MS           character varying(240),
     SUBMISSION_NAME_NL           character varying(240),
     SUBMISSION_NAME_NO           character varying(240),
     SUBMISSION_NAME_PL           character varying(240),
     SUBMISSION_NAME_PT           character varying(240),
     SUBMISSION_NAME_RO           character varying(240),
     SUBMISSION_NAME_RU           character varying(240),
     SUBMISSION_NAME_SC           character varying(240),
     SUBMISSION_NAME_SL           character varying(240),
     SUBMISSION_NAME_SV           character varying(240),
     SUBMISSION_NAME_TC           character varying(240),
     SUBMISSION_NAME_TH           character varying(240),
     SUBMISSION_NAME_TR           character varying(240),
     SUBMISSION_YEAR              integer,
     SUBMISSION_TYPE_CODE         character(3),
     SUBMISSION_CURRENCY_CODE     character varying(9)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_SUBM_DIM ADD PRIMARY KEY (SUBMISSION_KEY);



CREATE TABLE  FIN_SUBM_TYPE_LOOKUP
(
     SUBMISSION_TYPE_CODE         character(3)              not null,
     SUBMISSION_TYPE_EN           character varying(90)     not null,
     SUBMISSION_TYPE_AR           character varying(90)     not null,
     SUBMISSION_TYPE_CS           character varying(90)     not null,
     SUBMISSION_TYPE_DA           character varying(90)     not null,
     SUBMISSION_TYPE_DE           character varying(90)     not null,
     SUBMISSION_TYPE_EL           character varying(90)     not null,
     SUBMISSION_TYPE_ES           character varying(90)     not null,
     SUBMISSION_TYPE_FI           character varying(90)     not null,
     SUBMISSION_TYPE_FR           character varying(90)     not null,
     SUBMISSION_TYPE_HR           character varying(90)     not null,
     SUBMISSION_TYPE_HU           character varying(90)     not null,
     SUBMISSION_TYPE_ID           character varying(90)     not null,
     SUBMISSION_TYPE_IT           character varying(90)     not null,
     SUBMISSION_TYPE_JA           character varying(90)     not null,
     SUBMISSION_TYPE_KK           character varying(90)     not null,
     SUBMISSION_TYPE_KO           character varying(90)     not null,
     SUBMISSION_TYPE_MS           character varying(90)     not null,
     SUBMISSION_TYPE_NL           character varying(90)     not null,
     SUBMISSION_TYPE_NO           character varying(90)     not null,
     SUBMISSION_TYPE_PL           character varying(90)     not null,
     SUBMISSION_TYPE_PT           character varying(90)     not null,
     SUBMISSION_TYPE_RO           character varying(90)     not null,
     SUBMISSION_TYPE_RU           character varying(90)     not null,
     SUBMISSION_TYPE_SC           character varying(90)     not null,
     SUBMISSION_TYPE_SL           character varying(90)     not null,
     SUBMISSION_TYPE_SV           character varying(90)     not null,
     SUBMISSION_TYPE_TC           character varying(90)     not null,
     SUBMISSION_TYPE_TH           character varying(90)     not null,
     SUBMISSION_TYPE_TR           character varying(90)     not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE FIN_SUBM_TYPE_LOOKUP ADD PRIMARY KEY (SUBMISSION_TYPE_CODE);



CREATE TABLE  GO_BRANCH_DIM
(
     BRANCH_KEY                   integer                   not null,
     BRANCH_CODE                  integer                   not null,
     ADDRESS1                     character varying(120)    not null,
     ADDRESS2                        character varying(120),
     CITY                            character varying(60)     not null,
     PROV_STATE                      character varying(60),
     ADDRESS1_MB                     character varying(120),
     ADDRESS2_MB                     character varying(120),
     CITY_MB                         character varying(60)     not null,
     PROV_STATE_MB                   character varying(60),
     POSTAL_ZONE                     character varying(30)     not null,
     COUNTRY_CODE                    integer                   not null,
     WAREHOUSE_BRANCH_CODE           integer                   not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_BRANCH_DIM ADD PRIMARY KEY (BRANCH_KEY);



CREATE TABLE  GO_GENDER_LOOKUP
(
     GENDER_CODE                     smallint                  not null,
     GENDER_EN                       character varying(45),
     GENDER_DE                       character varying(45),
     GENDER_FR                       character varying(45),
     GENDER_JA                       character varying(45),
     GENDER_AR                       character varying(45),
     GENDER_CS                       character varying(45),
     GENDER_DA                       character varying(45),
     GENDER_EL                       character varying(45),
     GENDER_ES                       character varying(45),
     GENDER_FI                       character varying(45),
     GENDER_HR                       character varying(45),
     GENDER_HU                       character varying(45),
     GENDER_ID                       character varying(45),
     GENDER_IT                       character varying(45),
     GENDER_KK                       character varying(45),
     GENDER_KO                       character varying(45),
     GENDER_MS                       character varying(45),
     GENDER_NL                       character varying(45),
     GENDER_NO                       character varying(45),
     GENDER_PL                       character varying(45),
     GENDER_PT                       character varying(45),
     GENDER_RO                       character varying(45),
     GENDER_RU                       character varying(45),
     GENDER_SC                       character varying(45),
     GENDER_SL                       character varying(45),
     GENDER_SV                       character varying(45),
     GENDER_TC                       character varying(45),
     GENDER_TH                       character varying(45),
     GENDER_TR                       character varying(45)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_GENDER_LOOKUP ADD PRIMARY KEY (GENDER_CODE);



CREATE TABLE  GO_ORG_DIM
(
     ORGANIZATION_KEY                integer                   not null,
     ORGANIZATION_CODE1              character varying(30),
     ORGANIZATION_CODE2              character varying(30),
     ORGANIZATION_CODE3              character varying(30),
     ORGANIZATION_CODE4              character varying(30),
     ORGANIZATION_CODE               character varying(30),
     ORGANIZATION_PARENT             character varying(30),
     ORGANIZATION_LEVEL              smallint
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_ORG_DIM ADD PRIMARY KEY (ORGANIZATION_KEY);



CREATE TABLE  GO_ORG_NAME_LOOKUP
(
     ORGANIZATION_CODE               character varying(30)     not null,
     ORGANIZATION_NAME_EN            character varying(180),
     ORGANIZATION_NAME_DE            character varying(180),
     ORGANIZATION_NAME_FR            character varying(180),
     ORGANIZATION_NAME_JA            character varying(180),
     ORGANIZATION_NAME_AR            character varying(180),
     ORGANIZATION_NAME_CS            character varying(180),
     ORGANIZATION_NAME_DA            character varying(180),
     ORGANIZATION_NAME_EL            character varying(180),
     ORGANIZATION_NAME_ES            character varying(180),
     ORGANIZATION_NAME_FI            character varying(180),
     ORGANIZATION_NAME_HR            character varying(180),
     ORGANIZATION_NAME_HU            character varying(180),
     ORGANIZATION_NAME_ID            character varying(180),
     ORGANIZATION_NAME_IT            character varying(180),
     ORGANIZATION_NAME_KK            character varying(180),
     ORGANIZATION_NAME_KO            character varying(180),
     ORGANIZATION_NAME_MS            character varying(180),
     ORGANIZATION_NAME_NL            character varying(180),
     ORGANIZATION_NAME_NO            character varying(180),
     ORGANIZATION_NAME_PL            character varying(180),
     ORGANIZATION_NAME_PT            character varying(180),
     ORGANIZATION_NAME_RO            character varying(180),
     ORGANIZATION_NAME_RU            character varying(180),
     ORGANIZATION_NAME_SC            character varying(180),
     ORGANIZATION_NAME_SL            character varying(180),
     ORGANIZATION_NAME_SV            character varying(180),
     ORGANIZATION_NAME_TC            character varying(180),
     ORGANIZATION_NAME_TH            character varying(180),
     ORGANIZATION_NAME_TR            character varying(180)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_ORG_NAME_LOOKUP ADD PRIMARY KEY (ORGANIZATION_CODE);



CREATE TABLE  GO_REGION_DIM
(
     COUNTRY_KEY                     integer                   not null,
     COUNTRY_CODE                    integer                   not null,
     FLAG_IMAGE                      character varying(45)     not null,
     ISO_THREE_LETTER_CODE           character varying(9)      not null,
     ISO_TWO_LETTER_CODE             character varying(6)      not null,
     ISO_THREE_DIGIT_CODE            character varying(9)      not null,
     REGION_KEY                      integer                   not null,
     REGION_CODE                     integer                   not null,
     REGION_EN                       character varying(90)     not null,
     COUNTRY_EN                      character varying(90)     not null,
     REGION_DE                       character varying(90)     not null,
     COUNTRY_DE                      character varying(90)     not null,
     REGION_FR                       character varying(90)     not null,
     COUNTRY_FR                      character varying(90)     not null,
     REGION_JA                       character varying(90)     not null,
     COUNTRY_JA                      character varying(90)     not null,
     COUNTRY_AR                      character varying(90)     not null,
     REGION_AR                       character varying(90)     not null,
     REGION_CS                       character varying(90)     not null,
     COUNTRY_CS                      character varying(90)     not null,
     REGION_DA                       character varying(90)     not null,
     COUNTRY_DA                      character varying(90)     not null,
     REGION_EL                       character varying(90)     not null,
     COUNTRY_EL                      character varying(90)     not null,
     REGION_ES                       character varying(90)     not null,
     COUNTRY_ES                      character varying(90)     not null,
     REGION_FI                       character varying(90)     not null,
     COUNTRY_FI                      character varying(90)     not null,
     REGION_HR                       character varying(90)     not null,
     COUNTRY_HR                      character varying(90)     not null,
     REGION_HU                       character varying(90)     not null,
     COUNTRY_HU                      character varying(90)     not null,
     REGION_ID                       character varying(90)     not null,
     COUNTRY_ID                      character varying(90)     not null,
     REGION_IT                       character varying(90)     not null,
     COUNTRY_IT                      character varying(90)     not null,
     REGION_KK                       character varying(90)     not null,
     COUNTRY_KK                      character varying(90)     not null,
     REGION_KO                       character varying(90)     not null,
     COUNTRY_KO                      character varying(90)     not null,
     REGION_MS                       character varying(90)     not null,
     COUNTRY_MS                      character varying(90)     not null,
     REGION_NL                       character varying(90)     not null,
     COUNTRY_NL                      character varying(90)     not null,
     REGION_NO                       character varying(90)     not null,
     COUNTRY_NO                      character varying(90)     not null,
     REGION_PL                       character varying(90)     not null,
     COUNTRY_PL                      character varying(90)     not null,
     REGION_PT                       character varying(90)     not null,
     COUNTRY_PT                      character varying(90)     not null,
     REGION_RO                       character varying(90)     not null,
     COUNTRY_RO                      character varying(90)     not null,
     REGION_RU                       character varying(90)     not null,
     COUNTRY_RU                      character varying(90)     not null,
     REGION_SC                       character varying(90)     not null,
     COUNTRY_SC                      character varying(90)     not null,
     REGION_SL                       character varying(90)     not null,
     COUNTRY_SL                      character varying(90)     not null,
     REGION_SV                       character varying(90)     not null,
     COUNTRY_SV                      character varying(90)     not null,
     REGION_TC                       character varying(90)     not null,
     COUNTRY_TC                      character varying(90)     not null,
     REGION_TH                       character varying(90)     not null,
     COUNTRY_TH                      character varying(90)     not null,
     REGION_TR                       character varying(90)     not null,
     COUNTRY_TR                      character varying(90)     not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_REGION_DIM ADD PRIMARY KEY (COUNTRY_KEY);



CREATE TABLE  GO_SATISFACTION_DIM
(
     SATISFACTION_KEY                integer                   not null,
     SATISFACTION_CODE               integer                   not null,
     SATISFACTION_LOWER_LIMIT        double precision,
     SATISFACTION_UPPER_LIMIT        double precision,
     SATISFACTION_DESCRIPTION_EN     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_DE     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_FR     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_JA     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_AR     character varying(120),
     SATISFACTION_DESCRIPTION_CS     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_DA     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_EL     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_ES     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_FI     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_HR     character varying(120),
     SATISFACTION_DESCRIPTION_HU     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_ID     character varying(120),
     SATISFACTION_DESCRIPTION_IT     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_KK     character varying(120),
     SATISFACTION_DESCRIPTION_KO     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_MS     character varying(120),
     SATISFACTION_DESCRIPTION_NL     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_NO     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_PL     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_PT     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_RO     character varying(120),
     SATISFACTION_DESCRIPTION_RU     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_SC     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_SL     character varying(120),
     SATISFACTION_DESCRIPTION_SV     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_TC     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_TH     character varying(120)    not null,
     SATISFACTION_DESCRIPTION_TR     character varying(120)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_SATISFACTION_DIM ADD PRIMARY KEY (SATISFACTION_KEY);



CREATE TABLE  GO_TIME_DIM
(
     DAY_KEY                         integer                   not null,
     DAY_DATE                        timestamp,
     MONTH_KEY                       integer                   not null,
     CURRENT_MONTH                   smallint,
     MONTH_NUMBER                    integer,
     QUARTER_KEY                     integer                   not null,
     CURRENT_QUARTER                 smallint,
     CURRENT_YEAR                    smallint                  not null,
     DAY_OF_WEEK                     smallint,
     DAY_OF_MONTH                    smallint,
     DAYS_IN_MONTH                   smallint,
     DAY_OF_YEAR                     smallint,
     WEEK_OF_MONTH                   smallint,
     WEEK_OF_QUARTER                 smallint,
     WEEK_OF_YEAR                    smallint,
     MONTH_EN                        character varying(75),
     WEEKDAY_EN                      character varying(60),
     MONTH_DE                        character varying(75),
     WEEKDAY_DE                      character varying(60),
     MONTH_FR                        character varying(75),
     WEEKDAY_FR                      character varying(60),
     MONTH_JA                        character varying(75),
     WEEKDAY_JA                      character varying(60),
     MONTH_AR                        character varying(75),
     WEEKDAY_AR                      character varying(60),
     MONTH_CS                        character varying(75),
     WEEKDAY_CS                      character varying(60),
     MONTH_DA                        character varying(75),
     WEEKDAY_DA                      character varying(60),
     MONTH_EL                        character varying(75),
     WEEKDAY_EL                      character varying(60),
     MONTH_ES                        character varying(75),
     WEEKDAY_ES                      character varying(60),
     MONTH_FI                        character varying(75),
     WEEKDAY_FI                      character varying(60),
     MONTH_HR                        character varying(75)     not null,
     WEEKDAY_HR                      character varying(60)     not null,
     MONTH_HU                        character varying(75),
     WEEKDAY_HU                      character varying(60),
     MONTH_ID                        character varying(75),
     WEEKDAY_ID                      character varying(60),
     MONTH_IT                        character varying(75),
     WEEKDAY_IT                      character varying(60),
     MONTH_KK                        character varying(75)     not null,
     WEEKDAY_KK                      character varying(60)     not null,
     MONTH_KO                        character varying(75),
     WEEKDAY_KO                      character varying(60),
     MONTH_MS                        character varying(75),
     WEEKDAY_MS                      character varying(60),
     MONTH_NL                        character varying(75),
     WEEKDAY_NL                      character varying(60),
     MONTH_NO                        character varying(75),
     WEEKDAY_NO                      character varying(60),
     MONTH_PL                        character varying(75),
     WEEKDAY_PL                      character varying(60),
     MONTH_PT                        character varying(75),
     WEEKDAY_PT                      character varying(60),
     MONTH_RO                        character varying(75),
     WEEKDAY_RO                      character varying(60),
     MONTH_RU                        character varying(75),
     WEEKDAY_RU                      character varying(60),
     MONTH_SC                        character varying(75),
     WEEKDAY_SC                      character varying(60),
     MONTH_SL                        character varying(75)     not null,
     WEEKDAY_SL                      character varying(60)     not null,
     MONTH_SV                        character varying(75),
     WEEKDAY_SV                      character varying(60),
     MONTH_TC                        character varying(75),
     WEEKDAY_TC                      character varying(60),
     MONTH_TH                        character varying(75),
     WEEKDAY_TH                      character varying(60),
     MONTH_TR                        character varying(75),
     WEEKDAY_TR                      character varying(60)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_TIME_DIM ADD PRIMARY KEY (DAY_KEY);



CREATE TABLE  GO_TIME_QUARTER_LOOKUP
(
     QUARTER_KEY                     integer                   not null,
     QUARTER_EN                      character varying(60),
     QUARTER_DE                      character varying(60),
     QUARTER_FR                      character varying(60),
     QUARTER_JA                      character varying(60),
     QUARTER_AR                      character varying(60),
     QUARTER_CS                  character varying(60),
     QUARTER_DA                  character varying(60),
     QUARTER_EL                  character varying(60),
     QUARTER_ES                  character varying(60),
     QUARTER_FI                  character varying(60),
     QUARTER_HR                  character varying(60)     not null,
     QUARTER_HU                  character varying(60),
     QUARTER_ID                  character varying(60),
     QUARTER_IT                  character varying(60),
     QUARTER_KK                  character varying(60)     not null,
     QUARTER_KO                  character varying(60),
     QUARTER_MS                  character varying(60),
     QUARTER_NL                  character varying(60),
     QUARTER_NO                  character varying(60),
     QUARTER_PL                  character varying(60),
     QUARTER_PT                  character varying(60),
     QUARTER_RO                  character varying(60),
     QUARTER_RU                  character varying(60),
     QUARTER_SC                  character varying(60),
     QUARTER_SL                  character varying(60)     not null,
     QUARTER_SV                  character varying(60),
     QUARTER_TC                  character varying(60),
     QUARTER_TH                  character varying(60),
     QUARTER_TR                  character varying(60)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE GO_TIME_QUARTER_LOOKUP ADD PRIMARY KEY (QUARTER_KEY);



CREATE TABLE  MRK_ACTIVITY_STATUS_DIM
(
     ACTIVITY_STATUS_KEY         integer                   not null,
     ACTIVITY_STATUS_CODE        smallint                  not null,
     ACTIVITY_STATUS_EN          character varying(60),
     ACTIVITY_STATUS_DE          character varying(60),
     ACTIVITY_STATUS_FR          character varying(60),
     ACTIVITY_STATUS_JA          character varying(60),
     ACTIVITY_STATUS_AR          character varying(60),
     ACTIVITY_STATUS_CS          character varying(60),
     ACTIVITY_STATUS_DA          character varying(60),
     ACTIVITY_STATUS_EL          character varying(60),
     ACTIVITY_STATUS_ES          character varying(60),
     ACTIVITY_STATUS_FI          character varying(60),
     ACTIVITY_STATUS_HR          character varying(60)     not null,
     ACTIVITY_STATUS_HU          character varying(60),
     ACTIVITY_STATUS_ID          character varying(60),
     ACTIVITY_STATUS_IT          character varying(60),
     ACTIVITY_STATUS_KK          character varying(60)     not null,
     ACTIVITY_STATUS_KO          character varying(60),
     ACTIVITY_STATUS_MS          character varying(60),
     ACTIVITY_STATUS_NL          character varying(60),
     ACTIVITY_STATUS_NO          character varying(60),
     ACTIVITY_STATUS_PL          character varying(60),
     ACTIVITY_STATUS_PT          character varying(60),
     ACTIVITY_STATUS_RO          character varying(60),
     ACTIVITY_STATUS_RU          character varying(60),
     ACTIVITY_STATUS_SC          character varying(60),
     ACTIVITY_STATUS_SL          character varying(60)     not null,
     ACTIVITY_STATUS_SV          character varying(60),
     ACTIVITY_STATUS_TC          character varying(60),
     ACTIVITY_STATUS_TH          character varying(60),
     ACTIVITY_STATUS_TR          character varying(60)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;



CREATE TABLE  MRK_ADV_FACT
(
     ORGANIZATION_KEY            integer                   not null,
     BASE_PRODUCT_KEY            integer                   not null,
     CURRENT_YEAR                integer                   not null,
     ADV_DIRECT_MAIL             numeric(19,2),
     ADV_EMAIL                   numeric(19,2),
     ADV_MAGAZINE                numeric(18,0),
     ADV_OTHER                   numeric(19,2),
     ADV_RADIO                   numeric(19,2),
     ADV_SPONSORSHIPS            numeric(19,2),
     ADV_TELEVISION              numeric(19,2)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_ADV_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, BASE_PRODUCT_KEY, CURRENT_YEAR);



CREATE TABLE  MRK_BUNDLE_GROUP_LOOKUP
(
     BUNDLE_GROUP_CODE           integer                   not null,
     BUNDLE_GROUP_EN             character varying(120),
     BUNDLE_GROUP_DE             character varying(120),
     BUNDLE_GROUP_FR             character varying(120),
     BUNDLE_GROUP_JA             character varying(120),
     BUNDLE_GROUP_AR             character varying(120),
     BUNDLE_GROUP_CS             character varying(120),
     BUNDLE_GROUP_DA             character varying(120),
     BUNDLE_GROUP_EL             character varying(120),
     BUNDLE_GROUP_ES             character varying(120),
     BUNDLE_GROUP_FI             character varying(120),
     BUNDLE_GROUP_HR             character varying(120)    not null,
     BUNDLE_GROUP_HU             character varying(120),
     BUNDLE_GROUP_ID             character varying(120),
     BUNDLE_GROUP_IT             character varying(120),
     BUNDLE_GROUP_KK             character varying(120)    not null,
     BUNDLE_GROUP_KO             character varying(120),
     BUNDLE_GROUP_MS             character varying(120),
     BUNDLE_GROUP_NL             character varying(120),
     BUNDLE_GROUP_NO             character varying(120),
     BUNDLE_GROUP_PL             character varying(120),
     BUNDLE_GROUP_PT             character varying(120),
     BUNDLE_GROUP_RO             character varying(120),
     BUNDLE_GROUP_RU             character varying(120),
     BUNDLE_GROUP_SC             character varying(120),
     BUNDLE_GROUP_SL             character varying(120)    not null,
     BUNDLE_GROUP_SV             character varying(120),
     BUNDLE_GROUP_TC             character varying(120),
     BUNDLE_GROUP_TH             character varying(120),
     BUNDLE_GROUP_TR             character varying(120)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_BUNDLE_GROUP_LOOKUP ADD PRIMARY KEY (BUNDLE_GROUP_CODE);



CREATE TABLE  MRK_CAMPAIGN_LOOKUP
(
     CAMPAIGN_CODE               integer                   not null,
     CAMPAIGN_NAME_EN            character varying(150),
     CAMPAIGN_NAME_DE            character varying(150),
     CAMPAIGN_NAME_FR            character varying(150),
     CAMPAIGN_NAME_JA            character varying(150),
     CAMPAIGN_NAME_AR            character varying(150),
     CAMPAIGN_NAME_CS            character varying(150),
     CAMPAIGN_NAME_DA            character varying(150),
     CAMPAIGN_NAME_EL            character varying(150),
     CAMPAIGN_NAME_ES            character varying(150),
     CAMPAIGN_NAME_FI            character varying(150),
     CAMPAIGN_NAME_HR            character varying(150)    not null,
     CAMPAIGN_NAME_HU            character varying(150),
     CAMPAIGN_NAME_ID            character varying(150),
     CAMPAIGN_NAME_IT            character varying(150),
     CAMPAIGN_NAME_KK            character varying(150)    not null,
     CAMPAIGN_NAME_KO            character varying(150),
     CAMPAIGN_NAME_MS            character varying(150),
     CAMPAIGN_NAME_NL            character varying(150),
     CAMPAIGN_NAME_NO            character varying(150),
     CAMPAIGN_NAME_PL            character varying(150),
     CAMPAIGN_NAME_PT            character varying(150),
     CAMPAIGN_NAME_RO            character varying(150),
     CAMPAIGN_NAME_RU            character varying(150),
     CAMPAIGN_NAME_SC            character varying(150),
     CAMPAIGN_NAME_SL            character varying(150)    not null,
     CAMPAIGN_NAME_SV            character varying(150),
     CAMPAIGN_NAME_TC            character varying(150),
     CAMPAIGN_NAME_TH            character varying(150),
     CAMPAIGN_NAME_TR            character varying(150)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_CAMPAIGN_LOOKUP ADD PRIMARY KEY (CAMPAIGN_CODE);



CREATE TABLE  MRK_PRODUCT_SURVEY_DIM
(
     PRODUCT_SURVEY_KEY          integer                   not null,
     PRODUCT_TOPIC_CODE          integer,
     PRODUCT_TOPIC_EN            character varying(120),
     PRODUCT_TOPIC_DE            character varying(120),
     PRODUCT_TOPIC_FR            character varying(120),
     PRODUCT_TOPIC_JA            character varying(120),
     PRODUCT_TOPIC_AR            character varying(120),
     PRODUCT_TOPIC_CS            character varying(120),
     PRODUCT_TOPIC_DA            character varying(120),
     PRODUCT_TOPIC_EL            character varying(120),
     PRODUCT_TOPIC_ES            character varying(120),
     PRODUCT_TOPIC_FI            character varying(120),
     PRODUCT_TOPIC_HR            character varying(120)    not null,
     PRODUCT_TOPIC_HU            character varying(120),
     PRODUCT_TOPIC_ID            character varying(120),
     PRODUCT_TOPIC_IT            character varying(120),
     PRODUCT_TOPIC_KK            character varying(120)    not null,
     PRODUCT_TOPIC_KO            character varying(120),
     PRODUCT_TOPIC_MS            character varying(120),
     PRODUCT_TOPIC_NL            character varying(120),
     PRODUCT_TOPIC_NO            character varying(120),
     PRODUCT_TOPIC_PL            character varying(120),
     PRODUCT_TOPIC_PT            character varying(120),
     PRODUCT_TOPIC_RO            character varying(120),
     PRODUCT_TOPIC_RU            character varying(120),
     PRODUCT_TOPIC_SC            character varying(120),
     PRODUCT_TOPIC_SL            character varying(120)    not null,
     PRODUCT_TOPIC_SV            character varying(120),
     PRODUCT_TOPIC_TC            character varying(120),
     PRODUCT_TOPIC_TH            character varying(120),
     PRODUCT_TOPIC_TR            character varying(120)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PRODUCT_SURVEY_DIM ADD PRIMARY KEY (PRODUCT_SURVEY_KEY);



CREATE TABLE  MRK_PRODUCT_SURVEY_FACT
(
     MONTH_KEY                   integer                   not null,
     ORGANIZATION_KEY            integer                   not null,
     RTL_COUNTRY_KEY             integer                   not null,
     BRANCH_KEY                  integer                   not null,
     PRODUCT_KEY                 integer                   not null,
     PRODUCT_SURVEY_KEY          integer                   not null,
     PRODUCT_TOPIC_SCORE         double precision
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, RTL_COUNTRY_KEY, BRANCH_KEY, PRODUCT_KEY, PRODUCT_SURVEY_KEY);



CREATE TABLE  MRK_PROD_SURVEY_TARG_FACT
(
     MONTH_KEY                   integer                   not null,
     PRODUCT_KEY                 integer                   not null,
     PRODUCT_SURVEY_KEY          integer                   not null,
     PRODUCT_TOPIC_TARGET        double precision
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PROD_SURVEY_TARG_FACT ADD PRIMARY KEY (MONTH_KEY, PRODUCT_KEY, PRODUCT_SURVEY_KEY);



CREATE TABLE  MRK_PROMOTION_DIM
(
     PROMOTION_KEY               integer                   not null,
     PROMOTION_CODE              integer                   not null,
     CAMPAIGN_CODE               integer                   not null,
     BUNDLE_GROUP_CODE           integer,
     PROMOTION_NAME_EN           character varying(180),
     PROMOTION_NAME_DE           character varying(180),
     PROMOTION_NAME_FR           character varying(180),
     PROMOTION_NAME_JA           character varying(180),
     PROMOTION_NAME_AR           character varying(180),
     PROMOTION_NAME_CS           character varying(180),
     PROMOTION_NAME_DA           character varying(180),
     PROMOTION_NAME_EL           character varying(180),
     PROMOTION_NAME_ES           character varying(180),
     PROMOTION_NAME_FI           character varying(180),
     PROMOTION_NAME_HR           character varying(180)    not null,
     PROMOTION_NAME_HU           character varying(180),
     PROMOTION_NAME_ID           character varying(180),
     PROMOTION_NAME_IT           character varying(180),
     PROMOTION_NAME_KK           character varying(180)    not null,
     PROMOTION_NAME_KO           character varying(180),
     PROMOTION_NAME_MS           character varying(180),
     PROMOTION_NAME_NL           character varying(180),
     PROMOTION_NAME_NO           character varying(180),
     PROMOTION_NAME_PL           character varying(180),
     PROMOTION_NAME_PT           character varying(180),
     PROMOTION_NAME_RO           character varying(180),
     PROMOTION_NAME_RU           character varying(180),
     PROMOTION_NAME_SC           character varying(180),
     PROMOTION_NAME_SL           character varying(180)    not null,
     PROMOTION_NAME_SV           character varying(180),
     PROMOTION_NAME_TC           character varying(180),
     PROMOTION_NAME_TH           character varying(180),
     PROMOTION_NAME_TR           character varying(180)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PROMOTION_DIM ADD PRIMARY KEY (PROMOTION_KEY);



CREATE TABLE  MRK_PROMOTION_FACT
(
     ORGANIZATION_KEY            integer                   not null,
     ORDER_DAY_KEY               integer                   not null,
     RTL_COUNTRY_KEY             integer                   not null,
     EMPLOYEE_KEY                integer                   not null,
     RETAILER_KEY                integer                   not null,
     PRODUCT_KEY                 integer                   not null,
     PROMOTION_KEY               integer                   not null,
     SALES_ORDER_KEY             integer                   not null,
     QUANTITY                    smallint,
     UNIT_COST                   numeric(19,2),
     UNIT_PRICE                  numeric(19,2),
     UNIT_SALE_PRICE             numeric(19,2),
     GROSS_MARGIN                double precision,
     SALE_TOTAL                  numeric(19,2),
     GROSS_PROFIT                numeric(19,2)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PROMOTION_FACT ADD PRIMARY KEY (ORGANIZATION_KEY, ORDER_DAY_KEY, RTL_COUNTRY_KEY, EMPLOYEE_KEY, RETAILER_KEY, PRODUCT_KEY, PROMOTION_KEY, SALES_ORDER_KEY);



CREATE TABLE  MRK_PROMOTION_PLAN_FACT
(
     MONTH_KEY                   integer                   not null,
     ORGANIZATION_KEY            integer                   not null,
     BRANCH_KEY                  integer                   not null,
     RTL_COUNTRY_KEY             integer                   not null,
     PRODUCT_KEY                 integer                   not null,
     PROMOTION_KEY               integer                   not null,
     UNIT_COST                   numeric(19,2),
     UNIT_PRICE                  numeric(19,2),
     UNIT_SALE_PRICE             numeric(19,2),
     PROMOTION_PLAN_QUANTITY     integer                   not null,
     PROMOTION_PLAN_REVENUE      numeric(19,2)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, BRANCH_KEY, RTL_COUNTRY_KEY, PRODUCT_KEY, PROMOTION_KEY);



CREATE TABLE  MRK_RTL_SURVEY_DIM
(
     RETAILER_SURVEY_KEY         integer                   not null,
     RETAILER_TOPIC_CODE         integer,
     RETAILER_TOPIC_EN           character varying(150),
     RETAILER_TOPIC_DE           character varying(150),
     RETAILER_TOPIC_FR           character varying(150),
     RETAILER_TOPIC_JA           character varying(150),
     RETAILER_TOPIC_AR           character varying(150),
     RETAILER_TOPIC_CS           character varying(150),
     RETAILER_TOPIC_DA           character varying(150),
     RETAILER_TOPIC_EL           character varying(150),
     RETAILER_TOPIC_ES           character varying(150),
     RETAILER_TOPIC_FI           character varying(150),
     RETAILER_TOPIC_HR           character varying(150)    not null,
     RETAILER_TOPIC_HU           character varying(150),
     RETAILER_TOPIC_ID           character varying(150),
     RETAILER_TOPIC_IT           character varying(150),
     RETAILER_TOPIC_KK           character varying(150)    not null,
     RETAILER_TOPIC_KO           character varying(150),
     RETAILER_TOPIC_MS           character varying(150),
     RETAILER_TOPIC_NL           character varying(150),
     RETAILER_TOPIC_NO           character varying(150),
     RETAILER_TOPIC_PL           character varying(150),
     RETAILER_TOPIC_PT           character varying(150),
     RETAILER_TOPIC_RO           character varying(150),
     RETAILER_TOPIC_RU           character varying(150),
     RETAILER_TOPIC_SC           character varying(150),
     RETAILER_TOPIC_SL           character varying(150)    not null,
     RETAILER_TOPIC_SV           character varying(150),
     RETAILER_TOPIC_TC           character varying(150),
     RETAILER_TOPIC_TH           character varying(150),
     RETAILER_TOPIC_TR         character varying(150)
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_RTL_SURVEY_DIM ADD PRIMARY KEY (RETAILER_SURVEY_KEY);



CREATE TABLE  MRK_RTL_SURVEY_FACT
(
     MONTH_KEY                 integer                   not null,
     ORGANIZATION_KEY          integer                   not null,
     BRANCH_KEY                integer                   not null,
     RTL_COUNTRY_KEY           integer                   not null,
     RETAILER_KEY              integer                   not null,
     RETAILER_SURVEY_KEY       integer                   not null,
     RETAILER_TOPIC_SCORE      double precision
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_RTL_SURVEY_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, BRANCH_KEY, RTL_COUNTRY_KEY, RETAILER_KEY, RETAILER_SURVEY_KEY);



CREATE TABLE  MRK_RTL_SURVEY_TARG_FACT
(
     RETAILER_SURVEY_KEY       integer                   not null,
     MONTH_KEY                 integer                   not null,
     RETAILER_TOPIC_WEIGHT     integer,
     RETAILER_TOPIC_TARGET     double precision
)
DISTRIBUTE ON RANDOM
BACKUP DATA OFF
;

ALTER TABLE MRK_RTL_SURVEY_TARG_FACT ADD PRIMARY KEY (RETAILER_SURVEY_KEY, MONTH_KEY);



CREATE TABLE  SLS_ORDER_METHOD_DIM
(
     ORDER_METHOD_KEY          integer                   not null,
     ORDER_METHOD_CODE         integer                   not null,
     ORDER_METHOD_EN           character varying(90)     not null,
     ORDER_METHOD_DE           character varying(90)     not null,
     ORDER_METHOD_FR           character varying(90)     not null,
     ORDER_METHOD_JA           character varying(90)     not null,
     ORDER_METHOD_AR           character varying(90)     not null,
     ORDER_METHOD_CS           character varying(90)     not null,
     ORDER_METHOD_DA           character varying(90)     not null,
     ORDER_METHOD_EL           character varying(90)     not null,
     ORDER_METHOD_ES           character varying(90)     not null,
     ORDER_METHOD_FI           character varying(90)     not null,
     ORDER_METHOD_HR           character varying(90)     not null,
     ORDER_METHOD_HU           character varying(90)     not null,
     ORDER_METHOD_ID           character varying(90)     not null,
     ORDER_METHOD_IT           character varying(90)     not null,
     ORDER_METHOD_KK           character varying(90)     not null,
     ORDER_METHOD_KO           character varying(90)     not null,
     ORDER_METHOD_MS           character varying(90)     not null,
     ORDER_METHOD_NL           character varying(90)     not null,
     ORDER_METHOD_NO           character varying(90)     not null,
     ORDER_METHOD_PL           character varying(90)     not null,
     ORDER_METHOD_PT           character varying(90)     not null,
     ORDER_METHOD_RO           character varying(90)     not null,
     ORDER_METHOD_RU           character varying(90)     not null,
     ORDER_METHOD_SC           character varying(90)     not null,
     ORDER_METHOD_SL           character varying(90)     not null,
     ORDER_METHOD_SV           character varying(90)     not null,
     ORDER_METHOD_TC           character varying(90)     not null,
     ORDER_METHOD_TH           character varying(90)     not null,
     ORDER_METHOD_TR           character varying(90)     not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_ORDER_METHOD_DIM ADD PRIMARY KEY (ORDER_METHOD_KEY);



CREATE TABLE  SLS_PRODUCT_BRAND_LOOKUP
(
     PRODUCT_BRAND_CODE        integer                   not null,
     PRODUCT_BRAND_EN          character varying(90),
     PRODUCT_BRAND_DE          character varying(90),
     PRODUCT_BRAND_FR          character varying(90),
     PRODUCT_BRAND_JA          character varying(90),
     PRODUCT_BRAND_AR          character varying(90),
     PRODUCT_BRAND_CS          character varying(90),
     PRODUCT_BRAND_DA          character varying(90),
     PRODUCT_BRAND_EL          character varying(90),
     PRODUCT_BRAND_ES          character varying(90),
     PRODUCT_BRAND_FI          character varying(90),
     PRODUCT_BRAND_HR          character varying(90)     not null,
     PRODUCT_BRAND_HU          character varying(90),
     PRODUCT_BRAND_ID          character varying(90),
     PRODUCT_BRAND_IT          character varying(90),
     PRODUCT_BRAND_KK          character varying(90)     not null,
     PRODUCT_BRAND_KO          character varying(90),
     PRODUCT_BRAND_MS          character varying(90),
     PRODUCT_BRAND_NL          character varying(90),
     PRODUCT_BRAND_NO          character varying(90),
     PRODUCT_BRAND_PL          character varying(90),
     PRODUCT_BRAND_PT          character varying(90),
     PRODUCT_BRAND_RO          character varying(90),
     PRODUCT_BRAND_RU          character varying(90),
     PRODUCT_BRAND_SC          character varying(90),
     PRODUCT_BRAND_SL          character varying(90)     not null,
     PRODUCT_BRAND_SV          character varying(90),
     PRODUCT_BRAND_TC          character varying(90),
     PRODUCT_BRAND_TH          character varying(90),
     PRODUCT_BRAND_TR          character varying(90)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_BRAND_LOOKUP ADD PRIMARY KEY (PRODUCT_BRAND_CODE);



CREATE TABLE  SLS_PRODUCT_COLOR_LOOKUP
(
     PRODUCT_COLOR_CODE        integer                   not null,
     PRODUCT_COLOR_EN          character varying(90),
     PRODUCT_COLOR_DE          character varying(90),
     PRODUCT_COLOR_FR          character varying(90),
     PRODUCT_COLOR_JA          character varying(90),
     PRODUCT_COLOR_AR          character varying(90),
     PRODUCT_COLOR_CS          character varying(90),
     PRODUCT_COLOR_DA          character varying(90),
     PRODUCT_COLOR_EL          character varying(90),
     PRODUCT_COLOR_ES          character varying(90),
     PRODUCT_COLOR_FI          character varying(90),
     PRODUCT_COLOR_HR          character varying(90)     not null,
     PRODUCT_COLOR_HU          character varying(90),
     PRODUCT_COLOR_ID          character varying(90),
     PRODUCT_COLOR_IT          character varying(90),
     PRODUCT_COLOR_KK          character varying(90)     not null,
     PRODUCT_COLOR_KO          character varying(90),
     PRODUCT_COLOR_MS          character varying(90),
     PRODUCT_COLOR_NL          character varying(90),
     PRODUCT_COLOR_NO          character varying(90),
     PRODUCT_COLOR_PL          character varying(90),
     PRODUCT_COLOR_PT          character varying(90),
     PRODUCT_COLOR_RO          character varying(90),
     PRODUCT_COLOR_RU          character varying(90),
     PRODUCT_COLOR_SC          character varying(90),
     PRODUCT_COLOR_SL          character varying(90)     not null,
     PRODUCT_COLOR_SV          character varying(90),
     PRODUCT_COLOR_TC          character varying(90),
     PRODUCT_COLOR_TH          character varying(90),
     PRODUCT_COLOR_TR          character varying(90)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_COLOR_LOOKUP ADD PRIMARY KEY (PRODUCT_COLOR_CODE);



CREATE TABLE  SLS_PRODUCT_DIM
(
     PRODUCT_KEY               integer                   not null,
     PRODUCT_LINE_CODE         integer                   not null,
     PRODUCT_TYPE_KEY          integer                   not null,
     PRODUCT_TYPE_CODE         integer                   not null,
     PRODUCT_NUMBER            integer                   not null,
     BASE_PRODUCT_KEY          integer,
     BASE_PRODUCT_NUMBER       integer,
     PRODUCT_COLOR_CODE        integer,
     PRODUCT_SIZE_CODE         integer,
     PRODUCT_BRAND_KEY         integer,
     PRODUCT_BRAND_CODE        integer,
     PRODUCT_IMAGE             character varying(60),
     INTRODUCTION_DATE         timestamp                 not null,
     DISCONTINUED_DATE         timestamp
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_DIM ADD PRIMARY KEY (PRODUCT_KEY);



CREATE TABLE  SLS_PRODUCT_LINE_LOOKUP
(
     PRODUCT_LINE_CODE         integer                   not null,
     PRODUCT_LINE_EN           character varying(90)     not null,
     PRODUCT_LINE_DE           character varying(90),
     PRODUCT_LINE_FR           character varying(90),
     PRODUCT_LINE_JA           character varying(90),
     PRODUCT_LINE_AR           character varying(90),
     PRODUCT_LINE_CS           character varying(90),
     PRODUCT_LINE_DA           character varying(90),
     PRODUCT_LINE_EL           character varying(90),
     PRODUCT_LINE_ES           character varying(90),
     PRODUCT_LINE_FI           character varying(90),
     PRODUCT_LINE_HR           character varying(90)     not null,
     PRODUCT_LINE_HU           character varying(90),
     PRODUCT_LINE_ID           character varying(90),
     PRODUCT_LINE_IT           character varying(90),
     PRODUCT_LINE_KK           character varying(90)     not null,
     PRODUCT_LINE_KO           character varying(90),
     PRODUCT_LINE_MS           character varying(90),
     PRODUCT_LINE_NL           character varying(90),
     PRODUCT_LINE_NO           character varying(90),
     PRODUCT_LINE_PL           character varying(90),
     PRODUCT_LINE_PT           character varying(90),
     PRODUCT_LINE_RO           character varying(90),
     PRODUCT_LINE_RU           character varying(90),
     PRODUCT_LINE_SC           character varying(90),
     PRODUCT_LINE_SL           character varying(90)     not null,
     PRODUCT_LINE_SV           character varying(90),
     PRODUCT_LINE_TC           character varying(90),
     PRODUCT_LINE_TH           character varying(90),
     PRODUCT_LINE_TR           character varying(90)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_LINE_LOOKUP ADD PRIMARY KEY (PRODUCT_LINE_CODE);



CREATE TABLE  SLS_PRODUCT_LOOKUP
(
     PRODUCT_NUMBER            integer                   not null,
     PRODUCT_LANGUAGE          character varying(30)     not null,
     PRODUCT_NAME              character varying(150),
     PRODUCT_DESCRIPTION       character varying(765)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_LOOKUP ADD PRIMARY KEY (PRODUCT_NUMBER, PRODUCT_LANGUAGE);



CREATE TABLE  SLS_PRODUCT_SIZE_LOOKUP
(
     PRODUCT_SIZE_CODE         integer                   not null,
     PRODUCT_SIZE_EN           character varying(90),
     PRODUCT_SIZE_DE           character varying(90),
     PRODUCT_SIZE_FR           character varying(90),
     PRODUCT_SIZE_JA           character varying(90),
     PRODUCT_SIZE_AR           character varying(90),
     PRODUCT_SIZE_CS           character varying(90),
     PRODUCT_SIZE_DA           character varying(90),
     PRODUCT_SIZE_EL           character varying(90),
     PRODUCT_SIZE_ES           character varying(90),
     PRODUCT_SIZE_FI           character varying(90),
     PRODUCT_SIZE_HR           character varying(90)     not null,
     PRODUCT_SIZE_HU           character varying(90),
     PRODUCT_SIZE_ID           character varying(90),
     PRODUCT_SIZE_IT           character varying(90),
     PRODUCT_SIZE_KK           character varying(90)     not null,
     PRODUCT_SIZE_KO           character varying(90),
     PRODUCT_SIZE_MS           character varying(90),
     PRODUCT_SIZE_NL           character varying(90),
     PRODUCT_SIZE_NO           character varying(90),
     PRODUCT_SIZE_PL           character varying(90),
     PRODUCT_SIZE_PT           character varying(90),
     PRODUCT_SIZE_RO           character varying(90),
     PRODUCT_SIZE_RU           character varying(90),
     PRODUCT_SIZE_SC           character varying(90),
     PRODUCT_SIZE_SL           character varying(90)     not null,
     PRODUCT_SIZE_SV           character varying(90),
     PRODUCT_SIZE_TC           character varying(90),
     PRODUCT_SIZE_TH           character varying(90),
     PRODUCT_SIZE_TR           character varying(90)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_SIZE_LOOKUP ADD PRIMARY KEY (PRODUCT_SIZE_CODE);



CREATE TABLE  SLS_PRODUCT_TYPE_LOOKUP
(
     PRODUCT_TYPE_CODE         integer                   not null,
     PRODUCT_TYPE_EN           character varying(120)    not null,
     PRODUCT_TYPE_DE           character varying(120),
     PRODUCT_TYPE_FR           character varying(120),
     PRODUCT_TYPE_JA           character varying(120),
     PRODUCT_TYPE_AR           character varying(120),
     PRODUCT_TYPE_CS           character varying(120),
     PRODUCT_TYPE_DA           character varying(120),
     PRODUCT_TYPE_EL           character varying(120),
     PRODUCT_TYPE_ES           character varying(120),
     PRODUCT_TYPE_FI           character varying(120),
     PRODUCT_TYPE_HR           character varying(120)    not null,
     PRODUCT_TYPE_HU           character varying(120),
     PRODUCT_TYPE_ID           character varying(120),
     PRODUCT_TYPE_IT           character varying(120),
     PRODUCT_TYPE_KK           character varying(120)    not null,
     PRODUCT_TYPE_KO           character varying(120),
     PRODUCT_TYPE_MS           character varying(120),
     PRODUCT_TYPE_NL           character varying(120),
     PRODUCT_TYPE_NO           character varying(120),
     PRODUCT_TYPE_PL           character varying(120),
     PRODUCT_TYPE_PT           character varying(120),
     PRODUCT_TYPE_RO           character varying(120),
     PRODUCT_TYPE_RU           character varying(120),
     PRODUCT_TYPE_SC           character varying(120),
     PRODUCT_TYPE_SL           character varying(120)    not null,
     PRODUCT_TYPE_SV           character varying(120),
     PRODUCT_TYPE_TC           character varying(120),
     PRODUCT_TYPE_TH           character varying(120),
     PRODUCT_TYPE_TR           character varying(120)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_PRODUCT_TYPE_LOOKUP ADD PRIMARY KEY (PRODUCT_TYPE_CODE);



CREATE TABLE  SLS_RTL_DIM
(
     RETAILER_SITE_KEY         integer                   not null,
     RETAILER_SITE_CODE        integer                   not null,
     RETAILER_KEY              integer                   not null,
     RETAILER_CODE             integer                   not null,
     RETAILER_NAME             character varying(150)    not null,
     RETAILER_NAME_MB          character varying(150),
     RETAILER_CONTACT_CODE     integer                   not null,
     CONTACT_FIRST_NAME        character varying(75)     not null,
     CONTACT_LAST_NAME         character varying(90)     not null,
     GENDER_CODE               smallint                  not null,
     CONTACT_PHONE_NUMBER      character varying(60)     not null,
     CONTACT_EXTENSION         character varying(18),
     CONTACT_FAX               character varying(60),
     CONTACT_EMAIL             character varying(120),
     RTL_ADDRESS1              character varying(120)    not null,
     RTL_ADDRESS2              character varying(120),
     RTL_CITY                  character varying(90)     not null,
     RTL_PROV_STATE            character varying(90),
     CONTACT_FIRST_NAME_MB     character varying(75),
     CONTACT_LAST_NAME_MB      character varying(90),
     RTL_ADDRESS1_MB           character varying(120),
     RTL_ADDRESS2_MB           character varying(120),
     RTL_CITY_MB               character varying(90),
     RTL_PROV_STATE_MB         character varying(90),
     RTL_POSTAL_ZONE           character varying(30),
     RTL_COUNTRY_CODE          integer                   not null,
     RETAILER_START_DATE       timestamp,
     RETAILER_TYPE_CODE        integer                   not null,
     RETAILER_TYPE_EN          character varying(105)    not null,
     RETAILER_TYPE_DE          character varying(105),
     RETAILER_TYPE_FR          character varying(105),
     RETAILER_TYPE_JA          character varying(105),
     RETAILER_TYPE_AR          character varying(105),
     RETAILER_TYPE_CS          character varying(105),
     RETAILER_TYPE_DA          character varying(105),
     RETAILER_TYPE_EL          character varying(105),
     RETAILER_TYPE_ES          character varying(105),
     RETAILER_TYPE_FI          character varying(105),
     RETAILER_TYPE_HR          character varying(105)    not null,
     RETAILER_TYPE_HU          character varying(105),
     RETAILER_TYPE_ID          character varying(105),
     RETAILER_TYPE_IT          character varying(105),
     RETAILER_TYPE_KK          character varying(105)    not null,
     RETAILER_TYPE_KO          character varying(105),
     RETAILER_TYPE_MS          character varying(105),
     RETAILER_TYPE_NL          character varying(105),
     RETAILER_TYPE_NO          character varying(105),
     RETAILER_TYPE_PL          character varying(105),
     RETAILER_TYPE_PT          character varying(105),
     RETAILER_TYPE_RO          character varying(105),
     RETAILER_TYPE_RU          character varying(105),
     RETAILER_TYPE_SC          character varying(105),
     RETAILER_TYPE_SL          character varying(105)     not null,
     RETAILER_TYPE_SV          character varying(105),
     RETAILER_TYPE_TC          character varying(105),
     RETAILER_TYPE_TH          character varying(105),
     RETAILER_TYPE_TR          character varying(105),
     JOB_POSITION_EN           character varying(120)     not null,
     JOB_POSITION_DE           character varying(120)     not null,
     JOB_POSITION_FR           character varying(120)     not null,
     JOB_POSITION_JA           character varying(120)     not null,
     JOB_POSITION_AR           character varying(120),
     JOB_POSITION_CS           character varying(120)     not null,
     JOB_POSITION_DA           character varying(120)     not null,
     JOB_POSITION_EL           character varying(120)     not null,
     JOB_POSITION_ES           character varying(120)     not null,
     JOB_POSITION_FI           character varying(120)     not null,
     JOB_POSITION_HR           character varying(120)     not null,
     JOB_POSITION_HU           character varying(120)     not null,
     JOB_POSITION_ID           character varying(120),
     JOB_POSITION_IT           character varying(120)     not null,
     JOB_POSITION_KK           character varying(120)     not null,
     JOB_POSITION_KO           character varying(120)     not null,
     JOB_POSITION_MS           character varying(120),
     JOB_POSITION_NL           character varying(120)     not null,
     JOB_POSITION_NO           character varying(120)     not null,
     JOB_POSITION_PL           character varying(120)     not null,
     JOB_POSITION_PT           character varying(120)     not null,
     JOB_POSITION_RO           character varying(120),
     JOB_POSITION_RU           character varying(120)     not null,
     JOB_POSITION_SC           character varying(120)     not null,
     JOB_POSITION_SL           character varying(120)     not null,
     JOB_POSITION_SV           character varying(120)     not null,
     JOB_POSITION_TC           character varying(120)     not null,
     JOB_POSITION_TH           character varying(120)     not null,
     JOB_POSITION_TR           character varying(120),
     RTL_LAT                   character varying(36),
     RTL_LON                   character varying(36)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_RTL_DIM ADD PRIMARY KEY (RETAILER_SITE_KEY);



CREATE TABLE  SLS_SALES_FACT
(
     ORDER_DAY_KEY             integer                    not null,
     ORGANIZATION_KEY          integer                    not null,
     EMPLOYEE_KEY              integer                    not null,
     RETAILER_KEY              integer                    not null,
     RETAILER_SITE_KEY         integer                    not null,
     PRODUCT_KEY               integer                    not null,
     PROMOTION_KEY             integer                    not null,
     ORDER_METHOD_KEY          integer                    not null,
     SALES_ORDER_KEY           integer                    not null,
     SHIP_DAY_KEY              integer                    not null,
     CLOSE_DAY_KEY             integer                    not null,
     QUANTITY                  bigint                     not null,
     UNIT_COST                 numeric(19,2),
     UNIT_PRICE                numeric(19,2),
     UNIT_SALE_PRICE           numeric(19,2),
     GROSS_MARGIN              double precision           not null,
     SALE_TOTAL                numeric(19,2),
     GROSS_PROFIT              numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_SALES_FACT ADD PRIMARY KEY (ORDER_DAY_KEY, ORGANIZATION_KEY, EMPLOYEE_KEY, RETAILER_KEY, RETAILER_SITE_KEY, PRODUCT_KEY, PROMOTION_KEY, ORDER_METHOD_KEY);



CREATE TABLE  SLS_SALES_ORDER_DIM
(
     SALES_ORDER_KEY           integer                    not null,
     ORDER_DETAIL_CODE         integer                    not null,
     ORDER_NUMBER              integer                    not null,
     WAREHOUSE_BRANCH_CODE     integer
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_SALES_ORDER_DIM ADD PRIMARY KEY (SALES_ORDER_KEY);



CREATE TABLE  SLS_SALES_TARG_FACT
(
     MONTH_KEY                 integer                    not null,
     ORGANIZATION_KEY          integer                    not null,
     RTL_COUNTRY_KEY           integer                    not null,
     EMPLOYEE_KEY              integer                    not null,
     RETAILER_KEY              integer                    not null,
     PRODUCT_TYPE_KEY          integer                    not null,
     PRODUCT_BRAND_KEY         integer                    not null,
     SALES_TARGET              numeric(19,2)
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE SLS_SALES_TARG_FACT ADD PRIMARY KEY (MONTH_KEY, ORGANIZATION_KEY, RTL_COUNTRY_KEY, EMPLOYEE_KEY, RETAILER_KEY, PRODUCT_TYPE_KEY, PRODUCT_BRAND_KEY);



CREATE TABLE  XGOREVDW
(
     GOREV_ID                  integer                    not null,
     GO_OBJ_NAME               character varying(210)     not null,
     GO_OBJ_TYPE               character varying(150)     not null,
     GO_OBJ_PARENT_NAME        character varying(210)     not null,
     GO_OBJ_PARENT_TYPE        character varying(150)     not null,
     GO_DATA_OR_METADATA       character varying(150)     not null,
     GO_RELEASE                character varying(150),
     GO_DB_VERSION             character varying(30),
     GO_CHANGE_DATE            timestamp                  not null,
     GO_CHANGE_DESCRIPTION     character varying(3000)    not null
)
DISTRIBUTE ON RANDOM
;

ALTER TABLE XGOREVDW ADD PRIMARY KEY (GOREV_ID);


ALTER TABLE DIST_INVENTORY_FACT ADD Constraint DIST_INVENTORY_FACT_FK_1 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE DIST_INVENTORY_FACT ADD Constraint DIST_INVENTORY_FACT_FK_2 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE DIST_INVENTORY_FACT ADD Constraint DIST_INVENTORY_FACT_FK_3 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE DIST_PRODUCT_FORECAST_FACT ADD Constraint DIST_PRODUCT_FORECAST_FACT_FK_1 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE DIST_PRODUCT_FORECAST_FACT ADD Constraint DIST_PRODUCT_FORECAST_FACT_FK_2 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_8 FOREIGN KEY (RETURN_REASON_KEY) REFERENCES DIST_RETURN_REASON_DIM (RETURN_REASON_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_3 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_7 FOREIGN KEY (ORDER_METHOD_KEY) REFERENCES SLS_ORDER_METHOD_DIM (ORDER_METHOD_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_5 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_9 FOREIGN KEY (RETAILER_SITE_KEY) REFERENCES SLS_RTL_DIM (RETAILER_SITE_KEY) ;

ALTER TABLE DIST_RETURNED_ITEMS_FACT ADD Constraint DIST_RETURNED_ITEMS_FACT_FK_6 FOREIGN KEY (SALES_ORDER_KEY) REFERENCES SLS_SALES_ORDER_DIM (SALES_ORDER_KEY) ;

ALTER TABLE EMP_EMPLOYEE_DIM ADD Constraint EMP_EMPLOYEE_DIM_FK_1 FOREIGN KEY (POSITION_CODE) REFERENCES EMP_POSITION_LOOKUP (POSITION_CODE) ;

ALTER TABLE EMP_EMPLOYEE_DIM ADD Constraint EMP_EMPLOYEE_DIM_FK_2 FOREIGN KEY (TERMINATION_CODE) REFERENCES EMP_TERMINATION_LOOKUP (TERMINATION_CODE) ;

ALTER TABLE EMP_EMPLOYEE_DIM ADD Constraint EMP_EMPLOYEE_DIM_FK_3 FOREIGN KEY (GENDER_CODE) REFERENCES GO_GENDER_LOOKUP (GENDER_CODE) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_6 FOREIGN KEY (EXPENSE_TYPE_KEY) REFERENCES EMP_EXPENSE_TYPE_DIM (EXPENSE_TYPE_KEY) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_3 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_4 FOREIGN KEY (ACCOUNT_KEY) REFERENCES FIN_ACCOUNT_DIM (ACCOUNT_KEY) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_5 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_EXPENSE_FACT ADD Constraint EMP_EXPENSE_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_EXPENSE_PLAN_FACT ADD Constraint EMP_EXPENSE_PLAN_FACT_FK_2 FOREIGN KEY (EXPENSE_TYPE_KEY) REFERENCES EMP_EXPENSE_TYPE_DIM (EXPENSE_TYPE_KEY) ;

ALTER TABLE EMP_EXPENSE_PLAN_FACT ADD Constraint EMP_EXPENSE_PLAN_FACT_FK_1 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_EXPENSE_TYPE_DIM ADD Constraint EMP_EXPENSE_TYPE_DIM_FK_1 FOREIGN KEY (EXPENSE_UNIT_CODE) REFERENCES EMP_EXPENSE_UNIT_LOOKUP (EXPENSE_UNIT_CODE) ;

ALTER TABLE EMP_POSITION_DIM ADD Constraint EMP_POSITION_DIM_FK_1 FOREIGN KEY (POSITION_CODE) REFERENCES EMP_POSITION_LOOKUP (POSITION_CODE) ;

ALTER TABLE EMP_POSITION_SUMMARY_FACT ADD Constraint EMP_POSITION_SUMMARY_FACT_FK_2 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_POSITION_SUMMARY_FACT ADD Constraint EMP_POSITION_SUMMARY_FACT_FK_3 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_POSITION_SUMMARY_FACT ADD Constraint EMP_POSITION_SUMMARY_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_RANKING_FACT ADD Constraint EMP_RANKING_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE EMP_RANKING_FACT ADD Constraint EMP_RANKING_FACT_FK_3 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_RANKING_FACT ADD Constraint EMP_RANKING_FACT_FK_5 FOREIGN KEY (EMPLOYEE_RANKING_KEY) REFERENCES EMP_RANKING_DIM (EMPLOYEE_RANKING_KEY) ;

ALTER TABLE EMP_RANKING_FACT ADD Constraint EMP_RANKING_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_RANKING_FACT ADD Constraint EMP_RANKING_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_RECRUITMENT_FACT ADD Constraint EMP_RECRUITMENT_FACT_FK_2 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_RECRUITMENT_FACT ADD Constraint EMP_RECRUITMENT_FACT_FK_5 FOREIGN KEY (RECRUITMENT_MEDIUM_KEY) REFERENCES EMP_RECRUITMENT_DIM (RECRUITMENT_MEDIUM_KEY) ;

ALTER TABLE EMP_RECRUITMENT_FACT ADD Constraint EMP_RECRUITMENT_FACT_FK_3 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE EMP_RECRUITMENT_FACT ADD Constraint EMP_RECRUITMENT_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_RECRUITMENT_FACT ADD Constraint EMP_RECRUITMENT_FACT_FK_1 FOREIGN KEY (POST_DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD Constraint EMP_RECRUITMENT_LEAD_FACT_FK_2 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD Constraint EMP_RECRUITMENT_LEAD_FACT_FK_1 FOREIGN KEY (RECRUITMENT_MEDIUM_KEY) REFERENCES EMP_RECRUITMENT_DIM (RECRUITMENT_MEDIUM_KEY) ;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD Constraint EMP_RECRUITMENT_LEAD_FACT_FK_3 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD Constraint EMP_RECRUITMENT_LEAD_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_RECRUITMENT_LEAD_FACT ADD Constraint EMP_RECRUITMENT_LEAD_FACT_FK_5 FOREIGN KEY (POST_DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_SUCCESSION_FACT ADD Constraint EMP_SUCCESSION_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE EMP_SUCCESSION_FACT ADD Constraint EMP_SUCCESSION_FACT_FK_3 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_SUCCESSION_FACT ADD Constraint EMP_SUCCESSION_FACT_FK_5 FOREIGN KEY (SUCCESSOR_STATUS_KEY) REFERENCES EMP_SUCCESSION_STATUS_DIM (SUCCESSOR_STATUS_KEY) ;

ALTER TABLE EMP_SUCCESSION_FACT ADD Constraint EMP_SUCCESSION_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_SUCCESSION_FACT ADD Constraint EMP_SUCCESSION_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_SUMMARY_FACT ADD Constraint EMP_SUMMARY_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE EMP_SUMMARY_FACT ADD Constraint EMP_SUMMARY_FACT_FK_3 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_SUMMARY_FACT ADD Constraint EMP_SUMMARY_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_SUMMARY_FACT ADD Constraint EMP_SUMMARY_FACT_FK_1 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_SURVEY_FACT ADD Constraint EMP_SURVEY_FACT_FK_1 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_SURVEY_FACT ADD Constraint EMP_SURVEY_FACT_FK_3 FOREIGN KEY (EMPLOYEE_TOPIC_KEY) REFERENCES EMP_SURVEY_TOPIC_DIM (EMPLOYEE_TOPIC_KEY) ;

ALTER TABLE EMP_SURVEY_FACT ADD Constraint EMP_SURVEY_FACT_FK_2 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_SURVEY_FACT ADD Constraint EMP_SURVEY_FACT_FK_4 FOREIGN KEY (SATISFACTION_KEY) REFERENCES GO_SATISFACTION_DIM (SATISFACTION_KEY) ;

ALTER TABLE EMP_SURVEY_FACT ADD Constraint EMP_SURVEY_FACT_FK_5 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE EMP_SURVEY_TARG_FACT ADD Constraint EMP_SURVEY_TARG_FACT_FK_1 FOREIGN KEY (EMPLOYEE_TOPIC_KEY) REFERENCES EMP_SURVEY_TOPIC_DIM (EMPLOYEE_TOPIC_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_1 FOREIGN KEY (EXPENSE_TYPE_KEY) REFERENCES EMP_EXPENSE_TYPE_DIM (EXPENSE_TYPE_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_3 FOREIGN KEY (POSITION_KEY) REFERENCES EMP_POSITION_DIM (POSITION_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_5 FOREIGN KEY (TRAINING_KEY) REFERENCES EMP_TRAINING_DIM (TRAINING_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_4 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE EMP_TRAINING_FACT ADD Constraint EMP_TRAINING_FACT_FK_6 FOREIGN KEY (DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE FIN_ACCOUNT_DIM ADD Constraint FIN_ACCOUNT_DIM_FK_1 FOREIGN KEY (ACCOUNT_CLASS_CODE) REFERENCES FIN_ACCOUNT_CLASS_LOOKUP (ACCOUNT_CLASS_CODE) ;

ALTER TABLE FIN_ACCOUNT_DIM ADD Constraint FIN_ACCOUNT_DIM_FK_3 FOREIGN KEY (ACCOUNT_CODE) REFERENCES FIN_ACCOUNT_NAME_LOOKUP (ACCOUNT_CODE) ;

ALTER TABLE FIN_ACCOUNT_DIM ADD Constraint FIN_ACCOUNT_DIM_FK_2 FOREIGN KEY (ACCOUNT_TYPE_CODE) REFERENCES FIN_ACCOUNT_TYPE_LOOKUP (ACCOUNT_TYPE_CODE) ;

ALTER TABLE FIN_SUBM_DIM ADD Constraint FIN_SUBM_DIM_FK_1 FOREIGN KEY (SUBMISSION_CURRENCY_CODE) REFERENCES FIN_SUBM_CURRENCY_LOOKUP (SUBMISSION_CURRENCY_CODE) ;

ALTER TABLE FIN_SUBM_DIM ADD Constraint FIN_SUBM_DIM_FK_2 FOREIGN KEY (SUBMISSION_TYPE_CODE) REFERENCES FIN_SUBM_TYPE_LOOKUP (SUBMISSION_TYPE_CODE) ;

ALTER TABLE GO_ORG_DIM ADD Constraint GO_ORG_DIM_FK_1 FOREIGN KEY (ORGANIZATION_CODE) REFERENCES GO_ORG_NAME_LOOKUP (ORGANIZATION_CODE) ;

ALTER TABLE GO_TIME_DIM ADD Constraint GO_TIME_DIM_FK_1 FOREIGN KEY (QUARTER_KEY) REFERENCES GO_TIME_QUARTER_LOOKUP (QUARTER_KEY) ;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD Constraint MRK_PRODUCT_SURVEY_FACT_FK_2 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD Constraint MRK_PRODUCT_SURVEY_FACT_FK_3 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD Constraint MRK_PRODUCT_SURVEY_FACT_FK_5 FOREIGN KEY (RTL_COUNTRY_KEY) REFERENCES GO_REGION_DIM (COUNTRY_KEY) ;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD Constraint MRK_PRODUCT_SURVEY_FACT_FK_1 FOREIGN KEY (PRODUCT_SURVEY_KEY) REFERENCES MRK_PRODUCT_SURVEY_DIM (PRODUCT_SURVEY_KEY) ;

ALTER TABLE MRK_PRODUCT_SURVEY_FACT ADD Constraint MRK_PRODUCT_SURVEY_FACT_FK_4 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE MRK_PROD_SURVEY_TARG_FACT ADD Constraint MRK_PROD_SURVEY_TARG_FACT_FK_1 FOREIGN KEY (PRODUCT_SURVEY_KEY) REFERENCES MRK_PRODUCT_SURVEY_DIM (PRODUCT_SURVEY_KEY) ;

ALTER TABLE MRK_PROD_SURVEY_TARG_FACT ADD Constraint MRK_PROD_SURVEY_TARG_FACT_FK_2 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE MRK_PROMOTION_DIM ADD Constraint MRK_PROMOTION_DIM_FK_1 FOREIGN KEY (BUNDLE_GROUP_CODE) REFERENCES MRK_BUNDLE_GROUP_LOOKUP (BUNDLE_GROUP_CODE) ;

ALTER TABLE MRK_PROMOTION_DIM ADD Constraint MRK_PROMOTION_DIM_FK_2 FOREIGN KEY (CAMPAIGN_CODE) REFERENCES MRK_CAMPAIGN_LOOKUP (CAMPAIGN_CODE) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_2 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_3 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_6 FOREIGN KEY (RTL_COUNTRY_KEY) REFERENCES GO_REGION_DIM (COUNTRY_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_7 FOREIGN KEY (ORDER_DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_1 FOREIGN KEY (PROMOTION_KEY) REFERENCES MRK_PROMOTION_DIM (PROMOTION_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_4 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE MRK_PROMOTION_FACT ADD Constraint MRK_PROMOTION_FACT_FK_5 FOREIGN KEY (SALES_ORDER_KEY) REFERENCES SLS_SALES_ORDER_DIM (SALES_ORDER_KEY) ;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD Constraint MRK_PROMOTION_PLAN_FACT_FK_2 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD Constraint MRK_PROMOTION_PLAN_FACT_FK_3 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD Constraint MRK_PROMOTION_PLAN_FACT_FK_5 FOREIGN KEY (RTL_COUNTRY_KEY) REFERENCES GO_REGION_DIM (COUNTRY_KEY) ;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD Constraint MRK_PROMOTION_PLAN_FACT_FK_1 FOREIGN KEY (PROMOTION_KEY) REFERENCES MRK_PROMOTION_DIM (PROMOTION_KEY) ;

ALTER TABLE MRK_PROMOTION_PLAN_FACT ADD Constraint MRK_PROMOTION_PLAN_FACT_FK_4 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE MRK_RTL_SURVEY_FACT ADD Constraint MRK_RTL_SURVEY_FACT_FK_2 FOREIGN KEY (BRANCH_KEY) REFERENCES GO_BRANCH_DIM (BRANCH_KEY) ;

ALTER TABLE MRK_RTL_SURVEY_FACT ADD Constraint MRK_RTL_SURVEY_FACT_FK_3 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE MRK_RTL_SURVEY_FACT ADD Constraint MRK_RTL_SURVEY_FACT_FK_4 FOREIGN KEY (RTL_COUNTRY_KEY) REFERENCES GO_REGION_DIM (COUNTRY_KEY) ;

ALTER TABLE MRK_RTL_SURVEY_FACT ADD Constraint MRK_RTL_SURVEY_FACT_FK_1 FOREIGN KEY (RETAILER_SURVEY_KEY) REFERENCES MRK_RTL_SURVEY_DIM (RETAILER_SURVEY_KEY) ;

ALTER TABLE MRK_RTL_SURVEY_TARG_FACT ADD Constraint MRK_RTL_SURVEY_TARG_FACT_FK_1 FOREIGN KEY (RETAILER_SURVEY_KEY) REFERENCES MRK_RTL_SURVEY_DIM (RETAILER_SURVEY_KEY) ;

ALTER TABLE SLS_PRODUCT_DIM ADD Constraint SLS_PRODUCT_DIM_FK_1 FOREIGN KEY (PRODUCT_BRAND_CODE) REFERENCES SLS_PRODUCT_BRAND_LOOKUP (PRODUCT_BRAND_CODE) ;

ALTER TABLE SLS_PRODUCT_DIM ADD Constraint SLS_PRODUCT_DIM_FK_2 FOREIGN KEY (PRODUCT_COLOR_CODE) REFERENCES SLS_PRODUCT_COLOR_LOOKUP (PRODUCT_COLOR_CODE) ;

ALTER TABLE SLS_PRODUCT_DIM ADD Constraint SLS_PRODUCT_DIM_FK_3 FOREIGN KEY (PRODUCT_LINE_CODE) REFERENCES SLS_PRODUCT_LINE_LOOKUP (PRODUCT_LINE_CODE) ;

ALTER TABLE SLS_PRODUCT_DIM ADD Constraint SLS_PRODUCT_DIM_FK_4 FOREIGN KEY (PRODUCT_SIZE_CODE) REFERENCES SLS_PRODUCT_SIZE_LOOKUP (PRODUCT_SIZE_CODE) ;

ALTER TABLE SLS_PRODUCT_DIM ADD Constraint SLS_PRODUCT_DIM_FK_5 FOREIGN KEY (PRODUCT_TYPE_CODE) REFERENCES SLS_PRODUCT_TYPE_LOOKUP (PRODUCT_TYPE_CODE) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_4 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_5 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_8 FOREIGN KEY (ORDER_DAY_KEY) REFERENCES GO_TIME_DIM (DAY_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_1 FOREIGN KEY (PROMOTION_KEY) REFERENCES MRK_PROMOTION_DIM (PROMOTION_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_2 FOREIGN KEY (ORDER_METHOD_KEY) REFERENCES SLS_ORDER_METHOD_DIM (ORDER_METHOD_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_6 FOREIGN KEY (PRODUCT_KEY) REFERENCES SLS_PRODUCT_DIM (PRODUCT_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_3 FOREIGN KEY (RETAILER_SITE_KEY) REFERENCES SLS_RTL_DIM (RETAILER_SITE_KEY) ;

ALTER TABLE SLS_SALES_FACT ADD Constraint SLS_SALES_FACT_FK_7 FOREIGN KEY (SALES_ORDER_KEY) REFERENCES SLS_SALES_ORDER_DIM (SALES_ORDER_KEY) ;

ALTER TABLE SLS_SALES_TARG_FACT ADD Constraint SLS_SALES_TARG_FACT_FK_1 FOREIGN KEY (EMPLOYEE_KEY) REFERENCES EMP_EMPLOYEE_DIM (EMPLOYEE_KEY) ;

ALTER TABLE SLS_SALES_TARG_FACT ADD Constraint SLS_SALES_TARG_FACT_FK_2 FOREIGN KEY (ORGANIZATION_KEY) REFERENCES GO_ORG_DIM (ORGANIZATION_KEY) ;

ALTER TABLE SLS_SALES_TARG_FACT ADD Constraint SLS_SALES_TARG_FACT_FK_3 FOREIGN KEY (RTL_COUNTRY_KEY) REFERENCES GO_REGION_DIM (COUNTRY_KEY) ;
