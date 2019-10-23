defmodule UnshortenerWeb.ShortenerControllerTest do
  use UnshortenerWeb.ConnCase

  alias Unshortener.Shorteners
  alias Unshortener.Shorteners.Shortener

  @create_attrs %{
    domain: "some_domain.com",
    shortcode_alphabet: "some shortcode_alphabet",
    supports_https: true,
    url_pattern: "some url_pattern"
  }
  @update_attrs %{
    domain: "some-updated-domain.com",
    shortcode_alphabet: "some updated shortcode_alphabet",
    supports_https: false,
    url_pattern: "some updated url_pattern"
  }
  @invalid_attrs %{domain: nil, shortcode_alphabet: nil, supports_https: nil, url_pattern: nil}

  def fixture(:shortener) do
    {:ok, shortener} = Shorteners.create_shortener(@create_attrs)
    shortener
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shorteners", %{conn: conn} do
      conn = get(conn, Routes.shortener_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shortener" do
    test "renders shortener when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shortener_path(conn, :create), shortener: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shortener_path(conn, :show, id))

      assert %{
               "id" => id,
               "domain" => "some_domain.com",
               "shortcode_alphabet" => "some shortcode_alphabet",
               "supports_https" => true,
               "url_pattern" => "some url_pattern"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shortener_path(conn, :create), shortener: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shortener" do
    setup [:create_shortener]

    test "renders shortener when data is valid", %{
      conn: conn,
      shortener: %Shortener{id: id} = shortener
    } do
      conn = put(conn, Routes.shortener_path(conn, :update, shortener), shortener: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shortener_path(conn, :show, id))

      assert %{
               "id" => id,
               "domain" => "some-updated-domain.com",
               "shortcode_alphabet" => "some updated shortcode_alphabet",
               "supports_https" => false,
               "url_pattern" => "some updated url_pattern"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shortener: shortener} do
      conn = put(conn, Routes.shortener_path(conn, :update, shortener), shortener: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shortener" do
    setup [:create_shortener]

    test "deletes chosen shortener", %{conn: conn, shortener: shortener} do
      conn = delete(conn, Routes.shortener_path(conn, :delete, shortener))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shortener_path(conn, :show, shortener))
      end
    end
  end

  defp create_shortener(_) do
    shortener = fixture(:shortener)
    {:ok, shortener: shortener}
  end
end
