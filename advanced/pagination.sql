CREATE OR REPLACE PROCEDURE get_paginated_users(PageNumber integer, PageSize integer)
LANGUAGE plpgsql
AS $$
BEGIN
    DROP TABLE IF EXISTS tmp_table;
    CREATE TEMPORARY TABLE tmp_table AS
    SELECT *
    FROM users u
    WHERE u."IsDeleted" = false OR u."IsDeleted" = true
    LIMIT PageSize OFFSET (PageNumber - 1) * PageSize;

    RAISE NOTICE 'Data in tmp_table: %', (SELECT COUNT(*) FROM tmp_table);
END $$;

CALL get_paginated_users(2, 5);

SELECT * FROM tmp_table;

/*
Formula:
LIMIT PageSize OFFSET (PageNumber - 1) * PageSize

Explanation:
- LIMIT determines the maximum number of rows to return (PageSize).
- OFFSET skips the specified number of rows based on the formula (PageNumber - 1) * PageSize.
In this example:
- PageNumber = 2
- PageSize = 5
OFFSET = (2 - 1) * 5 = 5
The query fetches 5 rows starting from the 6th row.
*/
