class WelcomeController < ApplicationController
  def index
    @rd_rules = RulesFile.where(station: "Radio Disney").to_a
    @rdc_rules = RulesFile.where(station: "Radio Disney Country").to_a
    if current_user != nil && current_user.role == 'admin'
      redirect_to rules_files_path
    else
      render layout: "bare"
    end
  end
end
