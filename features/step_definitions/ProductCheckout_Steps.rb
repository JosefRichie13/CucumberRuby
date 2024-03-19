
Given('I remove {string} from the cart') do |productType|
    addOrRemoveFromCart(productType)
end



Given('I add {string} to the cart') do |productType|
    addOrRemoveFromCart(productType)
end



def addOrRemoveFromCart(productType)
    case productType
    when "Sauce Labs Backpack"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTBACKPACK)
    when "Sauce Labs Bike Light"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTBIKELIGHT)
    when"Sauce Labs Bolt T-Shirt"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTTSHIRT)
    when"Sauce Labs Fleece Jacket"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTJACKET)
    when "Sauce Labs Onesie"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTONESIE)
    when "Test.allTheThings() T-Shirt (Red)"
        DriverMethods.ClickButton(:css, Selectors::PRODUCTTSHIRTRED)
    end
end



Given('I click on the cart') do
    DriverMethods.ClickButton(:class_name, Selectors::CART)
end



Given('I checkout') do
    DriverMethods.ClickButton(:id, Selectors::CHECKOUT)
end



And('I enter my information to continue') do |table| 
    DriverMethods.TypeText(:id, Selectors::FIRSTNAME, table.rows.first[0])
    DriverMethods.TypeText(:id, Selectors::LASTNAME, table.rows.first[1])
    DriverMethods.TypeText(:id, Selectors::ZIPCODE, table.rows.first[2])
    DriverMethods.ClickButton(:id, Selectors::CONTINUEBUTTON)
end 


# We get the Tax shown in the UI, extract the number, convert it into float and store it in a variable, taxCalculatedByAPP
# We get the non taxed sum shown in the UI, extract the number, convert into float, multiple it by 0.08 (8%), round the result off to 2 and store it in a variable, taxCalculatedByCODE
# Then we check if both taxCalculatedByAPP and taxCalculatedByCODE are equal

# We get the total shown in the UI, extract the number, convert it into float and store it in a variable, totalCalculatedByAPP
# We get the non tax added total shown in the UI, extract the number, convert into float, add the tax calculated (taxCalculatedByCODE) and store it in a variable, totalCalculatedByCODE
# Then we check if both totalCalculatedByAPP and totalCalculatedByCODE are equal
And('I should see the tax calculated at 8 percent') do  

    taxCalculatedByAPP = DriverMethods.GetTextFromElement(:class_name, Selectors::TAXCALCULATED).scan(/\d+\.\d+/).first.to_f
    taxCalculatedByCODE = (DriverMethods.GetTextFromElement(:class_name, Selectors::SUBTOTAL).scan(/\d+\.\d+/).first.to_f * 0.08).round(2)
    expect(taxCalculatedByAPP).to eq(taxCalculatedByCODE)

    totalCalculatedByAPP = DriverMethods.GetTextFromElement(:css, Selectors::FULLTOTAL).scan(/\d+\.\d+/).first.to_f
    totalCalculatedByCODE = DriverMethods.GetTextFromElement(:class_name, Selectors::SUBTOTAL).scan(/\d+\.\d+/).first.to_f + taxCalculatedByCODE
    expect(totalCalculatedByAPP).to eq(totalCalculatedByCODE)

end 


# We get the individual prices into an array, individualPrices
# We remove the $ sign, convert the array elements into float and sum it. Storing it in a variable, sumCalculatedByCODE
# We get the total displayed in the UI, extract the number, convert into float and store it in a variable, sumCalculatedByAPP
# Then we check if sumCalculatedByCODE and sumCalculatedByAPP are equal
Then('I should see the individual items total correctly') do
    individualPrices = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRICELIST)
    individualPricesInFloatWithoutSign = individualPrices.map { |price| price.delete('$').to_f }
    sumCalculatedByCODE = individualPricesInFloatWithoutSign.sum

    sumCalculatedByAPP = DriverMethods.GetTextFromElement(:class_name, Selectors::SUBTOTAL).scan(/\d+\.\d+/).first.to_f

    expect(sumCalculatedByCODE).to eq(sumCalculatedByAPP)

end 


And('I confirm my order') do 
    DriverMethods.ClickButton(:id, Selectors::FINISHBUTTON)
end


Then('I should see {string} after the order is placed') do |message|
    expect(DriverMethods.GetTextFromElement(:class_name, Selectors::CHECKOUTBANNER)).to eq(message)
end