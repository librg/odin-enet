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

	server = host_create(&address, 32, 2, 0, 0);

	if server == nil {
		fmt.println("Couldn't create socket!");
	}
	defer host_destroy(server);

	loop: for true {
		for host_service(server, &event, 1000) > 0 {
			if event.event_type == EventType.Connect {
				//fmt.printf("User has been connected from %x\n", event.peer->address.host);
				fmt.println("Incoming connection!");
				peer_disconnect(event.peer, 0xBADF00D);
				break loop;
			}
		}
	}
}