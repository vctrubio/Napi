json.array! @employees do |employee|
  json.extract! employee, :id, :name, :phone, :credit, :description, :archive
json.employee employee.clients do |client|
  json.extract! client, :id, :name
end
end

