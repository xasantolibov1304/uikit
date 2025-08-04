// Package imports:
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// Project imports:
import 'reg_exp_constants.dart';

class TextMasks {
  const TextMasks._();

  static final _filter = {'#': CommonRegExps.onlyDigits};

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
      filter: {'#': CommonRegExps.digitOrAsterisk},
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
