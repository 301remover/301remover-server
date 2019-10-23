defmodule Unshortener.ShortenersTest do
  use Unshortener.DataCase

  alias Unshortener.Shorteners

  describe "shorteners" do
    alias Unshortener.Shorteners.Shortener

    @valid_attrs %{domain: "some domain", shortcode_alphabet: "some shortcode_alphabet", supports_https: true, url_pattern: "some url_pattern"}
    @update_attrs %{domain: "some updated domain", shortcode_alphabet: "some updated shortcode_alphabet", supports_https: false, url_pattern: "some updated url_pattern"}
    @invalid_attrs %{domain: nil, shortcode_alphabet: nil, supports_https: nil, url_pattern: nil}

    def shortener_fixture(attrs \\ %{}) do
      {:ok, shortener} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shorteners.create_shortener()

      shortener
    end

    test "list_shorteners/0 returns all shorteners" do
      shortener = shortener_fixture()
      assert Shorteners.list_shorteners() == [shortener]
    end

    test "get_shortener!/1 returns the shortener with given id" do
      shortener = shortener_fixture()
      assert Shorteners.get_shortener!(shortener.id) == shortener
    end

    test "create_shortener/1 with valid data creates a shortener" do
      assert {:ok, %Shortener{} = shortener} = Shorteners.create_shortener(@valid_attrs)
      assert shortener.domain == "some domain"
      assert shortener.shortcode_alphabet == "some shortcode_alphabet"
      assert shortener.supports_https == true
      assert shortener.url_pattern == "some url_pattern"
    end

    test "create_shortener/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shorteners.create_shortener(@invalid_attrs)
    end

    test "update_shortener/2 with valid data updates the shortener" do
      shortener = shortener_fixture()
      assert {:ok, %Shortener{} = shortener} = Shorteners.update_shortener(shortener, @update_attrs)
      assert shortener.domain == "some updated domain"
      assert shortener.shortcode_alphabet == "some updated shortcode_alphabet"
      assert shortener.supports_https == false
      assert shortener.url_pattern == "some updated url_pattern"
    end

    test "update_shortener/2 with invalid data returns error changeset" do
      shortener = shortener_fixture()
      assert {:error, %Ecto.Changeset{}} = Shorteners.update_shortener(shortener, @invalid_attrs)
      assert shortener == Shorteners.get_shortener!(shortener.id)
    end

    test "delete_shortener/1 deletes the shortener" do
      shortener = shortener_fixture()
      assert {:ok, %Shortener{}} = Shorteners.delete_shortener(shortener)
      assert_raise Ecto.NoResultsError, fn -> Shorteners.get_shortener!(shortener.id) end
    end

    test "change_shortener/1 returns a shortener changeset" do
      shortener = shortener_fixture()
      assert %Ecto.Changeset{} = Shorteners.change_shortener(shortener)
    end
  end
end
