# TESTE PARA AUTOMAÇÃO ATRAVES DO ROBOTFRAMEWORK

# Sobre o Projeto

Este repositorio utiliza o Robot Framework para automatizar testes. O objetivo desse projeto é testar funcionalidades diversas em uma aplicação web. Na automação utilizamos a biblioteca SeleniumLibrary, e para interagirmos com o navegador StringLibrary para gerar massa de dados como e-mail, telefone e dados cadastrais.

# Funcionalidades

##  **Teste de Cadastro de Usuario**
    ° Verificação de login bem sucedida atraves de informações validas

##  **Teste de Busca**
    ° Pesquise produtos utilizando palavras-chaves adequadas 

##  **Geração Automática de Conjunto de Dados**
    °Criação de e-mails, telefones e dados cadastrais utilizando a biblioteca StringLibrary

#   **Requisitos**
    °Certifique-se de que os seguintes requisitos estão instalados para executar este projeto.

*. Python 3.12 ou superior*
*. Robot Framework*
*. SeleniumLibrary e StringLibrary*

##  **Instalação dos Requesitos**
    °Para instalar o **Robot Framework** e as demais bibliotecas necessárias, execute os seguintes comandos:
    
    *pip install -r requirements.txt*

    °Ou, se preferir, você pode realizar a instalação manualmente:

    *pip install robotframework*
    *pip install robotframework-seleniumlibrary*
   
    °Clone o repositório para sua máquina local
    
    ``` bash
    *git clone https://github.com/Larissaluana/test_robotframework.git*

    °Execute o teste a seguir;
    *robot -t results "Suite\web_automathion_suite.robot"*

##  **Estrutura do Projeto**

