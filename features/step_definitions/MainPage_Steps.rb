Then('the sort {string} should work correctly') do |sorttype|
    case sorttype
    when "Price (high to low)"

        # We get the list of prices from the mainpage and store them in an array, noSortPrices
        # We remove the $ sign and convert the prices to floats and store them in an array, noSortPricesInFloatWithoutSign
        # We then sort it Descending and store it in an array, sortedPricesHighToLow
        # We then select the Price (high to low) option from the dropdown, repeat the step 1 and 2
        # We end up with prices sorted by the application in an array, afterSortPricesInFloatWithoutSign
        # Finally we compare both arrays if they are the same
        noSortPrices = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRICELIST)
        noSortPricesInFloatWithoutSign = noSortPrices.map { |price| price.delete('$').to_f }
        sortedPricesHighToLow = noSortPricesInFloatWithoutSign.sort { |a, b| b <=> a }

        DriverMethods.SelectFromDropdownUsingText(:class_name, Selectors::PRODUCTSORT, sorttype)
        priceAfterSortByUI = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRICELIST)
        afterSortPricesInFloatWithoutSign = priceAfterSortByUI.map { |price| price.delete('$').to_f }

        expect(sortedPricesHighToLow).to eq(afterSortPricesInFloatWithoutSign)

    when "Price (low to high)"

        noSortPrices = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRICELIST)
        noSortPricesInFloatWithoutSign = noSortPrices.map { |price| price.delete('$').to_f }
        sortedPricesLowToHigh = noSortPricesInFloatWithoutSign.sort

        DriverMethods.SelectFromDropdownUsingText(:class_name, Selectors::PRODUCTSORT, sorttype)
        priceAfterSortByUI = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRICELIST)
        afterSortPricesInFloatWithoutSign = priceAfterSortByUI.map { |price| price.delete('$').to_f }

        expect(sortedPricesLowToHigh).to eq(afterSortPricesInFloatWithoutSign)

    when "Name (Z to A)"

        # We get the names of products from the mainpage and store them in an array, noSortNames
        # We then sort it Descending and store it in an array, sortedNamesZtoA
        # We then select the Price (high to low) option from the dropdown
        # We end up with prices sorted by the application in an array, namesAfterSortByUI
        # Finally we compare both arrays if they are the same
        noSortNames = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRODUCTLIST)
        sortedNamesZtoA = noSortNames.sort{ |a, b| b <=> a }

        DriverMethods.SelectFromDropdownUsingText(:class_name, Selectors::PRODUCTSORT, sorttype)
        namesAfterSortByUI = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRODUCTLIST)

        expect(sortedNamesZtoA).to eq(namesAfterSortByUI)

    when "Name (A to Z)"

        noSortNames = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRODUCTLIST)
        sortedNamesZtoA = noSortNames.sort

        DriverMethods.SelectFromDropdownUsingText(:class_name, Selectors::PRODUCTSORT, sorttype)
        namesAfterSortByUI = DriverMethods.GetTextFromAListOfElements(:class_name, Selectors::PRODUCTLIST)

        expect(sortedNamesZtoA).to eq(namesAfterSortByUI)

    end
  end



  Then ('I should see {string} items in the cart bubble') do |cartNumber|
    expect(DriverMethods.GetTextFromElement(:class_name, Selectors::ITEMNUMBERINCART)).to eq(cartNumber)
  end