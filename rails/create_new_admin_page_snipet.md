基本的な画面の作成

### view / controller
```
#!/bin/bash
# notificationsの場合

cp app/controllers/admin/{customers,notifications}_controller.rb
cp -r app/views/admin/{customers,notifications}
cp spec/requests/admin/{customers,notifications}_spec.rb

find app/views/admin/notifications -type f | xargs perl -p -i -e "s/customer/notification/g"
find app/views/admin/notifications -type f | xargs perl -p -i -e "s/Customer/Notification/g"

find app/controllers/admin/notifications_controller.rb -type f | xargs perl -p -i -e "s/customer/notification/g"
find app/controllers/admin/notifications_controller.rb -type f | xargs perl -p -i -e "s/Customer/Notification/g"

find spec/requests/admin/notifications_spec.rb -type f | xargs perl -p -i -e "s/customer/notification/g"
find spec/requests/admin/notifications_spec.rb -type f | xargs perl -p -i -e "s/Customer/Notification/g"
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

### requests/spec
```
cp spec/requests/api/v1/lessons_spec.rb spec/requests/api/v1/free_videos_spec.rb

find spec/requests/api/v1/free_videos_spec.rb -type f | xargs perl -p -i -e "s/lesson/free_video/g"
find spec/requests/api/v1/free_videos_spec.rb -type f | xargs perl -p -i -e "s/Lesson/FreeVideo/g"
```
