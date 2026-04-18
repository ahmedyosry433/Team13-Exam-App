import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/home/data/models/response/subjects_respose.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@Injectable()
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(AppEndPoints.getAllSubjects)
  Future<SubjectsResponse> getsubjects();
}
