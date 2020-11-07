json.extract! order, :id, :client_id, :date, :price, :kg, :comment, :created_at, :updated_at
json.url order_url(order, format: :json)
