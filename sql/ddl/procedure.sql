CREATE or replace PROCEDURE  DROP_ALL_TABLES_FOR_SCHEMA(CHARACTER VARYING(128))
    RETURNS INTEGER
    LANGUAGE NZPLSQL
    EXECUTE AS CALLER
AS BEGIN_PROC

DECLARE
    tables RECORD;
    my_sql VARCHAR;
    schema_input alias for $1;
BEGIN

    FOR tables IN
    SELECT SCHEMA, TABLENAME FROM _V_TABLE WHERE OBJTYPE = 'TABLE' AND upper(SCHEMA) = schema_input ORDER BY 1
    LOOP

        raise notice 'Drop table : %.%', tables.schema, tables.tablename;

        my_sql := 'DROP TABLE "' || tables.schema || '"."' || tables.tablename || '";' ;

        execute immediate my_sql;

    END LOOP;

end;
END_PROC;


CREATE or replace PROCEDURE  DROP_ALL_VIEWS_FOR_SCHEMA(CHARACTER VARYING(128))
    RETURNS INTEGER
    LANGUAGE NZPLSQL
    EXECUTE AS CALLER
AS BEGIN_PROC

DECLARE
    views RECORD;
    my_sql VARCHAR;
    schema_input alias for $1;
BEGIN

    FOR views IN
    SELECT SCHEMA, VIEWNAME FROM _V_VIEW WHERE OBJTYPE = 'VIEW' AND upper(SCHEMA) = schema_input ORDER BY 1
    LOOP

        raise notice 'Drop view : %.%', views.schema, views.viewname;

        my_sql := 'DROP VIEW "' || views.schema || '"."' || views.viewname || '";' ;

        execute immediate my_sql;

    END LOOP;

end;
END_PROC;


CREATE or replace PROCEDURE  TRUNCATE_ALL_TABLES_FOR_SCHEMA(CHARACTER VARYING(128))
    RETURNS INTEGER
    LANGUAGE NZPLSQL
    EXECUTE AS CALLER
AS BEGIN_PROC

DECLARE
    tables RECORD;
    my_sql VARCHAR;
    schema_input alias for $1;
BEGIN


    FOR tables IN
    SELECT SCHEMA, TABLENAME FROM _V_TABLE WHERE OBJTYPE = 'TABLE' AND upper(SCHEMA) = schema_input ORDER BY 1
    LOOP

        raise notice 'Truncate table : %.%', tables.schema, tables.tablename;

        my_sql := 'TRUNCATE TABLE "' || tables.schema || '"."' || tables.tablename || '";' ;

        execute immediate my_sql;

    END LOOP;

end;
END_PROC;
