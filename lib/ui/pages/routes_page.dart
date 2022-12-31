import 'package:dashfleet_ui/data/entities.dart';
import 'package:flutter/material.dart';

import 'package:dashfleet_ui/ui/widgets/route_data_widget.dart';

/// Pagina donde se muestran todas las rutas.
class RoutesPage extends StatelessWidget {
  final List<Routes> routesToDo;
  final Routes routeComplete;

  const RoutesPage({
    super.key,
    required this.routesToDo,
    required this.routeComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text('ESTAS SON TUS RUTAS'),
          const SizedBox(height: 16),
          RouteCardWidget(
            route: routeComplete,
          ),
          const SizedBox(height: 32),
          const Text(
            'Estas son algunas que aun puedes realizar',
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: routesToDo.length,
              itemBuilder: (context, index) {
                return RouteCardWidget(
                  route: routesToDo[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
