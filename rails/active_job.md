active_jobとsidekiqを併用するといくつか弊害がある

```
Warning: by doing job retry through ActiveJob, you lose a lot of Sidekiq functionality:

Web UI visibility (the Retries tab will be empty)
You cannot iterate through retries with the Sidekiq::RetrySet API.
Sidekiq's log will not contain any failures or backtraces.
Errors will not be reported to Sidekiq's global error handlers
Many advanced Sidekiq features (e.g. Batches) will not work with AJ retries.
```
