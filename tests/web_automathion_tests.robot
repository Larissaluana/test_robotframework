*** Settings ***
Resource                ../resources/web_automathion_resources.robot
Documentation            Suite de teste criada para verificar o site Autonathionpraticed
Test Setup               Abrir o Navegador 
# Test Teardown            Fechar o navegador    

*** Test Cases ***
Caso de Teste 01: Acessa ao menu "WOMEN"
    [Documentation]     Esse teste verificar o menu Women no site http://www.automationpractice.pl/index.php
...                     e o produto Blouse     
    [Tags]              menu_produto 
    Dado que estou na home page do site www.automationpractice.pl/index.php
    Quando acessar o menu "Women"
    Então o slide da pagina deve ficar "WOMEN"
    E Verificar se aparece o produto "Blouse"

Caso de Teste 02: Pesquisa de um produto 
    [Documentation]         Esse teste verifica a busca de um produto
    [Tags]                  busca_produtos
    Dado que estou na home page do site www.automationpractice.pl/index.php 
    Quando digitar pelo produto "Blouse"
    Então a pagina seleciona os TOP SELLERS da categoria 
    E um produto da linha "Blouse" deve ser mostrado na página

Caso de Teste 03: Cadastrar um Novo Usuario
    Dado que estou na home page do site www.automationpractice.pl/index.php 
    Quando inserir um email para usuário novo
    Então conferir se "Create an account" está na pagina
    E preencher os campos obrigatorios "First Name, Last Name, Password"
    E verificar se o novo usuario foi cadastrado com sucesso

Caso de Teste 04: Completar cadastro do Novo usuario com informações adicionais 
     Dado que estou na home page do site www.automationpractice.pl/index.php
     Quando inserir um email para usuário novo
     E preencher os campos obrigatorios "First Name, Last Name, Password"
     E verificar se o novo usuario foi cadastrado com sucesso
     Então adicionar Endereço, Bairro, Cidade, Cep, Estado e Telefone
     E verificar se completou o cadastro do usuario

Caso de Teste 05: Deixa o cadastro do usuario incompleto e sinalizar erro
     Dado que estou na home page do site www.automationpractice.pl/index.php
     Quando inserir um email para usuário novo
     E não preencher os dados obrigatorios corretamente 
     Então retorna o aviso para preencher campos obrigatorios

# robot -t "Caso de Teste 06: Entrar em contato com o suporte do site Automation" -d results "test\web_automathion_tests"
Caso de Teste 06: Entrar em contato com o suporte do site Automation
     Dado que estou na home page do site www.automationpractice.pl/index.php
     Quando entro na opção de contatar o suporte do site
     E inserir emaiL, assunto e mensagem
    #  Então enviar a mensagem ao suporte após apertar o botão "Send"
     

# Caso de Teste 07: