when ODIN_OS == "windows" {
	import "core:sys/windows.odin";
	foreign import enet32 "enet.lib";
}

using import "enet/list.odin";
using import "enet/protocol.odin";


foreign enet32 {

	@(link_name="enet_initialize")
	initialize                     :: proc() -> i32 ---;

	@(link_name="enet_initialize_with_callbacks")
	initialize_with_callbacks      :: proc(version: u32, inits: ^Callbacks) ---;

	@(link_name="enet_deinitialize")
	deinitialize                   :: proc() ---;

	@(link_name="enet_linked_version")
	linked_version                 :: proc() -> u32 ---;


	@(link_name="enet_time_get")
	time_get                       :: proc() -> u64 ---;

	@(link_name="enet_time_set")
	time_set                       :: proc(time: u64) ---;


	@(link_name="enet_socket_create")
	socket_create                  :: proc(sock_type: Socket_Type) -> Socket ---;

	@(link_name="enet_socket_bind")
	socket_bind                    :: proc(socket: Socket, address: ^Address) -> int ---;

	@(link_name="enet_socket_get_address")
	socket_get_address             :: proc(socket: Socket, address: ^Address) -> int ---;

	@(link_name="enet_socket_listen")
	socket_listen                  :: proc(socket: Socket, arg1: int) -> int ---;

	@(link_name="enet_socket_accept")
	socket_accept                  :: proc(socket: Socket, address: ^Address) -> Socket ---;

	@(link_name="enet_socket_connect")
	socket_connect                 :: proc(socket: Socket, address: ^Address) -> int ---;

	@(link_name="enet_socket_send")
	socket_send                    :: proc(socket: Socket, address: ^Address, buffer: ^Buffer, buffer_count: uint) -> int ---;

	@(link_name="enet_socket_receive")
	socket_receive                 :: proc(socket: Socket, address: ^Address, buffer: ^Buffer, buffer_count: uint) -> int ---;

	@(link_name="enet_socket_wait")
	socket_wait                    :: proc(socket: Socket, arg1: ^u32, arg2: u64) -> int ---;

	@(link_name="enet_socket_set_option")
	socket_set_option              :: proc(socket: Socket, option: Socket_Option, arg2: int) -> int ---;

	@(link_name="enet_socket_get_option")
	socket_get_option              :: proc(socket: Socket, option: Socket_Option, arg2: int) -> int ---;

	@(link_name="enet_socket_shutdown")
	socket_shutdown                :: proc(socket: Socket, shutdown: Socket_Shutdown) -> int ---;

	@(link_name="enet_socket_destroy")
	socket_destroy                 :: proc(socket: Socket) ---;

	@(link_name="enet_socketset_select")
	socketset_select               :: proc(socket: Socket, sock_set: rawptr, sock_set2: rawptr, arg3: u32) -> int ---;


	@(link_name="enet_address_set_host_ip")
	address_set_host_ip            :: proc(address: ^Address, host_name: ^u8) -> i32 ---;

	@(link_name="enet_address_set_host")
	address_set_host               :: proc(address: ^Address, host_name: ^u8) -> i32 ---;

	@(link_name="enet_address_get_host_ip")
	address_get_host_ip            :: proc(address: ^Address, host_name: ^u8, name_length: uint) -> i32 ---;

	@(link_name="enet_address_get_host")
	address_get_host               :: proc(address: ^Address, host_name: ^u8, name_length: uint) -> i32 ---;


	@(link_name="enet_packet_create")
	packet_create                  :: proc(data: rawptr, data_length: uint, flags: Packet_Flag) -> ^Packet ---;

	@(link_name="enet_packet_create_offset")
	packet_create_offset           :: proc(data: rawptr, data_length, data_offset: uint, flags: Packet_Flag) -> ^Packet ---;

	@(link_name="enet_packet_destroy")
	packet_destroy                 :: proc(packet: ^Packet) ---;

	@(link_name="enet_packet_resize")
	packet_resize                  :: proc(packet: ^Packet, data_length: uint) -> int ---;

	@(link_name="enet_crc32")
	crc32                          :: proc(buffer: ^Buffer, buffer_count: uint) -> u32 ---;


	@(link_name="enet_host_create")
	host_create                    :: proc(address: ^Address, max_conn: uint, max_chan: uint, expected_in_bandwidth: u32, expected_out_bandwidth: u32) -> ^Host ---;

	@(link_name="enet_host_destroy")
	host_destroy                   :: proc(host: ^Host) ---;

	@(link_name="enet_host_connect")
	host_connect                   :: proc(host: ^Host, address: ^Address, chan_count: uint, data: u32) -> ^Peer ---;

	@(link_name="enet_host_check_events")
	host_check_events              :: proc(host: ^Host, event: ^Event) -> int ---;

	@(link_name="enet_host_service")
	host_service                   :: proc(host: ^Host, event: ^Event, timeout: u32) -> int ---;

	@(link_name="enet_host_flush")
	host_flush                     :: proc(host: ^Host) ---;

	@(link_name="enet_host_broadcast")
	host_broadcast                 :: proc(host: ^Host, chan_id: u8, packet: ^Packet) ---;

	@(link_name="enet_host_compress")
	host_compress                  :: proc(host: ^Host, compressor: ^Compressor) ---;

	@(link_name="enet_host_compress_with_range_coder")
	host_compress_with_range_coder :: proc(host: ^Host) -> int ---;

	@(link_name="enet_host_channel_limit")
	host_channel_limit             :: proc(host: ^Host, chan_limit: uint) ---;

	@(link_name="enet_host_bandwidth_limit")
	host_bandwidth_limit           :: proc(host: ^Host, in_bandwidth: u32, out_bandwidth: u32) ---;


	@(link_name="enet_peer_send")
	peer_send                      :: proc(peer: ^Peer, channel_id: u8, packet: ^Packet) -> int ---;

	@(link_name="enet_peer_receive")
	peer_receive                   :: proc(peer: ^Peer, channel_id: ^u8) -> ^Packet ---;

	@(link_name="enet_peer_ping")
	peer_ping                      :: proc(peer: ^Peer) ---;

	@(link_name="enet_peer_ping_interval")
	peer_ping_interval             :: proc(peer: ^Peer, ping_interval: u32) ---;

	@(link_name="enet_peer_timeout")
	peer_timeout                   :: proc(peer: ^Peer, timeout_limit: u32, timeout_minimum: u32, timeout_maximum: u32) ---;

	@(link_name="enet_peer_reset")
	peer_reset                     :: proc(peer: ^Peer) ---;

	@(link_name="enet_peer_disconnect")
	peer_disconnect                :: proc(peer: ^Peer, data: u32) ---;

	@(link_name="enet_peer_disconnect_now")
	peer_disconnect_now            :: proc(peer: ^Peer, data: u32) ---;

	@(link_name="enet_peer_disconnect_later")
	peer_disconnect_later          :: proc(peer: ^Peer, data: u32) ---;

	@(link_name="enet_peer_throttle_configure")
	peer_throttle_configure        :: proc(peer: ^Peer, interval: u32, acceleration: u32, deceleration: u32) ---;
}


