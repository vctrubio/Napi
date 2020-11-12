class Employees < Api
    format :json
    default_format :json
  
    namespace :employees, desc: 'Employees related CRUD operations' do
  
      desc 'Fetch all employees'
      get '/' do
        @employees = Employee.all
        # get employees client
        # @employees.each do |client|
        # end
        if @employees.present?
          { data: @employees, status: true }
        else
          error!({ status: false, message: 'Employee list is empty, Please add an Employee' }, 400)
        end
      end

      desc 'Fetch single employee'
      get '/:id' do
        @employee = Employee.find_by(id: params[:id])
        if @employee.present?
          { data: @employee, status: true }
        else
          error!({ status: false, message: 'employee with this id not found' }, 400)
        end
      end

      desc 'Fetch Employee Clients'
      get '/:id' do
        @employee = Employee.find_by(id: params[:id])
        # get clients, total order contributed
        employee_clients = @employee.clients
        employee_clients_count = @employee.clients.count
        orders_contributed = employee_clients.orders.count
        
        if @employee.present?
          { data: @employee, status: true }
        else
          error!({ status: false, message: 'employee with this id not found' }, 400)
        end
      end



      desc 'Create an Employee'
      params do
        requires :name, type: String, desc: 'Name'
        requires :phone, type: String, desc: 'Phone'
        requires :credit, type: Float, desc: 'Credit'
        requires :description, type: String, desc: 'Description'
        requires :archive, type: Boolean, desc: 'Archive'
        requires :cash, type: Float, desc: 'Cash'
        requires :paidcash, type: Float, desc: 'paidcash'
      end
  
      post '/' do
        @employee = Employee.new(params)
        if @employee.save
          { data: @employee, message: 'Employee was successfully added.', status: true}
        else
          error!({ status: false, message: 'Something went wrong' }, 400)
        end
      end

      desc 'Update an Employee'
      params do
        requires :name, type: String, desc: 'Name'
        requires :phone, type: String, desc: 'Phone'
        requires :credit, type: Float, desc: 'Credit'
        requires :description, type: String, desc: 'Description'
        requires :archive, type: Boolean, desc: 'Archive'
        requires :cash, type: Float, desc: 'Cash'
        requires :paidcash, type: Float, desc: 'paidcash'
      end

      put '/:id' do
        @employee = Employee.find_by(id: params[:id])
        if @employee && @employee.update(params)
          { data: @employee, message: 'Employee was successfully updated.', status: true}
        else
          error!({ status: false, message: 'Employee with this id not found' }, 400)
        end
      end

      desc 'Delete an Employee'
      delete '/:id' do
        @employee = Employee.find_by(id: params[:id])
        if @employee && @employee.delete
          { data: @employee, message: 'employee was successfully deleted.', status: true}
        else
          error!({ status: false, message: 'employee with this id not found' }, 400)
        end
      end

      desc 'Archive an employee'
      put '/archive/:id' do
        @employee = Employee.find_by(id: params[:id])
        if @employee && @employee.update(archive: params[:archive])
          { data: @employee, message: 'Employee was successfully updated.', status: true}
        else
          error!({ status: false, message: 'Employee with this id not found' }, 400)
        end
      end

    end
  end