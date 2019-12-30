class UsersController < ApplicationController
  @@token = "b356166581e64488aa7b95b8817465ffe23b0c64"
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
