with driver_metrics as 
(
    select driver_name,
        sum(race_starts) as race_starts,
        sum(number_of_wins) as total_wins,
        sum(number_of_podiums) as total_podiums,
        sum(case when standing=1 then 1 else 0 end) as total_championships
    from formula1.gold.v_driver_standing
    group by driver_name
    having total_championships >=1
)
select driver_name,
        race_starts,
        total_wins,
        total_podiums,
        total_championships,
        (total_championships * 100) + (total_wins * 10) + (total_podiums * 3) as greatness_score
    from driver_metrics
    order by greatness_score desc
    limit 10