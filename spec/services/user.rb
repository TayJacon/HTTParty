class ApiUser
  include HTTParty
  base_uri "http://127.0.0.1:3000"
  headers  "Content-Type" => "application/json"

  def self.save(user)
    post("/user", body: user.to_json)
  end

  def self.find(token, user_id)
    get("/user/#{user_id}", headers: { "Authorization" => token})
  end

  def self.token(user_email, user_pass)
    result = post("/auth", body: {email: user_email, password: user_pass}.to_json)
    "JWT #{result.parsed_response["token"]}"
  end
end
