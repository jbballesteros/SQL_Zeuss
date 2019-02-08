DROP TABLE indices_mantenimiento

SELECT DB_NAME() AS DatabaseName, Object_name(i.object_id) AS TableName, i.index_id, name AS IndexName, avg_fragmentation_in_percent
  
  INTO indices_mantenimiento
  FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, 'Limited') AS ips
    INNER JOIN sys.indexes AS i ON ips.object_id = i.object_id AND ips.index_id = i.index_id
ORDER BY avg_fragmentation_in_percent desc