import 'package:bloc_skeleton/common_ui/colors.dart';
import 'package:bloc_skeleton/common_ui/common_colors.dart';
import 'package:bloc_skeleton/common_ui/common_typography.dart';
import 'package:bloc_skeleton/core/utils/empty_padding.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/core/utils/value_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final String? label;
  final double? formHeight;
  final String hint;
  final TextEditingController? controller;
  final EdgeInsets padding;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final bool isObscureText;
  final bool isShowObscuredText;
  final List<TextInputFormatter>? inputFormatters;
  final BooleanCallback? onSuffixClick;
  final List<CommonTextFieldValidator> validators;
  final String defaultValue;
  final bool isEnable;
  final bool expands;
  final int maxLine;
  final Color? disabledFillColor;
  final TextAlignVertical? textAlignVertical;
  final double radius;
  final TextStyle? labelTextStyle;
  final Color? borderColor;
  final Color? hintColor;

  const CommonTextField({
    Key? key,
    this.label,
    required this.hint,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.inputAction = TextInputAction.done,
    this.inputType = TextInputType.text,
    this.isObscureText = false,
    this.isShowObscuredText = false,
    this.inputFormatters,
    this.onSuffixClick,
    this.disabledFillColor = CommonColors.greyD0,
    this.validators = const [],
    this.defaultValue = '',
    this.isEnable = true,
    this.formHeight,
    this.expands = false,
    this.textAlignVertical,
    this.radius = 4,
    this.labelTextStyle,
    this.maxLine = 1,
    this.borderColor,
    this.hintColor,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    widget.label!,
                    style: widget.labelTextStyle ?? CommonTypography.textH8,
                  ),
                )
              : const SizedBox.shrink(),
          6.ph,
          SizedBox(
            height: widget.formHeight,
            child: TextFormField(
              textAlignVertical: widget.textAlignVertical,
              enabled: widget.isEnable,
              expands: widget.expands,
              maxLines: widget.expands == true ? null : widget.maxLine,
              controller: _controller,
              textInputAction: widget.inputAction,
              keyboardType: widget.inputType,
              obscureText: widget.isObscureText && !widget.isShowObscuredText,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 9, height: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? CommonColors.whiteEC,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? CommonColors.whiteEC,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? CommonColors.whiteEC,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? CommonColors.blueC9,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: const BorderSide(
                    color: CommonColors.red26,
                  ),
                ),
                filled: true,
                isDense: true,
                focusColor: CommonColors.white5,
                fillColor: widget.isEnable
                    ? CommonColors.whiteFB
                    : widget.disabledFillColor,
                hintStyle: CommonTypography.textH8.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.hintColor ?? AppColors.madhaniGreyFont),
                hintText: widget.hint.isEmpty ? widget.label : widget.hint,
                suffixIcon: widget.isObscureText
                    ? IconButton(
                        onPressed: onSuffixIconClick,
                        splashRadius: 16,
                        icon: widget.isShowObscuredText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      )
                    : null,
              ),
              validator: _handleValidator,
            ),
          ),
        ],
      ),
    );
  }

  String? _handleValidator(String? value) {
    var isRequired = widget.validators.contains(
      CommonTextFieldValidator.noEmpty,
    );
    var validateEmail = widget.validators.contains(
      CommonTextFieldValidator.email,
    );
    var min8Character = widget.validators.contains(
      CommonTextFieldValidator.min8Character,
    );
    var min16Character = widget.validators.contains(
      CommonTextFieldValidator.min16Character,
    );

    var max50Character = widget.validators.contains(
      CommonTextFieldValidator.max50Character,
    );

    var min5Character =
        widget.validators.contains(CommonTextFieldValidator.min5Character);

    var phoneNumber = widget.validators.contains(
      CommonTextFieldValidator.phoneNumber,
    );

    if (isRequired && (value == null || value.isEmpty)) {
      return "${widget.label} can't be Empty";
    }
    if (validateEmail && !(value!.isValidEmail())) {
      return "Email invalid";
    }
    if (max50Character && (value?.length ?? 0) > 50) {
      return "${widget.label} length must be less than 50 characters long";
    }
    if (min8Character && (value?.length ?? 0) < 8) {
      return "${widget.label} length must be at least 8 characters long";
    }
    if (min16Character && (value?.length ?? 0) < 16) {
      return "${widget.label} length must be at least 10 characters long";
    }
    if (min5Character && (value?.length ?? 0) < 5) {
      return "${widget.label} length must be at least 5 characters long";
    }

    if (phoneNumber &&
        ((value?.length ?? 0) > 13 || (value?.length ?? 0) < 10)) {
      return "${widget.label} length must be at least 10 and less than 13";
    }
    return null;
  }

  void onSuffixIconClick() {
    if (widget.isShowObscuredText) {
      widget.onSuffixClick?.call(false);
    } else {
      widget.onSuffixClick?.call(true);
    }
  }
}

enum CommonTextFieldValidator {
  noEmpty,
  email,
  min8Character,
  min16Character,
  max50Character,
  phoneNumber,
  min5Character
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
