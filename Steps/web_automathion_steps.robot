*** Settings ***

Resource      ../Functions/web_automathion_functions.robot
Resource      ../PageObjects/web_automathion_page.robot

*** Keywords ***

Dado que estou na home page do site www.automationpractice.pl/index.php
    Go To    ${URL} 
    Sleep    10s
    Wait Until Element Is Visible    ${LOGO}

Quando acessar o menu "Women"
    Click Element     ${WOMEN}

Então o slide da pagina deve ficar "WOMEN"
    Wait Until Element Is Visible     ${SLIDE}

E Verificar se aparece o produto "Blouse"
    Scroll Element Into View      ${LOCALIZADOR}

Quando digitar pelo produto "${PRODUTO}"
    Input Text       search_query_top    ${PRODUTO}
    Click Button     ${BOTÃO_PESQUISA}

Então a pagina seleciona os TOP SELLERS da categoria
    Click Element     ${TOP_SELLERS}
 
E um produto da linha "${PRODUTO}" deve ser mostrado na página
    Wait Until Element Is Visible    locator=(//h5[contains(.,'${PRODUTO}')])[1]
    Click Element                    locator=(//img[contains(@class,'replace-2x img-responsive')])[1]
    Element Should Be Visible        locator=//img[contains(@height,'458')]

Quando inserir um email para usuário novo
    Click Element          ${LOGIN}  
    ${palavra_aleatoria}   Generate Random String   length=5    chars=[LETTERS]
    ${palavra_aleatoria}   Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable      ${EMAIL_TESTE}           ${palavra_aleatoria}@emailteste.com
    Input Text             email_create     ${EMAIL_TESTE}
    Click Element          ${CREATE_AN_ACCOUNT}
  
Então conferir se "Create an account" está na pagina 
    Wait Until Element Is Visible     ${IMAGEM_CREATE} 

E preencher os campos obrigatorios "First Name, Last Name, Password"
    Sleep    5s
    Click Element            ${GENDER}
    Input Text               customer_firstname    ${NAME} 
    Input Text               customer_lastname     ${LASTE_NAME}
    Input Password           passwd                ${PASSWD} 
    Double Click Element     ${MONTHS}
    Double Click Element     ${YEAR}
    Click Element            ${CONCLUIR}
 
E verificar se o novo usuario foi cadastrado com sucesso 
    Wait Until Element Is Visible     ${BTN_ACCOUNT} 
    Log         Your account has been created.    

Então adicionar Endereço, Bairro, Cidade, Cep, Estado e Telefone
    Click Element           ${ADD_MY_ADRESS}
    Input Text              address1        text=Rua:UM
    Input Text              city            text=Guarulhos
    Double Click Element    id_state
    Input Text              postcode        text=22222
    Double Click Element    id_country
    Input Text              phone           text=1111111111
    Input Text              phone_mobile    text=3333333333
    Click Element           ${SAVE}   

E verificar se completou o cadastro do usuario 
    Log    Your addresses are listed below.

E não preencher os dados obrigatorios corretamente
    Sleep    5s
    Click Element     ${GENDER}
    Input Text        customer_firstname      ${NAME}
    Input Text        customer_lastname       ${LASTE_NAME}
    Click Element     ${CONCLUIR}
    
Então retorna o aviso para preencher campos obrigatorios
    Log          passwd is required
    Log          Required field

Quando entro na opção de contatar o suporte do site 
    Click Element                    ${SUPORTE}
    Wait Until Element Is Visible    ${CONFIRMA}

E inserir emaiL, assunto e mensagem
    Click Element       id_contact
    ${PALAVRA_EMAIL}    Generate Random String     length=5    chars=[LETTERS]
    ${PALAVRA_EMAIL}    Convert To Lower Case      ${PALAVRA_EMAIL}
    Set Test Variable    ${EMAIL_SUPORTE}          ${PALAVRA_EMAIL}@emailteste.com
    Input Text            email                    ${EMAIL_SUPORTE} 
    Input Text            id_order                 TESTE
    Input Text            message                  TESTE

Então enviar a mensagem ao suporte após apertar o botão Send e confirma se foi enviado com sucesso
    Click Element        ${SEND}

