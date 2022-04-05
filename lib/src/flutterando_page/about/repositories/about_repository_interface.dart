import 'package:flutter_playground/src/common/page_state.dart';

abstract class IAboutRepository {
  Future<PageState> getModel();
}
