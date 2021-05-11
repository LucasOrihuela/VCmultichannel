<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModificarUsuario.aspx.vb" Inherits="RE_Escritorio.ModificarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Datepicker/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />

    <link rel="stylesheet" href="bootstrap/css/Personalizado.CSS" />
    <link rel="stylesheet" href="bootstrap/css/RE.CSS" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

    <!-- Font Awesome 4.5.0 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

<title></title>
    <style>
        @media screen and (max-device-width:980px) {
            .material input {
                
                font-size: 5rem ;
            }

            .material label {
                top: -100px;
                font-size: 5rem;
            }

            .material.input.up label {
                top: -150px;
                font-size: 4rem;
            }
            
            .btnCstm{
                font-size:5rem;
                border-radius:50px;
            }
            .btnCstmcancel{
                font-size:5rem;
                border-radius:50px;
            }
            .btnCstmcancel:hover {
                 font-size:5rem;
                border-radius:50px;            

            }

        }

    </style>
</head>
<body class="bg-dark">   
    <form id="form1" runat="server">

         <center>
        <div class="login-logo flexbox">
            <div class="col pt-5 ">
                <img src=".\dist\img\Users\default.png"  id="imgFoto" style="width: 150px; height:150px" runat="server" class="circle-photo" ></img>
            </div>
            <div>
                <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                <!--Subir Foto:--><asp:FileUpload ID="FileUpload1"  style="display:none !important" runat="server" onChange="this.form.submit()" />
                <!--  <asp:Button ID="Button1" runat="server" Text="Subir" />    -->  
                        </asp:View>
                            <asp:View ID="View2" runat="server">
                                Seleccione una Foto: <asp:Label ID="Label1" runat="server" ></asp:Label>
                                <input type="button" value="Cerrar" onclick="window.close()">
                            </asp:View>
                </asp:MultiView>
    
                <asp:Label ID="ErrorMessage"  CssClass="classErrorMessage"    runat="server"  EnableViewState="False"></asp:Label>
                <div style="display:none">
                    <asp:TextBox ID="txtRuta"     runat="server"   ></asp:TextBox>
                    <asp:TextBox ID="txtArchivo"  runat="server"   ></asp:TextBox>
                    <asp:TextBox ID="txtCampo"    runat="server"   ></asp:TextBox>
                </div>
            </div>
        </div> 
         </center>

        <div id="divContenedor" class="mx-auto mt-5 container-fluid" style="color:white; border-radius: 50px; padding: 10px; max-width: 600px; background-color: #1b1b1b ">
            <br/>

            <div class="material input mt-5">
                <br />
                <asp:TextBox ID="txtNombre" runat="server" style="color:white;"></asp:TextBox>
                <span class="highlight-bar"></span>
                <span class="bar">
                    <span class="left"></span>
                    <span class="right"></span>
                </span>
                <label>Nombre</label>
            </div>

            <div class="material input mt-5">
                <br />
                <asp:TextBox ID="txtEmail" runat="server" style="color:white;"></asp:TextBox>
                <span class="highlight-bar"></span>
                <span class="bar">
                    <span class="left"></span>
                    <span class="right"></span>
                </span>
                <label>Email</label>
            </div>

            <div class="material input">
                <asp:TextBox ID="txtTelefono" runat="server" style="color:white"></asp:TextBox>
                <span class="highlight-bar"></span>
                <span class="bar">
                    <span class="left"></span>
                    <span class="right"></span>
                </span>
                <label>Telefono</label>
            </div>
            
            <div class="material input">
                <asp:TextBox ID="txtClave" runat="server"   TextMode="Password"  style="color:white"></asp:TextBox>
                <span class="highlight-bar"></span>
                <span class="bar">
                    <span class="left"></span>
                    <span class="right"></span>
                </span>
                <label>Clave</label>
            </div>

            <div class="row justify-content-center mt-5">
                 
                <asp:Button ID="btnGuardarCambios" runat="server" CssClass="btnCstm" Text="Guardar Cambios" />
            </div>
            <div class="row justify-content-center">
                <asp:Button ID="btnCancelar" runat="server" CssClass="mt-4 btnCstmcancel " style=" padding: 7px 110px;" Text="Cancelar" />
            </div>
            
        </div>
        <center>
            <asp:Label ID="lblError" ForeColor="Yellow" runat="server" CssClass="lblcustom" Text=""></asp:Label>
            </center>
    </form>  

