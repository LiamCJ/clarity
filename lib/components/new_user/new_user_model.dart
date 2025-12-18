import '/flutter_flow/flutter_flow_util.dart';
import 'new_user_widget.dart' show NewUserWidget;
import 'package:flutter/material.dart';

class NewUserModel extends FlutterFlowModel<NewUserWidget> {
  ///  Local state fields for this component.

  String? profilePic;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadedProfilePic = false;
  FFUploadedFile uploadedLocalFile_uploadedProfilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedProfilePic = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
