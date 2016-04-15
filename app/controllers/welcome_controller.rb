class WelcomeController < ApplicationController
  def index
    @rd_rules = RulesFile.where(station: "Radio Disney").to_a
    @rdc_rules = RulesFile.where(station: "Radio Disney Country").to_a
  end
end
