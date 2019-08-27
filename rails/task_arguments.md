引数のコンマの間にスペースを入れてはいけない

```
execute :bundle, :exec, :rails, "aws:get_env_file[#{fetch(:rails_env)},#{release_path}]"
```
