SELECT
    c.city_name AS "Top 5 destinos mais buscados",
    COUNT(b.ticket_success)
FROM ft_booking b
         JOIN dm_routes r ON b.fk_route = r.sk_route
         JOIN dm_places p ON p.sk_place = r.fk_place_destination
         JOIN dm_city c ON c.sk_city = p.fk_city
WHERE r.place_origin_name LIKE '%Sao Paulo%'
    AND MONTH(b.date_boarding) = MONTH(CURRENT_DATE) -1
    AND YEAR(b.date_boarding) = YEAR(CURRENT_DATE)
GROUP BY c.city_name
ORDER BY COUNT(b.ticket_success) DESC
LIMIT 5