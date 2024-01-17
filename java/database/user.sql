-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER halls_creek_app_user
WITH PASSWORD 'halls_creek_app_user';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO halls_creek_app_user;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO halls_creek_app_user;

