// TODO: api QuestionsApiClient

import 'package:dio/dio.dart';
import 'package:exam_app/config/api/app_endpoints.dart';
import 'package:exam_app/features/questions/data/models/questions_response_models/questions_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'questions_api_client.g.dart';

@Injectable()
@RestApi()
abstract class QuestionsApiClient {
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;
  @GET(AppEndPoints.question)
  Future<QuestionsResponseModel> getQuestions(@Query('exam') String examId);
}
