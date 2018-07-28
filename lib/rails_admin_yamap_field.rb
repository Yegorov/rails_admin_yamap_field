require "rails_admin_yamap_field/engine"

module RailsAdminYamapField
  # Your code goes here...
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class YamapField < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :yamap_field
    fields << RailsAdmin::Config::Fields::Types::YamapField.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


