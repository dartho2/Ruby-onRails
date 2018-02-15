json.array! @items do |i|
  json.label
  if i.price.present?
    "#{i.name} - #{i.price}"
  else
    "#{i.name} - 0"
  end
  json.value i.name
  json.id i.id
  if i.price.present?
  json.price i.price
  else
    json.price "0"
  end
  # json.unitary_cost i.unitary_cost
end
