COMMENT ON TABLE     AGGR_TIME_PROD_OM_FACT  IS 'Warehouse table AGGR_TIME_PROD_OM_FACT contains aggregated sales fact data.';
COMMENT ON TABLE     BURST_TABLE  IS 'Warehouse table BURST_TABLE.';
COMMENT ON TABLE     BURST_TABLE2  IS 'Warehouse table BURST_TABLE2.';
COMMENT ON TABLE     DIST_INVENTORY_FACT  IS 'Warehouse table DIST_INVENTORY_FACT contains inventory data for sales made between sales operations and retailers.';
COMMENT ON TABLE     DIST_PRODUCT_FORECAST_FACT  IS 'Warehouse table DIST_PRODUCT_FORECAST_FACT contains product volume forecasts at the sales branch level.';
COMMENT ON TABLE     DIST_RETURNED_ITEMS_FACT  IS 'Warehouse table DIST_RETURNED_ITEMS_FACT contains details of products returned by retailers.';
COMMENT ON TABLE     DIST_RETURN_REASON_DIM  IS 'Warehouse table DIST_RETURN_REASON_DIM describes return reasons for products returned by retailers, in supported languages.';
COMMENT ON TABLE     EMP_EMPLOYEE_DIM  IS 'Warehouse table EMP_EMPLOYEE_DIM contains the employee hierarchy and job history of those working for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_EXPENSE_FACT  IS 'Warehouse table EMP_EXPENSE_FACT contains expense details of employees working for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_EXPENSE_PLAN_FACT  IS 'Warehouse table EMP_EXPENSE_PLAN_FACT contains expense budget data for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_EXPENSE_TYPE_DIM  IS 'Warehouse table EMP_EXPENSE_TYPE_DIM describes subcategories for expenses incurred by the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_EXPENSE_UNIT_LOOKUP  IS 'Warehouse table EMP_EXPENSE_UNIT_LOOKUP describes an expense as a quantity or percentage for expenses incurred by the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_POSITION_DIM  IS 'Warehouse table EMP_POSITION_DIM contains a department structure, and associated job positions for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_POSITION_LOOKUP  IS 'Warehouse table EMP_POSITION_LOOKUP describes job titles and department names for employees in the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_POSITION_SUMMARY_FACT  IS 'Warehouse table EMP_POSITION_SUMMARY_FACT contains headcount data for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_RANKING_DIM  IS 'Warehouse table EMP_RANKING_DIM describes performance grades of employees who work for the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_RANKING_FACT  IS 'Warehouse table EMP_RANKING_FACT contains the ranking scores of employees who work for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_RECRUITMENT_DIM  IS 'Warehouse table EMP_RECRUITMENT_DIM describes the employment source of employees working for the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_RECRUITMENT_FACT  IS 'Warehouse table EMP_RECRUITMENT_FACT contains hiring data for jobs filled by employees of the Great Outdoors Company.';
COMMENT ON TABLE     EMP_RECRUITMENT_LEAD_FACT  IS 'Warehouse table EMP_RECRUITMENT_LEAD_FACT';
COMMENT ON TABLE     EMP_SUCCESSION_FACT  IS 'Warehouse table EMP_SUCCESSION_FACT contains the readiness status of employees to move into new management roles in the Great Outdoors Company.';
COMMENT ON TABLE     EMP_SUCCESSION_STATUS_DIM  IS 'Warehouse table EMP_SUCCESSION_STATUS_DIM describes the readiness status of employees moving to new management postions in the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_SUMMARY_FACT  IS 'Warehouse table EMP_SUMMARY_FACT contains summaries of defined benefits for those working for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_SURVEY_FACT  IS 'Warehouse table EMP_SURVEY_FACT contains job satisfaction data of those working for the Great Outdoors Company.';
COMMENT ON TABLE     EMP_SURVEY_TARG_FACT  IS 'Warehouse table EMP_SURVEY_TARG_FACT contains job satisfaction target scores for employees of the Great Outdoors Company.';
COMMENT ON TABLE     EMP_SURVEY_TOPIC_DIM  IS 'Warehouse table EMP_SURVEY_TOPIC_DIM describes employee survey questions for employees of the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_TERMINATION_LOOKUP  IS 'Warehouse table EMP_TERMINATION_LOOKUP describes the termination reason or current status of employees that work for the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_TRAINING_DIM  IS 'Warehouse table EMP_TRAINING_DIM describes the training courses offered to employees of the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     EMP_TRAINING_FACT  IS 'Warehouse table EMP_TRAINING_FACT contains the training data of employees that work for the Great Outdoors Company.';
COMMENT ON TABLE     FIN_ACCOUNT_CLASS_LOOKUP  IS 'Warehouse table FIN_ACCOUNT_CLASS_LOOKUP describes the type or usage of a financial account, in supported languages.';
COMMENT ON TABLE     FIN_ACCOUNT_DIM  IS 'Warehouse table FIN_ACCOUNT_DIM contains the financial account hierarchy for the Great Outdoors Company.';
COMMENT ON TABLE     FIN_ACCOUNT_NAME_LOOKUP  IS 'Warehouse table FIN_ACCOUNT_NAME_LOOKUP describes the financial account names relating to the account dimension, in supported languages.';
COMMENT ON TABLE     FIN_ACCOUNT_TYPE_LOOKUP  IS 'Warehouse table FIN_ACCOUNT_TYPE_LOOKUP describes the behaviour of financial accounts when aggregated, in supported languages.';
COMMENT ON TABLE     FIN_FINANCE_FACT  IS 'Warehouse table FIN_FINANCE_FACT contains the debit or credit amounts of the financial accounts for the Great Outdoors Company.';
COMMENT ON TABLE     FIN_SUBM_CURRENCY_LOOKUP  IS 'Warehouse table FIN_SUBM_CURRENCY_LOOKUP describes the reporting currency relating to the submission dimension, in supported languages.';
COMMENT ON TABLE     FIN_SUBM_DIM  IS 'Warehouse table FIN_SUBM_DIM describes the year and names of each set of financial accounts for the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     FIN_SUBM_TYPE_LOOKUP  IS 'Warehouse table FIN_SUBM_TYPE_LOOKUP describes the reporting scenario of the financial statements for the Great Outdoors Company, in supported languages.';
COMMENT ON TABLE     GO_BRANCH_DIM  IS 'Warehouse table GO_BRANCH_DIM contains address information for corporate offices and distribution centers.';
COMMENT ON TABLE     GO_GENDER_LOOKUP  IS 'Warehouse table GO_GENDER_LOOKUP describes gender, in supported languages.';
COMMENT ON TABLE     GO_ORG_DIM  IS 'Warehouse table GO_ORG_DIM contains the organization hiearchy of the Great Outdoors Company.';
COMMENT ON TABLE     GO_ORG_NAME_LOOKUP  IS 'Warehouse table GO_ORG_NAME_LOOKUP describes organization names in supported languages.';
COMMENT ON TABLE     GO_REGION_DIM  IS 'Warehouse table GO_REGION_DIM describes the region names and countries as sales territories, in supported languages.';
COMMENT ON TABLE     GO_SATISFACTION_DIM  IS 'Warehouse table GO_SATISFACTION_DIM describes a satisfaction level for each survey topic in EMPLOYEE_SURVEY_RESULTS, in supported languages.';
COMMENT ON TABLE     GO_TIME_DIM  IS 'Warehouse table GO_TIME_DIM contains a four-year range of date lookup values.';
COMMENT ON TABLE     GO_TIME_QUARTER_LOOKUP  IS 'Warehouse table GO_TIME_QUARTER_LOOKUP describes quarterly periods used by the the Great Outdoors Company when making sales and financial reports, in supported languages.';
COMMENT ON TABLE     MRK_ACTIVITY_STATUS_DIM  IS 'Warehouse table MRK_ACTIVITY_STATUS_DIM describes if a retailer is active or not, in supported languages.';
COMMENT ON TABLE     MRK_ADV_FACT  IS 'Warehouse table MRK_ADV_FACT.';
COMMENT ON TABLE     MRK_BUNDLE_GROUP_LOOKUP  IS 'Warehouse table MRK_BUNDLE_GROUP_LOOKUP describes bundle names of products packaged together as a sales promotion, in supported languages.';
COMMENT ON TABLE     MRK_CAMPAIGN_LOOKUP  IS 'Warehouse table MRK_CAMPAIGN_LOOKUP describes categories of sales promotions, in supported languages.';
COMMENT ON TABLE     MRK_PRODUCT_SURVEY_DIM  IS 'Warehouse table MRK_PRODUCT_SURVEY_DIM describes the product survey questions in supported languages.';
COMMENT ON TABLE     MRK_PRODUCT_SURVEY_FACT  IS 'Warehouse table MRK_PRODUCT_SURVEY_FACT contains consumer satisfaction data for products sold by the Great Outdoors Company.';
COMMENT ON TABLE     MRK_PROD_SURVEY_TARG_FACT  IS 'Warehouse table MRK_PROD_SURVEY_TARG_FACT contains consumer satisfaction target scores for products sold by the Great Outdoors Company.';
COMMENT ON TABLE     MRK_PROMOTION_DIM  IS 'Warehouse table MRK_PROMOTION_DIM describes sales campaign and promotion names in supported languages.';
COMMENT ON TABLE     MRK_PROMOTION_FACT  IS 'Warehouse table MRK_PROMOTION_FACT contains results of sales promotions done by the Great Outdoors Company.';
COMMENT ON TABLE     MRK_PROMOTION_PLAN_FACT  IS 'Warehouse table MRK_PROMOTION_PLAN_FACT contains planning data used in sales promotions.';
COMMENT ON TABLE     MRK_RTL_SURVEY_DIM  IS 'Warehouse table MRK_RTL_SURVEY_DIM describes the retailer survey questions in supported languages.';
COMMENT ON TABLE     MRK_RTL_SURVEY_FACT  IS 'Warehouse table MRK_RTL_SURVEY_FACT contains retailer satisfaction data of companies that buy product from the Great Outdoors Company.';
COMMENT ON TABLE     MRK_RTL_SURVEY_TARG_FACT  IS 'Warehouse table MRK_RTL_SURVEY_TARG_FACT contains retailer satisfaction target scores for the Great Outdoors Company.';
COMMENT ON TABLE     SLS_ORDER_METHOD_DIM  IS 'Warehouse table SLS_ORDER_METHOD_DIM describes order methods such as fax or web, in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_BRAND_LOOKUP  IS 'Warehouse table SLS_PRODUCT_BRAND_LOOKUP describes the product brand names in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_COLOR_LOOKUP  IS 'Warehouse table SLS_PRODUCT_COLOR_LOOKUP describes the product colors in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_DIM  IS 'Warehouse table SLS_PRODUCT_DIM contains the product hiearchy of line, type, and product, and an alternate hierarchy of product brand and product.';
COMMENT ON TABLE     SLS_PRODUCT_LINE_LOOKUP  IS 'Warehouse table SLS_PRODUCT_LINE_LOOKUP describes general product categories in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_LOOKUP  IS 'Warehouse table SLS_PRODUCT_LOOKUP describribes product names and descriptions in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_SIZE_LOOKUP  IS 'Warehouse table SLS_PRODUCT_SIZE_LOOKUP describes product sizes in supported languages.';
COMMENT ON TABLE     SLS_PRODUCT_TYPE_LOOKUP  IS 'Warehouse table SLS_PRODUCT_TYPE_LOOKUP describes subcategories under product line, in supported languages.';
COMMENT ON TABLE     SLS_RTL_DIM  IS 'Warehouse table SLS_RTL_DIM describes the retailer hierarchy, including the names and addresses of companies that purchase wholesale from the Great Outdoors Company.';
COMMENT ON TABLE     SLS_SALES_FACT  IS 'Warehouse table SLS_SALES_FACT contains transaction and order information on sales made to retailers that buy wholesale from the Great Outdoors Company.';
COMMENT ON TABLE     SLS_SALES_ORDER_DIM  IS 'Warehouse table SLS_SALES_ORDER_DIM contains dimension-type order information correlating to sales fact data.';
COMMENT ON TABLE     SLS_SALES_TARG_FACT  IS 'Warehouse table SLS_SALES_TARG_FACT contains sales targets for employees of the Great Outdoors Company who sell to retailers.';
COMMENT ON TABLE     XGOREVDW  IS 'Warehouse table xgorevdw contains release and revision information on the tables and data belonging to the gosalesdw schema.';
