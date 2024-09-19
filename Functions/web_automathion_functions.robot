*** Settings ***

Library        SeleniumLibrary
Library        String
Library        RequestsLibrary
Library        Collections
# Library        FakerLibrary
Resource      ../PageObjects/web_automathion_page.robot
Resource      ../Steps/web_automathion_steps.robot

*** Keywords ***

Abrir o Navegador
    Open Browser    browser=${BROWSER}    
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser