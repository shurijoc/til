### HostedZoneのリストを取得する
`aws route53 list-resource-record-sets --hosted-zone-id HOSTED_ZONE_ID --output json > route53.json`

### ファイルを編集する

```route53.json
{
    "Comment": "string",
    "Changes": [
        {
            "Action": "CREATE",
            "ResourceRecordSet":{
                "ResourceRecords": [
                    {
                        "Value": "192.0.2.4"
                    }, 
                    {
                        "Value": "192.0.2.5"
                    }, 
                    {
                        "Value": "192.0.2.6"
                    }
                ], 
                "Type": "A", 
                "Name": "route53documentation.com.", 
                "TTL": 300
            }
        },
        {
            "Action": "CREATE",
            "ResourceRecordSet":{
                "AliasTarget": {
                    "HostedZoneId": "Z3BJ6K6RIION7M",
                    "EvaluateTargetHealth": false,
                    "DNSName": "s3-website-us-west-2.amazonaws.com."
            },
                "Type": "A",
                "Name": "www.route53documentation.com."
            }
        }
    ]
}
```

### HostedZoneのリストを更新する
aws route53 change-resource-record-sets --hosted-zone-id NEW_HOSTED_ZONE_ID --change-batch route53.json`
