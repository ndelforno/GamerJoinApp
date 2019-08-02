class UsersController < ApplicationController
  @@token = "91d05ba9314a8674642feacc02bd3ab3af4e1d6d"
  def show
    @user = User.find(params[:id])
    @xuid = get_xuid(@user)
    @xboxprofile = get_xbox_profile(@xuid)
    @xboxonegames = get_xbox_one_games(@xuid)
  end

  def get_xuid(user)
    url = "https://xboxapi.com/v2/xuid/#{@user.username}"
    response = HTTParty.get(url, headers: {"X-Auth" => @@token })
    body = JSON.parse(response.body)
    return body
  end


  def get_xbox_profile(xuid)
      url = "https://xboxapi.com/v2/#{xuid}/profile"
      response = HTTParty.get(url, headers: {"X-Auth" => @@token})
      body = JSON.parse(response.body)
      return body
  end

  def get_xbox_one_games(xuid)
    url = "https://xboxapi.com/v2/#{xuid}/xboxonegames"
    response = HTTParty.get(url, headers: {"X-Auth" => @@token})
    body = JSON.parse(response.body)
    return body
  end

end
