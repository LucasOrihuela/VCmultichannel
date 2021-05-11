<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MisReservas.aspx.vb" Inherits="RE_Escritorio.MisReservas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <center>
         
        <div  class="mx-auto " style=" border-radius: 5px; padding: 10px; max-width: 700px; height: 150px; background-color:#E6E6E6;"> <%--background-color:#1b1b1b"--%>
                <div class="row mx-0 pl-0 pr-0">
                <div class="col" style="margin-top:10px;">
                    <label class=" lblcustom justify-content-lg-center" style="color:#3390EE; font-size:3rem;" >Mis Reservas</label>
                </div>
            </div> 
        </div>
         
        <asp:PlaceHolder ID="plMensaje" runat="server" Visible="false">
            <div id="divMensaje" runat="server" class="container" style="background-color:#3390EE; margin-top:15px;">
                <div class="alert alert alert-dismissible" style="width:100%; text-align:center">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i id="iconoError" runat="server" class="icon fa fa-ban"></i><asp:Label ID="lblTituloMensaje" runat="server"></asp:Label></h4>
                    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                </div>
            </div>
        </asp:PlaceHolder>

        <div class="table-scroll" id="table-scroll" style="text-align:center; ">
            <div class="container-fluid">
            <table id="mostrarReservas" class="table-responsive table-borderedsaf mb-5" style="display: inline-table;margin-top:3em;">
                <thead>
                    <tr class="table table-borderedsaf " style="color: black; font-size: 2rem; table-layout:fixed;"> <%--background-color: #676767;--%>
                        <th style=" background-color: #6BBEFF; ">ID Reserva</th>
                        <th style=" background-color: #6BBEFF; ">Escritorio N° </th>
                        <th style=" background-color: #6BBEFF; ">Fecha </th>
                        <th style="width: 1rem; background-color: #6BBEFF; ">Acciones </th>
                    </tr>
                </thead>
                <asp:Repeater runat="server" ID="Escritorios" > <%--OnItemCommand="projects_ItemCommand"--%>
                    <ItemTemplate>
                        <tr class="table table-borderedsaf " style="color:black !important; background-color: white; font-size: 22px;"> <%--background-color: #121212;--%>
                            <td class="bordesTD" > <label class="  "><%#Eval("idReserva") %></label> </td>
                            <td class="bordesTD" > <label class="  "><%#Eval("idEscritorio") %></label> </td>
                            <td class="bordesTD" > <label class="  "><%#Eval("FechaHoraDesde") %></label> </td>
                            <td class="bordesTD" >
                                <asp:LinkButton ID="btnDelete" Style="margin:2px !important; background-color: #A0A0A0;" ClientIDMode="AutoID" CssClass="btn btn-xs" runat="server" CommandName="Delete" CommandArgument='<%#Eval("idReserva")%>' ToolTip="Cancelar reserva" ><span class="fa fa-close"></span></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>

        <div id="divOverlay" runat="server" class="overlay" style="display:none;">
            <div id="divPopUP" class="popupConfir" runat="server" style="display:none;" >
                <div id="pregunta" style="text-align:center; margin-top:25px;">
                    <asp:Label id="lblPregunta" Text="¿Estás seguro de querer cancelar la reserva?" runat="server" /> <%--Text="Esta seguro que desea realizar la reserva?"--%> 
                    <br />
                    <asp:Label id="lblFecha" Text="hoy" runat="server" />
                    <asp:Label ID="lblDato" Text="" runat="server" Visible="false" />
                </div>
                <div class="divBotones" >
                    <asp:Button ID="btnYES" runat="server" Text="Aceptar" CssClass="btn btn-success" onClick="eliminarReserva" />
                    <asp:Button ID="btnNO" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="redirectHere" />
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" OnClick="redirectHere" style="display:none" />
                </div>
            </div>
        </div>
                    
        </div>
      </center>
       <script>

           document.addEventListener('mouseup', function (e) {
               var container = document.getElementById('divPopUP');
               if (!container.contains(e.target)) {
                   container.style.display = 'none';
               }
           });

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
                //datetimepicker('datetimepicker');
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

        function Fundamentales() {
            setBtnDeleteConfirm("¿Estás seguro de querer borrar esta Juego?");
        }

        $(function () {
            init();
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(Fundamentales);
        });

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