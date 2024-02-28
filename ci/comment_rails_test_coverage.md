```
      - run:
          name: Comment test Coverage on GitHub
          command: |
              PULL_REQUEST_NUMBER=$(echo $CI_PULL_REQUEST | sed 's/[^0-9]*//g')

              if [ "$PULL_REQUEST_NUMBER" == false ] || [ -z "$PULL_REQUEST_NUMBER" ]; then
                echo 'Not pull request.'
                exit 0
              fi

              BASE_OUTPUT_URL="https://output.circle-artifacts.com/output/job/$CIRCLE_BUILD_NUM/artifacts/0"
              COV_URL="$BASE_OUTPUT_URL/tmp/circleci-artifacts/coverage/index.html"
              PERCENTAGE=`cat /tmp/circleci-artifacts/coverage/.last_run.json | jq '.result.line'`
              COMMENT_BODY="Coverage report\\n$COV_URL\\n$PERCENTAGE%"
              POST_BODY="{\"body\": \"$COMMENT_BODY\"}"

              curl -XPOST \
                -H "Authorization: token $GITHUB_TOKEN" \
                -H "Content-Type: application/json" \
                -d "$POST_BODY" \
                https://api.github.com/repos/{your-org}/{your-repo}/issues/$PULL_REQUEST_NUMBER/comments
```
