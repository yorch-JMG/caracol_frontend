
class Empleado {
  int? idEmpleado;
  String? nombre;
  String? puesto;
  String? departamento;
  String? telefono;
  int? admin;
  String? correoElectronico;

  factory Empleado.fromJson(Map<String, dynamic> empleado) {
    return Empleado(empleado["idEmpleado"], 
                    empleado['nombre'] as String, 
                    empleado['puesto'] as String, 
                    empleado['departamento'] as String, 
                    empleado['admin'] as int, 
                    empleado['correoElectronico'] as String);
  }

  Empleado( int idEmpleado,  String nombre, String puesto, String departamento, int admin, String correoElectronico)
  {
    this.idEmpleado = idEmpleado;
    this.nombre = nombre;
    this.puesto = puesto;
    this.departamento = departamento;
    this.admin = admin;
    this.correoElectronico = correoElectronico;
  }
  String? getNombre(){
    return nombre != null ? this.nombre : null;
  }
  String? getFecha(){
    return puesto != null ? this.puesto : null;
  }
  String? getTipoBoleto(){
    return departamento != null ? this.departamento : null;
  }
  int? getEdad(){
    return admin != null ? this.admin : null;
  }
  String? getCorreoElectronico(){
    return correoElectronico != null ? this.correoElectronico : null;
  }
}
