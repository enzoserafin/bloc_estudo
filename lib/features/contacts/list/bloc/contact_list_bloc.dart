import 'dart:async';
import 'dart:developer';

import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repository/contacts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';
part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  final ContactsRepository _repository;

  ContactListBloc({required ContactsRepository repository})
      : _repository = repository,
        super(ContactListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
    on<_ContactListEventDelete>(_deleteById);
  }

  Future<void> _findAll(
      _ContactListEventFindAll event, Emitter<ContactListState> emit) async {
    try {
      emit(ContactListState.loading());
      final contacts = await _repository.findAll();
      // await Future.delayed(const Duration(seconds: 1));

      emit(ContactListState.data(contacts: contacts));
    } on Exception catch (e, s) {
      log('Erro ao buscar contatos', error: e, stackTrace: s);
      emit(ContactListState.error(error: 'Erro ao buscar contatos'));
    }
  }

  FutureOr<void> _deleteById(
    _ContactListEventDelete event,
    Emitter<ContactListState> emit,
  ) async {
    try {
      emit(ContactListState.loading());
      await _repository.delete(event.model);
      // await Future.delayed(const Duration(seconds: 1));
      add(const ContactListEvent.findAll());
    } catch (e, s) {
      log('Erro ao excluir contato', error: e, stackTrace: s);
      emit(ContactListState.error(error: 'Erro ao excluir contato'));
    }
  }
}
