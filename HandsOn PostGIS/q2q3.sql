--Q2: Points inside a polygon (schools inside a neighborhood)
SELECT e.gid, e.nome, b.bairro
FROM escolasnatal e
JOIN bairrosnatal b ON ST_Intersects(e.geom,b.geom)
WHERE b.bairro = 'Cidade Alta'

--Q3: Density points per area unit inside a polygon (schools/km�)
SELECT count(e.*)*1000000/ST_Area(b.geom)
FROM escolasnatal e
JOIN bairrosnatal b ON ST_Intersects(e.geom, b.geom)
WHERE b.bairro = 'Cidade Alta'
GROUP BY b.geom