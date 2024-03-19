require 'selenium-webdriver'

class DriverMethods

    # Gets text from an element and returns it
    def GetTextFromElement(selectorType, selectorElement)
        return $browser.find_element(selectorType, selectorElement).text
    end    


    # Gets text from a list of elements and returns it
    def GetTextFromAListOfElements(selectorType, selectorElement)
        listOfElements = $browser.find_elements(selectorType, selectorElement)
        listOfText = []
        listOfElements.each do |listOfElements|
            listOfText.push(listOfElements.text)
          end
          return listOfText
    end


    # Selects an option from a dropdown based on the text
    def SelectFromDropdownUsingText(selectorType, selectorElement, selectOptionInText)
        select_element = $browser.find_element(selectorType, selectorElement)
        select = Selenium::WebDriver::Support::Select.new(select_element)
        select.select_by(:text, selectOptionInText)
    end


    # Opens an URL
    def NavigateToURL(url)
        $browser.navigate.to(url)
    end    


    # Types some text
    def TypeText(selectorType, selectorElement, textToType)
        $browser.find_element(selectorType, selectorElement).send_keys(textToType)
    end
    

    # Clicks on a button
    def ClickButton(selectorType, selectorElement)
        $browser.find_element(selectorType, selectorElement).click()
    end


    
    # Checks if element is visible or not
    # TRUE if its visible, which means the size will be greater than 0
    # FALSE if its not, which means the size will not be greater than 0
    def ElementVisibleOrNot(selectorType, selectorElement)
        if ($browser.find_elements(selectorType, selectorElement).size > 0)
            return true
        else
            return false
        end
    end



    # Returns the current URL
    def GetTheCurrentURL()
        return $browser.current_url
    end



    # Switches to a new window or tab
    # Starts from 0, which is the current opened tab/window
    # A new tab/window will be 1, and so on
    def SwitchToANewTab(tabNumber)
        handleID = $browser.window_handles[tabNumber]
        $browser.switch_to.window(handleID)
    end


end     