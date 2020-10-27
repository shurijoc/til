```
SELECT *, count(increasable_id) AS cnt FROM increasing_logs
WHERE increasable_type = 'EqualDivisionRewardPool'
GROUP BY increasable_id
HAVING(cnt >= 2);
```
