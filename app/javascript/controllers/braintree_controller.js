import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  static targets = ["payment"]

  connect() {
    dropin
      .create({
        authorization: "123",
        container: this.paymentTarget,
      })
      .then((instance) => {
        console.log(instance)
      })
      .catch((error) => {
        console.log(error)
      })
  }

  // disconnect() {}

  close() {
    this.element.remove()
  }
}
