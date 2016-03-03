class Profile

  attr_accessor :id,
    :full_name,
    :image_url,
    :job_title,
    :latitude,
    :longitude,
    :network_id,
    :photo,
    :theme_type,
    :user_id

  def initialize(hash)
    @id = hash["id"]
    @full_name = hash["full_name"]
    @image_url = hash["image_url"]
    @job_title = hash["job_title"]
    @latitude = hash["latitude"]
    @longitude = hash["longitude"]
    @network_id = hash["network_id"]
    @photo = hash["photo"]
    @theme_type = hash["theme_type"]
    @user_id = hash["user_id"]
  end

  def self.search(search_params)
    profiles = []
    profile_hashes = Unirest.post("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json/?search_params=#{search_params}",
      headers: {"Accept" => "application/json"}).body
    profile_hashes.each do |profile_hash|
      profiles << Profile.new(profile_hash)
    end
    return profiles
  end

  def self.find(id)
    profile_hash = Unirest.get("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json",
      headers: {"Accept" => "application/json"}).body
    Profile.new(profile_hash)
  end

  def self.all
    profiles = []
    profile_hashes = Unirest.get("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json",
        headers: {"Accept" => "application/json"}).body
    profile_hashes.each do |profile_hash|
      profiles << Profile.new(profile_hash)
    end
    return profiles
  end

  def self.create(attributes)
    profile_hash = Unirest.post("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json", 
      headers: {"Accept" => "application/json"},
      parameters: attributes).body
  end

  def update(attributes)
    profile_hash = Unirest.patch("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json", 
      headers: {"Accept" => "application/json"},
      parameters: attributes).body
  end

  def destroy
    Unirest.delete("http://staging-wwcode-api.herokuapp.com/api/v1/profiles.json", 
      headers: {"Accept" => "application/json"}).body
  end
end
