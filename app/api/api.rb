require 'grape-swagger'

class Api < Grape::API
  format :json
  prefix "api"
  default_error_formatter :json
  content_type :json, 'application/json'
  mount Bags
  mount Clients
  mount Employees
  mount Fruits
  mount Landlords
  mount Orders
  mount Payments
  mount Pickups
  mount Receipts
  mount Totals
  add_swagger_documentation
  before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
  end

  # global exception handler, used for error notifications
  rescue_from :all do |e|
      raise e
      error_response(message: "Internal server error: #{e}", status: 500)
  end
end
