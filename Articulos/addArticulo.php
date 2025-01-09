<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$REFERENCIA= $_REQUEST["REFERENCIA"];
$NOMBRE= $_REQUEST["NOMBRE"];
$DESCRIPCION= $_REQUEST["DESCRIPCION"];
$IMAGEN= $_REQUEST["IMAGEN"];
$PRECIO= $_REQUEST["PRECIO"];
$STOCK= $_REQUEST["STOCK"];
$ESTADO= $_REQUEST["ESTADO"];

$ETIQUETA = $_REQUEST["ETIQUETA"];
if($ETIQUETA == "NINGUNA"){
    $ETIQUETA = array();
}

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }
      
      $sql =       
      "INSERT INTO `ARTICULO`(`REFERENCIA`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `PRECIO`, `STOCK`, `ESTADO`) 
      VALUES (?,?,?,?,?,?,?)";

      $stmt = $conn->prepare($sql);

      $stmt->bind_param(
                    'sssssss', 
                    $REFERENCIA,
                    $NOMBRE,
                    $DESCRIPCION,
                    $IMAGEN,
                    $PRECIO,
                    $STOCK,
                    $ESTADO,
      );
          
    if ($stmt->execute()){
        $last_id = mysqli_insert_id($conn);
        
        foreach ($ETIQUETA as $FILA) {         
            $sql =       
            "INSERT INTO `ATRIBUTO`(`ARTICULO_ID_FK`, `ETIQUETA_ID_FK`, `ESPECIFICACION`) 
            VALUES (?,?,?)";

            $stmt_u = $conn->prepare($sql);

            $stmt_u->bind_param(
                            'iis', 
                            $last_id,
                            $FILA["ID"],
                            $FILA["path"],
            ); 

            if (!($stmt_u->execute())){
                echo json_encode(array(
                    "message"=>"Error al generar una etiqueta",
                    "status"=>"Error"
                ));
            }
        }
        echo json_encode(array(
            "message"=>"El articulo y sus etiquetas fue registrado correctamente", 
            "status"=>"Success"
        ));

    }else{

        echo json_encode(array(
            "message"=>"Error al generar el articulo",
            "status"=>"Error"
        ));
    }
}
catch(mysqli $e){
    echo json_encode(array(
      "message"=>$e,
      "status"=>"Error",
    ));
    return $e;
}

$conn->close();

?>


