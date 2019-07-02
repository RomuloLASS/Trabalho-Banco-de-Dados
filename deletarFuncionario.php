<?php
if (isset($_GET['cpf'])) {
    include_once("conexao.php"); /* Estabelece a conexão */
    $sql = "DELETE FROM funcionarios where cpf=\"" . $_GET['cpf'] . "\"";
    $resultado = mysqli_query($conexao, $sql);
    if ($resultado) {
        http_response_code(200);
    }
    } else {
        http_response_code(500);
    }
?>  