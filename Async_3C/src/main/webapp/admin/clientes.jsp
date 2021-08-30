<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="a/head.jsp" %>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <%@include file="a/menuSuperior.jsp" %>
            <%@include  file="a/menuLateral.jsp"%>

            <div class="content-wrapper">
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Clientes</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modal-lg">
                    <input type="hidden" id="idC" value="0">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 id="titulo" class="modal-title">Formulario De Registro</h4>
                                <button onclick="cancelarPeticion();" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form class="form" id="frmClientes">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label>Ingresar Nombres Completos</label>
                                                <input style="text-transform: uppercase;" id="nombresClientes" type="text" placeholder="Ingrese su Nombre Completos" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Tipo de Contacto</label>
                                                <select onchange="cambiarmaxLength();" style="text-transform: uppercase;" id="combo_TipoIdentificacion" style="width: 100%" class="select2 form-control" data-placeholder="Seleccionar">                                               
                                                    <option>Cargando . . .</option>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Número de Telefono</label>
                                                <input style="text-transform: uppercase;" maxlength="8" id="numIdentificacion" type="text" placeholder="7775996014" class="form-control">
                                            </div>                                     
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label>Dirección</label>
                                                <input style="text-transform: uppercase;" id="direccionCliente" type="text" placeholder="Ingrese su dirección completa" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Correo Electrónico</label>
                                                <input style="text-transform: uppercase;" id="correoCliente" type="email" placeholder="Ingrese Correo Electronico" class="form-control">
                                            </div>                                     
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label>Ingresar Contraseña</label>
                                                <input style="text-transform: uppercase;" id="passwordCliente" type="password" placeholder="Ingrese Contraseña" class="form-control">
                                            </div>                                     
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer clearfix">                               
                                    <button id="btn-save" type="submit" class="btn btn-outline-info float-right"><span class="fas fa-save"></span> Registrar Cliente</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="card card-orange card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">Registrar Cliente</h3>
                                    </div>
                                    <div class="card-body">
                                        <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#modal-lg"><i class="fas fa-file-signature"></i> Nuevo Registro</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="card card-orange card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">Listado De Cliente</h3>
                                    </div>
                                    <div class="card-body">
                                        <table id="tablaClientes" class="table table-responsive-lg table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombres Completos</th>
                                                    <th class="text-center">Tipo de contacto</th>
                                                    <th>Celular</th>
                                                    <th>Dirección</th>
                                                    <th>Email</th>
                                                    <th class="text-center">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombres Completos</th>
                                                    <th class="text-center">Tipo de contacto</th>
                                                    <th>Celular</th>
                                                    <th>Dirección</th>
                                                    <th>Email</th>
                                                    <th class="text-center">Acciones</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="main-footer">
                <p> © 2021-2021 Copyright Mounut.com <br> Todos los derechos reservados.</p>
            </footer>
        </div>

        <script src="../plugins/jquery/jquery.min.js"></script>
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="../dist/js/adminlte.min.js"></script>
        <script src="../js/scriptClientes.js" type="text/javascript"></script>
        <script src="../plugins/sweetAlert/sweetalert.js" type="text/javascript"></script>
    </body>
</html>
