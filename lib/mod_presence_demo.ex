defmodule ModPresenceDemo do
  require Record
  Record.defrecord(:request, Record.extract(:request, from: "include/ejabberd_http.hrl"))

  use Ejabberd.Module

  def start(host, _opts) do
    info('Starting ejabberd module Presence Demo')
    Ejabberd.Hooks.add(:set_presence_hook, host, __MODULE__, :on_presence, 50)
    :ok
  end

  def stop(host) do
    info('Stopping ejabberd module Presence Demo')
    Ejabberd.Hooks.delete(:set_presence_hook, host, __MODULE__, :on_presence, 50)
    :ok
  end

  def on_presence(user, _server, _resource, _packet) do
    info('Receive presence for #{user}')
    :none
  end

  def depends(_host, _opts) do
    []
  end

  def mod_options(_host) do
    []
  end

  def process(url_params, request(method: :PUT, data: body) = request) do
    IO.puts("------------------------")
    IO.inspect(url_params)
    IO.inspect(request)
    IO.inspect(body)
    IO.puts("------------------------")

    {200, [], "dummy response"}
  end

  def process(url_params, request(method: :POST, data: body)) do
    IO.puts("------------------------")
    IO.inspect(url_params)
    IO.inspect(body)
    IO.puts("------------------------")

    {200, [], "dummy response"}
  end
end
