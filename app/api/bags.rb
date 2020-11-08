class Bags < Api
	format :json
	default_format :json

	namespace :bags, desc: 'Bags related CRUD operations' do

		desc 'Fetch all bags'
		get '/' do
			@bags = Bag.all
			if @bags.present?
				{ data: @bags, status: true }
			else
				error!({ status: false, message: 'bags list is empty' }, 400)
			end
		end

		desc 'Fetch a single bag'
		get '/:id' do
			@bag = Bag.find_by(id: params[:id])
			bag_pickup = @bag.pickup
			bag_landlord = @bag.pickup.landlord
			if @bag.present?
				{ data: @bag, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

	desc 'Bag methods'
	get '/bag/:id' do
	  @bag = Bag.find_by(id: params[:id])
	# set pickup_id
	  if @bag.present?
		{ data: @bag, status: true }
	  else
		error!({ status: false, message: 'bag list is empty, Please add an client' }, 400)
	  end
	end









		desc 'Create a bag'
		params do
			requires :pickup_id, type: String, desc: 'payment_id'
			requires :kg, type: Integer, desc: 'kg'
			requires :price, type: Integer, desc: 'price'
			requires :avgprice, type: Float, desc: 'avgprice'
			requires :name, type: String, desc: 'name'
		end

		post '/' do
			@bag = Bag.new(params)
			if @bag.save
				{ data: @bag, message: 'bag was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a Bag'
		params do
			requires :pickup_id, type: String, desc: 'payment_id'
			requires :kg, type: Integer, desc: 'kg'
			requires :price, type: Integer, desc: 'price'
			requires :avgprice, type: Float, desc: 'float'
			requires :name, type: String, desc: 'name'
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