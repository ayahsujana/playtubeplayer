import 'package:minecraft_videos/model/base_model.dart';
import 'package:minecraft_videos/res/repository.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();

  dispose() {}
}
