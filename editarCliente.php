<?php session_start(); ?>
<?php
    if (isset($_POST["submit"])) {
        include_once("conexao.php"); /* Estabelece a conexão */
        $nome = $_POST['nome'];
        $telefone = $_POST['telefone'];
        $cpf = $_POST['cpf'];
        $endereco = $_POST['endereco'];



        $sql = "UPDATE `cliente` SET `nome`='$nome', `cpf`='$cpf',`telefone`='$telefone',`endereco`='$endereco' WHERE (`cliente`.`cpf`=\"" . $_GET['cpf'] . "\")";

        $salvar = mysqli_query($conexao, $sql);/*Escreve os dandos da tabela cliente no banco */
        if ($salvar) {
            ?>
            <div class="alert alert-success">Dados atualizados com sucesso!</div>
        <?php
        header("Location: visualizarCliente.php");
    } else {
        die(mysqli_error($conexao));
        ?>
            <div class="alert alert-warning">Falha ao atualizar os dados!</div>
        <?php
    }
    mysqli_close($conexao);/* Encerra a conexão com o banco */
    }

?>
<?php
include_once("conexao.php"); /* Estabelece a conexão */
$sql = "SELECT * FROM cliente where cpf='$_GET[cpf]'";
$resultado = mysqli_query($conexao, $sql);
if (mysqli_num_rows($resultado) === 1) {
    $linha = mysqli_fetch_assoc($resultado);
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Editar Cliente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="publico/css/bootstrap.min.css" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="publico/css/estilo.css">
</head>

<?php
include "header.php";
?>

<body>
    <!-- Script para fazer a máscara. Com ele, você pode definir qualquer tipo de máscara com o comando onkeypress="mascara(this, '###.###.###-##')". -->
    <script language="JavaScript">
        function mascara(t, mask) {
            var i = t.value.length;
            var saida = mask.substring(1, 0);
            var texto = mask.substring(i);
            console.log(saida, texto);
            if (texto.substring(0, 1) != saida) {
                t.value += texto.substring(0, 1);
            }
        }
    </script>
    <!-- Fim do script -->
    <!-- Formulário de Cadastro de Cliente -->
    <form action="" method="POST" target="_self">
        <fieldset>
            <legend>Informações:</legend>
            <div class="form-row">
                <div class="form-group col-md-8">
                    <label for="inputName">Nome</label>
                    <input type="name" name="nome" class="form-control" id="inputNome4" placeholder="Nome" value="<?php echo htmlspecialchars($linha['nome']) ?>">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputTelephone">Telefone</label>
                    <input type="text" name="telefone" class="form-control" id="inputTelefone4" placeholder="(11)1111-1111" onkeypress="mascara(this, '## ####-####')" maxlength="12" value="<?php echo htmlspecialchars($linha['telefone']) ?>">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputCPF">CPF</label>
                    <input type="text" name="cpf" class="form-control" id="inputCPF4" placeholder="111.111.111-11" onkeypress="mascara(this, '###.###.###-##')" maxlength="14" value="<?php echo htmlspecialchars($linha['cpf']) ?>">
                </div>
                <div class="form-group col-md-8">
                <label for="inputAddress">Endereço</label>
                <input type="text" name="endereco" class="form-control" id="inputAddress" placeholder="Av. Rio Branco" value="<?php echo htmlspecialchars($linha['endereco']) ?>">
            </div>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-primary" value="Submit" name="submit">Confirmar</button>
    </form>
    <!-- Fim do Formulário de Cadastro de Usuário  -->
</body>

<?php
include "footer.php";
?>

</html>