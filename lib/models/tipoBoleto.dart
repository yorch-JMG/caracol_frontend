class TipoBoleto {
  String? tipoBoletoMasComun;
  int? numeroDeBoletos;

  TipoBoleto(){
    this.tipoBoletoMasComun = "";
    this.numeroDeBoletos = 0;
  }
  void setDatosTipoBoleto(String tipoBoleto, int numeroDeBoletos){
    this.tipoBoletoMasComun = tipoBoleto;
    this.numeroDeBoletos = numeroDeBoletos;
  }
}
