defmodule MediumGraphqlApiWeb.PageController do
  use MediumGraphqlApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
