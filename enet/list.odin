ListNode :: struct #ordered {
	next: ^ListNode,
	previous: ^ListNode,
}

ListIterator :: ^ListNode;

List :: struct #ordered {
	sentinel: ListNode,
}