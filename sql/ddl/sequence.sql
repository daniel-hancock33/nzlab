CREATE SEQUENCE sequence1 as integer
START WITH 1 increment by 1
minvalue 1 maxvalue 100 no cycle
;
CREATE SEQUENCE sequence2 as integer
START WITH 11 increment by 2
minvalue 1 maxvalue 100 cycle
;
CREATE SEQUENCE sequence3 as integer
START WITH 93 increment by -10
minvalue 1 maxvalue 100 cycle
;
