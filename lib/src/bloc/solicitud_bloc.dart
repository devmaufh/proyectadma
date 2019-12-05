import 'dart:async';

import 'package:rmys/src/models/solicitud_model.dart';
import 'package:rmys/src/providers/apiProvider.dart';

class SolicitudBloc{
  final ApiProvider provider = ApiProvider();
  final _solicitudController = StreamController<List<SolicitudModel>>.broadcast();

    Stream<List<SolicitudModel>> get solicitudStream => _solicitudController.stream;


  void getSolicitud(String rfc)async{
    print("Obteniendo solicituid");
    var listaSolicitud  = await provider.listaSolicitudes(rfc);
    _solicitudController.sink.add(listaSolicitud);
  }
}