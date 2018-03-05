json.array! @magazine do |i|
  json.label "#{i.productname} - #{i.product.code}"
  json.value i.productname
  json.cat_buy i.cat_buy
  json.price i.price
  json.id i.id
  json.code i.product.code
  # json.id i.product_id
  # json.price i.price
  # json.unitary_cost i.unitary_cost
end
