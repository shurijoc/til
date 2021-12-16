```
class ApplicationController < ActionController::Base
  def current_user
    User.find_by(email: 'example@example.com')
  end
end
```

の場合

```
let!(:user) { create(:user) }

before do
  allow(user).to receive(:some_method).and_return(true)
  allow(User).to receive(:find_by).and_return(user)
end
```

のようにgetterからstubする
