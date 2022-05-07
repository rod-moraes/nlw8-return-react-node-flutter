import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class TextFormInput extends StatefulWidget {
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? icon;
  final String text;
  final String? label;
  final String? hintText;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;
  final Color? focusedBorderColor;
  final int? maxLength;
  final int? maxLines;
  final bool expands;
  final bool flexible;
  final bool divider;
  final bool disable;
  final bool disableForm;
  final bool password;

  const TextFormInput({
    Key? key,
    this.onChanged,
    required this.text,
    this.divider = true,
    this.disable = false,
    this.disableForm = false,
    this.flexible = false,
    this.textAlign = TextAlign.left,
    this.label,
    this.hintText,
    this.maxLength,
    this.expands = false,
    this.textStyle,
    this.contentPadding,
    this.focusedBorderColor,
    this.maxLines,
    this.icon,
    this.onSaved,
    this.validate,
    this.password = false,
  }) : super(key: key);

  @override
  State<TextFormInput> createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  late bool _passwordVisible;
  final ScrollController _scrollController = ScrollController();
  bool validator = true;

  TextStyle get styleText {
    if (widget.disableForm) {
      return AppTheme.textStyles.textPrimaryRegular;
    } else if (widget.disable) {
      return AppTheme.textStyles.textPrimaryRegular;
    } else {
      return AppTheme.textStyles.textPrimaryRegular;
    }
  }

  InputBorder get border => widget.divider
      ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppTheme.colors.stroke,
            width: 1,
          ),
        )
      : InputBorder.none;

  @override
  void initState() {
    _passwordVisible = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget textfield = RawScrollbar(
      thumbColor: AppTheme.colors.stroke,
      radius: Radius.circular(20),
      thickness: 5,
      controller: _scrollController,
      isAlwaysShown: true,
      crossAxisMargin: 6,
      mainAxisMargin: 8,
      child: TextFormField(
        scrollPhysics: BouncingScrollPhysics(),
        scrollController: _scrollController,
        scrollPadding: EdgeInsets.zero,
        readOnly: widget.disable || widget.disableForm,
        maxLength: widget.maxLength,
        textAlignVertical: TextAlignVertical.top,
        expands: widget.expands,
        maxLines: widget.maxLines,
        textAlign: widget.textAlign,
        obscureText: _passwordVisible,
        enableSuggestions: !widget.password,
        autocorrect: !widget.password,
        initialValue:
            Bidi.stripHtmlIfNeeded(widget.text.replaceAll("<br />", "\n")),
        keyboardType: (widget.maxLines ?? 2) > 1
            ? TextInputType.multiline
            : TextInputType.text,
        style: widget.textStyle ?? styleText,
        cursorColor: AppTheme.colors.backgroundAlertDialogColor,
        decoration: InputDecoration(
          labelText: widget.label,
          hoverColor: Colors.white,
          fillColor: AppTheme.colors.surfaceSecondary,
          filled: true,
          labelStyle: widget.textStyle ?? styleText,
          prefixIcon: widget.icon,
          hintText: widget.hintText,
          isDense: true,
          hintStyle: widget.disable
              ? AppTheme.textStyles.textSecondaryRegular
              : AppTheme.textStyles.textSecondaryRegular,
          hintMaxLines: 10,
          border: border,
          contentPadding: EdgeInsets.only(top: 8, left: 12, right: 12),
          enabledBorder: border,
          focusedBorder: border.copyWith(
              borderSide: border.borderSide
                  .copyWith(color: widget.focusedBorderColor, width: 2)),
          suffixIcon: !widget.password
              ? null
              : Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      _passwordVisible = !_passwordVisible;
                      setState(() {});
                    },
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    color: AppTheme.colors.stroke,
                  ),
                ),
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validate,
      ),
    );

    return widget.flexible ? Flexible(child: textfield) : textfield;
  }
}
