routing.sh
```sh
aws elbv2 create-rule \
  --listener-arn arn:aws:elasticloadbalancing:ap-northeast-1:759105656194:listener/app/runteq3-staging/3ed8e7269b94d9f8/9fb1a08f36fd02f0 \
  --priority 10 \
  --conditions file://rule-conditions.json \
  --actions file://rule-actions.json
```

rule-conditions.json
```json
[
  {
    "Field": "path-pattern",
    "PathPatternConfig": {
        "Values": [
          ".*wlwmanifest.xml",
          "/wp-login.php",
          "/.well-known*",
          "/mt*",
          "/phpinfo*"
        ]
    }
  }
]
```

rule-actions.json
```json
[
    {
        "Type": "fixed-response",
        "FixedResponseConfig": {
            "StatusCode": "404"
        }
    }
]
```

```
$ sh routing.sh
```
