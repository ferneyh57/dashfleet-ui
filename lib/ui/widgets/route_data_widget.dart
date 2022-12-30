import 'package:dashfleet_ui/data/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RouteListWidget extends StatelessWidget {
  final List<Routes> routesToDo;
  final Routes routeComplete;
  const RouteListWidget({
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
          _RouteCardWidget(
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
                return _RouteCardWidget(
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

class _RouteCardWidget extends StatefulWidget {
  final Routes route;
  const _RouteCardWidget({
    required this.route,
  });

  @override
  State<_RouteCardWidget> createState() => _RouteCardWidgetState();
}

class _RouteCardWidgetState extends State<_RouteCardWidget> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.route.completed) {
          setState(() {
            _selected = !_selected;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: _selected ? Colors.yellow : Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.pages),
                  const SizedBox(width: 24),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Nombre de el destino: ${widget.route.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            'Distancia promedio al destino :${widget.route.distance.toString()} km',
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.route.completed) const Icon(Icons.check),
          ],
        ),
      ),
    );
  }
}
