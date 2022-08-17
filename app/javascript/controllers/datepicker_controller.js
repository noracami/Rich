import { Controller } from "stimulus"
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

export default class extends Controller {
  connect() {
    console.log("hi")
    flatpickr(this.element, { enableTime: true })
  }

  // disconnect() {}

  close() {
    this.element.remove()
  }
}
