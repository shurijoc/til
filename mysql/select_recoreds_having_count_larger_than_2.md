重複レコードがある場合のSELECTとDELETEの方法

-- レコード確認用

SELECT item_id, COUNT(id) AS cnt
FROM versions
WHERE versions.item_type IN ('Affiliate::All', 'Affiliate', 'Property')
GROUP BY versions.item_type, versions.item_id, versions.created_at
HAVING(cnt >= 2)

-- レコード実行用

DELETE
FROM versions
WHERE id NOT IN (
  SELECT min_id
  from (
    SELECT MIN(id) as min_id
    FROM versions
    WHERE versions.item_type IN ('Affiliate::All', 'Affiliate', 'Property')
    GROUP BY versions.item_type, versions.item_id, versions.created_at
  ) as tmp
);
