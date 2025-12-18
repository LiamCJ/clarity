import '/backend/backend.dart';
import '/components/add_edit_card/add_edit_card_widget.dart';
import '/components/menu/menu_widget.dart';
import '/components/task_card/task_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'board_model.dart';
export 'board_model.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({super.key});

  static String routeName = 'Board';
  static String routePath = '/board';

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  late BoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.light);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: FFAppState().users(
        requestFn: () => queryUsersRecord(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> boardUsersRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 1440.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clarity',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    'Please note that certain functionalities have been disabled for demonstration purposes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.workSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 510),
                                      curve: Curves.linear,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              barrierColor: Color(0xC0413F42),
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(
                                                          1.0, -1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: MenuWidget(
                                                      usersLst:
                                                          boardUsersRecordList,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.menu,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          40.0, 25.0, 40.0, 50.0),
                      child: StreamBuilder<List<TaskRecord>>(
                        stream: queryTaskRecord(
                          queryBuilder: (taskRecord) =>
                              taskRecord.orderBy('DateTimeDragged'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TaskRecord> containerTaskRecordList =
                              snapshot.data!;

                          return Container(
                            constraints: BoxConstraints(
                              maxWidth: 1440.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.25,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'To-Do',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.workSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          DragTarget<TaskRecord>(
                                            onAcceptWithDetails:
                                                (details) async {
                                              _model.lane1Hover = false;
                                              if (details.data.lane != 1) {
                                                await details.data.reference
                                                    .update({
                                                  ...createTaskRecordData(
                                                    lane: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'DateTimeDragged':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            onWillAcceptWithDetails: (details) {
                                              (() async {
                                                _model.lane1Hover = true;

                                                safeSetState(() {});
                                              })();
                                              return true;
                                            },
                                            onLeave: (data) async {
                                              _model.lane1Hover = false;

                                              safeSetState(() {});
                                            },
                                            builder: (context, _, __) {
                                              return Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  minHeight: 750.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _model.lane1Hover
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final task =
                                                          containerTaskRecordList
                                                              .where((e) =>
                                                                  e.lane == 1)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: task.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 5.0),
                                                        itemBuilder: (context,
                                                            taskIndex) {
                                                          final taskItem =
                                                              task[taskIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            AddEditCardWidget(
                                                                          users:
                                                                              boardUsersRecordList,
                                                                          task:
                                                                              taskItem,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Draggable<
                                                                  TaskRecord>(
                                                                data: taskItem,
                                                                feedback:
                                                                    Material(
                                                                  type: MaterialType
                                                                      .transparency,
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                        'Keyuqr_${taskIndex}_of_${task.length}'),
                                                                    taskTitle:
                                                                        taskItem
                                                                            .title,
                                                                    taskDescription:
                                                                        taskItem
                                                                            .description,
                                                                    clientName:
                                                                        taskItem
                                                                            .client,
                                                                  ),
                                                                ),
                                                                child:
                                                                    TaskCardWidget(
                                                                  key: Key(
                                                                      'Keyuqr_${taskIndex}_of_${task.length}'),
                                                                  taskTitle:
                                                                      taskItem
                                                                          .title,
                                                                  taskDescription:
                                                                      taskItem
                                                                          .description,
                                                                  clientName:
                                                                      taskItem
                                                                          .client,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.25,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Busy',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.workSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          DragTarget<TaskRecord>(
                                            onAcceptWithDetails:
                                                (details) async {
                                              _model.lane2Hover = false;
                                              if (details.data.lane != 2) {
                                                await details.data.reference
                                                    .update({
                                                  ...createTaskRecordData(
                                                    lane: 2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'DateTimeDragged':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            onWillAcceptWithDetails: (details) {
                                              (() async {
                                                _model.lane2Hover = true;

                                                safeSetState(() {});
                                              })();
                                              return true;
                                            },
                                            onLeave: (data) async {
                                              _model.lane2Hover = false;

                                              safeSetState(() {});
                                            },
                                            builder: (context, _, __) {
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                constraints: BoxConstraints(
                                                  minHeight: 750.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _model.lane2Hover
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final task =
                                                          containerTaskRecordList
                                                              .where((e) =>
                                                                  e.lane == 2)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: task.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 5.0),
                                                        itemBuilder: (context,
                                                            taskIndex) {
                                                          final taskItem =
                                                              task[taskIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            AddEditCardWidget(
                                                                          users:
                                                                              boardUsersRecordList,
                                                                          task:
                                                                              taskItem,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Draggable<
                                                                  TaskRecord>(
                                                                data: taskItem,
                                                                feedback:
                                                                    Material(
                                                                  type: MaterialType
                                                                      .transparency,
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                        'Keytti_${taskIndex}_of_${task.length}'),
                                                                    taskTitle:
                                                                        taskItem
                                                                            .title,
                                                                    taskDescription:
                                                                        taskItem
                                                                            .description,
                                                                    clientName:
                                                                        taskItem
                                                                            .client,
                                                                  ),
                                                                ),
                                                                child:
                                                                    TaskCardWidget(
                                                                  key: Key(
                                                                      'Keytti_${taskIndex}_of_${task.length}'),
                                                                  taskTitle:
                                                                      taskItem
                                                                          .title,
                                                                  taskDescription:
                                                                      taskItem
                                                                          .description,
                                                                  clientName:
                                                                      taskItem
                                                                          .client,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.25,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Verify',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.workSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          DragTarget<TaskRecord>(
                                            onAcceptWithDetails:
                                                (details) async {
                                              _model.lane3Hover = false;
                                              if (details.data.lane != 3) {
                                                await details.data.reference
                                                    .update({
                                                  ...createTaskRecordData(
                                                    lane: 3,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'DateTimeDragged':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            onWillAcceptWithDetails: (details) {
                                              (() async {
                                                _model.lane3Hover = true;

                                                safeSetState(() {});
                                              })();
                                              return true;
                                            },
                                            onLeave: (data) async {
                                              _model.lane3Hover = false;

                                              safeSetState(() {});
                                            },
                                            builder: (context, _, __) {
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                constraints: BoxConstraints(
                                                  minHeight: 750.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _model.lane3Hover
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final task =
                                                          containerTaskRecordList
                                                              .where((e) =>
                                                                  e.lane == 3)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: task.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 5.0),
                                                        itemBuilder: (context,
                                                            taskIndex) {
                                                          final taskItem =
                                                              task[taskIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            AddEditCardWidget(
                                                                          users:
                                                                              boardUsersRecordList,
                                                                          task:
                                                                              taskItem,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Draggable<
                                                                  TaskRecord>(
                                                                data: taskItem,
                                                                feedback:
                                                                    Material(
                                                                  type: MaterialType
                                                                      .transparency,
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                        'Keyf7y_${taskIndex}_of_${task.length}'),
                                                                    taskTitle:
                                                                        taskItem
                                                                            .title,
                                                                    taskDescription:
                                                                        taskItem
                                                                            .description,
                                                                    clientName:
                                                                        taskItem
                                                                            .client,
                                                                  ),
                                                                ),
                                                                child:
                                                                    TaskCardWidget(
                                                                  key: Key(
                                                                      'Keyf7y_${taskIndex}_of_${task.length}'),
                                                                  taskTitle:
                                                                      taskItem
                                                                          .title,
                                                                  taskDescription:
                                                                      taskItem
                                                                          .description,
                                                                  clientName:
                                                                      taskItem
                                                                          .client,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.25,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Done',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.workSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          DragTarget<TaskRecord>(
                                            onAcceptWithDetails:
                                                (details) async {
                                              _model.lane4Hover = false;
                                              if (details.data.lane != 4) {
                                                await details.data.reference
                                                    .update({
                                                  ...createTaskRecordData(
                                                    lane: 4,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'DateTimeDragged':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                            onWillAcceptWithDetails: (details) {
                                              (() async {
                                                _model.lane4Hover = true;

                                                safeSetState(() {});
                                              })();
                                              return true;
                                            },
                                            onLeave: (data) async {
                                              _model.lane4Hover = false;

                                              safeSetState(() {});
                                            },
                                            builder: (context, _, __) {
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                constraints: BoxConstraints(
                                                  minHeight: 750.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: _model.lane4Hover
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final task =
                                                          containerTaskRecordList
                                                              .where((e) =>
                                                                  e.lane == 4)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: task.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 5.0),
                                                        itemBuilder: (context,
                                                            taskIndex) {
                                                          final taskItem =
                                                              task[taskIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            AddEditCardWidget(
                                                                          users:
                                                                              boardUsersRecordList,
                                                                          task:
                                                                              taskItem,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Draggable<
                                                                  TaskRecord>(
                                                                data: taskItem,
                                                                feedback:
                                                                    Material(
                                                                  type: MaterialType
                                                                      .transparency,
                                                                  child:
                                                                      TaskCardWidget(
                                                                    key: Key(
                                                                        'Keyeqv_${taskIndex}_of_${task.length}'),
                                                                    taskTitle:
                                                                        taskItem
                                                                            .title,
                                                                    taskDescription:
                                                                        taskItem
                                                                            .description,
                                                                    clientName:
                                                                        taskItem
                                                                            .client,
                                                                  ),
                                                                ),
                                                                child:
                                                                    TaskCardWidget(
                                                                  key: Key(
                                                                      'Keyeqv_${taskIndex}_of_${task.length}'),
                                                                  taskTitle:
                                                                      taskItem
                                                                          .title,
                                                                  taskDescription:
                                                                      taskItem
                                                                          .description,
                                                                  clientName:
                                                                      taskItem
                                                                          .client,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
