defmodule UnshortenerWeb.Router do
  use UnshortenerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UnshortenerWeb do
    pipe_through :api
    get("/shorteners", ShortenerController, :index)
    get("/shorteners/:id", ShortenerController, :show)
    post("/unshorten", UrlUnshortenController, :index)
    get("/redirect/:domain/:shortcode", RedirectController, :show)
  end
end
