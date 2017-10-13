using import "enet.odin";
import "core:fmt.odin";

main :: proc() {
	initialize();
	defer deinitialize();

	server: ^Host;
	address: Address;
	peer: ^Peer;
	event: Event;

	address.host = HOST_ANY;
	address.port = 27010;

	server = host_create(&address, 32, 4, 0, 0);

	if server == nil {
		fmt.println("Couldn't create socket!");
	}
	defer host_destroy(server);

	loop: for true {
		for host_service(server, &event, 1000) > 0 {
			switch event.event_type {
				case Event_Type.Connect:
					fmt.println("Incoming connection!");

				case Event_Type.Receive:
					data     := cast(^u32)event.packet.data;
					value    := cast(u32)data^;
					array := []u32 {(data)^, (data+1)^, (data+2)^};
					data_len := event.packet.data_len;

					fmt.println("Data received", array, "of size", data_len);
					peer_disconnect(event.peer, 42);
			}
		}
	}
}