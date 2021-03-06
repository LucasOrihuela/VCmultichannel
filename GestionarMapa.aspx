<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="GestionarMapa.aspx.vb" Inherits="RE_Escritorio.MapaGestionar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div onmousemove="showCoords(event)" onmouseout="clearCoor()">
        <p id="demo"></p>
        <div class="row" style="margin-bottom:30px; margin-top:30px;" >
            <div class="col-sm-4">
                <%--Escritorio  <asp:DropDownList ID="DropDownList1" class="corto" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id"> </asp:DropDownList>
                Estado <asp:DropDownList ID="DropDownList2" class="corto" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>
                     <br><br>
                Grupo <asp:DropDownList ID="DropDownList3" class="corto" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>
                Foto <asp:DropDownList ID="ddlFoto" class="corto" runat="server" onchange="LoadImg();"></asp:DropDownList>
                <br />
                <asp:Image ID="Img" runat="server" />--%>
                <center><asp:Button ID="btnGestionarGrupos" runat="server" CssClass="botones" Text="Gestionar grupos" OnClick="generarCambioGrupo" /> 
                
                <asp:Button ID="btnGestionarEscritorios" runat="server" CssClass="botones" Text="Gestionar escritorios" onClick="generarCambio"/>
                <br />
                </center>
               

            </div>
            <div class="col-sm-4">
                <asp:TextBox ID="txtX" class="corto" runat="server" ></asp:TextBox> <br>
                <asp:TextBox ID="txtY" class="corto" runat="server" ></asp:TextBox> <br>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="Select 0 as id, 'No asignar' as nombre union all select  id, convert(varchar(19),id) from [tblRE_Escritorios] order by 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="  select id, nombre from [tblRE_EscritoriosEstados] order by 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="Select 0 as id, 'No asignar' as nombre union all  select  id, nombre  from [tblRE_EscritoriosGrupos] order by 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="SP_RE_Escritorios"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="SP_RE_EscritoriosGrupos"></asp:SqlDataSource>


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource5">
            <ItemTemplate> 
                <input type="button"   class='circulo' style='position:absolute; top:<%# Eval("CoordenadaY") %>px; left:<%# Eval("CoordenadaX") %>px;  z-index:1'   value="<%# Eval("ID") %>"  />
            </ItemTemplate>  
        </asp:Repeater>

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate> 
                <input type="button" class='btn <%# Eval("Estado") %>' style='position:absolute; top:<%# Eval("CoordenadaY") %>px; left:<%# Eval("CoordenadaX") %>px; width:50px; z-index:2'   value="<%# Eval("ID") %>"  />
            </ItemTemplate> 
        </asp:Repeater>
 
        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="main.css" rel="stylesheet">
        
        <div id="divPlano">
            <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="dist\img\plano\plano.png" OnClick="ImageButton1_Click"/>
        </div>
 
        <div class="container" style="padding-top: 1em;">
            <button type="button" class="btn btn-default">Normal</button>
            <button type="button" class="btn btn-primary">Disponible</button>
            <button type="button" class="btn btn-danger">En reparación</button>
            <button type="button" class="btn btn-success">Ocupado</button>
            <button type="button" class="btn btn-info">Información</button>
            <button type="button" class="btn btn-warning">Advertencia</button>
            <button type="button" class="btn btn-link">Enlace</button>
        </div>

          <div id="divOverlay" runat="server" class="overlay" style="display:none;">
        <div id="divPopUP" class="popup" runat="server" style="display:none;" >
            <div id="pregunta" style="text-align:center; margin-top:1rem; margin-bottom:1rem;">
                <asp:Label id="lblPregunta" runat="server" /> <br />
                <asp:Label id="lblCambiar" runat="server" /> <asp:DropDownList ID="DropDownList3" class="corto" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>  <asp:DropDownList ID="DropDownList1" class="corto" style="height:2.2rem" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id"> </asp:DropDownList>
                <asp:Label id="lblEstado" Text="Estado" runat="server" />  <asp:DropDownList ID="DropDownList2" class="corto" runat="server" style="height:2.2rem" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>
                     <br><br>
            </div>
            <div id="divImagen" style="width: 25em; margin:auto auto auto auto; text-align:center;" runat="server">
                <img id="imgEscritorio" src="./dist/img/escritorios/default.png" class="imgDiv" runat="server" alt="Imagen no disponible" />
            </div>
            <div class="divBotones" style="margin-top: 1rem; margin-bottom: 0.5rem;">
                <asp:Button ID="btnYES" runat="server" Text="Reservar" CssClass="btn btn-success" onClick="cerrarDiv" />
                <asp:Button ID="btnNO" runat="server" Text="Cancelar" CssClass="btn btn-danger" onClick="cerrarDivSinCambio" />
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" style="display:none" OnClick="cerrarDiv" />
                <asp:Button ID="btnAceptarOcupado" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="cerrarDiv" style="display:none" />
            </div>
        </div>
    </div>



<%--    <center>
    <div id="divCarrusel" style="margin: 5rem 15rem 5rem 15rem; width:40rem;">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="./dist/img/escritorios/e1.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="./dist/img/escritorios/e3.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="./dist/img/escritorios/e6.png" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
    </div>
    </center>--%>





    </div>

<script>
    function showCoords(event) {
        var x = event.clientX;
        var y = event.clientY;
        var coor = "X: " + x + ", Y: " + y;
        document.getElementById("<%= txtX.ClientID %>").value = x;
        document.getElementById("<%= txty.ClientID %>").value = y;
    }

    function clearCoor() {
        document.getElementById("demo").innerHTML = "";
    }

    function LoadImg() {
        var foto = document.getElementById("ContentPlaceHolder1_ddlFoto");
        document.getElementById("ContentPlaceHolder1_Img").src = "dist/img/escritorio/" + foto.value;
    }

    //function getValue(valor) {
    //    var val = valor.toString();
    //    var prefijo = "ContentPlaceHolder1_";
    //    document.getElementById(prefijo + "btnValor").value = val;

    //    if (estadoDesc == 'Libre') {
    //        document.getElementById(prefijo + "lblPregunta").innerHTML = 'Reservar escritorio N° ' + val + ' ?';
    //        document.getElementById(prefijo + "btnYES").style.removeProperty('display');
    //        document.getElementById(prefijo + "btnNO").style.removeProperty('display');
    //        document.getElementById(prefijo + "btnAceptarOcupado").style.display = "none";
    //    }
    //    else {
    //        document.getElementById(prefijo + "lblPregunta").innerHTML = estadoDesc;
    //        document.getElementById(prefijo + "btnYES").style.display = "none";
    //        document.getElementById(prefijo + "btnNO").style.display = "none";
    //        document.getElementById(prefijo + "btnAceptarOcupado").style.removeProperty('display');
    //    }
    //    //document.getElementById(prefijo + "btnValor").classList.add(clase);

    //    /*document.getElementById(prefijo + "lblTipo").innerHTML = 'Tipo: ' + tipoDesc;*/

    //    document.getElementById(prefijo + "imgEscritorio").src = "./dist/img/escritorios/e" + val + ".png?version=1";
    //    document.getElementById(prefijo + "imgURL").value = "./dist/img/escritorios/e" + val + ".png?version=1";

    //    document.getElementById(prefijo + "divOverlay").style.removeProperty('display');
    //    document.getElementById(prefijo + "divPopUP").style.removeProperty('display');;
    //}



</script>

</asp:Content>