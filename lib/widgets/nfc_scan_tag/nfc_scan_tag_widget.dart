import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'nfc_scan_tag_model.dart';
export 'nfc_scan_tag_model.dart';

class NfcScanTagWidget extends StatefulWidget {
  const NfcScanTagWidget({
    super.key,
    bool? isScanning,
  }) : isScanning = isScanning ?? true;

  final bool isScanning;

  @override
  State<NfcScanTagWidget> createState() => _NfcScanTagWidgetState();
}

class _NfcScanTagWidgetState extends State<NfcScanTagWidget> {
  late NfcScanTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NfcScanTagModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isScanning) {
        await actions.nfcScan();
        if (FFAppState().nfcUserId == FFAppState().userGuid) {
          if (loggedIn) {
            _model.count = await queryMemoriesRecordCount(
              queryBuilder: (memoriesRecord) => memoriesRecord.where(
                'user_id',
                isEqualTo: currentUserUid,
              ),
            );
            if (_model.count! <= 0) {
              _model.output2 = await querySharedUserRecordOnce(
                queryBuilder: (sharedUserRecord) => sharedUserRecord
                    .where(
                      'isShared',
                      isEqualTo: true,
                    )
                    .where(
                      'ownEmail',
                      isEqualTo: currentUserEmail,
                    ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.output2 != null) {
                context.goNamed('MemoriesTimeline');

                return;
              } else {
                context.goNamed('CreateMemories');
              }
            } else {
              context.goNamed('MemoriesTimeline');

              return;
            }
          } else {
            _model.output = await queryNfcDataRecordOnce(
              queryBuilder: (nfcDataRecord) => nfcDataRecord.where(
                'nfcId',
                isEqualTo: FFAppState().nfcTag,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if (_model.output?.nfcId != null && _model.output?.nfcId != '') {
              if (FFAppState().nfcTag != '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'The jewelry is already registered. Please login.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                context.goNamed('LoginPage');
              } else {
                return;
              }

              return;
            } else {
              if (FFAppState().nfcTag != '') {
                context.goNamed('SignupPage');
              } else {
                return;
              }

              return;
            }
          }

          return;
        } else {
          context.pop();
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: const NfcScanTagWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          return;
        }
      } else {
        await actions.writeNfcTag(
          currentUserUid,
          () async {
            Navigator.pop(context);
          },
        );
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28.0),
          bottomRight: Radius.circular(28.0),
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'vsy7p8pj' /* Ready to scan */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Helvetica',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Lottie.asset(
                    'assets/lottie_animations/NFC_Scan.json',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7b9md3sy' /* Approach an NFC tag */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Helvetica',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.07, 0.83),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'mzzpfp4l' /* Cancel */,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 55.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFDCDFE2),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Helvetica',
                          color: Colors.black,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