</body>
<script>
    var materialFramework = {}

    materialFramework.input = {
        init: function () {
            $(".material.input").each(function () {
                var $parent = $(this);
                var $input = $parent.children('input');
                var $select = $parent.children('select');
                var $textarea = $parent.children('textarea');

                if ($input.val() != "") {
                    $input.parent().addClass('up');
                }
    
                if ($select.val() != "-1") {
                    if ($select.val() != null)
                        $select.parent().addClass('up');
                }
    
                if ($textarea.val() != "") {
                    $textarea.parent().addClass('up');
                }

                $parent.mousedown(function (e) {
                    materialFramework.input.currentMouseDown = e;
                });

                $select.focusout(function (e) {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');
                    var hasContent = false;
                    if ($select.val() && $select.val() != "-1") {
                        hasContent = true;
                    }

                    if (hasContent) {
                        $parent.addClass('up');
                        $parent.removeClass('down');
                    } else {
                        $parent.addClass('down');
                        $parent.removeClass('up');
                    }
                });

                $input.focusout(function (e) {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');
                    var hasContent = false;
                    if ($input.val() && $input.val().length > 0) {
                        hasContent = true;
                    }

                    if (hasContent) {
                        $parent.addClass('up');
                        $parent.removeClass('down');
                    } else {
                        $parent.addClass('down');
                        $parent.removeClass('up');
                    }
                });

                $textarea.focusout(function (e) {
                    var $textarea = $(this);
                    var $parent = $textarea.parent();
                    var $label = $parent.children('label');
                    var hasContent = false;
                    if ($textarea.val() && $textarea.val().length > 0) {
                        hasContent = true;
                    }

                    if (hasContent) {
                        $parent.addClass('up');
                        $parent.removeClass('down');
                    } else {
                        $parent.addClass('down');
                        $parent.removeClass('up');
                    }
                });

                $textarea.focusin(function (e) {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.addClass('up focused');

                    var x = materialFramework.input.currentMouseDown.pageX - $input.offset().left;
                    var pctl = x / $input.width() * 100;
                    if (pctl > 100) {
                        pctl = 99;
                    }
                    var pctr = 100 - pctl;

                    $parent.find('.bar .left, .bar .right').css({
                        transition: '',
                    });

                    $parent.find('.bar .left, .bar .right').css({
                        left: pctl + '%',
                        right: pctr + '%'
                    });

                    setTimeout(function () {
                        $parent.find('.bar .left, .bar .right').css({
                            transition: '0.3s ease all',
                        });

                        $parent.find('.bar .left').css({
                            left: '0',
                        });

                        $parent.find('.bar .right').css({
                            right: '0',
                        });
                    }, 10);
                });

                $select.focusin(function (e) {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.addClass('up focused');

                    var x = materialFramework.input.currentMouseDown.pageX - $input.offset().left;
                    var pctl = x / $input.width() * 100;
                    if (pctl > 100) {
                        pctl = 99;
                    }
                    var pctr = 100 - pctl;

                    $parent.find('.bar .left, .bar .right').css({
                        transition: '',
                    });

                    $parent.find('.bar .left, .bar .right').css({
                        left: pctl + '%',
                        right: pctr + '%'
                    });

                    setTimeout(function () {
                        $parent.find('.bar .left, .bar .right').css({
                            transition: '0.3s ease all',
                        });

                        $parent.find('.bar .left').css({
                            left: '0',
                        });

                        $parent.find('.bar .right').css({
                            right: '0',
                        });
                    }, 10);
                });

                $input.focusin(function (e) {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.addClass('up focused');

                    var x = materialFramework.input.currentMouseDown.pageX - $input.offset().left;
                    var pctl = x / $input.width() * 100;
                    if (pctl > 100) {
                        pctl = 99;
                    }
                    var pctr = 100 - pctl;

                    $parent.find('.bar .left, .bar .right').css({
                        transition: '',
                    });

                    $parent.find('.bar .left, .bar .right').css({
                        left: pctl + '%',
                        right: pctr + '%'
                    });

                    setTimeout(function () {
                        $parent.find('.bar .left, .bar .right').css({
                            transition: '0.3s ease all',
                        });

                        $parent.find('.bar .left').css({
                            left: '0',
                        });

                        $parent.find('.bar .right').css({
                            right: '0',
                        });
                    }, 10);
                });

                $input.focusout(function () {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.removeClass('focused');
                });

                $select.focusout(function () {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.removeClass('focused');
                });

                $textarea.focusout(function () {
                    var $input = $(this);
                    var $parent = $input.parent();
                    var $label = $parent.children('label');

                    $parent.removeClass('focused');
                });
            });

            $('.material.input label').click(function() {
                $(this).parent().children('input').focus();
                $(this).parent().children('textarea').focus();
            });
        }
    }

    $(function (){
        materialFramework.input.init();
         if ($('#hfError').val()) {
            if ($('#hfError').val() == 'Error al actualizar los datos') {
                showError('Error');
            } else {
                showsucces('Datos actualizados con exito');
            }
        }
            
    });
    
</script>
    <script type="text/javascript">
    $(function () {
        var fileupload = $("#FileUpload1");
        var filePath = $("#spnFilePath");
        var image = $("#imgFoto");
        image.click(function () {
            fileupload.click();
        });
        fileupload.change(function () {
            var fileName = $(this).val().split('\\')[$(this).val().split('\\').length - 1];
            filePath.html("<b>Selected File: </b>" + fileName);
        });
    });
    </script>

</html>