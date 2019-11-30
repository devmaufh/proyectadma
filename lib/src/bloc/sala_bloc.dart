import 'dart:async';

import 'package:rmys/src/models/sala_model.dart';
import 'package:rmys/src/providers/apiProvider.dart';

class SalasBloc{
  final ApiProvider provider = ApiProvider();
  final _salasController = StreamController<List<SalaModel>>.broadcast();

    Stream<List<SalaModel>> get salasStream => _salasController.stream;


  void getSalas()async{
    print("Obteniendo salas");
    var listaSalas  = await provider.listaSalas();
    _salasController.sink.add(listaSalas);
  }
}