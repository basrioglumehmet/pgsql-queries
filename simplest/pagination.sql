SELECT * 
FROM users u 
ORDER BY u."Id" DESC
LIMIT 5 OFFSET 0; 
/*
Formula:
LIMIT page size
OFFSET (currentPage - 1) * page size

Explanation:
Limits the result set to 5 records per page and calculates the offset based on the current page.
In this example:
- Page size = 5
- Current page = 1
So, OFFSET = (1 - 1) * 5 = 0
*/
