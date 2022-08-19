import { Controller } from "stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    console.log(this.element)
    Sortable.create(this.element)
  }
  // TODO Sortable
  // disconnect() {}
}
