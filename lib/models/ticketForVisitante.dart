class Ticket {
  String nombreVisitante = "";
  String nombreEvento = "";
  String fechaEvento = "";
  String tipoBoleto = "";
  int precio = 0;

  factory Ticket.fromJson(Map<String, dynamic> ticket) {
    return Ticket(ticket["nombreVisitante"] as String, 
                    ticket['nombreEvento'] as String, 
                    ticket['fechaEvento'] as String, 
                    ticket['tipoBoleto'] as String, 
                    ticket['precio'] as int);
  }
  Ticket(String nombreVisitante, String nombreEvento, String fechaEvento, String tipoBoleto, int precio){
    this.nombreVisitante = nombreVisitante;
    this.nombreEvento = nombreEvento;
    this.fechaEvento = fechaEvento;
    this.tipoBoleto = tipoBoleto;
    this.precio = precio;
  }
  String getNombreVisitante(){
    return nombreVisitante != null ? this.nombreVisitante : "";
  }
  String getNombreEvento(){
    return nombreEvento != null ? this.nombreEvento : "";
  }
  String getFechaEvento(){
    return fechaEvento != null ? this.fechaEvento : "";
  }
  String getTipoBoleto(){
    return tipoBoleto != null ? this.tipoBoleto : "";
  }
}
