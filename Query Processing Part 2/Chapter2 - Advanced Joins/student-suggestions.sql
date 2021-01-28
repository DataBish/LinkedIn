-----------------------------------------------------
-- Please copy and fill the following information: --
-----------------------------------------------------
/*
Name: Daniel Bish
Video:Self and inequality joins
Time: 2021-01-28
My suggestion:
Change the last filter for name and species into one concatinated column. It will only save some typing and will only work if the columns are the same datatype.
If anyone sees a way that this fails, please jump in. 
And thank you Ami, Advanced SQL: Logical Query Processing, Part 1 & Part 2 are really great courses. The industry needs more of this. 
*/

-- Query:
SELECT A1.Adopter_Email
	,A1.Adoption_Date
	,A1.Name AS Name1
	,A1.Species AS Species1
	,A2.Name AS Name2
	,A2.Species AS Species2
FROM Adoptions AS A1
INNER JOIN Adoptions AS A2
	ON A1.Adopter_Email=A2.Adopter_Email
		AND A1.Adoption_Date=A2.Adoption_Date
--------Replace this >>>
		--AND (	(A1.Name = A2.Name AND A1.Species > A2.Species)
		--		OR
		--		(A1.Name > A2.Name AND A1.Species = A2.Species)
		--		OR
		--		(A1.Name > A2.Name AND A1.Species <> A2.Species))
--------With this >>>
		AND A1.Name+A1.Species > A2.Name+A2.Species
ORDER BY A1.Adopter_Email,A1.Adoption_Date;



