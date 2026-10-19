SELECT *
FROM formula1_incr.gold.vw_race_analysis
WHERE status IN (
    'Retired',
    'Withdrew',
    'Accident',
    'Collision',
    'Steering',
    'Gearbox',
    'Power Unit',
    'Puncture',
    'Wheel',
    'Track rod'
);