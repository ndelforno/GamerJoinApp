class UsersController < ApplicationController
  @@token = "91d05ba9314a8674642feacc02bd3ab3af4e1d6d"
  def show
    @user = User.find(params[:id])
    @xuid = getxuid(@user)
    @xboxprofile = getxboxprofile(@xuid)
  end

  def getxuid(user)
    url = "https://xboxapi.com/v2/xuid/#{@user.username}"
    puts url
    response = HTTParty.get(url, headers: {"X-Auth" => @@token })
    puts response
    body = JSON.parse(response.body)
    return body
  end


  def getxboxprofile(xuid)
      url = "https://xboxapi.com/v2/#{xuid}/profile"
      puts url
      response = HTTParty.get(url, headers: {"X-Auth" => @@token})
      puts response
      body = JSON.parse(response.body)
      return body
  end

end
