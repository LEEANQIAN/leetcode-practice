# 175. Combine Two Tables (EASY)
SELECT FirstName, LastName, City, State FROM
Person LEFT JOIN Address ON Person.PersonID = Address.PersonID