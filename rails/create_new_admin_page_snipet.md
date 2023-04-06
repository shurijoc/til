基本的な画面の作成

### view / controller
```
#!/bin/bash
# customersを元にnotificationsを作る場合
FROM_D=customer
FROM_U=Customer
TO_D=notification
TO_U=Notification

cp app/controllers/admin/{$FROM_D,$TO_D}s_controller.rb
cp -r app/views/admin/{$FROM_D,$TO_D}s
cp spec/requests/admin/{$FROM_D,$TO_D}s_spec.rb

find app/views/admin/${TO_D}s -type f | xargs perl -p -i -e "s/$FROM_D/$TO_D/g"
find app/views/admin/${TO_D}s -type f | xargs perl -p -i -e "s/$FROM_U/$TO_U/g"

find app/controllers/admin/${TO_D}s_controller.rb -type f | xargs perl -p -i -e "s/$FROM_D/$TO_D/g"
find app/controllers/admin/${TO_D}s_controller.rb -type f | xargs perl -p -i -e "s/$FROM_U/$TO_U/g"

find spec/requests/admin/${TO_D}s_spec.rb -type f | xargs perl -p -i -e "s/$FROM_D/$TO_D/g"
find spec/requests/admin/${TO_D}s_spec.rb -type f | xargs perl -p -i -e "s/$FROM_U/$TO_U/g"

### requests/spec
cp spec/requests/admin/${FROM_D}s_spec.rb spec/requests/admin/${TO_D}s_spec.rb

find spec/requests/admin/${TO_D}s_spec.rb -type f | xargs perl -p -i -e "s/$FROM_D/$TO_D/g"
find spec/requests/admin/${TO_D}s_spec.rb -type f | xargs perl -p -i -e "s/$FROM_U/$TO_U/g"
```

### sidebar
```
#!/bin/sh

for class in attendances courses notifications payments
do
  cat <<-EOS >> app/views/admin/shared/_sidebar.html.slim
    li.nav-item
      = link_to admin_${class}_path, class: "nav-link #{active_class('admin/${class}')}" do
        i.nav-icon.fas.fa-ticket-alt
        p = "#{human(${class})}管理"
EOS
done
```

### パンくずリスト
```
#!/bin/sh

for class in attendances courses notifications payments
do
  cat <<-EOS >> config/breadcrumbs.rb
# admin_${class}
crumb :admin_${class} do
  link '管理者管理', admin_${class}_path
  parent :admin_root
end

crumb :new_admin_${class} do
  link '管理者新規登録', new_admin_${class}_path
  parent :admin_${class}
end

crumb :admin_${class} do |${class}|
  link '管理者詳細', admin_${class}_path(${class})
  parent :admin_${class}
end

crumb :edit_admin_${class} do |${class}|
  link '管理者編集', edit_admin_${class}_path(${class})
  parent :admin_${class}
end

EOS
done
```
