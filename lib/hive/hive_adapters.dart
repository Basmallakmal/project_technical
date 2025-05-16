import 'package:hive_ce/hive.dart';
import 'package:project_technical/domain/model/post_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<PostModel>(),
])

class HiveAdapters {}