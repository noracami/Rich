import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["likeButton"]

  connect() {
    console.log(this.element.dataset.liked)
    this.setLiked(!(this.element.dataset.liked === "true"))
  }

  setLiked(flag) {
    console.log(flag ? `can like` : `can unlike`)
    this.likeButtonTarget.textContent = flag ? "按讚" : "收回讚"
  }

  like_article() {
    const articleId = this.element.dataset.articleId
    Rails.ajax({
      url: `/api/v1/articles/${articleId}/like`,
      type: "post",
      success: ({ state }) => {
        if (state === "like") {
          this.setLiked(true)
        } else {
          this.setLiked(false)
        }
      },
      error: (resp) => {
        console.log(resp)
      },
    })
  }
}
