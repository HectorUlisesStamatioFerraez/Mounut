<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registro Diseñadores</title>
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
                                <h1 class="m-0 text-dark">Diseñadores</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modal-lg">
                    <input type="hidden" id="idMar" value="0">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 id="titulo" class="modal-title">Formulario De Registro</h4>
                                <button onclick="cancelarPeticion();" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form class="form" id="frmMarcas">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label style="font-family: sans-serif">Nombre del diseñador</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="fas fa-copyright"></i></span>
                                                    </div>
                                                    <input type="text" name="nombreMar" id="nombreMar" class="form-control" placeholder="Ingresar Nombre del diseñador">
                                                </div>
                                            </div>                                            
                                        </div>                                  
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                            <div class="form-group">
                                                <label style="font-family: sans-serif">Estado del Diseñador</label>
                                                <div class="input-group">                                             
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <input type="checkbox" checked="" name="chkEstadoMarca" id="chkEstadoMarca">
                                                        </span>
                                                    </div>
                                                    <label type="text" class="form-control">Activo / Inactivo</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer clearfix">                               
                                    <button id="btn-save" type="submit" class="btn btn-outline-success float-right">Registrar Diseñador <span class="fas fa-save"></span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="card card-purple card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">Registrar Diseñador</h3>
                                    </div>
                                    <div class="card-body">
                                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#modal-lg"><i class="fas fa-file-signature"></i> Nuevo Registro</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="card card-yellow card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">Listado Diseñadores</h3>
                                    </div>
                                    <div class="card-body">
                                        <table id="tablaMarcas" class="table table-responsive-lg table-bordered table-hover">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>Id</th>
                                                    <th>Diseñador</th>
                                                    <th>Estado</th>                                                
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                                <tr class="text-center">
                                                    <th>Id</th>
                                                    <th>Diseñador</th>
                                                    <th>Estado</th> 
                                                    <th>Acciones</th>
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
        <script src="../plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="../plugins/jquery-validation/additional-methods.min.js"></script>
        <script src="../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
        <script src="../plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../plugins/datatables-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
        <script src="../dist/js/adminlte.min.js"></script>
        <script src="../js/scriptDisenadores.js" type="text/javascript"></script>
        <script src="../plugins/sweetAlert/sweetalert.js" type="text/javascript"></script>
    </body>
</html>



