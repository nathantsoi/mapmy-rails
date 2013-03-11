require 'open-uri'
require 'nokogiri'

namespace :assets do
  desc 'update openlayers assets from openlayers.org'
  task :update do |t, args|
    OPEN_LAYERS_DIR = args[:open_layers_dir]||'http://openlayers.org/download'
    LOCAL_CACHE = '/tmp'
    RAILS_ROOT = File.expand_path('../../../', __FILE__)
    giri = Nokogiri::HTML(open(OPEN_LAYERS_DIR))
    latest = giri.css('tr td a').select{|el| el.text =~ /tar\.gz$/}.last.attr('href')
    tmp_tgz = File.join(LOCAL_CACHE, latest)
    tmp_extract = tmp_tgz.gsub(/\.tar\.gz$/, '')
    File.open(tmp_tgz, 'wb') { |f|
      f.write(open("#{OPEN_LAYERS_DIR}/#{latest}").read)
    }
    `cd #{LOCAL_CACHE} && tar -xzf #{latest}`
    `cp #{File.join(tmp_extract, '*.js')} #{File.join(RAILS_ROOT, 'vendor', 'assets', 'javascripts', 'openlayers')}`
    `cp -r #{File.join(tmp_extract, 'theme')} #{File.join(RAILS_ROOT, 'vendor', 'assets', 'stylesheets', 'openlayers')}`
  end

end
