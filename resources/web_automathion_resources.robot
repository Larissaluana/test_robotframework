*** Settings ***
Library        SeleniumLibrary
Library        String
Library        RequestsLibrary
Library        Collections
# Library        FakerLibrary


*** Variables ***
${BROWSER}              chrome
${URL}                  http://www.automationpractice.pl/index.php
${LOGO}                 //img[contains(@class,'logo img-responsive')]
${WOMEN}                //a[contains(@title,'Women')]
${SLIDE}                //span[@class='category-name'][contains(.,'Women')]
${LOCALIZADOR}          //h5[@itemprop='name'][contains(.,'Blouse')]
${TOP_SELLERS}          //a[contains(@title,'View a top sellers products')]
${LOGIN}                //a[contains(@class,'login')]
${CREATE_AN_ACCOUNT}    //span[contains(.,'Create an account')]
${IMAGEM_CREATE}        //h1[@class='page-heading'][contains(.,'Create an account')]
${BOTÃO_PESQUISA}       //button[@type='submit'][contains(.,'Search')]
${NAME}                 MARIA
${LASTE_NAME}           SILVA
${PASSWD}               PASSWD
${GENDER}               id_gender2
${DAYS}                 (//span[contains(.,'2')])[2]
${MONTHS}               //select[contains(@name,'months')]
${YEAR}                 //select[contains(@name,'years')]
${CONCLUIR}             //span[contains(.,'Register')]
${ADD_MY_ADRESS}        //span[contains(.,'Add my first address')]
${SAVE}                 //span[contains(.,'Save')]
${SUPORTE}              //a[contains(@title,'Contact us')]
${CONFIRMA}             //h3[@class='page-subheading'][contains(.,'send a message')]


*** Keywords ***

Abrir o Navegador
   Open Browser    browser=${BROWSER}    
   Maximize Browser Window

Fechar o navegador
   Capture Page Screenshot
   Close Browser

Dado que estou na home page do site www.automationpractice.pl/index.php
    Go To    url=${URL} 
    Sleep    10s
    Wait Until Element Is Visible    locator=${LOGO}

Quando acessar o menu "Women"
    Click Element    locator=${WOMEN}

Então o slide da pagina deve ficar "WOMEN"
    Wait Until Element Is Visible    locator=${SLIDE}

E Verificar se aparece o produto "Blouse"
     Scroll Element Into View    locator=${LOCALIZADOR}

Quando digitar pelo produto "${PRODUTO}"
     Input Text      locator=search_query_top    text=${PRODUTO}
     Click Button    locator=${BOTÃO_PESQUISA}

Então a pagina seleciona os TOP SELLERS da categoria
     Click Element    locator=${TOP_SELLERS}
 
E um produto da linha "${PRODUTO}" deve ser mostrado na página
     Wait Until Element Is Visible    locator=(//h5[contains(.,'${PRODUTO}')])[1]
     Click Element                    locator=(//img[contains(@class,'replace-2x img-responsive')])[1]
     Element Should Be Visible        locator=//img[contains(@height,'458')]

 Quando inserir um email para usuário novo
     Click Element          locator=${LOGIN}  
     ${palavra_aleatoria}   Generate Random String   length=5    chars=[LETTERS]
     ${palavra_aleatoria}   Convert To Lower Case    ${palavra_aleatoria}
     Set Test Variable      ${EMAIL_TESTE}           ${palavra_aleatoria}@emailteste.com
     Input Text             locator=email_create     text=${EMAIL_TESTE}
     Click Element          locator=${CREATE_AN_ACCOUNT}
  
 Então conferir se "Create an account" está na pagina 
     Wait Until Element Is Visible    locator=${IMAGEM_CREATE} 

E preencher os campos obrigatorios "First Name, Last Name, Password"
     Sleep    5s
     Click Element            locator=${GENDER}
     Input Text               locator=customer_firstname    text=${NAME} 
     Input Text               locator=customer_lastname   text=${LASTE_NAME}
     Input Password           locator=passwd   password=${PASSWD} 
     Double Click Element     locator=${MONTHS}
     Double Click Element     locator=${YEAR}
     Click Element            locator=${CONCLUIR}
 
E verificar se o novo usuario foi cadastrado com sucesso 
    Wait Until Element Is Visible    locator=//h1[@class='page-heading'][contains(.,'My account')]
    Log         Your account has been created.    

Então adicionar Endereço, Bairro, Cidade, Cep, Estado e Telefone
    Click Element           locator=${ADD_MY_ADRESS}
    Input Text              locator=address1        text=Rua:UM
    Input Text              locator=city            text=Guarulhos
    Double Click Element    locator=id_state
    Input Text              locator=postcode        text=22222
    Double Click Element    locator=id_country
    Input Text              locator=phone           text=1111111111
    Input Text              locator=phone_mobile    text=3333333333
    Click Element           locator=${SAVE}   

 E verificar se completou o cadastro do usuario 
     Log    Your addresses are listed below.

E não preencher os dados obrigatorios corretamente
    Sleep    5s
    Click Element     ${GENDER}
    Input Text        customer_firstname      ${NAME}
    Input Text        customer_lastname       ${LASTE_NAME}
    Click Element     {CONCLUIR}
    
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

Então enviar a mensagem ao suporte após apertar o botão "Send"
    Click Element    locator=//span[contains(.,'Send')]
