part of '../music_detail_page.dart';

class _MusicDetailInherit extends InheritedWidget {
  final PageManager pageManager;

  const _MusicDetailInherit({
    required this.pageManager,
    required super.child,
  });

  static _MusicDetailInherit of(BuildContext context) {
    final _MusicDetailInherit? result =
        context.dependOnInheritedWidgetOfExactType<_MusicDetailInherit>();
    assert(result != null, 'No _MusicDetailInherit found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(_MusicDetailInherit oldWidget) {
    return true;
  }
}
