```config/routes.rb
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
```

```app/controllers/application_controller.rb

  private
  
  def routing_error
    raise ActionController::RoutingError, params[:path]
  end
```
