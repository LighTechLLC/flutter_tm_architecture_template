import 'package:architecture_template/contacts/contacts_main/models/contact_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'contacts_repository.g.dart';

@RestApi()
abstract class ContactsRepository {
  factory ContactsRepository(Dio dio, {String baseUrl}) = _ContactsRepository;

  @GET('/contacts/')
  Future<List<ContactResponse>> fetchContacts();
}
