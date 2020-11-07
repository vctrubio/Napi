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

    desc 'Fetch all clients for an employee'
    get '/employee/:id' do
      @employee = Employee.find_by(id: params[:id])
      if @employee.present?
        { data: @employee.clients, status: true }
      else
        error!({ status: false, message: 'Client list is empty, Please add an client' }, 400)
      end
    end


    desc 'Fetch single client'
    get '/:id' do
      @client = Client.find_by(id: params[:id])
      if @client.present?
        { data: @client.client_data, status: true }
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
      # requires :rating, type: Boolean, desc: 'Rating'
      requires :employee_id, type: String, desc: 'Employee Id'
      requires :latitude, type: String, desc: 'Latitude'
      requires :longitude, type: Boolean, desc: 'Longitude'
    end

    post '/' do
      @client = Clinet.new(params)
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
      # requires :rating, type: Boolean, desc: 'Rating'
      requires :employee_id, type: String, desc: 'Employee Id'
      requires :latitude, type: String, desc: 'Latitude'
      requires :longitude, type: Boolean, desc: 'Longitude'
    end
    put '/:id' do
      @client = Client.find_by(id: params[:id])
      if @client && @client.update(params)
        { data: @client, message: 'Employee was successfully updated.', status: true}
      else
        error!({ status: false, message: 'Employee with this id not found' }, 400)
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
