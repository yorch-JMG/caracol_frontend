import 'package:charts_flutter/flutter.dart' as charts;

class DatosGrafica {
  int anios = 0;
  int ventas = 0;
  charts.Color color = charts.Color.black;

  factory DatosGrafica.fromJson(Map<String, dynamic> datos) {
    return DatosGrafica(datos["años"] as int, 
                    datos['ventas'] as int);
  }

  DatosGrafica( int anios,  int ventas)  {
    this.anios = anios;
    this.ventas = ventas;
  }
  int getAnios(){
    return anios != null ? this.anios : 0;
  }
  int getVentas(){
    return ventas != null ? this.ventas : 0;
  }
}
