import 'package:flutter/widgets.dart';

class FutureImage<M extends ImageProvider> extends StatelessWidget {
  final Future<M> future;

  const FutureImage({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<M>(future: future, builder: _builder);
  }

  Widget _builder(BuildContext context, AsyncSnapshot<M> snapshot) {
    final image = snapshot.data;

    if (image == null) return const SizedBox();

    return Image(image: image);
  }
}
