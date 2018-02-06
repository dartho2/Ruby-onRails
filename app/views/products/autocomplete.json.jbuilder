json.array! @items do |i|
  json.label "#{i.name} - #{i.price}"
  json.value i.name
  json.id i.id
  # json.unitary_cost i.unitary_cost
end
