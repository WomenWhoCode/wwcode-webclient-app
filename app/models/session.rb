class Session

  def self.create(attributes)
    new_session_hash = Unirest.post("#{ENV['API_DOMAIN']}/auth/sign_in",
              headers: {"Accept" => "application/json"},
              parameters: attributes)
    
    return new_session_hash
  end

  def self.destroy(authentication_headers)
    Unirest.delete("#{ENV['API_DOMAIN']}/auth/sign_out",
              headers: authentication_headers)
  end

end