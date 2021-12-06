import 'package:charts_flutter/flutter.dart' as charts;

class DatosGrafica {
  int? anios;
  int? ventas;
  charts.Color? color;

  factory DatosGrafica.fromJson(Map<String, dynamic> datos) {
    return DatosGrafica(datos["años"] as int, 
                    datos['ventas'] as int);
  }

  DatosGrafica( int anios,  int ventas)  {
    this.anios = anios;
    this.ventas = ventas;
  }
  int? getAnios(){
    return anios != null ? this.anios : null;
  }
  int? getVentas(){
    return ventas != null ? this.ventas : null;
  }
}
