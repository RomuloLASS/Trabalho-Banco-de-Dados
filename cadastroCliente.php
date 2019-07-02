<?php
    session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cadastro de Cliente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="publico/css/bootstrap.min.css" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="publico/css/estilo.css">
</head>

<?php
include "header.php";
?>

<hr>

<body>
    <!-- Script para fazer a máscara. Com ele, você pode definir qualquer tipo de máscara com o comando onkeypress="mascara(this, '###.###.###-##')". -->
    <script language="JavaScript">
        function mascara(t, mask) {
            var i = t.value.length;
            var saida = mask.substring(1, 0);
            var texto = mask.substring(i);
            console.log(i, texto, texto.substring(0, 1), saida);
            if (texto.substring(0, 1) != saida) {
                console.log(texto.substring(0, 1));
                t.value += texto.substring(0, 1);
            }
        }
    </script>
    <!-- Fim do script -->
    <!-- Formulário de Cadastro de Cliente -->
    <form action="cadastroCliente.php" method="POST" target="_self">
        <fieldset>
            <legend>Informações:</legend>
            <div class="form-row">
                <div class="form-group col-md-8">
                    <label for="inputName">Nome</label>
                    <input type="name" name="nome" class="form-control" id="inputNome4" placeholder="Nome">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputTelephone">Telefone</label>
                    <input type="text" name="telefone" class="form-control" id="inputTelefone4" placeholder="(11)1111-1111" onkeypress="mascara(this, '## ####-####')" maxlength="12">
                </div>
                <div class="form-group col-md-2">
                    <label for="inputCPF">CPF</label>
                    <input type="text" name="cpf" class="form-control" id="inputCPF4" placeholder="111.111.111-11" onkeypress="mascara(this, '###.###.###-##')" maxlength="14">
                </div>
                <div class="form-group col-md-8">
                <label for="inputAddress">Endereço</label>
                <input type="text" name="endereco" class="form-control" id="inputAddress" placeholder="Av. Rio Branco">
            </div>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-primary" value="Submit" name="submit">Confirmar</button>
    </form>
    <!-- Fim do Formulário de Cadastro de Usuário  -->
    <?php
    /* Ligação com Banco de Dados */
    if (isset($_POST["submit"])) {
        include_once("conexao.php"); /* Estabelece a conexão */
        $nome = $_POST['nome'];
        $telefone = $_POST['telefone'];
        $cpf = $_POST['cpf'];
        $endereco = $_POST['endereco'];

        $sql = "insert into cliente (nome,cpf,telefone,endereco) values ('$nome','$cpf','$telefone','$endereco')";

        $salvar = mysqli_query($conexao, $sql);/*Escreve os dandos da tabela cliente no banco */
        if ($salvar) {
            ?>
            <div class="alert alert-success">Cliente cadastrado com sucesso!</div>
        <?php
    } else {
        die(mysqli_error($conexao));
        ?>
            <div class="alert alert-warning">Falha ao cadastrar cliente!</div>
        <?php
    }
    mysqli_close($conexao);/* Encerra a conexão com o banco */
}

?>

</body>

<hr>

<?php
include "footer.php";
?>

</html>