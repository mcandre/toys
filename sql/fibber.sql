-- Example:
--
-- psql -f fibber.sql
--
-- psql
-- # SELECT psqlfib(10);
--  psqlfib 
-- ---------
--       55
-- (1 row)

CREATE OR REPLACE FUNCTION
psqlfib(n int) RETURNS int AS $$
  BEGIN
  IF n < 2 THEN
    RETURN n;
    END IF;
    RETURN psqlfib(n-1) + psqlfib(n-2);
  END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
