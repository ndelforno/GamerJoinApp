class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    url = "https://xboxapi.com/v2/xuid/#{@user.username}"
    print url
    response = HTTParty.get(url, :headers {"X-Auth" => "91d05ba9314a8674642feacc02bd3ab3af4e1d6d"})
    print response
    body = JSON.parse(response.body)
  end
end
