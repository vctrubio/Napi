class Orders < Api
	format :json
	default_format :json

	namespace :orders, desc: 'orders related CRUD operations' do

		desc 'Fetch all orders'
		get '/' do
      @orders = Order.all
      # do order.receipts 
			if @orders.present?
				{ data: @orders, status: true }
			else
				error!({ status: false, message: 'orders list is empty' }, 400)
			end
		end

		desc 'Fetch a single order'
		get '/:id' do
			@order = Order.find_by(id: params[:id])
			
			@order.receipts.each do |r|
				fruit_name = r.fruit.name
				kg = r.kg
				number_of_fruits = r.count
			end

			if @order.present?
				{ data: @order, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

		desc 'Fetch all Receipts for an order'
		get '/order/:id' do
		  @order = Order.find_by(id: params[:id])
		  if @order.present?
			{ data: @order.receipts, status: true }
		  else
			error!({ status: false, message: 'Receipt list is empty, Please add an client' }, 400)
		  end
		end

		desc 'Order methods'
		get '/Order/:id' do
		  @order = Order.find_by(id: params[:id])

		  #   on save/update add/subtract client.employee.credit total.new

		  # methods toggle paid, delivered, completed --here on in MODULE
		  def paid
			@order.toggle! :paid
		  end	
		  def delivered
			@order.toggle! :delivered
		  end	
		  def completed
			@order.paid = true
			@order.delivered = true
		  end


		# def find_employee
		# 	# this or this
		# 	@employee = Employee.find(params[:id])
		# 	@employee.credit = ...
		# end

		  if @order.present?
			{ data: @order, status: true }
		  else
			error!({ status: false, message: 'Order list is empty, Please add an client' }, 400)
		  end
		end







		desc 'Create an Order'
		params do
			requires :client_id, type: String, desc: 'client_id'
			requires :date, type: Date, desc: 'date'
			requires :time, type: String, desc: 'time'
			requires :price, type: Float, desc: 'price'
			requires :kg, type: Float, desc: 'kg'
			requires :comment, type: String, desc: 'comment'
			requires :paid, type: Boolean, desc: 'paid'
			requires :delivered, type: Boolean, desc: 'delivered'
		end

		post '/' do
			@order = Order.new(params)
			if @order.save
				{ data: @order, message: 'order was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update an Order'
		params do
			requires :client_id, type: String, desc: 'client_id'
			requires :date, type: Date, desc: 'date'
			requires :time, type: String, desc: 'time'
			requires :price, type: Float, desc: 'price'
			requires :kg, type: Float, desc: 'kg'
			requires :comment, type: String, desc: 'comment'
			requires :paid, type: Boolean, desc: 'paid'
			requires :delivered, type: Boolean, desc: 'delivered'
		end
		put '/:id' do
			@bag = Bag.find_by(id: params[:id])
			if @bag && @bag.update(params)
				{ data: @bag, message: 'bag was successfully updated.', status: true}
			else
				error!({ status: false, message: 'Total with this id not found' }, 400)
			end
		end

		desc 'Delete a bag'
		delete '/:id' do
			@bag = Bag.find_by(id: params[:id])
			if @bag && @bag.delete
				{ data: @bag, message: 'bag was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'bag with this id not found' }, 400)
			end
		end

	
	end
end