class RulesFile < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :document, DocumentUploader
end
