describe "post" do
    context "quando cadastro um novo usuario" do
      before do 
        @new_user = build(:user).to_hash

        @result = HTTParty.post(
          "http://127.0.0.1:3000/user",
          body: @new_user.to_json,
          headers: {
            "Content-Type" => "application/json"
          }
        )
      end

      it {expect(@result.response.code).to eql "200"}
    end
end
