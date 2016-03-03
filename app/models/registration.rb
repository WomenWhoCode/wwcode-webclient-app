class Registration 

  def initialize(new_user_hash)
    @username = new_user_hash['username']
    @email = new_user_hash['email']
    @password = new_user_hash['password']
    @password_confirmation = new_user_hash['password_confirmation']
    @access_code = new_user_hash['access_code']
  end

  def self.create(attributes)
    new_user_hash = Unirest.post("#{ENV['API_DOMAIN']}/auth",
              headers: {"Accept" => "application/json"},
              parameters: attributes)
    Registration.new(new_user_hash.body["data"])
    return new_user_hash
  end

end