class Contact {
  final String name;
  const Contact({
    required this.name,
  });
}

class ContactBook {
  ContactBook._sharedinstance();
  static final ContactBook _share = ContactBook._sharedinstance();
  factory ContactBook() => _share;

  final List<Contact> _contacts = [];
  int get length => _contacts.length;
  void add({required Contact contact}) {
    _contacts.add(contact);
  }

  void remove({required Contact contact}) {
    _contacts.remove(contact);
  }

  Contact? contact({required int atindex}) {
    return _contacts.length > atindex ? _contacts[atindex] : null;
  }
}
