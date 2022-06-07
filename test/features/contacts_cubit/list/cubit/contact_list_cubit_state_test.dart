import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repository/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  //declaração
  late ContactsRepository repository;
  late ContactListCubit cubit;
  late List<ContactModel> contacts;

  //preparação
  setUp(() {
    repository = MockContactsRepository();
    cubit = ContactListCubit(repository: repository);
    contacts = [
      ContactModel(name: 'Enzo Serafin', email: 'enzoserafin@gmail.com'),
      ContactModel(
          name: 'Heitor de Freitas Serafin', email: 'heitorfserafin@gmail.com')
    ];
  });

  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve buscar os contados',
    build: () => cubit,
    act: (cubit) => cubit.findAll(),
    setUp: () {
      when(
        () => repository.findAll(),
      ).thenAnswer((_) async => contacts);
    },
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
  );
}
