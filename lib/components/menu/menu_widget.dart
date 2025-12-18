import '/backend/backend.dart';
import '/components/add_edit_card/add_edit_card_widget.dart';
import '/components/users/users_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    this.usersLst,
  });

  final List<UsersRecord>? usersLst;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  late MenuModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -37.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: AddEditCardWidget(
                          users: widget.usersLst!,
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    Text(
                      'Add card',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.workSans(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: UsersWidget(),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.group,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    Text(
                      'Users',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.workSans(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            if (!(Theme.of(context).brightness == Brightness.dark))
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setDarkModeSetting(context, ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Text(
                          'Dark mode',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.workSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            if (Theme.of(context).brightness == Brightness.dark)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setDarkModeSetting(context, ThemeMode.light);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.wb_sunny_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        Text(
                          'Light mode',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.workSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
