// Package imports:
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'reg_exp_constants.dart';

class MyTextMasks {
  const MyTextMasks._();

  static final _filter = {'#': MyRegExps.onlyDigits};

  static MaskTextInputFormatter pinfl([String? initialValue]) {
    return MaskTextInputFormatter(
      initialText: initialValue,
      mask: '# ## ## ## ### ### #',
      filter: _filter,
    );
  }

  static MaskTextInputFormatter paymentCard([String? initialValue]) {
    return MaskTextInputFormatter(
      initialText: initialValue,
      mask: '#### #### #### ####',
      filter: {'#': MyRegExps.digitOrAsterisk},
    );
  }

  static MaskTextInputFormatter expireDate([String? initialValue]) {
    return MaskTextInputFormatter(
      initialText: initialValue,
      mask: '##/##',
      filter: _filter,
    );
  }
}
