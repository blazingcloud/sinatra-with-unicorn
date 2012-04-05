require 'rack/test'
require_relative '../module_loader'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

#https://gist.github.com/1523353
class Sinatra::Base
  @@prepared = nil

  def self.onion_core
    onion = prototype
    loop do
      onion = onion.instance_variable_get('@app')
      return onion if onion.class == self || onion.nil?
    end
  end

  def self.prepare_instance
    @@prepared = onion_core
  end

  # Override
  def call(env)
    d = @@prepared || dup
    @@prepared = nil
    d.call!(env)
  end
end
