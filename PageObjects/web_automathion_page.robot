#########################################################################################################
Autor: Larissa Luana de Paula
Descrição: Elementos capturados da pagina de interação com automatização
Criação: 19/09/2024
#########################################################################################################
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
${DAYS}                 //span[contains(.,'2')][2]
${MONTHS}               //select[contains(@name,'months')]
${YEAR}                 //select[contains(@name,'years')]
${CONCLUIR}             //span[contains(.,'Register')]
${ADD_MY_ADRESS}        //span[contains(.,'Add my first address')]
${SAVE}                 //span[contains(.,'Save')]
${SUPORTE}              //a[contains(@title,'Contact us')]
${CONFIRMA}             //h3[@class='page-subheading'][contains(.,'send a message')]
${SEND}                 //span[contains(.,'Send')]
${BTN_ACCOUNT}          //h1[@class='page-heading'][contains(.,'My account')]