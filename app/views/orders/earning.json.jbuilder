json.array! @orders_group do |month, order|
  json.data "#{month.strftime('%m/%d/%Y')}"

  json.numer order do |f|
    json.order "#{f.id}"
    json.sale_data "#{f.sale_date.strftime('%m/%d/%Y')}"

    json.product_order f.product_orders do |p|
      json.name "#{p.name}"
      json.quantity "#{p.quantity}"
      json.price "#{p.price}"
    end
  end
end
