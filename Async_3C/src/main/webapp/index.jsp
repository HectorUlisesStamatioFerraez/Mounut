<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="img/shopping-cart.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    <link href="css/grid.css" rel="stylesheet" type="text/css"/>
    <link href="css/card.css" rel="stylesheet" type="text/css"/>
    <title>Mounut | Principal</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light margin-bottom ">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand"><img src="img/Logo2.png" width="40px"></a>
    <a href="./Controlador?accion=home"><h3 id="logo" style="color: black;">Mounut</h3></a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="./Controlador?accion=carrito"><i class="fas fa-shopping-cart"></i>(<label style="color: darkorange">${cont}</label>)</i> Carrito</a>
            </li>
        </ul>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <form class="form-inline my-2 my-lg-0">
                <input type="search" name="txtbuscar" style="width:450px" class="form-control mr-sm-2" placeholder="Busca un Producto">
                <input type="submit" name="accion" value="Buscar"  class="btn btn-primary my-2 my-sm-0">
            </form>
        </ul>
        <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
            <a style="cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fas fa-user-friends"></i> ${logueo}</a>
            <div class="dropdown-menu text-center dropdown-menu-right">
                <a class="dropdown-item" href="#"><img src="img/user.png" alt="60" height="60"/></a>
                <a class="dropdown-item" href="#">${user}</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="Controlador?accion=MisCompras">Mis Compras</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="./Controlador?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>
            </div>
        </ul>
    </div>
</nav><hr>

<div class="container-fluid">
    <h2>Novedades:</h2>
    <div id="carousel1" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/vestidos.jpg" alt="" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Primer slide"><title>Placeholder</title><rect width="100%" height="100%"/>
                <div class="carousel-caption d-none d-md-block">
                    <h5><span class="textoCarousel">Nuestra nueva selección de vestidos que seguro te sorprenderá</span></h5>
                    </button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/pantalones.jpg" alt="" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Primer slide"><title>Placeholder</title><rect width="100%" height="100%"/>
                <div class="carousel-caption d-none d-md-block">
                    <h5><span class="textoCarousel">Contamos con los mejores pantalones para esta temporada</span></h5>
                    </button>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/playeras.jpg" alt="" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Primer slide"><title>Placeholder</title><rect width="100%" height="100%"/>
                <div class="carousel-caption d-none d-md-block">
                    <h5><span class="textoCarousel">Consigue ya las mejores playeras para combinar con tus amigas</span></h5>
                    </button>
                </div>
            </div>
            <!--Controles NEXT y PREV-->
            <a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel1" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--Controles de indicadores-->
            <ol class="carousel-indicators">
                <li data-target="#carousel1" data-slide-to="0" class="active"></li>
                <li data-target="#carousel1" data-slide-to="1"></li>
                <li data-target="#carousel1" data-slide-to="2"></li>
            </ol>
        </div>
    </div>
    <br>
    <hr>
    <aside>
        <article>
            <img src="img/promo.jpg" width="100%" height="50%" alt="">
        </article>
    </aside>
    <br><br>
    <h2>Nuestros Productos:</h2>
    <div class="row">
        <c:forEach var="p" items="${productos}">
            <div class="col-sm-3">
                <div class="form-group">
                    <div class="card">
                        <div class="imgBx">
                            <img src="${p.getImagen()}" width="200" height="170">
                        </div>
                        <div class="contentBx">
                            <h3>${p.getNombres()}</h3>
                            <h2 class="price">$ ${p.getPrecio()}</h2>
                            <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="buy"><i class="fas fa-cart-plus"></i>Añadir</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="container col-lg-9">
            <div class="modal-content">
                <div class="pr-2 pt-1">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="text-center">
                    <img src="img/user.png" width="100" height="100">
                </div>
                <div class="modal-header text-center">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a style="color: black" class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                        </li>
                        <li class="nav-item">
                            <a style="color: black" class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                        </li>
                    </ul>
                </div>
                <div class="modal-body">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                            <form action="Controlador">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                </div>
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input type="password" name="txtpass" class="form-control" placeholder="*****">
                                </div>
                                <button type="submit" name="accion" value="Validar" class="btn btn-primary btn-block">Iniciar</button>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                            <form action="Controlador">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="txtnom" class="form-control" placeholder="Juan Perez">
                                </div>
                                <div class="form-group">
                                    <label>Celular</label>
                                    <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="7775996014">
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input type="text" name="txtdire" class="form-control" placeholder="Jiutepec/Col.Parres">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                </div>
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input type="password" name="txtpass" class="form-control" placeholder="****">
                                </div>
                                <button type="submit" name="accion" value="Registrar" class="btn btn-primary btn-block">Crear Cuenta</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer">
    <center><p> © 2021-2021 Copyright Mounut.com <br> Todos los derechos reservados.</p></center>
</footer>

<script>
    const list = document.querySelectorAll('.list');
    function activeLink(){
        list.forEach((item) =>
            item.classList.remove('active'));
            this.classList.add('active');
    }
    list.forEach((item) =>
        item.addEventListener('click',activeLink));
</script>


<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
