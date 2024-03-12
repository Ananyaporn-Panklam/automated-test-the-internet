*** Variables ***
${text_login_page_xpath}    //*[@id="content"]//h2
${input_username_xpath}    //input[@id="username"]
${input_password_xpath}    //input[@id="password"]
${button_login_xpath}    //*[@id="login"]/button
${text_login_success_xpath}    //div[@id='flash' and contains(@class, 'flash success')]
${text_login_unsuccess_xpath}    //div[@id='flash-messages']//div[@id='flash' and contains(@class, 'flash error')]
${button_logout_xpath}     //a[contains(@class, 'button secondary radius') and contains(@href, '/logout')]
${text_logout_success_xpath}    //div[@id='flash-messages']//div[@id='flash' and contains(@class, 'flash success')] 