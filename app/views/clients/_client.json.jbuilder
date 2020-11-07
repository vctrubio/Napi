json.extract! client, :id, :employee_id, :name, :phone, :address, :flat, :zone, :description, :latitude, :longitude, :created_at, :updated_at
json.url client_url(client, format: :json)
