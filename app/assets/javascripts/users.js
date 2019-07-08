const fetchXboxProfile = (query) => {
  return axios({
    url: "https://xboxapi.com/v2/profile",
    method: 'get',
    data: '',
    dataType: 'json',
    headers: {
      X-AUTH:"91d05ba9314a8674642feacc02bd3ab3af4e1d6d"
    }
  });

  document.addEventListener("turbolinks:load", async (event) =>{
    const hasUsername = document.getElementById('username')
  })
};
