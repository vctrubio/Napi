class Payments < Api
	format :json
	default_format :json

	namespace :payments, desc: 'payments related CRUD operations' do

		desc 'Fetch all payments'
		get '/' do
			@payments = Payment.all
			if @payments.present?
				{ data: @payments, status: true }
			else
				error!({ status: false, message: 'payments list is empty' }, 400)
			end
		end

		desc 'Fetch a single Payment'
		get '/:id' do
			@payment = Payment.find_by(id: params[:id])
			if @payment.present?
				{ data: @payment, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

		desc 'Create a Payment'
		params do
			requires :employee_id, type: String, desc: 'employee_id'
			requires :date, type: Date, desc: 'date'
   			requires :price, type: Float, desc: 'price'
      			# change db:to_int
			requires :ticket, type: Boolean, desc: 'ticket'
		end

		post '/' do
			@payment = Payment.new(params)
			# find payment.employee_id
			# create payment.total_id new
			if @payment.save
				{ data: @payment, message: 'payment was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a Payment'
		params do
			requires :employee_id, type: String, desc: 'employee_id'
			requires :date, type: Date, desc: 'date'
      		requires :price, type: Float, desc: 'price'
      		# change db:to_int
			requires :ticket, type: Boolean, desc: 'ticket'
    	end
    
		put '/:id' do
			@payment = Payment.find_by(id: params[:id])
			if @payment && @payment.update(params)
				{ data: @payment, message: 'payment was successfully updated.', status: true}
			else
				error!({ status: false, message: 'Payment with this id not found' }, 400)
			end
		end

		desc 'Delete a payment'
		delete '/:id' do
			@payment = Payment.find_by(id: params[:id])
			if @payment && @payment.delete
				{ data: @payment, message: 'payment was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'payment with this id not found' }, 400)
			end
		end

	
	end
end