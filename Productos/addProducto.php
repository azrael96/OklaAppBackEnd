<?php
header("Access-Control-Allow-Origin");

include("db.php");

$Descripcion= $_REQUEST["descripcion"];
$Alto= $_REQUEST["alto"];
$Ancho= $_REQUEST["ancho"];
$Largo= $_REQUEST["largo"];
$Peso= $_REQUEST["peso"];
$Color= $_REQUEST["color"];
$TipoPantalla= $_REQUEST["tipopantalla"];
$TamañoPantalla= $_REQUEST["tamañopantalla"];
$TipoStorage= $_REQUEST["tipostorage"];
$CapacidadStorage= $_REQUEST["capacidadstorage"];
$CapacidadRam= $_REQUEST["capacidadram"];
$TipoRam= $_REQUEST["tiporam"];
$GeneracionProcesador= $_REQUEST["generacionprocesador"];
$SerieProcesador= $_REQUEST["serieprocesador"];
$MarcaProcesador= $_REQUEST["marcaprocesador"];
$Stock= $_REQUEST["stock"];
$Precio= $_REQUEST["precio"];
$Imagen= $_REQUEST["imagen"];
$Nombre= $_REQUEST["nombre"];
$Status= "Activo";

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }
      
      $sql = "SELECT count(1) FROM PRODUCTO WHERE NOMBRE = ?";
      $stmt_u = $conn->prepare($sql);
      $stmt_u->bind_param('s', $Nombre);
      $stmt_u->execute();
      $stmt_u->bind_result($found_u);
      $stmt_u->fetch();
      $stmt_u->close();

      if ($found_u) {

          echo json_encode(array(
                              "message"=>"Error: El producto ya existe",
                              "status"=>"Error"
                          ));

      } else {

          $sql = "INSERT INTO PRODUCTO (`NOMBRE`, `IMAGEN`, `PRECIO`, `STOCK`, `ESTADO`, `PROCESADOR`, `MARCA_PROCESADOR`, `GENERACION_SERIE`, `RAM`, `TIPO_RAM`, `STORAGE`, `TIPO_STORAGE`, `PANTALLA`, `TIPO_PANTALLA`, `TAMANO_PANTALLA`, `COLOR`, `PESO`, `LARGO`, `ANCHO`, `ALTO`, `DESCRIPCION`)
          VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
          $stmt = $conn->prepare($sql);
          $stmt->bind_param('ssiissssssssssssiiiis',
                            $Nombre,
                            $Imagen,
                            $Precio,
                            $Stock,
                            $Status,
                            $MarcaProcesador,
                            $SerieProcesador,
                            $GeneracionProcesador,
                            $CapacidadRam,
                            $TipoRam,
                            $CapacidadStorage,
                            $TipoStorage,
                            $TamañoPantalla,
                            $TipoPantalla,
                            $TamañoPantalla,
                            $Color,
                            $Peso,
                            $Largo,
                            $Ancho,
                            $Alto,
                            $Descripcion
                            );
          
          if ($stmt->execute()){

            echo json_encode(array(
                              "message"=>"El usuario fue registrado correctamente", 
                              "status"=>"Success"
                            ));

          }else{

            echo json_encode(array(
                              "message"=>"Error al generar el registro",
                              "status"=>"Error"
                            ));
          }
      }

    } 
catch(mysqli $e){
    //die("and error has been ocurred" . $e);
    echo json_encode(array(
      "message"=>$e,
      "status"=>"Error",
    ));
    return $e;
}

$conn->close();
?>



