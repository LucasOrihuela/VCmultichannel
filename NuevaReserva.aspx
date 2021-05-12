﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reservar.aspx.vb" Inherits="RE_Escritorio.Reservar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <div  class="mx-auto " style=" border-radius: 5px; padding: 10px; max-width: 450px; height: 140px; background-color: #3390EE; "> <%--background-color:#1b1b1b;--%>
            <div class="row mx-0 pl-0 pr-0" >
                <div class="col d-flex justify-content-end" >
                    <a href="#" id="Button1" runat="server"  ><span   class="fa fa-caret-left mt-4 ml-4" style="color:white; font-size: 60px"></span></a> <%--color:#54dbb3;--%>
                </div>

                <div class="col">
                    <div>
                        &nbsp;<asp:TextBox ID="txtFecha" runat="server"  ReadOnly=true CssClass=" form-control form-rounded" Style=" background-color:white;  width:150px; font-weight: bold; height: 55px; font-size: 1.1rem; color:#3390EE; "></asp:TextBox> <%--color:#54dbb3;--%>
                        <br />
                        &nbsp;<asp:DropDownList ID="DropDownList0" runat="server" DataSourceID="SqlDataSource6" DataTextField="Descripcion" DataValueField="hora"> </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="SP_RE_Reserva_Listar"></asp:SqlDataSource>
                    </div>
                </div>

                <div class="col d-flex justify-content-start">
                    <a href="#" id="Button2" runat="server"  ><span   class="fa fa-caret-right mt-4" style="color:white; font-size: 60px; "></span></a> <%--color:#54dbb3;--%>
                </div> 
            </div> 
        </div>

    <asp:TextBox ID="txtFechaDB" runat="server"   Style=" display:none"></asp:TextBox>

<div id="mapaCompleto" >
    <div onmousemove="showCoords(event)" onmouseout="clearCoor()" >
        <div style="display: none">
            <p id="demo"></p>
            Escritorio  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id"> </asp:DropDownList>
            Estado <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>
                 <br><br>
            Grupo <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="Select 0 as id, 'No asignar' as nombre union all select  id, convert(varchar(19),id) from [tblRE_Escritorios] order by 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="  select id, nombre from [tblRE_EscritoriosEstados] order by 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="Select 0 as id, 'No asignar' as nombre union all  select  id, nombre  from [tblRE_EscritoriosGrupos] order by 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand=""></asp:SqlDataSource>
            <br><br>
            X <asp:TextBox ID="txtX" runat="server"></asp:TextBox>  <br>
            Y <asp:TextBox ID="txtY" runat="server"></asp:TextBox> <br>
        </div>

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="SP_RE_EscritoriosGrupos"></asp:SqlDataSource>

        <div id="botones" style="z-index:3;">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
                <ItemTemplate> 
                    <input type="button" class='circulo' style='position:absolute; top:<%# Eval("CoordenadaY") %>px; left:<%# Eval("CoordenadaX") %>px;  z-index:1'   value="<%# Eval("ID")  %>"  />
                </ItemTemplate>  
            </asp:Repeater>

            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="">
                <ItemTemplate>                    
                    <input type="button" class='btn <%# Eval("Estado") %>' data-estadodesc='<%# Eval("EstadoDesc") %>' data-tipodesc='<%# Eval("TipoDesc") %>' style='position: absolute; top: <%# Eval("CoordenadaY") %>px; left: <%# Eval("CoordenadaX") %>px; width: 50px; z-index: 2' value="<%#Eval("Nombre") & Eval("ID") %>" onclick="getValue(this.value, this.getAttribute('class'), this.getAttribute('data-TipoDesc'), this.getAttribute('data-EstadoDesc'), <%# Eval("Foto") %>);" />
                </ItemTemplate>  
            </asp:Repeater>
        </div>
        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="main.css" rel="stylesheet">
        <div id="divPlano">
            <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="dist\img\Mapa\mapa.png" OnClick="ImageButton1_Click" />
        </div>

        <div class="container" style="padding-top: 1em;">
            <button type="button" class="btn btn-default">Normal</button>
            <button type="button" class="btn OcupadoPorUsuario">Mi Reserva</button>
            <button type="button" class="btn Libre">Disponible</button>
            <button type="button" class="btn OcupadoPorOtro">Ocupado</button>
            <button type="button" class="btn AnuladoPorCercania">Advertencia</button>
            <button type="button" class="btn Roto">En reparación</button>
            <button type="button" class="btn btn-link">Enlace</button>
        </div>
    </div>
</div>

    <div id="divOverlay" runat="server" class="overlay" style="display:none;">
        <div id="divPopUP" class="popup" runat="server" style="display:none;" >
            <div id="pregunta" style="text-align:center; margin-top:1rem; margin-bottom:1rem;">
                <asp:Label id="lblPregunta" Text="Desea generar la reserva?" runat="server" /> <br />
                <asp:Label id="lblTipo" Text="Tipo de escritorio: Escritorio" runat="server" style="font-size: 1.5rem;" />
            </div>
            <div id="divImagen" style="width: 25em; margin:auto auto auto auto; text-align:center;" runat="server">
                <img id="imgEscritorio" src="./dist/img/escritorios/default.png" class="imgDiv" runat="server" alt="Imagen no disponible" />
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

    function getValue(valor, clase, tipoDesc, estadoDesc,Foto) {
        var val = valor.toString();
        var prefijo = "ContentPlaceHolder1_";
        document.getElementById(prefijo + "btnValor").value = val;

        if (estadoDesc == 'Libre') {
            document.getElementById(prefijo + "lblPregunta").innerHTML = 'Reservar escritorio N° ' + val + ' ?';
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

        document.getElementById(prefijo + "imgEscritorio").src = "./dist/img/escritorio/ " + Foto + ".png ? version = 2";
        document.getElementById(prefijo + "imgURL").value = "./dist/img/escritorio/" + Foto + ".png?version=2";

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