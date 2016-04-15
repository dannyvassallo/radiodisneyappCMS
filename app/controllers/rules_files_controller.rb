class RulesFilesController < ApplicationController
  def index
    @rules_files = RulesFile.all
  end

  def show
    @rules_file = RulesFile.friendly.find(params[:id])
  end

  def new
    @rules_file = RulesFile.new
  end

  def create
    @rules_file = RulesFile.new(rules_file_params)
    name = @rules_file.name

    if @rules_file.save
      flash[:notice] = "Your new campaign '#{name}' was created!"
      redirect_to @rules_file
    else
      flash[:error] = "There was an error creating the campaign. Please try again."
      render action: :new
    end
  end

  def edit
    @rules_file = RulesFile.friendly.find(params[:id])
  end

  def update
    @rules_file = RulesFile.friendly.find(params[:id])
    name = @rules_file.name
    if @rules_file.update_attributes(rules_file_params)
      flash[:notice] = "The rules file '#{name}' was updated!"
      redirect_to @rules_file
    else
      flash[:error] = "There was an error updating the rules file. Please try again."
      render action: :edit
    end
  end

  def destroy
    @rules_file = RulesFile.friendly.find(params[:id])
    name = @rules_file.name

    if @rules_file.destroy
      flash[:notice] = "The rules file '#{name}' was deleted successfully."
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting the rules file '#{name}'. Please try again."
      render :show
    end
  end

  private

  def rules_file_params
    params.require(:rules_file).permit(:name, :document, :station)
  end
end
