#
# install dependencies
#
# $ gem install json
# $ gem install ruby-trello
#
# documents
# https://github.com/jeremytregunna/ruby-trello

require 'json'
require 'trello'

# README通りにセットアップ
api_key = 'foo'
token = 'bar'

Trello.configure do |config|
  config.developer_public_key = api_key # The "key" from step 1
  config.member_token = token # The token from step 2.
end

file = File.read('./trello_test_export.json')
json = JSON.parse(file)

# 新規カードと新規ラベルをボードに手動で追加する

#
# 1. 旧リストを元に新ラベルを付与する
#

#
# 新しいラベルのID表取得
# hash = json['labels'].last(4).inject({}) { |hash, list| hash[list['id']] = list['name']; hash }
# CTのみ別途取得
# ct = json['labels'].find { |label| label['name'] == 'CT' }
new_label_id_hash = {
"61f0e0dca563192dbdb7ff78"=>"CT",
"61f0ed26a47b4d173c365497"=>"School開発",
"61f0ed2ef003921ff6f96965"=>"School非開発",
"61f0ed43daabb81c5370be1b"=>"不具合",
"61f0ed4a1eaadb348fa1e8fe"=>"LMS",
"61f0ed506ccc84201c6a9842"=>"E-LEARNING"}.invert


# リストIDと対応表作成
#
# hash = json['lists'].inject({}) { |hash, list| hash[list['id']] = list['name']; hash }
#

old_list_id_hash = {
 "61f0e0dba563192dbdb7fb6d"=>"共有・相談事項（組織/受講生対応）",
 "61f0e0dba563192dbdb7fb6e"=>"懸念点",
 "61f0e0dba563192dbdb7fb6f"=>"他部署/他チームからの相談案件",
 "61f0e0dba563192dbdb7fb70"=>"School開発",
 "61f0e0dba563192dbdb7fb71"=>"コンテンツ改善・企画",
 "61f0e0dba563192dbdb7fb73"=>"業務改善・運用",
 "61f0e0dba563192dbdb7fb74"=>"新規カリキュラム",
 "61f0e0dba563192dbdb7fb75"=>"改善要望あり",
 "61f0e0dba563192dbdb7fb76"=>"LMS",
 "61f0e0dba563192dbdb7fb77"=>"Career開発",
 "61f0e0dba563192dbdb7fb78"=>"e-learning開発"
}.invert

list_to_label_hash = {
  old_list_id_hash['共有・相談事項（組織/受講生対応）'] => new_label_id_hash['CT'],
  old_list_id_hash['懸念点'] => new_label_id_hash['CT'],
  old_list_id_hash['他部署/他チームからの相談案件'] => new_label_id_hash['CT'],
  old_list_id_hash['School開発'] => new_label_id_hash['School開発'],
  old_list_id_hash['コンテンツ改善・企画'] => new_label_id_hash['School非開発'],
  old_list_id_hash['業務改善・運用'] => new_label_id_hash['School非開発'],
  old_list_id_hash['新規カリキュラム'] => new_label_id_hash['School非開発'],
  old_list_id_hash['改善要望あり'] => new_label_id_hash['CT'],
  old_list_id_hash['LMS'] => new_label_id_hash['LMS'],
  old_list_id_hash['Career開発'] => new_label_id_hash['CT'],
  old_list_id_hash['e-learning開発'] => new_label_id_hash['E-LEARNING']
}

json['cards'].each do |card_json|
  card = Trello::Card.find(card_json['id'])
  next if list_to_label_hash[card_json['idList']].nil?
  label = Trello::Label.find(list_to_label_hash[card_json['idList']])

  card.add_label(label)
end

#
# 2.旧リストから新リストへ移動させる
#
# 新しいリストのID表取得
# hash = json['lists'].last(8).inject({}) { |hash, list| hash[list['id']] = list['name']; hash }
# iceboxのみ別途取得
# json['lists'].find { |list| list['name'] == 'Icebox' }

new_list_id_hash = {
 "61f0e0dba563192dbdb7fb6c"=>"Icebox",
 "61f0ebeca29af4575a08d11e"=>"👶 New",
 "61f0e94a368caa3e8e97b919"=>"🔜 Todo",
 "61f0e9508feef81067d6440f"=>"✨ Doing",
 "61f0e9533970e779f5148a4c"=>"🔔 Waiting",
 "61f0e957209e0633246fb8a7"=>"✅ PR",
 "61f0e95b4dda288f9d97064d"=>"💻 Staging",
 "61f0e95ef51a131898146870"=>"🚀 Releasing",
 "61f0e96247ce792404d27453"=>"🎉 Done(2022/01)"}.invert

list_convert_hash = {
  old_list_id_hash['共有・相談事項（組織/受講生対応）'] => nil,
  old_list_id_hash['懸念点'] => new_list_id_hash['👶 New'],
  old_list_id_hash['他部署/他チームからの相談案件'] => new_list_id_hash['👶 New'],
  old_list_id_hash['School開発'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['コンテンツ改善・企画'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['業務改善・運用'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['新規カリキュラム'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['改善要望あり'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['LMS'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['Career開発'] => new_list_id_hash['🔜 Todo'],
  old_list_id_hash['e-learning開発'] => new_list_id_hash['🔜 Todo']
}

json['cards'].each do |card_json|
  card = Trello::Card.find(card_json['id'])
  list_id = list_convert_hash[card_json['idList']]
  next if list_id.nil?

  card.move_to_list(list_id)
end

#
# 3. 旧ラベルを元に新リストへ移動させる
#
# 旧ラベルのID表取得
# json['labels'].inject({}) { |hash, list| hash[list['id']] = list['name']; hash }
#

old_label_id_hash = {
 "61f0e0dca563192dbdb7ff8e"=>"Done",
 "61f0e0dca563192dbdb7ff88"=>"優先度高",
 "61f0e0dca563192dbdb7ff8b"=>"優先度中",
 "61f0e0dca563192dbdb7ff94"=>"Pending",
 "61f0e0dca563192dbdb7ff75"=>"Going",
 "61f0e0dca563192dbdb7ff85"=>"開発",
 "61f0e0dca563192dbdb7ff78"=>"CT",
 "61f0e0dca563192dbdb7ff7b"=>"優先度低",
 "61f0e0dca563192dbdb7ff7e"=>"デザイン・コーディング",
 "61f0e0dca563192dbdb7ff81"=>"設計中",
 "61f0e0dca563192dbdb7ff91"=>"Releasing",
}.invert

label_to_list_hash = {
 old_label_id_hash['Done'] => nil,
 old_label_id_hash['優先度高'] => nil,
 old_label_id_hash['優先度中'] => nil,
 old_label_id_hash['Pending'] => new_list_id_hash['Icebox'],
 old_label_id_hash['Going'] => new_list_id_hash['✨ Doing'],
 old_label_id_hash['開発'] => nil,
 old_label_id_hash['CT'] => nil,
 old_label_id_hash['優先度低'] => nil,
 old_label_id_hash['デザイン・コーディング'] => nil,
 old_label_id_hash['設計中'] => new_list_id_hash['🔜 Todo'],
 old_label_id_hash['Releasing'] => new_list_id_hash['🚀 Releasing']
}

json['cards'].each do |card|
  card = Trello::Card.find(card_json['id'])
  ['labels'].each do |label|
    list_id = label_to_list_hash[label['id']]
    next if list_id.nil?

    card.move_to_list(list_id)
  end
end
