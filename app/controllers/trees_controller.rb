class TreesController < ApplicationController

	def index
		current_user
		@trees = @current_user.trees.all
		@tree = Tree.new
	end

	def show
		current_user
		@familymember = Familymember.new
		@tree = Tree.find(params[:id])
		# Select all members of tree instance.
		@all_members = @tree.familymembers
		# Select Hierarchical top familymember of @tree.
		@top = @all_members.first
		# Variable to send to D3 script.
		gon.familymembers = {children: @top.fill_array, first_name: @top.first_name}
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
