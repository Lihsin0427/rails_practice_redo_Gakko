// import httpClient from "lib/http/client"

// document.addEventListener("turbolinks:load", () => {

//   const likeBtn = document.querySelector("#like-btn")

//   if (likeBtn) {
//     likeBtn.addEventListener("click", () => {
//       const courseID = likeBtn.dataset.id

//       httpClient.post(`/api/v1/courses/${courseID}/like`).then(({ data }) => {
//         console.log(data)
//         if (data.result === "like"){
//           likeBtn.classList.add("favorited")
//         } else {
//           likeBtn.classList.remove("favorited")
//         }
//       })
//     })
//   }
// })

