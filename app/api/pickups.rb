class Pickups < Api
	format :json
	default_format :json

	namespace :payments, desc: 'pickups related CRUD operations' do

		desc 'Fetch all pickups'
		get '/' do
			@pickups = Pickup.all
			if @pickups.present?
				{ data: @pickups, status: true }
			else
				error!({ status: false, message: 'pickups list is empty' }, 400)
			end
		end

		desc 'Fetch a single Pickup'
		get '/:id' do
			@pickup = Pickup.find_by(id: params[:id])
			pickup_landlord = @pickup.landlord				
			if @pickup.present?
				{ data: @pickup, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

		desc 'Create a pickup'
		params do
			requires :fruit_id, type: String, desc: 'fruit_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :kg, type: Float, desc: 'kg'
		end

		post '/' do
      @pickup = Pickup.new(params)
      #find @pickup.landlord_id
			if @pickup.save
				{ data: @pickup, message: 'pickup was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a pickup'
		params do
			requires :fruit_id, type: String, desc: 'fruit_id'
			requires :order_id, type: String, desc: 'order_id'
			requires :kg, type: Float, desc: 'kg'
		end
    
		put '/:id' do
			@pickup = Pickup.find_by(id: params[:id])
			if @pickup && @pickup.update(params)
				{ data: @pickup, message: 'pickup was successfully updated.', status: true}
			else
				error!({ status: false, message: 'pickup with this id not found' }, 400)
			end
		end

		desc 'Delete a pickup'
		delete '/:id' do
			@pickup = Pickup.find_by(id: params[:id])
			if @pickup && @pickup.delete
				{ data: @pickup, message: 'pickup was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'pickup with this id not found' }, 400)
			end
		end

	
	end
end