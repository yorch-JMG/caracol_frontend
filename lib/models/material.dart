
class Material1 {
  int idMaterial = 0;
  String? nombre;
  String? tipo;
  int? cantidad;

  factory Material1.fromJson(Map<String, dynamic> material) {
    return Material1(material["idMaterial"], 
                    material['nombre'] as String, 
                    material['tipo'] as String, 
                    material['cantidad'] as int); 
  }
  Material1( int idMaterial,  String nombre, String tipo, int cantidad)
  {
    this.idMaterial = idMaterial;
    this.nombre = nombre;
    this.tipo = tipo;
    this.cantidad = cantidad;
  }
  int getIdMaterial(){
    return idMaterial != null ? this.idMaterial : 0;
  }
  String? getNombre(){
    return nombre != null ? this.nombre : "";
  }
  String? getTipo(){
    return tipo != null ? this.tipo : "";
  }
  int? getCantidad(){
    return cantidad != null ? this.cantidad : 0;
  }
}
