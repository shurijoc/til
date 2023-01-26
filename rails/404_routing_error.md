config/routes.rb
```
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
```

app/controllers/applicatoin_controller.rb
```
  rescue_from ActionController::RoutingError, with: :render_404

  private
  
  def routing_error
    raise ActionController::RoutingError, params[:path]
  end
```
