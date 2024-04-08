import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'moment_detail_model.dart';
export 'moment_detail_model.dart';

class MomentDetailWidget extends StatefulWidget {
  const MomentDetailWidget({
    super.key,
    this.moments,
    this.memories,
  });

  final MomentsRecord? moments;
  final MemoriesRecord? memories;

  @override
  State<MomentDetailWidget> createState() => _MomentDetailWidgetState();
}

class _MomentDetailWidgetState extends State<MomentDetailWidget> {
  late MomentDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentDetailModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: OctoImage(
                          placeholderBuilder: (_) => SizedBox.expand(
                            child: Image(
                              image: BlurHashImage(widget.moments!.imgBlurHash),
                              fit: BoxFit.cover,
                            ),
                          ),
                          image: NetworkImage(
                            valueOrDefault<String>(
                              widget.moments?.imgUrl,
                              'https://firebasestorage.googleapis.com/v0/b/envoke-7dtyz3.appspot.com/o/Frame%201.png?alt=media&token=8c4b7f71-652d-4cf1-b4f2-1b4e0a946659',
                            ),
                          ),
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(10.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.memories!.memoryTitle,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Istanbul type',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat('d MMMM y',
                                              widget.memories!.createdTime!),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Istanbul type',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
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
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 40.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Vector.svg',
                              width: 30.0,
                              height: 15.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(-1.0, -1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 0.0, 10.0),
                            child: Text(
                              widget.moments!.title,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Istanbul type',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 36.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 0.0, 10.0),
                            child: Text(
                              widget.moments!.notes,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (widget.moments?.audioUrl != null &&
                              widget.moments?.audioUrl != '')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: FlutterFlowAudioPlayer(
                                      audio: Audio.network(
                                        widget.moments!.audioUrl,
                                        metas: Metas(
                                          id: '2vqf7_-855edce5',
                                          title: 'Audio Memo',
                                        ),
                                      ),
                                      titleTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                      playbackDurationTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                      fillColor: Colors.black,
                                      playbackButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      elevation: 0.0,
                                      playInBackground: PlayInBackground
                                          .disabledRestoreOnForeground,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
