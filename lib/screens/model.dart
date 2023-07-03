import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact({
    required this.name,
  }) : id = const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedinstance() : super([]);
  static final ContactBook _share = ContactBook._sharedinstance();
  factory ContactBook() => _share;

  int get length => value.length;
  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atindex}) {
    return value.length > atindex ? value[atindex] : null;
  }
}
