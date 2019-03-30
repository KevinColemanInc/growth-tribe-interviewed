require 'net/http'
require 'uri'

class GetTree
  def tree
    return @tree if defined?(@tree)
    @tree = Tree.new(JSON.parse(raw_json))
  end

  def raw_json
    uri = URI.parse("https://random-tree.herokuapp.com/")
    response = Net::HTTP.get_response(uri)
    response.body
  end
end


