require "rails_admin_yamap_field/engine"

module RailsAdminYamapField
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class YamapField < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)

          register_instance_option(:partial) do
            :form_yamap_field
          end

          register_instance_option(:formatted_value) do
            if bindings[:controller].action_name == "show"
              bindings[:view].render "rails_admin/main/show_yamap_field", field: self
            else
              value
            end
          end

          # If the point is presented, she is the center of the map
          # else center of the map 0 km in Moscow
          register_instance_option(:center_lat) do
            bindings[:object].send(self.latitude_field) || 55.767461
          end

          register_instance_option(:center_long) do
            bindings[:object].send(self.longitude_field) || 37.631422
          end

          register_instance_option(:zoom_level) do
            7
          end

          register_instance_option(:map_html_width) do
            '100%'
          end
          register_instance_option(:map_html_height) do
            '500px'
          end
          register_instance_option(:map_lang) do
             'ru_RU'
          end
          register_instance_option(:api_key) do
            nil
          end

          register_instance_option(:latitude_field) do
            :latitude
          end

          register_instance_option(:longitude_field) do
            :longitude
          end

          def dom_name
            # @dom_name ||= "#{bindings[:form].try(:object_name)}_#{name}"
            #               .gsub /\[|\]\[|\]_|\]/, "_"
            bindings[:form].instance_variable_get(:@dom_id)[:"#{name}"]
          end

          def latitude_dom_name
            # @lat_dom_name ||= "#{bindings[:form].try(:object_name)}_#{latitude_field}"
            #                   .gsub /\[|\]\[|\]_|\]/, "_"
            bindings[:form].instance_variable_get(:@dom_id)[:"#{latitude_field}"]
          end

          def longitude_dom_name
            # @lon_dom_name ||= "#{bindings[:form].try(:object_name)}_#{longitude_field}"
            #                   .gsub /\[|\]\[|\]_|\]/, "_"
            bindings[:form].instance_variable_get(:@dom_id)[:"#{longitude_field}"]
          end

          def javascript_url
            return @javascript_url if @javascript_url.present?
            api_key = api_key.present? ? "&apikey=#{field.api_key}" : ""
            host = if api_key.present?
              "enterprise.api-maps.yandex.ru"
            else
              "api-maps.yandex.ru"
            end
            @javascript_url = "https://#{host}/2.1/?lang=#{map_lang}" \
                              "&onload=initMap&onerror=errorMap#{api_key}"
          end

        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  # puts parent, properties, fields
  # if properties[:name] == :yamap_field
  #   fields << RailsAdmin::Config::Fields::Types::YamapField.new(parent, properties[:name], properties)
  #   true
  # else
  #   false
  # end
end


