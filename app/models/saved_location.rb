class SavedLocation < ActiveRecord::Base
  validates_presence_of :name, :zip_code
end
