List_Node :: struct #ordered {
	next: ^List_Node,
	previous: ^List_Node,
}

ListIterator :: ^List_Node;

List :: struct #ordered {
	sentinel: List_Node,
}