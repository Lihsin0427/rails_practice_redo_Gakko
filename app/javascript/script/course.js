import axios from "axios"

document.addEventListener("turbolinks:load", () => {
  const likeBtn = document.querySelector("#like-btn")

  if (likeBtn) {
    likeBtn.addEventListener("click", () => {
      axios.get("https://randomuser.me/api/?results=5").then(({ data }) => {
        data.results.forEach((u) => {
          console.log(u.email)
        })
        likeBtn.classList.add("favorited")
      })
    })
  }
})