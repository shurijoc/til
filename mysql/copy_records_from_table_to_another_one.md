```
INSERT INTO affiliate_versions
SELECT item_type, item_id, event, whodunnit, object, created_at
FROM versions
WHERE versions.item_type IN ('Affiliate::All', 'Affiliate');
```
