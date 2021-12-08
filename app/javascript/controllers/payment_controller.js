import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"


export default class extends Controller {
  static values = {
    token: String,
  }
static targets = ["dropin","nonce"]

connect() {
  const form = this.element.parentNode
  dropin
    .create({
      container: this.dropinTarget,
      authorization: this.tokenValue,
    })
    .then((instance) => {
      form.addEventListener("submit", (e) => {
        e.preventDefault()

        instance.requestPaymentMethod().then(({ nonce }) => {
          this.nonceTarget.value = nonce
          form.submit()
        })
      })
    })
    .catch((err) => {
      console.log("ERROR: ", err)
    })
  }
}