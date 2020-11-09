class Receipts < Api
	format :json
	default_format :json

	namespace :receipts, desc: 'receipts related CRUD operations' do

		desc 'Fetch all receipts'
		get '/' do
			@receipts = Receipt.all
			if @receipts.present?
				{ data: @receipts, status: true }
			else
				error!({ status: false, message: 'receipts list is empty' }, 400)
			end
		end

		desc 'Fetch a single Receipt'
		get '/:id' do
			@receipt = Receipt.find_by(id: params[:id])
			if @receipt.present?
				{ data: @receipt, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

		get '/order/:id' do
			@order = Order.find_by(id: params[:id])
			if @order.present?
				# this this correct?
			  { data: @order.receipts, status: true }
			else
			  error!({ status: false, message: 'err' }, 400)
			end
		  end

		desc 'Create a Receipt'
		params do
			requires :fruit_id, type: String, desc: 'fruit_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :kg, type: Float, desc: 'kg'
			requires :price, type: Float, desc: 'price'
		end

		post '/' do
      @receipt = Receipt.new(params)
      # find @receipt.order_id
			if @receipt.save
				{ data: @receipt, message: 'receipt was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a receipt'
		params do
			requires :fruit_id, type: String, desc: 'fruit_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :kg, type: Float, desc: 'kg'
			requires :price, type: Float, desc: 'price'
		end
    
		put '/:id' do
			@receipt = Receipt.find_by(id: params[:id])
			if @receipt && @receipt.update(params)
				{ data: @receipt, message: 'receipt was successfully updated.', status: true}
			else
				error!({ status: false, message: 'receipt with this id not found' }, 400)
			end
		end

		desc 'Delete a receipt'
		delete '/:id' do
			@receipt = Receipt.find_by(id: params[:id])
			if @receipt && @receipt.delete
				{ data: @receipt, message: 'receipt was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'receipt with this id not found' }, 400)
			end
		end

	
	end
end