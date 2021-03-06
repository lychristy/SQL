SELECT person1,
       person2,
       count(*) AS call_count,
       sum(duration) AS total_duration
FROM
  (SELECT CASE WHEN from_id < to_id THEN from_id ELSE to_id END AS person1,
          CASE WHEN from_id < to_id THEN to_id ELSE from_id END AS person2,
          duration
   FROM Calls) tbl1
GROUP BY person1,
         person2