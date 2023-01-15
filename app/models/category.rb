class Category < ActiveHash::Base
  self.data = [
    { id:1, item_status: '---' },
    { id:2, item_status: 'レディース' },
    { id:3, item_status: 'メンズ' },
    { id:4, item_status: 'ベビー・キッズ' },
    { id:5, item_status: 'インテリア・住まい・小物' },
    { id:6, item_status: '本・音楽・ゲーム' },
    { id:7, item_status: 'おもちゃ・ホビー・グッズ' },
    { id:8, item_status: '家電・スマホ・カメラ' },
    { id:9, item_status: 'スポーツ・レジャー' },
    { id:10, item_status: 'ハンドメイド' },
    { id:11, item_status: 'その他' }
]

include ActiveHash::Associations
has_many :items

end