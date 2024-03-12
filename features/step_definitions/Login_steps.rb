require_relative '../support/configs.rb'
require_relative '../support/driver.rb'
require_relative '../support/selectors.rb'

DriverMethods = DriverMethods.new

Given('I open the web page') do
    DriverMethods.NavigateToURL(@driver, Configs::MAINURL)
end

When('I login as a {string} user') do |usertype|
    case usertype
    when "standard"
        DriverMethods.TypeText(@driver, :id, Selectors::USERNAME, Configs::VALIDUSER)
        DriverMethods.TypeText(@driver, :id, Selectors::PASSSWORD, Configs::PASSWORD)
    end

    DriverMethods.ClickButton(@driver, :id, Selectors::LOGINBUTTON)
end    

Then ('I should see {string} in the {string}') do |message, page|
    case page
    when "homepage"
        expect(message).to eq(DriverMethods.GetTextFromElement(@driver, :class_name, Selectors::HOMEPAGETITLE))
        expect(DriverMethods.ElementVisibleOrNot(@driver, :id, Selectors::LOGINBUTTON)).to eq(false)
    end
end
