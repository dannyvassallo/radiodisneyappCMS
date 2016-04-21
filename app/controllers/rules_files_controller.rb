class RulesFilesController < ApplicationController
  before_filter :redirect_to_index, except: [:show]
  before_filter :check_admin, except: [:show]

  def index
    @rd_rules = RulesFile.where(station: "Radio Disney").to_a
    @rdc_rules = RulesFile.where(station: "Radio Disney Country").to_a
  end

  def show
    @rules_file = RulesFile.friendly.find(params[:id])
    render layout: 'bare'
  end

  def new
    @rules_file = RulesFile.new
  end

  def create
    @rules_file = RulesFile.new(rules_file_params)
    name = @rules_file.name

    if @rules_file.save
      flash[:notice] = "Your new rules '#{name}' were created!"
      redirect_to rules_files_path
    else
      flash[:error] = "There was an error creating the rules. Please try again."
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
      redirect_to rules_files_path
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
      redirect_to rules_files_path
    else
      flash[:error] = "There was an error deleting the rules file '#{name}'. Please try again."
      render :show
    end
  end

  def redirect_to_index
    if current_user == nil || current_user.role != 'admin'
      flash[:error] = "You are not authorized to do that."
      redirect_to root_path
    end
  end

  def check_admin
    if current_user != nil
      if current_user.role != 'admin'
        flash[:error] = "You are not authorized to do that."
        redirect_to root_path
      end
    end
  end

  private

  def rules_file_params
    params.require(:rules_file).permit(:name, :document, :station)
  end
end
