import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_technical/config/theme/colors.dart';
import 'package:project_technical/presentation/utils/app_services.dart';

class CustomTextInput {
  static Widget inputTextStyleLogin({
    Key? key,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(PointerDownEvent)? onTapOutside,
    int? maxLines = 1,
    int? maxLength,
    String? labelText,
    String? hintText,
    bool enabled = true,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6)),
    Widget? prefixIcon,
    Widget? suffixIcon,
    Function(String)? onChange,
    Function(String)? onSubmit,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      key: key,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      keyboardType: keyboardType,
      style: Theme.of(AppServices.context).textTheme.titleMedium,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: onTapOutside,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(AppServices.context).textTheme.titleMedium,
        hintText: hintText,
        hintStyle: Theme.of(
          AppServices.context,
        ).textTheme.labelMedium!.copyWith(color: kappBrown.withOpacity(0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        border: OutlineInputBorder(borderRadius: borderRadius),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  static Widget inputTextPasswordStyle({
    Key? key,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(PointerDownEvent)? onTapOutside,
    int? maxLines = 1,
    int? maxLength,
    bool obscureText = true,
    String? labelText,
    String? hintText,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6)),
    Widget? prefixIcon,
    Widget? suffixIcon,
    Function(String)? onChange,
    Function(String)? onSubmit,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      key: key,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      keyboardType: keyboardType,
      style: Theme.of(AppServices.context).textTheme.titleMedium,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      onTapOutside: onTapOutside,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(AppServices.context).textTheme.titleMedium,
        hintText: hintText,
        hintStyle: Theme.of(
          AppServices.context,
        ).textTheme.labelMedium!.copyWith(color: kappBrown.withOpacity(0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        border: UnderlineInputBorder(borderRadius: borderRadius),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
    );
  }

  static Widget styleInputNumber({
    Key? key,
    String? labelText,
    String? hintText,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? prefixText,
    TextStyle? prefixStyle,
    Function(PointerDownEvent)? onTapOutside,
    List<TextInputFormatter> inputFormatters = const [],
    TextEditingController? controller,
    String? Function(String?)? validator,
    int? maxLines = 1,
    int? maxLength,
    Function(String)? onChanged,
    TextInputAction? textInputAction,
    bool autofocus = false,
  }) {
    return TextFormField(
      key: key,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ...inputFormatters,
      ],
      style: Theme.of(AppServices.context).textTheme.titleMedium,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: onTapOutside,
      textInputAction: textInputAction,
      autofocus: autofocus,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(AppServices.context).textTheme.titleMedium,
        hintText: hintText,
        hintStyle: Theme.of(AppServices.context).textTheme.labelMedium,
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
      ),
      onChanged: onChanged,
    );
  }

  static Widget styleInput({
    Key? key,
    Function()? onTap,
    Function(PointerDownEvent)? onTapOutside,
    bool readOnly = false,
    bool autofocus = false,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(String)? onChange,
    Function(String)? onSubmit,
    List<TextInputFormatter> inputFormatters = const [],
    int? maxLines = 1,
    int? maxLength,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      key: key,
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      style: Theme.of(AppServices.context).textTheme.titleMedium,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: onTapOutside,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(AppServices.context).textTheme.titleMedium,
        hintText: hintText,
        hintStyle: Theme.of(
          AppServices.context,
        ).textTheme.labelMedium!.copyWith(color: kappBrown.withOpacity(0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
    );
  }

  static Widget styleInputUndeline({
    Key? key,
    Function()? onTap,
    Function(PointerDownEvent)? onTapOutside,
    bool readOnly = false,
    bool autofocus = false,
    String? labelText,
    String? hintText,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(String)? onChange,
    Function(String)? onSubmit,
    List<TextInputFormatter> inputFormatters = const [],
    int? maxLines = 1,
    int? maxLength,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      key: key,
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      style: Theme.of(AppServices.context).textTheme.titleMedium,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: onTapOutside,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(AppServices.context).textTheme.titleMedium,
        hintText: hintText,
        hintStyle: Theme.of(
          AppServices.context,
        ).textTheme.labelMedium!.copyWith(color: kappBrown.withOpacity(0.5)),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: kappRed, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: kappBrown, width: 1.0),
        ),
        border: const UnderlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
    );
  }
}
