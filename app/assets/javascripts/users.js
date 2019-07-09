console.log('test');

const fetchXboxProfile = (query) => {
  return axios({
    url: "https://xboxapi.com/v2/xuid/" + query,
    method: 'get',
    data: '',
    dataType: 'json',
    headers: {
      "X-Auth" : "91d05ba9314a8674642feacc02bd3ab3af4e1d6d",
    }
  });
};

  document.addEventListener("turbolinks:load", async (event) =>{
    console.log("test");
    const hasUserName = document.getElementById('username').innerText;
    console.log(hasUserName)
    if (hasUserName) {
      const {
        data
      } = await fetchXboxProfile(hasUserName)

      var xuid = data["xuid"]
      console.log(xuid);
    }
  })
