SELECT r.sk_route,
       r.route_title AS "Rota",
       COUNT(b.ticket_success) "Tickets rota"
FROM ft_booking b JOIN dm_routes r ON b.fk_route = r.sk_route
WHERE r.sk_route IN (10739,47,10779,12066,1141,2,12037,2168,79705,1178,10741,52,4,890,588571,790,122464,10740,18648,193833,82,
                     585424,11040,12039,1182,607310,6395,79709,669,79751,72681,758,2202,61217,2170,1142,2205,10742,175417,
                     236,12040,1144,6428,1150,3292,10,75717,18688,3294,24,79715)
    AND MONTH(b.date_boarding) = MONTH(CURRENT_DATE) -1 AND YEAR(b.date_boarding) = YEAR(CURRENT_DATE)
GROUP BY  r.place_origin_name, r.place_destination_name, r.route_title, r.sk_route, MONTH(b.date_boarding)
