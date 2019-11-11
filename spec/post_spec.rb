describe "cadastro" do

  it "novo usuario" do

    Database.new.delete_user("me1@papito.io")

    result = HTTParty.post("http://127.0.0.1:3000/user", 
    body: {full_name: "Fernando Papito", email: "me1@papito.io", password: "jarvis123"}.to_json,
    headers: {
      "Content-Type" => "application/json"
    })

    expect(result.response.code).to eql "200"
  end
end
