ProtocolHeader :: struct #packed {
	peer_id, sent_time: u16,
}

ProtocolCommandHeader :: struct #packed {
	command: u8,
	channel_id: u8,
	reliable_seq_number: u16,
}

ProtocolAcknowledge :: struct #packed {
	header: ProtocolCommandHeader,
	recv_reliable_seq_number: u16,
	recv_sent_time: u16,
}

ProtocolConnect :: struct #packed {
	header: ProtocolCommandHeader,
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

ProtocolVerifyConnect :: struct #packed {
	header: ProtocolCommandHeader,
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

ProtocolBandwidthLimit :: struct #packed {
	header: ProtocolCommandHeader,
	incoming_bandwidth: u32,
	outgoing_bandwidth: u32,
}

ProtocolThrottleConfigure :: struct #packed {
	header: ProtocolCommandHeader,
	packet_throttle_interval: u32,
	packet_throttle_acceleration: u32,
	packet_throttle_deceleration: u32,
}

ProtocolDisconnect :: struct #packed {
	header: ProtocolCommandHeader,
	data: u32,
}

ProtocolPing :: struct #packed {
	header: ProtocolCommandHeader,
}

ProtocolSendReliable :: struct #packed {
	header: ProtocolCommandHeader,
	data_length: u16,
}

ProtocolSendUnreliable :: struct #packed {
	header: ProtocolCommandHeader,
	unreliable_sequence_number: u16,
	data_length: u16,
}

ProtocolSendUnsequenced :: struct #packed {
	header: ProtocolCommandHeader,
	unsequenced_group: u16,
	data_length: u16,
}

ProtocolSendFragment :: struct #packed {
	header: ProtocolCommandHeader,
	data_length: u16,
	fragment_count: u32,
	fragment_number: u32,
	total_length: u32,
	fragment_offset: u32,
}

Protocol :: struct #packed {
	header: ProtocolCommandHeader,
	acknowledge: ProtocolAcknowledge,
	connect: ProtocolConnect,
	verify_connect: ProtocolVerifyConnect,
	disconnect: ProtocolDisconnect,
	ping: ProtocolPing,
	send_reliable: ProtocolSendReliable,
	send_unreliable: ProtocolSendUnreliable,
	send_unsequenced: ProtocolSendUnsequenced,
	send_fragment: ProtocolSendFragment,
	bandwidth_limit: ProtocolBandwidthLimit,
	throttle_configure: ProtocolThrottleConfigure,
}

PROTOCOL_MINIMUM_MTU             :: 576;
PROTOCOL_MAXIMUM_MTU             :: 4096;
PROTOCOL_MAXIMUM_PACKET_COMMANDS :: 32;
PROTOCOL_MINIMUM_WINDOW_SIZE     :: 4096;
PROTOCOL_MAXIMUM_WINDOW_SIZE     :: 65536;
PROTOCOL_MINIMUM_CHANNEL_COUNT   :: 1;
PROTOCOL_MAXIMUM_CHANNEL_COUNT   :: 255;
PROTOCOL_MAXIMUM_PEER_ID         :: 0xFFF;
PROTOCOL_MAXIMUM_FRAGMENT_COUNT  :: 1024 * 102;