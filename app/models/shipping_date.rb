class ShippingDate < ActiveHash::Base
  self.data = [
    { id:1, shipping_date: '1~2日で発送' },
    { id:2, shipping_date: '2~3日で発送' },
    { id:3, shipping_date: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end