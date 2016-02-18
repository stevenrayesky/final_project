class TreesController < ApplicationController

	def index
		current_user
		@trees = @current_user.trees.all
		@tree = Tree.new
	end

	def show
		current_user
		@tree = Tree.find(params[:id])
		@familymember = Familymember.new
		@all_members = @tree.familymembers
	end

	def create
		current_user
		@tree = Tree.new(tree_params)
		@tree.user_id = @current_user.id
		if @tree.save
			redirect_to (:back)
		end
	end

	def destroy
		@tree = Tree.find(params[:id])	
		if @tree.destroy
			redirect_to (:back)
		end
	end

	def update
		@tree = Tree.find(params[:id])
		@tree.update(tree_params)
		if @tree.save
			redirect_to (:back)
		end
	end

	private

	def tree_params
		params.require(:tree).permit(:name)
		
	end
end
