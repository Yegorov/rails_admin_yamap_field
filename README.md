[![Gem Version](https://badge.fury.io/rb/rails_admin_yamap_field.svg)](https://badge.fury.io/rb/rails_admin_yamap_field)

# RailsAdminYamapField

Simple implementation of Yandex maps in rails admin.

Inspired by these projects:
* [Rails Admin Map Field](https://github.com/beyondthestory/rails_admin_map_field)
* [RailsAdminGoogleMap](https://github.com/nicovak/rails_admin_google_map)
* [Rails Admin Place Field](https://github.com/thinkclay/rails_admin_place_field/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_yamap_field'
```

And then execute:
```bash
$ bundle
```

## Usage

Add `attr_accessor ya_map` to you model for which you need to show the map or define
`ya_map` and `ya_map=` methods as you wish, for example:

```ruby
class Address < ApplicationRecord
  # others methods
  def ya_map=(lat_lon)
    self[:lat], self[:lon] = lat_lon.split(",")
  end
  def ya_map
    [lat, lon].join(",")
  end
  # others methods
end
```

### Available options for configure in rails_admin:

* center_lat - map center latitude
* center_long - map center longitude
* zoom_level - map zoom level
* map_html_width - width div map container: default '100%'
* map_html_height - height div map container: default '500px'
* map_lang - language map: default 'ru_RU', for other values see [this ref](https://tech.yandex.ru/maps/doc/jsapi/2.1/dg/concepts/load-docpage/#load__param)
* api_key - api key for enterprise version: default 'nil'
* latitude_field - latitude attribute name in you model: default 'latitude'
* longitude_field - longitude attribute name in you model: default 'longitude'

### Example:

```ruby
class Address < ApplicationRecord
  attr_accessor :ya_map

  rails_admin do
    field :lat, :hidden
    field :lon, :hidden
    field :ya_map, :yamap_field do
      map_html_width "600px"
      latitude_field :lat
      longitude_field :lon
     end
  end
end
```

### Screenshot

![Sample screenshot](/wiki/screenshot_1.png)

## References

* [API Yandex map](https://tech.yandex.ru/maps/doc/jsapi/2.1/quick-start/index-docpage/)
  * [Placemark docpage](https://tech.yandex.ru/maps/doc/jsapi/2.1/ref/reference/Placemark-docpage/)
* [API Yandex map. DragEnd event](https://yandex.ru/blog/mapsapi/24027)
* [Create custom field in rails_admin](https://github.com/sferik/rails_admin/wiki/Custom-field)
  * [rails_admin base field class](https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/fields/base.rb)

## Contributing

Feel free to send pull requests or write issue.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
