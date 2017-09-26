Protocol_Header :: struct #packed {
	peer_id, sent_time: u16,
}

Protocol_Command_Header :: struct #packed {
	command: u8,
	channel_id: u8,
	reliable_seq_number: u16,
}

Protocol_Acknowledge :: struct #packed {
	header: Protocol_Command_Header,
	recv_reliable_seq_number: u16,
	recv_sent_time: u16,
}

Protocol_Connect :: struct #packed {
	header: Protocol_Command_Header,
	outgoing_peer_id: u16,
	incoming_session_id: u8,
	outgoing_session_id: u8,
	mtu: u32,
	window_size: u32,
	channel_count: u32,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
	packet_throttle_interval: u32,
	packet_throttle_acceleration: u32,
	packet_throttle_deceleration: u32,
	connect_id: u32,
	data: u32,
}

Protocol_Verify_Connect :: struct #packed {
	header: Protocol_Command_Header,
	outgoing_peer_id: u16,
	incoming_session_id: u8,
	outgoing_session_id: u8,
	mtu: u32,
	window_size: u32,
	channel_count: u32,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
	packet_throttle_interval: u32,
	packet_throttle_acceleration: u32,
	packet_throttle_deceleration: u32,
	connect_id: u32,
}

Protocol_Bandwidth_Limit :: struct #packed {
	header: Protocol_Command_Header,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
}

Protocol_Throttle_Configure :: struct #packed {
	header: Protocol_Command_Header,
	packet_throttle_interval: u32,
	packet_throttle_acceleration: u32,
	packet_throttle_deceleration: u32,
}

Protocol_Disconnect :: struct #packed {
	header: Protocol_Command_Header,
	data: u32,
}

Protocol_Ping :: struct #packed {
	header: Protocol_Command_Header,
}

Protocol_Send_Reliable :: struct #packed {
	header: Protocol_Command_Header,
	data_length: u16,
}

Protocol_Send_Unreliable :: struct #packed {
	header: Protocol_Command_Header,
	unreliable_sequence_number: u16,
	data_length: u16,
}

Protocol_Send_Unsequenced :: struct #packed {
	header: Protocol_Command_Header,
	unsequenced_group: u16,
	data_length: u16,
}

Protocol_Send_Fragment :: struct #packed {
	header: Protocol_Command_Header,
	start_seq_number: u16,
	data_length: u16,
	fragment_count: u32,
	fragment_number: u32,
	total_length: u32,
	fragment_offset: u32,
}

Protocol :: struct #raw_union {
	header: Protocol_Command_Header,
	acknowledge: Protocol_Acknowledge,
	connect: Protocol_Connect,
	verify_connect: Protocol_Verify_Connect,
	disconnect: Protocol_Disconnect,
	ping: Protocol_Ping,
	send_reliable: Protocol_Send_Reliable,
	send_unreliable: Protocol_Send_Unreliable,
	send_unsequenced: Protocol_Send_Unsequenced,
	send_fragment: Protocol_Send_Fragment,
	bandwidth_limit: Protocol_Bandwidth_Limit,
	throttle_configure: Protocol_Throttle_Configure,
}

PROTOCOL_MINIMUM_MTU             :: 576;
PROTOCOL_MAXIMUM_MTU             :: 4096;
PROTOCOL_MAXIMUM_PACKET_COMMANDS :: 32;
PROTOCOL_MINIMUM_WINDOW_SIZE     :: 4096;
PROTOCOL_MAXIMUM_WINDOW_SIZE     :: 65536;
PROTOCOL_MINIMUM_CHANNEL_COUNT   :: 1;
PROTOCOL_MAXIMUM_CHANNEL_COUNT   :: 255;
PROTOCOL_MAXIMUM_PEER_ID         :: 0xFFF;
PROTOCOL_MAXIMUM_FRAGMENT_COUNT  :: 1024 * 1024;