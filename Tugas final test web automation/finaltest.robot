*** Settings ***
Library                             SeleniumLibrary
Test Setup                          Open Browser                               ${openurl}      ${browsertype}
Test Teardown                       Close Browser

***Variables***
${openurl}                          http://automationpractice.pl/index.php
${browsertype}                      edge
${EmailV}                           finaltestdumyyyy@yopmail.com

***Test Cases***
i want to press homepage button or your logo a new experience
    maximize Browser window
    click element                   //img[@class="logo img-responsive"]
    element should be visible       //div[@id="facebook_block"]
    page should contain                                                        Popular     

i want to register in this page (VALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email_create"]                    ${EmailV}   
    click element                   //i[@class="icon-user left"]
    element should be visible       //h1[@class="page-heading"]
    sleep                                                                      10s
    select radio button             id_gender                                  1
    input text                      //*[@id="customer_firstname"]              final
    input text                      //*[@id="customer_lastname"]               test
    input text                      //*[@id="passwd"]                          12345
    click element                   //option[@value="22"]
    click element                   (//option[@value="2"])[2]
    click element                   //*[@value="1997"]
    click element                   //*[@name="submitAccount"]
    page should contain                                                        My account

i want to register in this page (INVALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email_create"]                    finaltestdumyy
    click element                   //i[@class="icon-user left"]
    sleep                                                                      3s
    element should be visible       //*[@id="create_account_error"]

i want to login in this page (VALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email"]                           finaltestdumyyy@yopmail.com
    input text                      //*[@id="passwd"]                          12345
    click element                   //*[@id="SubmitLogin"]
    page should contain                                                        My account

i want to login in this page (INVALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email"]                           finaltestdumyyy@yopmail.com
    input text                      //*[@id="passwd"]                          123456
    click element                   //*[@id="SubmitLogin"]
    page should contain                                                        Authentication failed.

i want to order at this page condition when user already fill address  (VALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email"]                           finaltestdumyyy@yopmail.com
    input text                      //*[@id="passwd"]                          12345
    click element                   //*[@id="SubmitLogin"]
    page should contain                                                        My account
    click element                   //a[@title="Women"]
    click element                   //*[@id="list"]/a/i
    click element                   //*[@id="center_column"]/ul/li[2]/div/div/div[3]/div/div[2]/a[1]
    sleep                                                                      5s
    click element                   //*[@title="Proceed to checkout"]
    click element                   //*[@id="center_column"]/p[2]/a[1]
    page should contain                                                        Addresses
    click element                   (//button[@type="submit"])[2]
    page should contain                                                        Shipping:
    click element                   //*[@id="cgv"]
    element should be visible       //*[@class="page-heading"]
    click element                   //*[@id="form"]/p/button
    click element                   //a[@class="bankwire"]
    click element                   //*[@id="cart_navigation"]/button
    page should contain                                                        Your order on My Store is complete.

i want to order at this page (INVALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email"]                           finaltestdumyyy@yopmail.com
    input text                      //*[@id="passwd"]                          12345
    click element                   //*[@id="SubmitLogin"]
    page should contain                                                        My account
    click element                   //a[@title="Women"]
    click element                   //*[@id="list"]/a/i
    click element                   //*[@id="center_column"]/ul/li[2]/div/div/div[3]/div/div[2]/a[1]
    sleep                                                                      5s
    click element                   //*[@title="Proceed to checkout"]
    click element                   //*[@id="center_column"]/p[2]/a[1]
    page should contain                                                        Addresses
    click element                   (//button[@type="submit"])[2]
    page should contain                                                        Shipping:
    click element                   //*[@id="form"]/p/button
    page should contain                                                        You must agree to the terms of service before continuing.

i want to open my account (VALID)
    maximize Browser window
    click element                   //a[@class="login"]
    input text                      //*[@id="email"]                           finaltestdumyyy@yopmail.com
    input text                      //*[@id="passwd"]                          12345
    click element                   //*[@id="SubmitLogin"]
    page should contain                                                        My account
    click element                   //img[@class="logo img-responsive"]
    click element                   //*[@title="View my customer account"]
    page should contain                                                        My account

i want to open contact us (VALID)
    maximize Browser window
    click element                   //*[@title="Contact us"]
    element should be visible       //*[@class="page-heading bottom-indent"]