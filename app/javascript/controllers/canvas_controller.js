import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("hi")
    if (this.element.getContext) {
      var ctx = this.element.getContext("2d")

      ctx.fillRect(25, 25, 100, 100)
      ctx.clearRect(45, 45, 60, 60)
      ctx.strokeRect(50, 50, 50, 50)
    }
  }
}
