import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/constant.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.hintText = '',
      required this.onSave});
  final String labelText;
  final String hintText;
  final Function(String?) onSave;
  static String code = '';

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

 

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon;
    Widget? suffix;

    if (widget.labelText == 'Barcode Scanner(optional)') {
      suffix = IconButton(
          onPressed: () {
            _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                context: context,
                onCode: (val) {
                  setState(() {
                    CustomTextFormField.code = val!;
                  });
                });
          },
          icon: const Icon(Icons.qr_code_scanner_rounded, color: textColor));
    } else if (widget.labelText == 'Temperature') {
      suffixIcon = const Icon(Icons.keyboard_arrow_down_rounded);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'The field must be filled out';
            } else {
              return null;
            }
          },
          onSaved: widget.onSave,
          decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: textColor),
              hintText: widget.labelText == 'Barcode Scanner(optional)'
                  ? CustomTextFormField.code
                  : widget.hintText,
              filled: true,
              suffixIcon: suffixIcon,
              suffix: suffix,
              fillColor: whiteColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: whiteColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: whiteColor)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: whiteColor)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25))),
    );
  }
}
