import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'add_shared_model.dart';
export 'add_shared_model.dart';

class AddSharedWidget extends StatefulWidget {
  const AddSharedWidget({super.key});

  @override
  State<AddSharedWidget> createState() => _AddSharedWidgetState();
}

class _AddSharedWidgetState extends State<AddSharedWidget> {
  late AddSharedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddSharedModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'zftor8xk' /* Share Moment */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Helvetica',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: FlutterFlowIconButton(
                        borderColor: const Color(0xFF212121),
                        borderRadius: 16.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        fillColor: const Color(0xFF212121),
                        icon: Icon(
                          Icons.close,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 20.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'qoeg2o09' /* Enter Email */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF5A5A5A),
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Helvetica',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor: const Color(0xFF2F2F2F),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Helvetica',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var shouldSetState = false;
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.textController.text ==
                                    currentUserEmail) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'You cannot share memory with yourself.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.output = await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'email',
                                      isEqualTo: _model.textController.text,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  shouldSetState = true;
                                  if (_model.output?.email != null &&
                                      _model.output?.email != '') {
                                    _model.output2 =
                                        await querySharedUserRecordOnce(
                                      queryBuilder: (sharedUserRecord) =>
                                          sharedUserRecord.where(
                                        'sharedEmail',
                                        isEqualTo: _model.textController.text,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    shouldSetState = true;
                                    if (_model.output2?.sharedEmail != null &&
                                        _model.output2?.sharedEmail != '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Email already shared with another user.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      _model.output3 =
                                          await queryMemoriesRecordCount(
                                        queryBuilder: (memoriesRecord) =>
                                            memoriesRecord.where(
                                          'user_id',
                                          isEqualTo: currentUserUid,
                                        ),
                                      );
                                      shouldSetState = true;
                                      if (_model.output3! > 0) {
                                        await SharedUserRecord.collection
                                            .doc()
                                            .set(createSharedUserRecordData(
                                              isShared: true,
                                              sharedEmail: currentUserEmail,
                                              sharedUid: currentUserUid,
                                              sharedUserName: valueOrDefault(
                                                  currentUserDocument
                                                      ?.firstName,
                                                  ''),
                                              ownUserId: _model.output?.uid,
                                              ownEmail: _model.output?.email,
                                            ));
                                        Navigator.pop(context);
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please add atleast one memory to share.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        Navigator.pop(context);
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'User not registered.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    Navigator.pop(context);
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '1xmio5dg' /* Share */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Helvetica',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
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
    );
  }
}
