class Network 

  attr_accessor :id,
    :objectId,
    :awesome_count,
    :image_url,
    :latitude,
    :longitude,
    :meetup_group_id,
    :time_zone,
    :title

  def initialize(hash)
    @id = hash["id"]
    @awesome_count = hash["awesome_count"]
    @image_url = hash["image_url"]
    @latitude = hash["latitude"]
    @longitude = hash["longitude"]
    @meetup_group_id = hash["meetup_group_id"]
    @time_zone = hash["time_zone"]
    @title = hash["title"]
  end

  def self.all
    networks = []
    network_hashes = Unirest.get("http://staging-wwcode-api.herokuapp.com/api/v1/networks.json",
        headers: {"Accept" => "application/json"}).body
    network_hashes.each do |network_hash|
      networks << Network.new(network_hash)
    end
    return networks
  end

end
