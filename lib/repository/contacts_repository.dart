import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  String baseUrl = 'http://10.0.2.2:3031/contacts';

  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get(baseUrl);

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> create(ContactModel model) =>
      Dio().post(baseUrl, data: model.toMap());

  Future<void> update(ContactModel model) async {
    String url = baseUrl + '/${model.id}';

    Dio().put(url, data: model.toMap());
  }

  Future<void> delete(ContactModel model) async {
    String url = baseUrl + '/${model.id}';

    Dio().delete(url);
  }
}
