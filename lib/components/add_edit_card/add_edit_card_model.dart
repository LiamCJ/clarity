import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_edit_card_widget.dart' show AddEditCardWidget;
import 'package:flutter/material.dart';

class AddEditCardModel extends FlutterFlowModel<AddEditCardWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtTitle widget.
  FocusNode? txtTitleFocusNode;
  TextEditingController? txtTitleTextController;
  String? Function(BuildContext, String?)? txtTitleTextControllerValidator;
  // State field(s) for txtClient widget.
  FocusNode? txtClientFocusNode;
  TextEditingController? txtClientTextController;
  String? Function(BuildContext, String?)? txtClientTextControllerValidator;
  // State field(s) for txtDescription widget.
  FocusNode? txtDescriptionFocusNode;
  TextEditingController? txtDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtDescriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtTitleFocusNode?.dispose();
    txtTitleTextController?.dispose();

    txtClientFocusNode?.dispose();
    txtClientTextController?.dispose();

    txtDescriptionFocusNode?.dispose();
    txtDescriptionTextController?.dispose();
  }
}
