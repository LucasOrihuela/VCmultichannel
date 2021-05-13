<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DDJJ.aspx.vb" Inherits="RE_Escritorio.DDJJ" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      
<!-- saved from url=(0039)http://www.sarsy-srl.com/WBO/Login.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/AdminLTE.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="css/blue.css">
    <!--Sweet Alert! -->
    <link rel="stylesheet" href="css/sweetalert2.css">
    <link rel="stylesheet" href="dist/css/controles.css" type="text/css" />
    <title>

</title><link id="ImgfavIcon" rel="shorcut icon" href=""></head>
 <Style>

 </style>

    <div class="login-box">
        
        <!-- /.login-logo -->
        <div class="login-box-body">
            <div  class="mx-auto " style=" border-radius: 5px; padding: 10px; max-width: 450px; height: 110px; background-color:#E6E6E6;"> <%--background-color:#1b1b1b"--%>
                <div class="row mx-0 pl-0 pr-0">
                <div class="col" style="margin-top:10px;">
                    <label class="lblcustom justify-content-lg-center" style="color:#3390EE; font-size:2.5rem;" >Declaracion Jurada</label>
                </div>
            </div> 
        </div>
 
	<div id="nav-spacer"  ></div>
  
<div id="div1"> 
<div id="divContenedor" class="mx-auto mt-5 container-fluid" style="color:black; border-radius: 50px; padding: 10px; max-width: 500px; background-color: white; border: 1px solid #3390EE;">
  
            
          
              
                <asp:Panel ID="Panel1" runat="server" visible="true">
                    <center><progress max="101" value="14.3" style="width:250px;"></progress></center>
                    <div class="text-center" style="text-align:center">
                        <h3> ¿Cuál es tu temperatura corporal? </h3> 
                        <br />
                        <button type="button" id="btnRestarTemp" class="btn btn-outline-primary" onclick="BajarTemperatura()">-</button>
                        &nbsp
                        <input type="text" value="37" id="txtTemperatura" runat="server" style="border:hidden; text-align:center;"/>
                        &nbsp
                        <button type="button" id="btnSumarTemp" class="btn btn-outline-primary" onclick="AumentarTemperatura()">+</button>
                    </div>
                    <div class="container" style="width:40rem;">
                       <div id="container1" class="separadoArriba" style="text-align:left;" >
                            <b><p>Consejos para medir la temperatura: </p></b>
                        </div>
                        <div>
                            <ul style="max-width:450px;"> 
                                <li style="margin-bottom:1rem;">Medí la temperatura siempre en el mismo lugar (oido y axila), ya que de otro modo pueden variar los valores.</li>
                                <li style="margin-bottom:1rem;">No se debe tomar la temperatura despues del baño o de haber realizado una actividad fisica. Esperá por lo menos 20 minutos para hacerlo.</li>
                                <li>La fiebre hay que medirla, no hay que fiarse de la percepción que se tenga al tocar la frente.</li>
                            </ul>
                        </div>
                        <div style="text-align:center; max-width:450px;">
                            <br />
                            <asp:Button CssClass="botones" ID="btnContinuarPanel1" runat="server" Text="Continuar" />
                        </div>
                    </div>
                        
                </asp:Panel>

                <asp:Panel ID="Panel2" Visible="false" runat="server">
               <center><progress max="101" value="28.6" style="width:250px;"></progress></center>
                <div id="container2" class="separadoAbajo" style="text-align:center; max-width:450px" >
                    <p>¿Tenés dolor de garganta?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault1" id="gargantaSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault1" id="gargantaNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>

                    <p class="separadoArriba">¿Tenés dificultad respiratoria o falta de aire?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault2" id="respiratorioSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault2" id="respiratorioNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>

                    <p class="separadoArriba">¿Tenés dolor de cabeza?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault3" id="cabezaSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault3" id="cabezaNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>
                    <br />
                    <asp:Button ID="btnContinuarPanel2" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>


                <asp:Panel ID="Panel3" Visible="false" runat="server">
                    <center><progress max="101" value="42.9" style="width:250px;"></progress></center>
                <div id="container3" class="separadoAbajo" style="text-align:center" >
                    <p>¿Tenés diarrea?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault4" id="diarreaSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault4" id="diarreaNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>

                    <p class="separadoArriba">¿Tenés vómitos?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault5" id="vomitoSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault5" id="vomitoNO" checked  runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>

                    <p class="separadoArriba">¿Tenés dolor muscular?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault6" id="muscularSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault6" id="muscularNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>
                    <br />
                        <asp:Button ID="btnContinuarPanel3" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>


                <asp:Panel ID="Panel4" Visible="false" runat="server">
                    <center><progress max="101" value="57.2" style="width:250px;"></progress></center>
                <div id="container4" class="separadoAbajo" style="text-align:center; max-width:450px" >
                    <p>¿Percibiste una pérdida del olfato de manera repentina?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault7" id="olfatoSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault7" id="olfatoNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>

                    <p class="separadoArriba">¿Percibiste una marcada pérdida del gusto (sabor de los alimentos) de manera repentina?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault8" id="gustoSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI</label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault8" id="gustoNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO</label>
                    </div>

                    <p class="separadoArriba">¿Tenés tos?</p>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault9" id="tosSI" runat="server" value="SI">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> SI </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault9" id="tosNO" checked runat="server" value="NO">
                      <label class="form-check-label" for="flexRadioDefault" style="width:10px;"> NO </label>
                    </div>
                    <br />
                    <asp:Button ID="btnContinuarPanel4" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>

                <asp:Panel ID="Panel5" Visible="false" runat="server">
                    <center><progress max="101" value="71.5" style="width:250px;"></progress></center>
                <div id="container5" class="separadoAbajo" style="text-align:center; max-width:450px" >
                    <div class="form-check" style="text-align:left;">
                        <asp:CheckBox ID="ContactoEstrecho" runat="server" />
                        <label class="form-check-label" for="defaultCheck1">
                            Trabajo o convivo con una persona que actualmente es caso confirmado
                        </label> <br />
                        
                        <asp:CheckBox ID="ContactoCercano" runat="server" />
                        <label class="form-check-label" for="defaultCheck2">
                            Pasé en los últimos 14 dias al menos 15 minutos cerca de una persona que actualmente es caso confirmado COVID-19
                        </label> <br />

                        <asp:CheckBox ID="Cancer" runat="server" />
                        <label class="form-check-label" for="defaultCheck3">
                            Tengo/tuve cáncer
                        </label>
                        <br />
                    </div>
                    <asp:Button ID="btnContinuarPanel5" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>

                <asp:Panel ID="Panel6" Visible="false" runat="server">
                    <center><progress max="101" value="85.8" style="width:250px;"></progress></center>
                <div id="container6" class="separadoAbajo" style="text-align:center;" >
                    <div style="text-align:left;">
                        <asp:CheckBox ID="Diabetes" runat="server" />
                      <label class="form-check-label" for="defaultCheck4">
                        Tengo diabetes
                      </label>
                     <br />
                        <asp:CheckBox ID="Hepatica" runat="server" />
                      <label class="form-check-label" for="defaultCheck5">
                        Tengo alguna enfermedad hepática
                      </label>
                     <br />
                        <asp:CheckBox ID="Renal" runat="server" />
                      <label class="form-check-label" for="defaultCheck6">
                        Tengo enfermedad renal crónica
                      </label>
                     <br />
                    </div>
                        
                  
                     <asp:Button ID="btnContinuarPanel6" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>

                <asp:Panel ID="Panel7" Visible="false" runat="server">
                    <center><progress max="101" value="101" style="width:250px;"></progress></center>
                <div id="container7" class="separadoAbajo" style="text-align:center;" >
                    <div style="text-align:left"> <asp:CheckBox ID="EnfermedadRespiratoria" runat="server" />
                      <label class="form-check-label" for="defaultCheck7">
                        Tengo alguna enfermedad respiratoria
                      </label>
                    <br />
                        <asp:CheckBox ID="Cardiologica" runat="server" />
                      <label class="form-check-label" for="defaultCheck8">
                        Tengo alguna enfermedad cardiológica
                      </label>
                    <br />
                        <asp:CheckBox ID="Defensas" runat="server" />
                      <label class="form-check-label" for="defaultCheck9">
                        Tengo alguna condición que baja las defensas
                      </label> 
                    <br /></div>
                       
                
                    <asp:Button ID="BtnContinuarPanel7" CssClass="botones" runat="server" Text="Continuar" />
                </div>
                </asp:Panel>

             </div>

     
        <asp:Label ID="lblMensaje" runat="server" style="color:red;" Text=""></asp:Label> 

          <script type="text/javascript">
              //<![CDATA[
              WebForm_AutoFocus('btnLogin');
    </script>
    <script type="text/javascript">
        function AumentarTemperatura() {
            var temp = parseFloat(document.getElementById("<%= txtTemperatura.ClientID %>").value) + 0.1
            document.getElementById("<%= txtTemperatura.ClientID %>").value = temp.toFixed("1")
        }
        function BajarTemperatura() {
            var temp = parseFloat(document.getElementById("<%= txtTemperatura.ClientID %>").value) - 0.1
            document.getElementById("<%= txtTemperatura.ClientID %>").value = temp.toFixed("1")
        }
        </script>
  
            <br>
           
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery 2.2.4 -->
    <script src="script/jquery-2.2.4.min.js.descarga"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="script/bootstrap.min.js.descarga"></script>
    <!-- iCheck -->
    <script src="script/icheck.min.js.descarga"></script>
    <!--Sweet Alert! -->
    <script src="script/sweetalert2.js.descarga"></script>
    <!--Funciones-->
    <script src="script/Funciones.js.descarga"></script>
    <!--Validaciones-->
    <script src="script/Login.js.descarga"></script>
   
<div class="swal2-container"><div class="swal2-overlay" tabindex="-1"></div><div class="swal2-modal" style="display: none; margin-top: -299px;" tabindex="-1"><div class="swal2-icon swal2-error"><span class="x-mark"><span class="line left"></span><span class="line right"></span></span></div><div class="swal2-icon swal2-question">?</div><div class="swal2-icon swal2-warning">!</div><div class="swal2-icon swal2-info">i</div><div class="swal2-icon swal2-success"><span class="line tip"></span> <span class="line long"></span><div class="placeholder"></div> <div class="fix"></div></div><img class="swal2-image"><h2></h2><div class="swal2-content"></div><input class="swal2-input"><select class="swal2-select"></select><div class="swal2-radio"></div><label for="swal2-checkbox" class="swal2-checkbox"><input type="checkbox" id="swal2-checkbox"></label><textarea class="swal2-textarea"></textarea><div class="swal2-validationerror"></div><hr class="swal2-spacer"><button type="button" class="swal2-confirm">OK</button><button type="button" class="swal2-cancel">Cancel</button>
    <span class="swal2-close">×</span></div></div>

</asp:Content>