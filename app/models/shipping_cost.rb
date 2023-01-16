class ShippingCost < ActiveHash::Base
  self.data = [
    {id:1, shipping_cost: '---' },
    {id:2, shipping_cost: '着払い(購入者負担)' },
    {id:3, shipping_cost: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end