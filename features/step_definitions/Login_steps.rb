require_relative '../support/configs.rb'
require_relative '../support/driver.rb'
require_relative '../support/selectors.rb'
require_relative '../support/methods.rb'

DriverMethods = DriverMethods.new
HelperMethods = HelperMethods.new 

Given('I open the web page') do
    DriverMethods.NavigateToURL(Configs::MAINURL)
end

When('I login as a {string} user') do |usertype|
    case usertype
    when "standard"
        DriverMethods.TypeText(:id, Selectors::USERNAME, Configs::VALIDUSER)
        DriverMethods.TypeText(:id, Selectors::PASSSWORD, Configs::PASSWORD)
    when "locked"
        DriverMethods.TypeText(:id, Selectors::USERNAME, Configs::LOCKEDUSER)
        DriverMethods.TypeText(:id, Selectors::PASSSWORD, Configs::PASSWORD)
    when"no_username"
        DriverMethods.TypeText(:id, Selectors::PASSSWORD, Configs::PASSWORD)
    when"no_password"
        DriverMethods.TypeText(:id, Selectors::USERNAME, Configs::VALIDUSER)
    when "wrong_username"
        DriverMethods.TypeText(:id, Selectors::USERNAME, Configs::WRONGUSER)
        DriverMethods.TypeText(:id, Selectors::PASSSWORD, Configs::PASSWORD)
    when "wrong_password"
        DriverMethods.TypeText(:id, Selectors::USERNAME, Configs::VALIDUSER)
        DriverMethods.TypeText(:id, Selectors::PASSSWORD, Configs::WRONGPASSWORD)
    end

    DriverMethods.ClickButton(:id, Selectors::LOGINBUTTON)
end    

Then ('I should see {string} in the {string}') do |message, page|
    case page
    when "homepage"
        expect(message).to eq(DriverMethods.GetTextFromElement(:class_name, Selectors::HOMEPAGETITLE))
        expect(DriverMethods.ElementVisibleOrNot(:id, Selectors::LOGINBUTTON)).to eq(false)
    when "loginpage"
        expect(message).to eq(DriverMethods.GetTextFromElement(:class_name, Selectors::LOGINPAGETITLE))
        expect(DriverMethods.ElementVisibleOrNot(:id, Selectors::LOGINBUTTON)).to eq(true)
    end
end

Then ('I should see the login error message {string}') do |errormessage|
    expect(DriverMethods.GetTextFromElement(:css, Selectors::ERRORMESSAGE)).to include(errormessage)
end

When ('I logout of the webpage')do
    DriverMethods.ClickButton(:id, Selectors::MENU)
    HelperMethods.SleepForABit(2)
    DriverMethods.ClickButton(:id, Selectors::LOGOUTBUTTON)
end
