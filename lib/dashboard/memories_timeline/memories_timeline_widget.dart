import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/delete_memories/delete_memories_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'memories_timeline_model.dart';
export 'memories_timeline_model.dart';

class MemoriesTimelineWidget extends StatefulWidget {
  const MemoriesTimelineWidget({super.key});

  @override
  State<MemoriesTimelineWidget> createState() => _MemoriesTimelineWidgetState();
}

class _MemoriesTimelineWidgetState extends State<MemoriesTimelineWidget> {
  late MemoriesTimelineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemoriesTimelineModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SharedUserRecord>>(
      stream: querySharedUserRecord(
        queryBuilder: (sharedUserRecord) => sharedUserRecord.where(
          'ownEmail',
          isEqualTo: currentUserEmail != '' ? currentUserEmail : null,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.transparent,
                  ),
                ),
              ),
            ),
          );
        }
        List<SharedUserRecord> memoriesTimelineSharedUserRecordList =
            snapshot.data!;
        final memoriesTimelineSharedUserRecord =
            memoriesTimelineSharedUserRecordList.isNotEmpty
                ? memoriesTimelineSharedUserRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.black,
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        if (FFAppState().bgImg == '') {
                          return Opacity(
                            opacity: 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/happy-saint-valentine-s-day-concept_2.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return Opacity(
                            opacity: 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: FFAppState().bgImg,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          'Hi, ${valueOrDefault(currentUserDocument?.firstName, '')}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Istanbul type',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 45.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        functions.getGreetingUsingTime(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'JasmineUPC',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 48.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (valueOrDefault<bool>(
                                          memoriesTimelineSharedUserRecord
                                              ?.isShared,
                                          false,
                                        )) {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<MemoriesRecord>>(
                                              stream: queryMemoriesRecord(
                                                queryBuilder:
                                                    (memoriesRecord) =>
                                                        memoriesRecord
                                                            .where(
                                                              'user_id',
                                                              isEqualTo:
                                                                  memoriesTimelineSharedUserRecord
                                                                      ?.sharedUid,
                                                            )
                                                            .orderBy(
                                                                'created_time',
                                                                descending:
                                                                    true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Colors.transparent,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<MemoriesRecord>
                                                    columnMemoriesRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                      columnMemoriesRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnMemoriesRecord =
                                                        columnMemoriesRecordList[
                                                            columnIndex];
                                                    return FutureBuilder<int>(
                                                      future:
                                                          queryMomentsRecordCount(
                                                        parent:
                                                            columnMemoriesRecord
                                                                .reference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        int columnCount =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (columnCount <=
                                                                      0) {
                                                                    context
                                                                        .pushNamed(
                                                                      'createMoment',
                                                                      queryParameters:
                                                                          {
                                                                        'memories':
                                                                            serializeParam(
                                                                          columnMemoriesRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'memories':
                                                                            columnMemoriesRecord,
                                                                      },
                                                                    );

                                                                    return;
                                                                  } else {
                                                                    context
                                                                        .pushNamed(
                                                                      'momentTimeline',
                                                                      queryParameters:
                                                                          {
                                                                        'memories':
                                                                            serializeParam(
                                                                          columnMemoriesRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'memories':
                                                                            columnMemoriesRecord,
                                                                      },
                                                                    );

                                                                    return;
                                                                  }
                                                                },
                                                                child:
                                                                    SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Stack(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                        child:
                                                                            OctoImage(
                                                                          placeholderBuilder: (_) =>
                                                                              SizedBox.expand(
                                                                            child:
                                                                                Image(
                                                                              image: BlurHashImage(columnMemoriesRecord.imgBlurHash),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            columnMemoriesRecord.imgUrl,
                                                                          ),
                                                                          width:
                                                                              350.0,
                                                                          height:
                                                                              350.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat('d MMMM y', columnMemoriesRecord.createdTime!),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          columnMemoriesRecord.memoryTitle,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Istanbul type',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: 28.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(const SizedBox(height: 5.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Shared by',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'JasmineUPC',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w300,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      memoriesTimelineSharedUserRecord!.sharedUserName,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'JasmineUPC',
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            fontSize: 24.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w300,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          100.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            1.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.6,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'MMMM y',
                                                                          columnMemoriesRecord
                                                                              .createdTime!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Istanbul type',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            useGoogleFonts:
                                                                                false,
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
                                                  }),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<MemoriesRecord>>(
                                              stream: queryMemoriesRecord(
                                                queryBuilder:
                                                    (memoriesRecord) =>
                                                        memoriesRecord
                                                            .where(
                                                              'user_id',
                                                              isEqualTo:
                                                                  currentUserUid,
                                                            )
                                                            .orderBy(
                                                                'created_time',
                                                                descending:
                                                                    true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Colors.transparent,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<MemoriesRecord>
                                                    columnMemoriesRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                      columnMemoriesRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnMemoriesRecord =
                                                        columnMemoriesRecordList[
                                                            columnIndex];
                                                    return FutureBuilder<int>(
                                                      future:
                                                          queryMomentsRecordCount(
                                                        parent:
                                                            columnMemoriesRecord
                                                                .reference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        int columnCount =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (columnCount <=
                                                                        0) {
                                                                      context
                                                                          .pushNamed(
                                                                        'createMoment',
                                                                        queryParameters:
                                                                            {
                                                                          'memories':
                                                                              serializeParam(
                                                                            columnMemoriesRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'memories':
                                                                              columnMemoriesRecord,
                                                                        },
                                                                      );

                                                                      return;
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        'momentTimeline',
                                                                        queryParameters:
                                                                            {
                                                                          'memories':
                                                                              serializeParam(
                                                                            columnMemoriesRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'memories':
                                                                              columnMemoriesRecord,
                                                                        },
                                                                      );

                                                                      return;
                                                                    }
                                                                  },
                                                                  onLongPress:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                DeleteMemoriesWidget(
                                                                              memory: columnMemoriesRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                          child:
                                                                              OctoImage(
                                                                            placeholderBuilder: (_) =>
                                                                                SizedBox.expand(
                                                                              child: Image(
                                                                                image: BlurHashImage(columnMemoriesRecord.imgBlurHash),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            image:
                                                                                CachedNetworkImageProvider(
                                                                              columnMemoriesRecord.imgUrl,
                                                                            ),
                                                                            width:
                                                                                350.0,
                                                                            height:
                                                                                350.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat('d MMMM y', columnMemoriesRecord.createdTime!),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            columnMemoriesRecord.memoryTitle,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Istanbul type',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: 28.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(const SizedBox(height: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          100.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            1.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet<
                                                                            bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          final datePickedCupertinoTheme =
                                                                              CupertinoTheme.of(context);
                                                                          return Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height / 3,
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            child:
                                                                                CupertinoTheme(
                                                                              data: datePickedCupertinoTheme.copyWith(
                                                                                textTheme: datePickedCupertinoTheme.textTheme.copyWith(
                                                                                  dateTimePickerTextStyle: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              child: CupertinoDatePicker(
                                                                                mode: CupertinoDatePickerMode.date,
                                                                                minimumDate: DateTime(1900),
                                                                                initialDateTime: getCurrentTimestamp,
                                                                                maximumDate: getCurrentTimestamp,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                use24hFormat: false,
                                                                                onDateTimeChanged: (newDateTime) => safeSetState(() {
                                                                                  _model.datePicked = newDateTime;
                                                                                }),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });

                                                                    await columnMemoriesRecord
                                                                        .reference
                                                                        .update(
                                                                            createMemoriesRecordData(
                                                                      createdTime:
                                                                          _model
                                                                              .datePicked,
                                                                    ));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.6,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'MMMM y',
                                                                            columnMemoriesRecord.createdTime!),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Istanbul type',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
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
                                                  }),
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('profileDetail');
                              },
                              text: 'Admin',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Istanbul type',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('CreateMemories');
                            },
                            text: '',
                            icon: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              width: 48.0,
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Istanbul type',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
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
