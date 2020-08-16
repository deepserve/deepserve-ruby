class Deepserve
  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end

  def self.project(permalink)
    Deepserve::Project.new(permalink)
  end
end

require_relative './deepserve/rest_api.rb'
require_relative './deepserve/graphql_api.rb'
require_relative './deepserve/project.rb'
