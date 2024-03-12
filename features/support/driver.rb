require 'selenium-webdriver'

class DriverMethods

    def GetTextFromElement(driver, selectorType, selectorElement)
        return driver.find_element(selectorType, selectorElement).text
    end    


    def NavigateToURL(driver, url)
        driver.navigate.to(url)
    end    


    def TypeText(driver, selectorType, selectorElement, textToType)
        driver.find_element(selectorType, selectorElement).send_keys(textToType)
    end
    

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