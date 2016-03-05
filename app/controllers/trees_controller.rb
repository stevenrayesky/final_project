class TreesController < ApplicationController

	def index
		current_user
		@trees = @current_user.trees.all
		@tree = Tree.new
	end

	def show
		current_user
		@new_partner_relationship = PartnerRelationship.new
		@familymember = Familymember.new
		@child = Familymember.new
		@parent = Familymember.new
		@new_partner = Familymember.new
		@tree = Tree.find(params[:id])
		# Select all members of tree instance.
		@all_members = @tree.familymembers
		# Select Hierarchical top familymember of @tree.
		@top = @tree.find_origin
		# Variable to send to D3 script.
		if @tree.familymembers?
			@chart = {children: @top.fill_array, first_name: @top.first_name, id: @top.id, tree_id: @tree.id }
		end

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
