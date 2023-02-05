import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/device/managers/ambient_manager.dart';

typedef WidgetBuilder = List<Widget> Function(BuildContext context, Widget? child, Widget? ambientChild);

class AmbientBuilder extends StatefulWidget {
  const AmbientBuilder({
    required this.child,
    this.builder,
    this.ambientChild,
    this.ambientManager,
    super.key,
  });

  final Widget child;
  final Widget? ambientChild;
  final WidgetBuilder? builder;

  final AmbientManager? ambientManager;

  @override
  State createState() => _AmbientBuilderState();
}

class _AmbientBuilderState extends State<AmbientBuilder> {
  late final AmbientManager _ambientManager;

  var _isAmbient = false;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    _ambientManager = widget.ambientManager ?? GetIt.I.get<AmbientManager>();
    subscription = _ambientManager.ambient.listen((_) {
      setState(() {
        _isAmbient = _ambientManager.isAmbient;
      });
    });
  }

  @override
  void didUpdateWidget(covariant AmbientBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.ambientManager == oldWidget.ambientManager) {
      return;
    }

    subscription.cancel();
    _ambientManager = widget.ambientManager ?? GetIt.I.get<AmbientManager>();
    subscription = _ambientManager.ambient.listen((_) {
      setState(() {
        _isAmbient = _ambientManager.isAmbient;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  List<Widget> _defaultBuilder(BuildContext context, Widget? child, Widget? ambientChild) {
    return [
      widget.child,
      if (_isAmbient && widget.ambientChild != null) widget.ambientChild!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final builder = widget.builder ?? _defaultBuilder;

    return Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: builder(context, widget.child, widget.ambientChild));
  }
}
