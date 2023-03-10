import 'package:dashfleet_ui/ui/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// pagina de login.
class LogInPage extends StatefulWidget {
  const LogInPage({
    super.key,
  });

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController controllerCel = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  final textFieldBorderStyle = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      color: Colors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'amb app'.toUpperCase(),
            ),
            const SizedBox(height: 12),
            const Text('Login'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 20,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Field para el telefono.
                    Text(
                      'celular',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controllerCel,
                      decoration: InputDecoration(
                        border: textFieldBorderStyle,
                      ),
                    ),
                    const SizedBox(height: 24),

                    ///Field para la contrase??a.
                    Text(
                      'Clave',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controllerPass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: textFieldBorderStyle,
                      ),
                      onEditingComplete: () {},
                    ),
                    const SizedBox(height: 24),

                    /// Recordar contrase??a.
                    _SwitchWidget(
                      rememberUser: (remember) {},
                    ),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return _Buttons(
                  onTapSigInM: () {
                    ref.read(logInVM.notifier).onLogIn(
                          cell: controllerCel.value.text,
                          pass: controllerPass.value.text,
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SwitchWidget extends StatefulWidget {
  final void Function(bool remember) rememberUser;
  const _SwitchWidget({
    required this.rememberUser,
  });

  @override
  State<_SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<_SwitchWidget> {
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: _active,
          onChanged: (value) {
            setState(() {
              _active = value;
            });
          },
        ),
        const SizedBox(width: 12),
        Text(
          'Recordar',
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  final void Function() onTapSigInM;
  const _Buttons({
    required this.onTapSigInM,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Boton de login.
          Ink(
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: onTapSigInM,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                child: Text(
                  'ENTRAR',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Olvido su contrase??a?',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.blue[900],
                  ),
            ),
          )
        ],
      ),
    );
  }
}
