
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS INT)) AS total_deaths, ROUND(SUM(CAST(new_deaths AS INT))/SUM(New_Cases)*100,6) AS DeathPercentage
FROM CovidDataProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

SELECT location, SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
From CovidDataProject..CovidDeaths
WHERE continent IS NULL 
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC

SELECT location, population, MAX(total_cases) AS HighestInfectionCount,  ROUND(MAX((total_cases/population))*100,6) AS PercentPopulationInfected
FROM CovidDataProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

SELECT location, population,date, MAX(total_cases) AS HighestInfectionCount,  ROUND(MAX((total_cases/population))*100,6) AS PercentPopulationInfected
FROM CovidDataProject..CovidDeaths
GROUP BY location, population, date
ORDER BY PercentPopulationInfected DESC
