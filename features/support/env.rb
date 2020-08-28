require 'rspec'
require 'httparty'

require_relative 'helpers'

DATA = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/loja.yml"))

Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].each { |file| require file }

World(INSTANCIAS)
World(Helpers)