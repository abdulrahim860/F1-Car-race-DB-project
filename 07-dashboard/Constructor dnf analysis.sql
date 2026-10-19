SELECT
    constructor_name,
    COUNT(*) AS total_entries,
    SUM(
        CASE
            WHEN status IN (
                'Retired', 'Withdrew', 'Accident', 'Collision',
                'Steering', 'Gearbox', 'Power Unit', 'Puncture',
                'Wheel', 'Track rod'
            )
            THEN 1 ELSE 0
        END
    ) AS dnf_count,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN status IN (
                    'Retired', 'Withdrew', 'Accident', 'Collision',
                    'Steering', 'Gearbox', 'Power Unit', 'Puncture',
                    'Wheel', 'Track rod'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS dnf_percentage
FROM formula1_incr.gold.vw_race_analysis
GROUP BY constructor_name
HAVING COUNT(*) >= 100
ORDER BY dnf_percentage DESC;