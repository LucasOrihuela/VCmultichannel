<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Pedidos.aspx.vb" Inherits="RE_Escritorio.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link rel="stylesheet" href="dist/css/controles.css?V=2" type="text/css" />
    <link rel="stylesheet" href="bootstrap/css/Personalizado.CSS?V=2" />
 

    <!-- Font Awesome 4.5.0 -->
 

    <style>
        @media screen and (max-device-width:980px) {
            .btnCstm{
                font-size:5rem;
                border-radius:50px;
            }
            .btnCstm:hover {
                 font-size:5rem;
                border-radius:50px;            
                background-color:white;
            }
            .btnCstmcancel{
                font-size:5rem;
                border-radius:50px;
            }
            .btnCstmcancel:hover {
                 font-size:5rem;
                border-radius:50px;            
                background-color:white;
            }

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div  class="mx-auto " style=" border-radius: 5px; padding: 10px; max-width: 450px; height: 110px; background-color:#E6E6E6;"> <%--background-color:#1b1b1b"--%>
                <div class="row mx-0 pl-0 pr-0">
                <div class="col" style="margin-top:10px;">
                    <center><label class="lblcustom justify-content-lg-center"; style="color:#14B111; font-size:2.5rem;" >Nuevo pedido</label></center>
                </div>
            </div> 
        </div>
        <div id="divContenedor" class="mx-auto mt-5 container-fluid" style="color:white; border-radius: 50px; padding: 10px; max-width: 500px; background-color: white; border: 1px solid #14B111">
            <br/>

            <div >
                <label class="TextPedidos"> Elija una fecha:</label>
                <br />  <center><asp:Calendar ID="CalendarioFechas" CssClass="calendario" runat="server"></asp:Calendar></center>  
            </div>

             <div >
                <label class="TextPedidos"> Elija un horario: </label>
               <br />
                <asp:DropDownList ID="DropDownList0" runat="server" DataSourceID="SqlDataSource6" DataTextField="Descripcion" DataValueField="hora" class="form-control form-rounded" style="max-width:300px; color:#000000; font-size:1.2rem;"> </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="SP_RE_Reserva_Listar"></asp:SqlDataSource>
            </div>

            <div >
                 <label class="TextPedidos"> Elija un area:</label>
                <br />
                <asp:DropDownList ID="ddlAreas" runat="server" class=" form-control form-rounded" style="max-width:300px; color:#000000; font-size:1.2rem"></asp:DropDownList>
            </div>
      
            <div class="row justify-content-center mt-5">
                 
            <div id="divOverlay" runat="server" class="overlay" style="display:none;">
        <div id="divPopUP" class="popup" runat="server" style="display:none;" >
            <div id="pregunta" style="text-align:center; margin-top:1rem; margin-bottom:1rem;">
                <asp:Label id="lblPregunta" Text="Desea generar la reserva?" runat="server" /> <br />
                <asp:Label id="lblTipo" Text="Tipo de Lugar: Lugar" runat="server" style="font-size: 1.5rem;" />
            </div>
            <div id="divImagen" style="width: 25em; margin:auto auto auto auto; text-align:center;" runat="server">
                <img id="imgLugar" src="./dist/img/Lugares/default.png" class="imgDiv" runat="server" alt="Imagen no disponible" />
            </div>
            <div class="divBotones" style="margin-top: 1rem; margin-bottom: 0.5rem;">
                <asp:Button ID="btnYES" runat="server" Text="Reservar" CssClass="btn btn-success" onClick="generarReserva" />
                <asp:Button ID="btnNO" runat="server" Text="Cancelar" CssClass="btn btn-danger" onClick="cerrrarDiv" />
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="redirectMisReservas" style="display:none" />
                <asp:Button ID="btnAceptarOcupado" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="cerrrarDiv" style="display:none" />
            </div>
        </div>
    </div>
                <div>
        <asp:TextBox ID="btnValor" runat="server" Text="" Style="display:none;" AutoPostBack="true" ></asp:TextBox>
        <asp:TextBox ID="imgURL" runat="server" Text="" Style="display:none;" AutoPostBack="true" ></asp:TextBox>
    </div>

                <asp:Button ID="btnGuardarReserva" runat="server" CssClass="botones" Text="Reservar" />
            </div>
            <br />
            <div class="row justify-content-center">
                <asp:Button ID="btnCancelar" runat="server" CssClass="botones"  Text="Cancelar" />
            </div>
            
        </div>
        <center>
            <asp:Label ID="lblError" ForeColor="Yellow" runat="server" CssClass="lblcustom" Text=""></asp:Label>
            </center>
   
    <script>
        function getValue(valor, clase, tipoDesc, estadoDesc) {
            var val = valor.toString();
            var prefijo = "ContentPlaceHolder1_";
            document.getElementById(prefijo + "btnValor").value = val;

            if (estadoDesc == 'Libre') {
                document.getElementById(prefijo + "lblPregunta").innerHTML = 'Reservar Lugar N° ' + val + ' ?';
                document.getElementById(prefijo + "btnYES").style.removeProperty('display');
                document.getElementById(prefijo + "btnNO").style.removeProperty('display');
                document.getElementById(prefijo + "btnAceptarOcupado").style.display = "none";
            }
            else {
                document.getElementById(prefijo + "lblPregunta").innerHTML = estadoDesc;
                document.getElementById(prefijo + "btnYES").style.display = "none";
                document.getElementById(prefijo + "btnNO").style.display = "none";
                document.getElementById(prefijo + "btnAceptarOcupado").style.removeProperty('display');
            }
            //document.getElementById(prefijo + "btnValor").classList.add(clase);

            document.getElementById(prefijo + "lblTipo").innerHTML = 'Tipo: ' + tipoDesc;

            document.getElementById(prefijo + "imgLugar").src = "./dist/img/Lugares/" + val + ".png?version=1";
            document.getElementById(prefijo + "imgURL").value = "./dist/img/Lugares/" + val + ".png?version=1";

            document.getElementById(prefijo + "divOverlay").style.removeProperty('display');
            document.getElementById(prefijo + "divPopUP").style.removeProperty('display');;
        }

    </script>
</asp:Content>
