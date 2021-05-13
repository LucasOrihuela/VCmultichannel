<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="RE_Escritorio.Login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.css?V=1" />
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css" />
    <!--Sweet Alert! -->
    <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.css" />
    
    <link rel="stylesheet" href="bootstrap/css/Personalizado.CSS" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <title>VC Multichanel</title>
    <link rel="shorcut icon"  href="dist/img/login/icono.png" />

<style>
    .bodyClass{
        background: url('dist/img/login/fondo.jpg') no-repeat center center fixed;
        background-size: cover;
        }
    .primerEnc{
        font-size: 3em;
    }

    .segEnc{
        font-size: 2em;
    }

    .btnRecuperar{
    background-color: transparent;
    border: 1px solid white;
    color: blue;
    padding: 5px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    border-bottom-left-radius: 20px;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
    border-top-right-radius: 20px;
    }

    .divLogin{
            position: fixed; 
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 5px !important;
            padding: 10px !important; 
            width: 25em; 
            height: 35em; 
            background-color: white !important;
        }

</style>

</head>


<body class="bodyClass" >
    <div class="login-box" style="position:sticky; text-align:center;">
        
        <div class="mx-auto divLogin" >
            
            <div class="login-logo" style="position:relative; "> <!-- /.login-logo -->
                <div>
                    <img src=".\dist\img\login\logo.png?V=2" style="width: 6.7em;" />
                </div>
            </div>

            <div id="encabezados" style="text-align:center">
                <asp:Label id="lblEncabezado1" class="primerEnc" runat="server">Empleados</asp:Label> <br />
                <asp:Label id="lblEncabezado2" class="segEnc" runat="server"> Ingrese sus Credenciales</asp:Label>
            </div>

            <div style="display:none;">
                <p class="login-box-msg lblcustom" style="color:white">LOGIN</p>
            </div>

            <form method="post" runat="server" defaultbutton="btnLogin" style="margin-top:2em;">
                <div class="form-group has-feedback">
                    <input id="user" runat="server" type="text" class="form-control" style="width: 23rem; height: 3rem; font-size:medium;" placeholder="User" />
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input id="pass" runat="server" type="password" class="form-control" style="width: 23rem; height: 3rem; font-size:medium;" placeholder="Password" />
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
            <div class="form-group has-feedback">
                <center>   
                    <asp:LinkButton ID="btnLogin" runat="server" Text="Login" OnClientClick="Login" class=" btnCstm" style="color: white;" />
                    <%--<br>
                    <asp:Button ID="btnAgregarUsuario" runat="server" CssClass="mt-4 btnCstmcancel "   Text="Nuevo Usuario" />
                    <br>--%>
                    <asp:Button ID="btnrecuperar" runat="server" Text="Recupear Contraseña" OnClientClick="return callREcuperar();" class="btnRecuperar" />
                </center>  
            </div>
            </form>

            <asp:PlaceHolder ID="mensajeError" runat="server" Visible="false">
                <div class="container" style="background-color:white; margin-top:15px;">
                    <div class="alert alert alert-dismissible" style="width:100%; text-align:center">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h4><i class="icon fa fa-ban"></i><asp:Label ID="lblTituloMensajeError" runat="server"></asp:Label></h4>
                        <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                    </div>
                </div>
            </asp:PlaceHolder>
            <br />
           
        </div>
        <!-- /.login-box-body -->
    </div>
 <script>
function callREcuperar(){
   
    window.location = "RecuperarClave.aspx";
    return false;
}
 </script>

    <!-- jQuery 2.2.4 -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="plugins/iCheck/icheck.min.js"></script>
    <!--Sweet Alert! -->
    <script src="plugins/sweetalert2/sweetalert2.js"></script>
    <!--Funciones-->
    <script src="Scripts/Funciones.js?v=1"></script>
    <!--Validaciones-->
    <script src="Scripts/Validaciones/Login.js"></script>
    <div style="display:none">
    <iframe id="fraWBOOLD" runat="server"></iframe>
    </div>

</body>
</html>
