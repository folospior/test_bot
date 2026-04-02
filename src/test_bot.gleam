import gleam/erlang/process
import grom
import grom/gateway
import spectator

pub fn main() -> Nil {
  let assert Ok(_) = spectator.start()

  let assert Ok(token) = envoy.get("DISCORD_BOT")

  let client = grom.Client(token:)

  let identify =
    client
    |> gateway.identify(intents: [])

  let assert Ok(data) = gateway.get_data(client)

  let assert Ok(_gateway) =
    gateway.new(Nil, identify, data)
    |> gateway.start

  process.sleep_forever()
}