Socket_Type :: enum i32 {
	Stream   = 1,
	Datagram = 2,
}

Socket_Wait :: enum i32 {
	None      = 0,
	Send      = (1 << 0),
	Receive   = (1 << 1),
	Interrupt = (1 << 2),
}

Socket_Option :: enum i32 {
	Non_Blocking    = 1,
	Broadcast       = 2,
	Receive_Buffer  = 3,
	Send_Buffer     = 4,
	Reuse_Address   = 5,
	Receive_Timeout = 6,
	Send_Timeout    = 7,
	Error           = 8,
	No_Delay        = 9,
}

Socket_Shutdown :: enum i32 {
	Read      = 0,
	Write     = 1,
	ReadWrite = 2,
}

Packet_Flag :: enum i32 {
	Reliable            = (1 << 0),
	Unsequenced         = (1 << 1),
	No_Allocate         = (1 << 2),
	Unreliable_Fragment = (1 << 3),
	Sent                = (1 << 8),
}

Peer_State :: enum i32 {
	Disconnected             = 0,
	Connecting               = 1,
	Acknowledging_Connect    = 2,
	Connection_Pending       = 3,
	Connection_Succeeded     = 4,
	Connected                = 5,
	Disconnect_Later         = 6,
	Disconnecting            = 7,
	Acknowledging_Disconnect = 8,
	Zombie                   = 9,
}

