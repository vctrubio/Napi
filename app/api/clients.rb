class Clients < Api
  format :json
  default_format :json

  namespace :clients, desc: 'Clients related CRUD operations' do

    desc 'Fetch all clients'
    get '/' do
      @clients = Client.all
      if @clients.present?
        { data: @clients, status: true }
      else
        error!({ status: false, message: 'Client list is empty, Please add an client' }, 400)
      end
    end

    # because belongs_to employee
    desc 'Fetch all clients for an employee'
    get '/employee/:id' do
      @employee = Employee.find_by(id: params[:id])
      if @employee.present?
        { data: @employee.clients, status: true }
      else
        error!({ status: false, message: 'Client list is empty, Please add an client' }, 400)
      end
    end

    desc 'Client methods'
    get '/client/:id' do
      @client = Client.find_by(id: params[:id])
      #total no. of orders, kg, €
      order_count = @client.orders.count
      client_order_last = @client.orders.last
      client_order_last_five = @client.orders.last(5)

      # client_total_prices = 0
      # client_total_kgs = 0
      @client.orders.each do |order|
        client_total_prices += order.price.sum
        client_total_kgs += order.kg.sum
      end
      client_avg_price = (client_total_kgs/client_total_prices)

      if @client.present?
        { data: @client, status: true }
      else
        error!({ status: false, message: 'Client list is empty, Please add an client' }, 400)
      end
    end







    desc 'Fetch single client'
    get '/:id' do
      @client = Client.find_by(id: params[:id])
      if @client.present?
        { data: @client, status: true }
      else
        error!({ status: false, message: 'Client with this id not found' }, 400)
      end
    end

    desc 'Create a client'
    params do
      requires :name, type: String, desc: 'Name'
      requires :phone, type: String, desc: 'Phone'
      requires :address, type: String, desc: 'address'
      requires :zone, type: String, desc: 'Zone'
      # requires :inactive, type: Boolean, desc: 'Inactive'
      requires :flat, type: String, desc: 'Flat'
      requires :description, type: String, desc: 'Description'
      requires :rating, type: Boolean, desc: 'Rating'
      requires :employee_id, type: String, desc: 'Employee Id'
      requires :latitude, type: String, desc: 'Latitude'
      requires :longitude, type: Boolean, desc: 'Longitude'
      requires :archive, type: Boolean, desc: 'Archive'

    end

    post '/' do
      @client = Client.new(params)
      # @client.employee_id =??
      if @client.save
        { data: @client, message: 'Client was successfully added.', status: true}
      else
        error!({ status: false, message: 'Something went wrong' }, 400)
      end
    end

    desc 'Update an client'
    params do
      requires :name, type: String, desc: 'Name'
      requires :phone, type: String, desc: 'Phone'
      requires :address, type: String, desc: 'address'
      requires :zone, type: String, desc: 'Zone'
      requires :flat, type: String, desc: 'Flat'
      requires :description, type: String, desc: 'Description'
      requires :rating, type: Boolean, desc: 'Rating'
      requires :employee_id, type: String, desc: 'Employee Id'
      requires :latitude, type: String, desc: 'Latitude'
      requires :longitude, type: Boolean, desc: 'Longitude'
      requires :archive, type: Boolean, desc: 'Archive'

    end
    
    put '/:id' do
      @client = Client.find_by(id: params[:id])
      if @client && @client.update(params)
        { data: @client, message: 'Client was successfully updated.', status: true}
      else
        error!({ status: false, message: 'Client with this id not found' }, 400)
      end
    end

    desc 'Delete a client'
    delete '/:id' do
      @client = Client.find_by(id: params[:id])
      if @client && @client.delete
        { data: @client, message: 'Client was successfully deleted.', status: true}
      else
        error!({ status: false, message: 'Client with this id not found' }, 400)
      end
    end


  end
end
