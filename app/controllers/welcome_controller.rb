class WelcomeController < ApplicationController
  def home
    # escape 跳脫
    # render html: "<h1>hi</h1>".html_safe
    # render file: "abc.html"
    @lottery = [*1..43].sample(6)
  end

  def about

  end
end
