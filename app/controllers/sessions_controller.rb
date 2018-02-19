class SessionsController < ApplicationController

  def create
    # raise params.inspect
    # binding.pry

    # {"provider"=>"facebook",
    #  "uid"=>"10156760494199749",
    #  "info"=>
    #   {"email"=>"dreamaire@hotmail.com",
    #    "name"=>"Hoon Lee",
    #    "image"=>"http://graph.facebook.com/v2.6/10156760494199749/picture"},
    #  "credentials"=>
    #   {"token"=>
    #     "EAACR09ljRBIBAGcGfI8AqtmHZC648rNe1cl8kQkFQqBCauxvaEduZACZAx1mOAl8XW1ZCUXlcywZAgerUX4aHJZBVZ
    # MaiZCiZA22ZBAzHeFjeE9LchocNhZAJotUjE9w3RgBGAZCutHq5CSnReqpmfCjzjsXTDRIZCQZDZD",
    #    "expires_at"=>1524188299,
    #    "expires"=>true},
    #  "extra"=>
    #   {"raw_info"=>
    #     {"name"=>"Hoon Lee",
    #      "email"=>"dreamaire@hotmail.com",
    #      "id"=>"10156760494199749"}}}

    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.name = auth["info"]["name"]
      u.email = auth["info"]["email"]
      u.uid = auth["uid"]
    end

    session[:user_id] = @user.id





  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end
