import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Field para el telefono.
            Text(
              'celular',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 6),
            TextField(),
            const SizedBox(height: 24),

            ///Field para la contraseña.
            Text(
              'Clave',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 6),
            TextField(),
            const SizedBox(height: 24),

            /// Recordar contraseña.
            _SwitchWidget(),
            const Spacer(),
            const _Buttons(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _SwitchWidget extends StatefulWidget {
  const _SwitchWidget();

  @override
  State<_SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<_SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: false,
      onChanged: (value) {},
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Align(
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
              onTap: () {},
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
              'Olvido su contraseña?',
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
