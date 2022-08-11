import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  like_article() {
    const articleId = this.element.dataset.articleId
    Rails.ajax({
      url: `/api/v1/articles/${articleId}/like`,
      type: "post",
      success: (resp) => {
        console.log(resp)
      },
      error: (resp) => {
        console.log(resp)
      },
    })
  }
}
