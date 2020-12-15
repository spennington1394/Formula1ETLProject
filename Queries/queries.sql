select * from "Race"

select "year", "name"
from "Race"
where "year" = 2009;

select "year", "name"
from "Race"
where "year" = 1960

select "Race"."name", "Race"."year",
"ConstructorResults"."raceId", "ConstructorResults"."points",
"Constructor"."constructorId",
"Constructor"."name", "ConstructorResults"."constructorId"
from "Race"
join "ConstructorResults"
on "Race"."raceId" = "ConstructorResults"."raceId"
left join "Constructor"
on "ConstructorResults"."constructorId" = "Constructor"."constructorId"
where "Race"."year" = 1995