<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NuevoMapa.aspx.vb" Inherits="RE_Escritorio.NuevoMapa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div onmousemove="showCoords(event)" onmouseout="clearCoor()">
        <p id="demo"></p>
        <div class="row" style="margin-bottom:30px; margin-top:30px;" >
            <div class="col-sm-4">
          <%--      Escritorio  <asp:DropDownList ID="DropDownList1" class="corto" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id"> </asp:DropDownList>
                Estado <asp:DropDownList ID="DropDownList2" class="corto" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>
                     <br><br>
                Grupo <asp:DropDownList ID="DropDownList3" class="corto" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="id"> </asp:DropDownList>--%>
            </div>
            <div class="col-sm-4">
                X <asp:TextBox ID="txtX" class="corto" runat="server"></asp:TextBox> <br>
                Y <asp:TextBox ID="txtY" class="corto" runat="server"></asp:TextBox> <br>
            </div>
        </div>

<%--        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RE %>" SelectCommand="Select 0 as id, 'No asignar' as nombre union all select  id, convert(varchar(19),id) from [tblRE_Escritorios] order by 1"></asp:SqlDataSource>
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
                <input type="button"   class='btn btn-<%# Eval("Estado") %>' style='position:absolute; top:<%# Eval("CoordenadaY") %>px; left:<%# Eval("CoordenadaX") %>px; width:50px; z-index:2'   value="<%# Eval("ID") %>"  />
            </ItemTemplate> 
        </asp:Repeater>
 --%>
        <link href="bootstrap.min.css" rel="stylesheet">
        <link href="main.css" rel="stylesheet">
        
        <div id="divPlano">
            <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="dist\img\plano\plano.png" OnClick="ImageButton1_Click" />
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
</script>

</asp:Content>

