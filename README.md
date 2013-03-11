# Mapmy::Rails

Use OpenLayers OpenStreet map in Rails

## Installation

Add this line to your application's Gemfile:

    gem 'mapmy-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mapmy-rails

## Usage

### Include the assets

application.js

```
//= require openlayers
```

application.css

```
 *= require openlayers
```

### Use the map

Add the element the map will be appended to, sudo-haml looks like this:

```haml
body.map
  .container
    #map
```

Add the javascript (coffeescript) to create a map

```coffeescript
$map = $('.container #map')
buildMap = ->
  map = new OpenLayers.Map($map.get(0), {
    # Precompiled by the mapmy-rails gem
    theme: '/assets/openlayers/theme/default/style.css'
  })
  map.addLayer(new OpenLayers.Layer.OSM())
  map.zoomToMaxExtent();
  return map

buildMap()
```

Add the map styles

```scss
body.map {
  &, .container, #map {
    box-sizing: border-box;
    height: 100%;
  }
  #map {
    // Override twitter bootstrap image max-width;
    img {
      max-width: none;
    }
  }
}
```

## Resources

http://dev.openlayers.org/apidocs/files/OpenLayers/Map-js.html
http://wiki.openstreetmap.org/wiki/OpenLayers_Simple_Example
http://wiki.openstreetmap.org/wiki/Creating_your_own_tiles

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
