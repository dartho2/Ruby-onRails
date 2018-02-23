json.array! @items do |i|
  json.label "#{i.name} - #{i.code} - #{i.price}"
  json.value i.name
  json.id i.id
  json.price i.price
  # json.unitary_cost i.unitary_cost
end
