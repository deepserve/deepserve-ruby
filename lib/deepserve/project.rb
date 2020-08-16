require 'rest-client'
class Deepserve::Project
  attr_reader :permalink, :permalink

  def initialize(permalink)
    @permalink = permalink
  end

  def predict(data)
    Deepserve::GraphqlApi.predict(@permalink, data)
  end
end
