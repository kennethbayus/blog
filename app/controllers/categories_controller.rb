class CategoriesController <ApplicationController
	
	before_action :require_user, except:[:show]
	before_action :set_category, except:[:new, :create]

	def new
		@category=Category.new
		@categories = Category.all.order(:name)
	end

	def create
		@category=Category.new(category_params)

		if @category.save
  		flash[:notice] = "New Category created successfully"
  		redirect_to new_category_path
  	else
  		render :new
  	end

	end

	def show	
	end

	def destroy

		if @category.destroy
			flash[:notice] = "Category was deleted successfully"
		end

  	redirect_to new_category_path
  
	end

	def edit
	end

	def update

	 	if @category.update(category_params)
  		flash[:notice] = "Category was updated successfully"
  		redirect_to new_category_path
  	else
  		render :edit
  	end
	end

	def set_category
		@category = Category.find_by slug: params[:id]
	end

	private 
		def category_params
			params.require(:category).permit(:name)
		end

end