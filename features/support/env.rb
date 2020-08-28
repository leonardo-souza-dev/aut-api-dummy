require 'rspec'
require 'httparty'

DATA = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/loja.yml"))

Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].each { |file| require file }

World(INSTANCIAS)