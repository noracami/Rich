import { Controller } from "stimulus"
import ax from "lib/http/client"

export default class extends Controller {
  like_article() {
    const articleId = this.element.dataset.articleId
    // 打 api -> post /api/v1/articles/6/like
    ax.post(`/api/v1/articles/${articleId}/like`).then((resp) => {
      console.log(resp.data)
    })
  }
}
