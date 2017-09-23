using import "enet.odin";
import "core:fmt.odin";

main :: proc() {
	initialize();
	defer deinitialize();

	client: ^Host;
	address: Address;
	peer: ^Peer;
	event: Event;

	client = host_create(nil, 1, 2, 0, 0);

	if client == nil {
		fmt.println("Couldn't create socket!");
	}

	host_name := "127.0.0.1\x00";
	c_host_name := &host_name[0];

	address_set_host_ip(&address, c_host_name);
	address.port = 27010;

	fmt.println("Host IP set!");

	peer = host_connect(client, &address, 0, 0);

	if peer == nil {
		fmt.println("Yuk!");
	}

	fmt.println("Establishing connection!");

	if host_service(client, &event, 5000) > 0 && event.event_type == EventType.Connect {
		fmt.println("It works!");
	}
	else {
		fmt.println("Nay!");
		peer_reset(peer);
	}
}