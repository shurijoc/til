fetch(:aaaa)を `set` 内で使用するときはlambdaを使用して遅延評価させる

NG

`set :puma_conf, "#{release_path}/config/puma/#{rails_env}.rb"`

OK

`set :puma_conf, -> { "#{release_path}/config/puma/#{rails_env}.rb" }`


## configuration一覧
```config/deploy.rb
namespace :config do
  task :display do
    Capistrano::Configuration.env.keys.each do |key|
      p "#{key} => #{fetch(key)}"
    end
  end
end
```

実行
`$ cap production config:display`
