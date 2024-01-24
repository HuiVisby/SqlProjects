SELECT *
FROM [PortfolioProject].[dbo].[CovidDeaths]
ORDER BY 3,4


SELECT [location], [date],total_cases, new_cases, total_deaths,population
FROM [PortfolioProject].[dbo].[CovidDeaths]
ORDER BY 1,2

--Looking at Total cases vs Total Deaths
SELECT [location], [date],total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM [PortfolioProject].[dbo].[CovidDeaths]
WHERE [location] like '%states%'
ORDER BY 1,2

--Looking at Total cases vs Total population
--Shows what percentage of population get covid
SELECT [location], [date],total_cases, population, (total_cases/population)*100 as DeathPercentage
FROM [PortfolioProject].[dbo].[CovidDeaths]
WHERE [location] like '%sweden%'
ORDER BY 1,2

SELECT [location],population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population)*100)as PercentePopulatinInfected
FROM [PortfolioProject].[dbo].[CovidDeaths]
GROUP by [location],population
ORDER BY PercentePopulatinInfected DESC

SELECT [location], MAX(CAST(total_deaths AS int)) as TotalDeathCount
FROM [PortfolioProject].[dbo].[CovidDeaths]
WHERE [continent] is not NULL
GROUP by [location]
ORDER BY TotalDeathCount DESC

SELECT [location], MAX(CAST(total_deaths AS int)) as TotalDeathCount
FROM [PortfolioProject].[dbo].[CovidDeaths]
WHERE [continent] is NULL
GROUP by [location]
ORDER BY TotalDeathCount DESC

 



