import 'dart:async';

import 'package:rmys/src/models/evento_model.dart';
import 'package:rmys/src/providers/apiProvider.dart';

class EventosBloc{
  final ApiProvider provider = ApiProvider();
  final _eventosController = StreamController<List<EventoModel>>.broadcast();

    Stream<List<EventoModel>> get eventosStream => _eventosController.stream;


  void getEventos()async{
    print("Obteniendo eventos");
    var listaEventos  = await provider.listaEventos();
    _eventosController.sink.add(listaEventos);
  }
}