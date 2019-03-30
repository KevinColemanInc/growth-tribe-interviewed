require 'net/http'
require 'uri'

class GetTree
  def tree
    Tree.new(JSON.parse(raw_json))
  end

  def raw_json
    return $raw_json if defined?($raw_json)
    uri = URI.parse("https://random-tree.herokuapp.com/")
    response = Net::HTTP.get_response(uri)
    
    $raw_json = response.body
  end
end


