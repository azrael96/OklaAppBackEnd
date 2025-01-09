<?php
include 'db.php';

header("Access-Control-Allow-Origin");
header("Content-Type: application/json");

$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

switch ($method) {
    case 'GET':
        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            $result = $conn->query("SELECT * FROM usuarios WHERE id=$id");
            $data = $result->fetch_assoc();
            echo json_encode($data);
        } else {
            $result = $conn->query("SELECT * FROM usuarios");
            $users = [];
            while ($row = $result->fetch_assoc()) {
                $users[] = $row;
            }
            echo json_encode($users);
        }
        break;

    case 'POST':

        $id = $input['id'];
        $documento = $input['documento'];
        $nombre = $input['nombre_razon_social'];
        $apellidos = $input['apellidos'];
        $telefono = $input['telefono'];
        $correo = $input['correo'];
        $rol = $input['rol'];
        $username = $input['username'];
        $password = $input['pass'];
        $tipo_documento = $input['tipo_doc'];
        $avatar = $input['avatar'];

        $conn->query("INSERT INTO usuarios (`ID`, `DOCUMENTO`, `NOMBRE_RAZON_SOCIAL`, `APELLIDOS`, `TELEFONO`, `CORREO`, 
                    `ROL`, `USERNAME`, `PASS`, `TIPO_DOC`, `AVATAR`) 
                    VALUES ($id, '$documento', '$nombre', '$apellidos', '$telefono', '$correo', '$rol', '$username', '$password', $tipo_documento, '$avatar')");
        echo json_encode(["message" => "User added successfully"]);
        break;

    case 'PUT':

        $id = $_GET['id'];

        $documento = $input['documento'];
        $nombre = $input['nombre_razon_social'];
        $apellidos = $input['apellidos'];
        $telefono = $input['telefono'];
        $correo = $input['correo'];
        $rol = $input['rol'];
        $username = $input['username'];
        $password = $input['pass'];
        $tipo_documento = $input['tipo_doc'];
        $avatar = $input['avatar'];
        
        $conn->query("UPDATE `usuarios` SET `DOCUMENTO`='$documento',`NOMBRE_RAZON_SOCIAL`='$nombre',`APELLIDOS`='$apellidos',
                    `TELEFONO`='$telefono',`CORREO`='$correo',`ROL`='$rol',`USERNAME`='$username',`PASS`='$password',
                    `TIPO_DOC`=$tipo_documento,`AVATAR`='$avatar' WHERE `ID`=$id");
                echo json_encode(["message" => "User updated successfully"]);
        break;

    case 'DELETE':
        $id = $_GET['id'];
        $conn->query("DELETE FROM usuarios WHERE id=$id");
        echo json_encode(["message" => "User deleted successfully"]);
        break;
    default:
        echo json_encode(["message" => "Invalid request method"]);
        break;
}

$conn->close();
?>/