Event_Type :: enum i32 {
	None       = 0,
	Connect    = 1,
	Disconnect = 2,
	Receive    = 3,
}

Address :: struct #ordered {
	host: u32,
	port: u16,
}

Packet :: struct #ordered {
	ref_count: uint,
	flags: u32,
	data: ^u8,
	data_len: uint,
	free_cb: Packet_Free_Callback,
	user_data: rawptr,
}

Acknowledgement :: struct #ordered {
	acknowledgement_list: List_Node,
	sent_time: u32,
	command: Protocol,
}

Outgoing_Command :: struct #ordered {
	outgoing_command_list: List_Node,
	reliable_sequence_number: u16,
	unreliable_sequence_number: u16,
	sent_time: u32,
	round_trip_timeout: u32,
	round_trip_timeout_limit: u32,
	fragment_offset: u32,
	fragment_length: u16,
	send_attempts: u16,
	command: Protocol,
	packet: ^Packet,
}

Incoming_Command :: struct #ordered {
	incoming_command_list: List_Node,
	reliable_sequence_number: u16,
	unreliable_sequence_number: u16,
	command: Protocol,
	fragment_count: u32,
	fragments_remaining: u32,
	fragments: ^u32,
	packet: ^Packet,
}

Channel :: struct #ordered {
	outgoing_reliable_sequence_number: u16,
	outgoing_unreliable_sequence_number: u16,
	used_reliable_windows: u16,
	reliable_windows: [PEER_RELIABLE_WINDOWS]u16,
	incoming_reliable_sequence_number: u16,
	incoming_unreliable_sequence_number: u16,
	incoming_reliable_commands: List,
	incoming_unreliable_commands: List,
}

Peer :: struct #ordered {
	dispatch_list: List_Node,
	host: ^Host,
	outgoing_peer_id: u16,
	incoming_peer_id: u16,
	connect_id: u32,
	outgoing_session_id: u8 ,
	incoming_session_id: u8 ,
	address: Address,
	data: rawptr,
	state: i32,
	channels: ^Channel,
	channel_count: uint,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
	incoming_bandwidth_throttle_epoch: u32,
	outgoing_bandwidth_throttle_epoch: u32,
	incoming_data_total: u32,
	outgoing_data_total: u32,
	last_send_time: u32,
	last_receive_time: u32,
	next_timeout: u32,
	earliest_timeout: u32,
	packet_loss_epoch: u32,
	packets_sent: u32,
	packets_lost: u32,
	packet_loss: u32,
	packet_loss_variance: u32,
	packet_throttle: u32,
	packet_throttle_limit: u32,
	packet_throttle_counter: u32,
	packet_throttle_epoch: u32,
	packet_throttle_acceleration: u32,
	packet_throttle_deceleration: u32,
	packet_throttle_interval: u32,
	ping_interval: u32,
	timeout_limit: u32,
	timeout_minimum: u32,
	timeout_maximum: u32,
	last_round_trip_time: u32,
	lowest_round_trip_time: u32,
	last_round_trip_time_variance: u32,
	highest_round_trip_time_variance: u32,
	round_trip_time: u32,
	round_trip_time_variance: u32,
	mtu: u32,
	window_size: u32,
	reliable_data_in_transit: u32,
	outgoing_reliable_sequence_number: u16,
	acknowledgements: List,
	sent_reliable_commands: List,
	sent_unreliable_commands: List,
	outgoing_reliable_commands: List,
	outgoing_unreliable_commands: List,
	dispatched_commands: List,
	needs_dispatch: int,
	incoming_unsequenced_group: u16,
	outgoing_unsequenced_group: u16,
	unsequenced_window: [PEER_UNSEQUENCED_WINDOW_SIZE / 32]u32,
	event_data: u32,
	total_waiting_data: uint,
}

Buffer :: struct #ordered {
	data_len: uint,
	data: rawptr,
}

Compressor :: struct #ordered {
	ctx: rawptr,
	compress: #type proc(ctx: rawptr, buffers: ^Buffer, buffer_count: uint, limit: uint, out_data: ^u8, out_limit: uint) -> uint,
	decompress: #type proc(ctx: rawptr, data: ^u8, limit: uint, out_data: ^u8, out_limit: uint) -> uint,
	destroy: #type proc(ctx: rawptr),
}

