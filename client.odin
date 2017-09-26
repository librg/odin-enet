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

	address_set_host_ip(&address, &host_name[0]);
	address.port = 27010;

	fmt.println("Host IP set!");

	peer = host_connect(client, &address, 0, 0);
	defer host_destroy(client);
	defer peer_reset(peer);

	if peer == nil {
		fmt.println("Yuk!");
	}

	fmt.println("Establishing connection!");

	if host_service(client, &event, 1000) > 0 && event.event_type == Event_Type.Connect {
		fmt.println("It works!");
		data := []u32 {1, 2, 3};
		fmt.println(data);
		packet := packet_create(&data[0], size_of(u32)*3, Packet_Flag.Reliable);
		peer_send(peer, 0, packet);
		host_flush(client);
	}
	else {
		fmt.println("Nay!");
	}

}