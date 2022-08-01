import 'package:flutter/src/widgets/framework.dart';

class GetBuilder<T> extends StatefulWidget {
  final T init;
  final Widget Function(dynamic) builder;

  GetBuilder({
    required this.init,
    required this.builder,
  }) {}

  @override
  State<GetBuilder> createState() => GetBuilderState();
}

class GetBuilderState extends State<GetBuilder> {
  @override
  void initState() {
    (widget.init).state = this;
    widget.init.onInit();
    super.initState();
  }

  @override
  void dispose() {
    widget.init.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    (widget.init).state = this;
    return widget.builder(widget.init);
    // var c = LoginController();
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => c),
    //     // ChangeNotifierProvider(create: (_) => LoginController()),
    //   ],
    //   child: Consumer<T>(
    //     builder: (context, changeNotifier, child) {
    //       return builder(changeNotifier);
    //     },
    //   ),
    // );
  }
}