Host :: struct #ordered {
	socket: Socket,
	address: Address,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
	bandwidth_throttle_epoch: u32,
	mtu: u32,
	random_seed: u32,
	recalculate_bandwidth_limits: int,
	peers: ^Peer,
	peer_count: uint,
	channel_limit: uint,
	service_time: u32,
	dispatch_queue: List,
	continue_sending: int,
	packet_size: uint,
	header_flags: u16,
	commands: [PROTOCOL_MAXIMUM_PACKET_COMMANDS]Protocol,
	command_count: uint,
	buffers: [BUFFER_MAXIMUM]Buffer,
	buffer_count: uint,
	checksum: Checksum_Callback,
	compressor: Compressor,
	packet_data: [2][PROTOCOL_MAXIMUM_MTU]u8,
	received_address: Address,
	received_data: ^u8,
	received_data_length: uint,
	total_sent_data: u32,
	total_sent_packets: u32,
	total_received_data: u32,
	total_received_packets: u32,
	intercept: Intercept_Callback,
	connected_peers: uint,
	bandwidth_limited_peers: uint,
	duplicate_peers: uint,
	maximum_packet_size: uint,
	maximum_waiting_data: uint,
}

Event :: struct #ordered {
	event_type: Event_Type,
	peer: ^Peer,
	channel_id: u8,
	data: u32,
	packet: ^Packet,
}

Callbacks :: struct #ordered {
	malloc: #type proc(size: u32),
	free: #type proc(memory: rawptr),
	no_memory: #type proc(),
}

Packet_Free_Callback :: #type proc(packet: ^Packet);
Checksum_Callback :: #type proc(buffers: ^Buffer, buffer_count: u32) -> u32;
Intercept_Callback :: #type proc(host: ^Host, event: ^Event) -> i32;

HOST_ANY :: 0;
HOST_BROADCAST :: 0xffffffff;
PORT_ANY :: 0;
BUFFER_MAXIMUM :: (1 + 2 * PROTOCOL_MAXIMUM_PACKET_COMMANDS);

HOST_RECEIVE_BUFFER_SIZE          :: 256 * 1024;
HOST_SEND_BUFFER_SIZE             :: 256 * 1024;
HOST_BANDWIDTH_THROTTLE_INTERVAL  :: 1000;
HOST_DEFAULT_MTU                  :: 1400;
HOST_DEFAULT_MAXIMUM_PACKET_SIZE  :: 32 * 1024 * 1024;
HOST_DEFAULT_MAXIMUM_WAITING_DATA :: 32 * 1024 * 1024;

PEER_DEFAULT_ROUND_TRIP_TIME      :: 500;
PEER_DEFAULT_PACKET_THROTTLE      :: 32;
PEER_PACKET_THROTTLE_SCALE        :: 32;
PEER_PACKET_THROTTLE_COUNTER      :: 7;
PEER_PACKET_THROTTLE_ACCELERATION :: 2;
PEER_PACKET_THROTTLE_DECELERATION :: 2;
PEER_PACKET_THROTTLE_INTERVAL     :: 5000;
PEER_PACKET_LOSS_SCALE            :: (1 << 16);
PEER_PACKET_LOSS_INTERVAL         :: 10000;
PEER_WINDOW_SIZE_SCALE            :: 64 * 1024;
PEER_TIMEOUT_LIMIT                :: 32;
PEER_TIMEOUT_MINIMUM              :: 5000;
PEER_TIMEOUT_MAXIMUM              :: 30000;
PEER_PING_INTERVAL                :: 500;
PEER_UNSEQUENCED_WINDOWS          :: 64;
PEER_UNSEQUENCED_WINDOW_SIZE      :: 1024;
PEER_FREE_UNSEQUENCED_WINDOWS     :: 32;
PEER_RELIABLE_WINDOWS             :: 16;
PEER_RELIABLE_WINDOW_SIZE         :: 0x1000;
PEER_FREE_RELIABLE_WINDOWS        :: 8;

when ODIN_OS == "windows" {
	Socket :: u64;
}
else {
	Socket :: int;
}
