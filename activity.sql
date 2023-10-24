WITH RECURSIVE ActivityHierarchy AS (
    SELECT
        a.id,
        a.parent_id,
        a.activitytype_id,
        a.activity_id,
        at.name AS activity_name,
        CAST(at.name AS VARCHAR) AS hierarchy_path
    FROM ActivityType AS at
    JOIN Activity AS a ON at.id = a.activitytype_id
    WHERE a.parent_id IS NULL 

    UNION

    SELECT
        a.id,
        a.parent_id,
        a.activitytype_id,
        a.activity_id,
        at.name AS activity_name,
        CONCAT(h.hierarchy_path, ' -> ', at.name) AS hierarchy_path
    FROM Activity AS a
    JOIN ActivityType AS at ON at.id = a.activitytype_id
    JOIN ActivityHierarchy AS h ON a.parent_id = h.id
)
SELECT * FROM ActivityHierarchy
ORDER BY id;