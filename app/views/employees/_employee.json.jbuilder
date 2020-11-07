json.extract! employee, :id, :name, :phone, :credit, :description, :archive, :created_at, :updated_at
json.url employee_url(employee, format: :json)
