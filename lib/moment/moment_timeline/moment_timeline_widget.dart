import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moment_timeline_model.dart';
export 'moment_timeline_model.dart';

class MomentTimelineWidget extends StatefulWidget {
  const MomentTimelineWidget({
    super.key,
    this.memories,
  });

  final MemoriesRecord? memories;

  @override
  State<MomentTimelineWidget> createState() => _MomentTimelineWidgetState();
}

class _MomentTimelineWidgetState extends State<MomentTimelineWidget> {
  late MomentTimelineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentTimelineModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MomentsRecord>>(
      stream: queryMomentsRecord(
        parent: widget.memories?.reference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
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
        List<MomentsRecord> momentTimelineMomentsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/tran.jpeg',
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 24.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 190.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Vector.svg',
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      Alignment(-1.0, -1.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 230.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                widget.memories!.memoryTitle,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Istanbul type',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 28.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 115.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'd MMMM y',
                                                    widget.memories!
                                                        .createdTime!),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Istanbul type',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius: 10.0,
                                            borderWidth: 1.0,
                                            buttonSize: 45.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: Icon(
                                              Icons.add_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'createMoment',
                                                queryParameters: {
                                                  'memories': serializeParam(
                                                    widget.memories,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'memories': widget.memories,
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final momentList =
                                      momentTimelineMomentsRecordList.toList();
                                  return Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.8,
                                    child: CarouselSlider.builder(
                                      itemCount: momentList.length,
                                      itemBuilder:
                                          (context, momentListIndex, _) {
                                        final momentListItem =
                                            momentList[momentListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'momentDetail',
                                              queryParameters: {
                                                'moments': serializeParam(
                                                  momentListItem,
                                                  ParamType.Document,
                                                ),
                                                'memories': serializeParam(
                                                  widget.memories,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'moments': momentListItem,
                                                'memories': widget.memories,
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 300),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 300),
                                                  imageUrl:
                                                      momentListItem.imgUrl,
                                                  width: 315.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      momentListItem
                                                                          .title
                                                                          .maybeHandleOverflow(
                                                                              maxChars: 10),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Istanbul type',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                36.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (momentListItem
                                                                            .audioUrl !=
                                                                        null &&
                                                                    momentListItem
                                                                            .audioUrl !=
                                                                        '')
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            45.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .play_arrow,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                momentListItem
                                                                    .notes,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: RichText(
                                                              textScaleFactor:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: (momentListIndex +
                                                                            1)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Istanbul type',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              38.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: '/',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Istanbul type',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontSize:
                                                                          38.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: momentTimelineMomentsRecordList
                                                                        .length
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Istanbul type',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Istanbul type',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage:
                                            min(0, momentList.length - 1),
                                        viewportFraction: 0.8,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.3,
                                        enableInfiniteScroll: false,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
