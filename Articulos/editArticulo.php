<?php
header("Access-Control-Allow-Origin");

include("../db.php");

$ID= $_REQUEST["ID"];

$REFERENCIA= $_REQUEST["REFERENCIA"];
$NOMBRE= $_REQUEST["NOMBRE"];
$DESCRIPCION= $_REQUEST["DESCRIPCION"];
$IMAGEN= $_REQUEST["IMAGEN"];
$PRECIO= $_REQUEST["PRECIO"];
$STOCK= $_REQUEST["STOCK"];
$ESTADO= $_REQUEST["ESTADO"];

$CATEGORIAS_IN = $_REQUEST["ETIQUETAS"];

if($CATEGORIAS_IN == null){
    $CATEGORIAS_IN = json_decode('[]', TRUE);
}

try{
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }
      
        $sql =       
        "UPDATE `ARTICULO` 
        SET `REFERENCIA`=?,`NOMBRE`=?,`DESCRIPCION`=?,`IMAGEN`=?,
        `PRECIO`=?,`STOCK`=?,`ESTADO`=? WHERE `ID`= ?";

        $stmt = $conn->prepare($sql);

        $stmt->bind_param(
                        'ssssssss', 
                        $REFERENCIA,
                        $NOMBRE,
                        $DESCRIPCION,
                        $IMAGEN,
                        $PRECIO,
                        $STOCK,
                        $ESTADO,
                        $ID,
        );

        if ($stmt->execute()){
            $sql_2 = "SELECT ID, ETIQUETA_ID_FK
            FROM ATRIBUTO
            WHERE ARTICULO_ID_FK = ?;";

            $stmt_2 = $conn->prepare($sql_2);
            $stmt_2->bind_param('i', $ID);
            $stmt_2->execute();

            $resultado = $stmt_2->get_result();
            $CATEGORIAS_DB = $resultado->fetch_all(MYSQLI_ASSOC);

            foreach ($CATEGORIAS_DB as $CAT_DB ) {

                /*
                echo json_encode(array(
                    "CATEGORIAS_IN"=>$CATEGORIAS_IN,
                    "FILTER"=>array_column($CATEGORIAS_IN, "ETIQUETA_ID_FK"),
                    "CAT_DB"=>$CAT_DB["ETIQUETA_ID_FK"],
                    "IF" => array_search(
                        $CAT_DB["ETIQUETA_ID_FK"], 
                        array_column($CATEGORIAS_IN, "ID")
                    ) !==FALSE,
                ));
                */

                if(
                    array_search(
                    $CAT_DB["ETIQUETA_ID_FK"], 
                    array_column($CATEGORIAS_IN, "ID")
                    ) !== FALSE
                )
                {
                    /*echo json_encode(array(
                        "NO_DELETE"=>$CAT_DB,
                    ));*/
                }else{
                    /*echo json_encode(array(
                        "TO_DELETE"=>$CAT_DB,
                    ));*/

                    
                    $sql = "DELETE FROM ATRIBUTO 
                    WHERE (ARTICULO_ID_FK = ? 
                    AND ETIQUETA_ID_FK = ?)";

                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param(
                                    'ii',
                                    $ID,
                                    $CAT_DB["ETIQUETA_ID_FK"],
                    );

                    if ($stmt->execute()){
                        /*echo json_encode(array(
                            "message"=>"Atributo eliminado", 
                            "status"=>"Success"
                        ));*/
                    }else{
                        echo json_encode(array(
                            "message"=>"Error al eliminar un atributo",
                            "status"=>"Error"
                        ));
                    }
                    
                }
            } 

            foreach ($CATEGORIAS_IN as $CAT_INPUT ) {
                
                /*
                echo json_encode(array(
                    "CATEGORIAS_DB"=>$CATEGORIAS_DB,
                    "FILTER"=>array_column($CATEGORIAS_DB, "ETIQUETA_ID_FK"),
                    "CAT_INPUT"=>$CAT_INPUT["ID"], 
                    "IF" => array_search(
                        $CAT_INPUT["ID"], 
                        array_column($CATEGORIAS_DB, "ETIQUETA_ID_FK")
                    ) !==FALSE,
                ));
                */

                if(
                    array_search(
                    $CAT_INPUT["ID"], 
                    array_column($CATEGORIAS_DB, "ETIQUETA_ID_FK")
                    ) !==FALSE
                )
                {
                    /*echo json_encode(array(
                        "NO_INSERT"=>$CAT_INPUT,
                    ));*/
                }else{
                    /*echo json_encode(array(
                        "TO_INSERT"=>$CAT_INPUT,
                    ));*/

                    $sql =       
                    "INSERT INTO `ATRIBUTO`(`ARTICULO_ID_FK`, `ETIQUETA_ID_FK`, `ESPECIFICACION`) 
                    VALUES (?,?,?)";
        
                    $stmt_u = $conn->prepare($sql);
                    $stmt_u->bind_param(
                                    'iis', 
                                    $ID,
                                    $CAT_INPUT["ID"],
                                    $CAT_INPUT["path"],
                    ); 
        
                    if ($stmt_u->execute()){
                        /*echo json_encode(array(
                            "message"=>"Atributo añadido", 
                            "status"=>"Success",
                        ));*/
                    }else{
                        echo json_encode(array(
                            "message"=>"Error al añadir una atributo",
                            "status"=>"Error"
                        ));
                    }
                    
                };
            }
                
        }else{
            echo json_encode(array(
                "message"=>"Error: al modificar el articulo",
                "status"=>"Error",
        ));
        }
    
    echo json_encode(array(
        "message"=>"Edicion Terminada", 
        "status"=>"Success",
    ));

}
catch(mysqli_sql_exception  $e){
    echo $e->getMessage();
    die("and error has been ocurred" . $e);
}

$conn->close();
?>

