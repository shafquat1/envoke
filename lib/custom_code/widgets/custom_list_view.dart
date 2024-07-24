// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
      child: StreamBuilder<List<MemoriesRecord>>(
        stream: queryMemoriesRecord(
          queryBuilder: (memoriesRecord) => memoriesRecord
              .where(
                'user_id',
                isEqualTo: currentUserUid,
              )
              .orderBy('created_time', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50,
                ),
              ),
            );
          }
          List<MemoriesRecord> listViewMemoriesRecordList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewMemoriesRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewMemoriesRecord =
                  listViewMemoriesRecordList[listViewIndex];
              return FutureBuilder<int>(
                future: queryMomentsRecordCount(
                  parent: listViewMemoriesRecord.reference,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.transparent,
                          ),
                        ),
                      ),
                    );
                  }
                  int columnCount = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (columnCount <= 0) {
                                context.pushNamed(
                                  'createMoment',
                                  queryParameters: {
                                    'memories': serializeParam(
                                      listViewMemoriesRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'memories': listViewMemoriesRecord,
                                  },
                                );
                                return;
                              } else {
                                context.pushNamed(
                                  'momentTimeline',
                                  queryParameters: {
                                    'memories': serializeParam(
                                      listViewMemoriesRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'memories': listViewMemoriesRecord,
                                  },
                                );
                                return;
                              }
                            },
                            onLongPress: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0, 0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: DeleteMemoriesWidget(
                                        memory: listViewMemoriesRecord,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 1),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              listViewMemoriesRecord
                                                  .imgBlurHash),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: CachedNetworkImageProvider(
                                        listViewMemoriesRecord.imgUrl,
                                      ),
                                      width: 350,
                                      height: 350,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          'd MMMM y',
                                                          listViewMemoriesRecord
                                                              .createdTime!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Helvetica',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Text(
                                                        listViewMemoriesRecord
                                                            .memoryTitle,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Helvetica',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize: 28,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(height: 5)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional(0, 0),
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ),
                            ],
                          ),
                          if (functions.setDateVisibility(listViewIndex,
                                  _model.listMemories.toList()) ??
                              true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet<bool>(
                                    context: context,
                                    builder: (context) {
                                      final _datePickedCupertinoTheme =
                                          CupertinoTheme.of(context);
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        child: CupertinoTheme(
                                          data: _datePickedCupertinoTheme
                                              .copyWith(
                                            textTheme: _datePickedCupertinoTheme
                                                .textTheme
                                                .copyWith(
                                              dateTimePickerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Helvetica',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            minimumDate: DateTime(1900),
                                            initialDateTime:
                                                getCurrentTimestamp,
                                            maximumDate: getCurrentTimestamp,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            use24hFormat: false,
                                            onDateTimeChanged: (newDateTime) =>
                                                safeSetState(() {
                                              _model.datePicked = newDateTime;
                                            }),
                                          ),
                                        ),
                                      );
                                    });
                                await listViewMemoriesRecord.reference
                                    .update(createMemoriesRecordData(
                                  createdTime: _model.datePicked,
                                ));
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    dateTimeFormat(
                                      'MMMM',
                                      listViewMemoriesRecord.createdTime!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Helvetica',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
