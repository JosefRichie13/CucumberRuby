
Given('I remove {string} from the cart') do |productType|
    addOrRemoveFromCart(productType)
end


Given('I add {string} to the cart') do |productType|
    addOrRemoveFromCart(productType)
end


def addOrRemoveFromCart(productType)
    case productType
    when "Sauce Labs Backpack"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTBACKPACK)
    when "Sauce Labs Bike Light"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTBIKELIGHT)
    when"Sauce Labs Bolt T-Shirt"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTTSHIRT)
    when"Sauce Labs Fleece Jacket"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTJACKET)
    when "Sauce Labs Onesie"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTONESIE)
    when "Test.allTheThings() T-Shirt (Red)"
        DriverMethods.ClickButton(@driver, :css, Selectors::PRODUCTTSHIRTRED)
    end
end

Given('I click on the cart') do
    DriverMethods.ClickButton(@driver, :class_name, Selectors::CART)
end

Given('I checkout') do
    DriverMethods.ClickButton(@driver, :id, Selectors::CHECKOUT)
end

And('I enter my information to continue') do |table| 
    DriverMethods.TypeText(@driver, :id, Selectors::FIRSTNAME, table.rows.first[0])
    DriverMethods.TypeText(@driver, :id, Selectors::LASTNAME, table.rows.first[1])
    DriverMethods.TypeText(@driver, :id, Selectors::ZIPCODE, table.rows.first[2])
    DriverMethods.ClickButton(@driver, :id, Selectors::CONTINUEBUTTON)
end 

And('I should see the tax calculated at 8 percent') do  

    taxCalculatedByAPP = DriverMethods.GetTextFromElement(@driver, :class_name, Selectors::TAXCALCULATED).scan(/\d+\.\d+/).first.to_f
    taxCalculatedByCODE = (DriverMethods.GetTextFromElement(@driver, :class_name, Selectors::SUBTOTAL).scan(/\d+\.\d+/).first.to_f * 0.08).round(1)
    expect(taxCalculatedByAPP).to eq(taxCalculatedByCODE)

    totalCalculatedByAPP = DriverMethods.GetTextFromElement(@driver, :css, Selectors::FULLTOTAL).scan(/\d+\.\d+/).first.to_f
    totalCalculatedByCODE = DriverMethods.GetTextFromElement(@driver, :class_name, Selectors::SUBTOTAL).scan(/\d+\.\d+/).first.to_f + taxCalculatedByCODE
    expect(totalCalculatedByAPP).to eq(totalCalculatedByCODE)

end 