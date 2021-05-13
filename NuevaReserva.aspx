<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NuevaReserva.aspx.vb" Inherits="RE_Escritorio.NuevaReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="mx-auto " style=" border-radius: 5px; padding: 10px; max-width: 450px; height: 140px; background-color: #c2081b; "> <%--background-color:#1b1b1b;--%>
            <div class="row mx-0 pl-0 pr-0" >
                <div class="col d-flex justify-content-end" >
                    <a href="#" id="Button1" runat="server"  ><span   class="fa fa-caret-left mt-4 ml-4" style="color:white; font-size: 60px"></span></a> <%--color:#54dbb3;--%>
                </div>

                <div class="col">
                    <div>
                        &nbsp;<asp:TextBox ID="txtFecha" runat="server"  ReadOnly=true CssClass=" form-control form-rounded" Style=" background-color:white;  width:150px; font-weight: bold; height: 55px; font-size: 1.1rem; color:#c2081b; "></asp:TextBox> <%--color:#54dbb3;--%>
                        <br />
                       &nbsp;<asp:DropDownList ID="ddlTurno" AutoPostBack="true" runat="server"   DataTextField="Descripcion" DataValueField="hora" class=" form-control form-rounded" style="margin-left:-18px;margin-top:-40px;background-color:white;  width:180px; font-weight: bold; height: 38px; font-size: 1.1rem; color:#c2081b"> </asp:DropDownList>
                             
                       
                    </div>
                </div>

                <div class="col d-flex justify-content-start">
                    <a href="#" id="Button2" runat="server"  ><span   class="fa fa-caret-right mt-4" style="color:white; font-size: 60px; "></span></a> <%--color:#54dbb3;--%>
                </div> 
            </div> 
        </div>

    <asp:TextBox ID="txtFechaDB" runat="server"   Style=" display:none"></asp:TextBox>

<div id="mapaCompleto" >
   
        <div id="botones" style="z-index:3;">
      

            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="">
                <ItemTemplate> 
                    <input type="button" class='btn <%# Eval("Estado") %>' data-EstadoDesc='<%# Eval("EstadoDesc") %>' data-TipoDesc='<%# Eval("TipoDesc") %>' data-Nombre='<%# Eval("Nombre") %>' data-Numero='<%# Eval("Numero") %>'  style='position:absolute; top:<%# Eval("CoordenadaY") %>px; left:<%# Eval("CoordenadaX") %>px; width:35px; z-index:2' value="<%# Eval("Numero") %>" onClick="getValue(<%# Eval("ID") %>, this.getAttribute('class'), this.getAttribute('data-TipoDesc'), this.getAttribute('data-EstadoDesc'), this.getAttribute('data-Nombre'), this.getAttribute('data-Numero'),<%# Eval("Foto") %>);" />
                </ItemTemplate>  
            </asp:Repeater>
        </div>
        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="main.css" rel="stylesheet">
        <div id="divPlano">
            <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="dist\img\plano\plano.png?V=4" OnClick="ImageButton1_Click" />
        </div>

        <div class="container" style="padding-top: 1em;">
 
            <button type="button" class="btn OcupadoPorUsuario">Mi Reserva</button>
            <button type="button" class="btn Libre">Disponible</button>
            <button type="button" class="btn OcupadoPorOtro">Ocupado</button>
            <button type="button" class="btn AnuladoPorCercania">Advertencia</button>
            <button type="button" class="btn Roto">En reparación</button>
 
        </div>
    </div>
</div>

    <div id="divOverlay" runat="server" class="overlay" style="display:none;">
        <div id="divPopUP" class="popup" runat="server" style="display:none;" >
            <div id="pregunta" style="text-align:center; margin-top:1rem; margin-bottom:1rem;">
                  <asp:Label id="lblError"   ForeColor="red" Text="" runat="server" />  
                <asp:Label id="lblPregunta" Text="" runat="server" /> <br />
                <asp:Label id="lblTipo" Text="Tipo de Lugar: Lugar" runat="server" style="font-size: 1.5rem;" />
            </div>
            <div id="divImagen" style="width: 25em; margin:auto auto auto auto; text-align:center;" runat="server">
                <img id="imgLugar" src="./dist/img/Lugares/default.png" class="imgDiv"  style=" width: 500px"  runat="server" alt="Imagen no disponible" />
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

<script>

    function getValue(valor, clase, tipoDesc, estadoDesc, Nombre, Numero, foto) {
        var val = valor.toString();
        var prefijo = "ContentPlaceHolder1_";
        document.getElementById(prefijo + "btnValor").value = val;
        document.getElementById(prefijo + "lblError").innerHTML = "";
        if (estadoDesc == 'Libre') {
            document.getElementById(prefijo + "lblPregunta").innerHTML = 'Reservar lugar N° ' + Numero + ' en el horario:' + document.getElementById(prefijo + "ddlTurno").value  + ' ?';
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

        document.getElementById(prefijo + "lblTipo").innerHTML = 'Fila: ' + Nombre;

        document.getElementById(prefijo + "imgLugar").src = "./dist/img/Lugares/" + foto + ".png?version=1";
        document.getElementById(prefijo + "imgURL").value = "./dist/img/Lugares/" + foto + ".png?version=1";

        document.getElementById(prefijo + "divOverlay").style.removeProperty('display');
        document.getElementById(prefijo + "divPopUP").style.removeProperty('display');;
    }

        

    function showCoords(event) {
        var x = event.clientX;
        var y = event.clientY;
        var coor = "X: " + x + ", Y: " + y;
        document.getElementById("txtX").value = x;
        document.getElementById("txtY").value = y;
    }

    function clearCoor() {
        document.getElementById("demo").innerHTML = "";
    }

    function datetimepicker(id) {
        var from = $("input[id$=" + id + "]").val();
        if (from) {
            from = from.split("/");
            today = new Date(from[2], from[0] - 1, from[1]);
        }
        else {
            date = new Date();
            today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        }
        $("input[id$=" + id + "]").datepicker({
            language: 'en',
            format: 'mm/dd/yyyy',
            todayHighlight: true,
            defaultDate: today,
            autoclose: true
        });

        $("input[id$=" + id + "]").datepicker('setDate', today);
    }

    $(function () {
        var from = $('[id$=datetimepicker]').val();
        if (from) {
            from = from.split("/");
            today = new Date(from[2], from[0] - 1, from[1]);
        }
        else {
            date = new Date();
            today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        }
        $('[id$=datetimepicker]').datetimepicker({
            startDate: date.getDate() + "-" + date.getMonth() + "-" + date.getFullYear(),
            startView: "day",
        });

    });


</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('[id$=tblHorariosCanchas]').dataTable({
            language: {
                searchPlaceholder: "Buscar",
                search: "",
            },
            "paging": false,
            "info": false

        });

        var tam = $(window).width();
        if (tam < 780) {
            $('#idCajaBienv').css('font-size', '3rem', '!important');
        }
        else {
            $('#idCajaBienv').css('font-size', '1.9rem', '!important');
        }
        console.log(tam);
    });
    var table = $('#example').DataTable();

</script>
</asp:Content>
