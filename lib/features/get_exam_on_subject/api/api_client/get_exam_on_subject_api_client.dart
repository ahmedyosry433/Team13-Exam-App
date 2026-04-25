import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/get_exam_on_subject/data/models/response/get_exam_on_subject_response.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'get_exam_on_subject_api_client.g.dart';

@Injectable()
@RestApi()
abstract class GetExamSubjectApiClient {
  @factoryMethod
  factory GetExamSubjectApiClient(Dio dio) = _GetExamSubjectApiClient;
  @GET(AppEndPoints.getExamOnSubject)
  Future<GetExamOnSubjectResponse> getExamOnSubject(@Query('subject') String subjectId);
}