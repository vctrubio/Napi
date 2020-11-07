class Fruits < Api
	format :json
	default_format :json

	namespace :fruits, desc: 'fruits related CRUD operations' do

		desc 'Fetch all fruits'
		get '/' do
			@fruits = Fruit.all
			if @fruits.present?
				{ data: @fruits, status: true }
			else
				error!({ status: false, message: 'fruits list is empty' }, 400)
			end
		end

		desc 'Fetch a single Fruit'
		get '/:id' do
			@fruit = Fruit.find_by(id: params[:id])
			if @fruit.present?
				{ data: @fruit, status: true }
			else
				error!({ status: false, message: 'Bag with this id not found' }, 400)
			end
		end

		desc 'Create a Fruit'
		params do
			requires :name, type: String, desc: 'name'
			requires :comment, type: String, desc: 'comment'
   		requires :priceA, type: Float, desc: 'priceA'
   		requires :priceB, type: Float, desc: 'priceB'
   		requires :priceC, type: Float, desc: 'priceC'
		end

		post '/' do
			@fruit = Fruit.new(params)
			if @fruit.save
				{ data: @fruit.fruit_data, message: 'fruit was successfully created.', status: true}
			else
				error!({ status: false, message: 'Something went wrong' }, 400)
			end
		end

		desc 'Update a Fruit'
		params do
			requires :name, type: String, desc: 'name'
			requires :comment, type: String, desc: 'comment'
   		requires :priceA, type: Float, desc: 'priceA'
   		requires :priceB, type: Float, desc: 'priceB'
   		requires :priceC, type: Float, desc: 'priceC'
		end
    
		put '/:id' do
			@fruit = Fruit.find_by(id: params[:id])
			if @fruit && @fruit.update(params)
				{ data: @fruit, message: 'fruit was successfully updated.', status: true}
			else
				error!({ status: false, message: 'fruit with this id not found' }, 400)
			end
		end

		desc 'Delete a fruit'
		delete '/:id' do
			@fruit = Fruit.find_by(id: params[:id])
			if @fruit && @fruit.delete
				{ data: @fruit, message: 'fruit was successfully deleted.', status: true}
			else
				error!({ status: false, message: 'fruit with this id not found' }, 400)
			end
		end

	
	end
end