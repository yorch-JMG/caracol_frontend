class Visitante {
  int? idVisitante;
  String? nombre;
  String? fecha;
  String? tipoBoleto;
  int? edad;
  String? correoElectronico;

  Visitante( int idVisitante,  String nombre, String fecha, String tipoBoleto, int edad, String correoElectronico)
  {
    this.idVisitante = idVisitante;
    this.nombre = nombre;
    this.fecha = fecha;
    this.tipoBoleto = tipoBoleto;
    this.edad = edad;
    this.correoElectronico = correoElectronico;
  }

  factory Visitante.fromJson(Map<String, dynamic> json) {
    return Visitante(json['idVisitante'] as int, 
                    json['nombre'] as String, 
                    json['fecha'] as String, 
                    json['tipoBoleto'] as String, 
                    json['edad'] as int, 
                    json['correoElectronico'] as String);
  }
  String? getNombre(){
    return nombre != null ? this.nombre : null;
  }
  String? getFecha(){
    return fecha != null ? this.fecha : null;
  }
  String? getTipoBoleto(){
    return tipoBoleto != null ? this.tipoBoleto : null;
  }
  int? getEdad(){
    return edad != null ? this.edad : null;
  }
  String? getCorreoElectronico(){
    return correoElectronico != null ? this.correoElectronico : null;
  }
}
