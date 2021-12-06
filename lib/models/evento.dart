class Evento {
  int? noEvento;
  String? nombre;
  String? fecha;
  int? asistentes;
  String? descripcion;

  factory Evento.fromJson(Map<String, dynamic> evento) {
    return Evento(evento["noEvento"], 
                    evento['nombre'] as String, 
                    evento['fecha'] as String, 
                    evento['asistentes'] as int, 
                    evento['descripcion'] as String); 
  }

  Evento( int noEvento,  String nombre, String fecha, int asistentes , String descripcion)
  {
    this.noEvento = noEvento;
    this.nombre = nombre;
    this.fecha = fecha;
    this.asistentes = asistentes;
    this.descripcion = descripcion;
  }
  int? getNoEvento(){
    return noEvento != null ? this.noEvento : null;
  }
  String? getNombre(){
    return nombre != null ? this.nombre : null;
  }
  String? getFecha(){
    return fecha != null ? this.fecha : null;
  }
  int? getAsistentes(){
    return asistentes != null ? this.asistentes : null;
  }
  String? getDescripcion(){
    return descripcion != null ? this.descripcion : null;
  }
}
