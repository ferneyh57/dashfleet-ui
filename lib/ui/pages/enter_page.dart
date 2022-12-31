import 'package:dashfleet_ui/ui/di/providers.dart';
import 'package:dashfleet_ui/ui/pages/log_in_page.dart';
import 'package:dashfleet_ui/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Enrutador.
class EntryPage extends ConsumerWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    if (ref.watch(logInVM).isLoginOk) {
      return const MainBasePage();
    }

    return const LogInPage();
  }
}
