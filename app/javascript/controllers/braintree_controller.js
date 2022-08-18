import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  static targets = ["payment"]

  connect() {
    const { token } = this.element.dataset
    dropin
      .create({
        authorization: token,
        container: this.paymentTarget,
      })
      .then((instance) => {
        this.element.addEventListener("submit", (event) => {
          event.preventDefault()

          instance
            .requestPaymentMethod()
            .then((payload) => {
              // Step four: when the user is ready to complete their
              //   transaction, use the dropinInstance to get a payment
              //   method nonce for the user's selected payment method, then add
              //   it a the hidden field before submitting the complete form to
              //   a server-side integration
              this.createNonceField(payload.nonce)
              // document.getElementById('nonce').value = payload.nonce;
              this.element.submit()
            })
            .catch((error) => {
              throw error
            })
        })
      })
      .catch((error) => {
        console.log(error)
      })
  }

  // disconnect() {}

  createNonceField(nonce) {
    const field = document.createElement("input")
    field.setAttribute("type", "hidden")
    field.setAttribute("name", "nonce")
    field.setAttribute("value", nonce)
    this.element.appendChild(field)
  }

  close() {
    this.element.remove()
  }
}
