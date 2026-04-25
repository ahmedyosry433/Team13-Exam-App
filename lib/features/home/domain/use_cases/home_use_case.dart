import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/home/domain/entities/subjects_entity.dart';
import 'package:exam_app/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable()
class HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCase({ required this.homeRepository});
  Future<Result<List<SubjectsEntity>>> call() async {
    return  await homeRepository.getSubjects();
  }
}
