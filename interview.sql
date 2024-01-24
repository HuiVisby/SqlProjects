-- Exchange seats
CREATE TABLE [PortfolioProject].[dbo].[Seat]
(
"id" INT,
name VARCHAR(50)
);

INSERT  INTO [PortfolioProject].[dbo].[Seat]
VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'James')
;
SELECT
s1.id,
(CASE 
WHEN s1.id%2 = 0 THEN s3.name
WHEN s1.id%2 = 1 THEN ISNULL(s2.name, s1.name)
END
) AS student
FROM [PortfolioProject].[dbo].[Seat] AS s1
  LEFT JOIN [PortfolioProject].[dbo].[Seat] AS s2 ON s2.id - s1.id = 1
  LEFT JOIN [PortfolioProject].[dbo].[Seat] AS s3 ON s1.id - s3.id = 1
;

SELECT 
s1.id,
(
CASE
WHEN s1.id%2 = 0 THEN s3.name
WHEN s1.id%2 = 1 THEN ISNULL(s2.name, s1.name)
END
) AS Student
FROM [PortfolioProject].[dbo].[Seat] AS s1
LEFT JOIN [PortfolioProject].[dbo].[Seat] AS s2 ON s2.id - s1.id = 1 -- find next id
LEFT JOIN [PortfolioProject].[dbo].[Seat] AS s3 ON s1.id - s3.id = 1 -- find previous id

