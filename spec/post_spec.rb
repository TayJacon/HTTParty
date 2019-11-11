describe "post" do
    context "quando cadastro um novo usuario" do
      before do 
        @new_user = {full_name: "Test skywalker", email: "test@jedi.com", password: "jedi123"}
        Database.new.delete_user(@new_user[:email])

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
