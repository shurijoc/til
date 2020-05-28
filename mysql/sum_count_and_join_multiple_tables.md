3つ以上のテーブルにまたがっての集計はActiveRecordでは無理っぽい。
LEFT OUTER JOINの中身で集計関数をそれぞれ走らせて、それをSELECT文の中でさらに指定する。

今回は以下の関連
- users has_many equal_division_reward_pools
- users has_many ticket_pools

```
SELECT
    `users`.`id`,
    `users`.`name`,
    `users`.`nickname`,
    `users`.`created_at`,
    `users`.`deleted_at`,
    IFNULL(equal_division_reward_pools.count, 0) AS equal_division_watch_count,
    IFNULL(ticket_pools.count, 0) AS ticket_pool_count
FROM
    `users`
    LEFT OUTER JOIN(
      SELECT `equal_division_reward_pools`.`user_id`, SUM(watch_count) AS count FROM `equal_division_reward_pools` GROUP BY `equal_division_reward_pools`.`user_id`
    ) AS equal_division_reward_pools
    ON `equal_division_reward_pools`.`user_id` = `users`.`id`
    LEFT OUTER JOIN(
      SELECT `ticket_pools`.`user_id`, COUNT(id) AS count FROM `ticket_pools` GROUP BY `ticket_pools`.`user_id`
    ) AS ticket_pools
    ON `ticket_pools`.`user_id` = `users`.`id`
WHERE
    `users`.`deleted_at` IS NULL
AND `users`.`id` BETWEEN #{user_ids.first} AND #{user_ids.last}
GROUP BY
  `users`.`id`
```
