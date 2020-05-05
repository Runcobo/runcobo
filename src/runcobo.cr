require "jbuilder"
require "./tops/**"
require "./runcobo/**"
require "./commands/**"
require "radix"

module Runcobo
  # Starts Runcobo App with host ("0.0.0.0"), port (3000), reuse_port (false) and handlers (Runcobo::Server.default_handlers).
  #
  # Or read ENV["HOST"] as host, read ENV["PORT"] as port.
  # ```
  # Runcobo.start
  # ```
  #
  # Starts with custom host, port, reuse_port and handlers.
  # ```
  # Runcobo.start(
  #   host: "0.0.0.0",
  #   port: "5000",
  #   reuse_port: true,
  #   handlers: [
  #     Runcobo::RouteHandler.new,
  #     Runcobo::RouteNotFoundHandler.new,
  #   ]
  # )
  # ```
  def self.start(*,
                 host : String = ENV["HOST"]? || "0.0.0.0",
                 port : Int32 = (ENV["PORT"]? || 3000).to_i,
                 reuse_port : Bool = false,
                 handlers : Array(HTTP::Handler) = Runcobo::Server.default_handlers)
    server = Runcobo::Server.new
    server.host = host
    server.port = port
    server.reuse_port = reuse_port
    server.handlers = handlers
    server.listen
  end
end
