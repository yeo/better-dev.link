defmodule Betterdev.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Betterdev.Web, :controller
      use Betterdev.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: Betterdev.Web
      import Plug.Conn
      import Betterdev.Web.Router.Helpers
      import Betterdev.Web.Gettext

      plug NewRelic.Instrumentation.Plug
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/betterdev/web/templates",
                        namespace: Betterdev.Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Betterdev.Web.Router.Helpers
      import Betterdev.Web.ErrorHelpers
      import Betterdev.Web.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Betterdev.Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
