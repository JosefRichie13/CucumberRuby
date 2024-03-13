require 'selenium-webdriver'

class DriverMethods

    # Gets text from an element and returns it
    def GetTextFromElement(driver, selectorType, selectorElement)
        return driver.find_element(selectorType, selectorElement).text
    end    


    # Gets text from a list of elements and returns it
    def GetTextFromAListOfElements(driver, selectorType, selectorElement)
        listOfElements = driver.find_elements(selectorType, selectorElement)
        listOfText = []
        listOfElements.each do |listOfElements|
            listOfText.push(listOfElements.text)
          end
          return listOfText
    end


    # Selects an option from a dropdown based on the text
    def SelectFromDropdownUsingText(driver, selectorType, selectorElement, selectOptionInText)
        select_element = driver.find_element(selectorType, selectorElement)
        select = Selenium::WebDriver::Support::Select.new(select_element)
        select.select_by(:text, selectOptionInText)
    end


    # Opens an URL
    def NavigateToURL(driver, url)
        driver.navigate.to(url)
    end    


    # Types some text
    def TypeText(driver, selectorType, selectorElement, textToType)
        driver.find_element(selectorType, selectorElement).send_keys(textToType)
    end
    

    # Clicks on a button
    def ClickButton(driver, selectorType, selectorElement)
        driver.find_element(selectorType, selectorElement).click()
    end


    
    # Checks if element is visible or not
    # TRUE if its visible, which means the size will be greater than 0
    # FALSE if its not, which means the size will not be greater than 0
    def ElementVisibleOrNot(driver, selectorType, selectorElement)
        if (driver.find_elements(selectorType, selectorElement).size > 0)
            return true
        else
            return false
        end
    end


end     