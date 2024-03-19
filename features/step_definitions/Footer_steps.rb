Given('I confirm that the footer is {string}') do |visibleStatus|
    if(visibleStatus == "not visible")
        expect(DriverMethods.ElementVisibleOrNot(:class, Selectors::FOOTER)).to eq(false)
    else
        expect(DriverMethods.ElementVisibleOrNot(:class, Selectors::FOOTER)).to eq(true)
    end
end

And('I click on the {string} icon in the footer') do |footerIcon|
    case footerIcon
    when "Twitter"
        DriverMethods.ClickButton(:class, Selectors::FOOTER_TWITTER)
        HelperMethods.SleepForABit(5)
    when "Facebook"
        DriverMethods.ClickButton(:class, Selectors::FOOTER_FB)
        HelperMethods.SleepForABit(5)
    when "LinkedIn"
        DriverMethods.ClickButton(:class, Selectors::FOOTER_LINKEDIN) 
        HelperMethods.SleepForABit(5)
    end
end

Then('I should see the redirect link as {string}') do |redirectURL|
    DriverMethods.SwitchToANewTab(1)
    expect(DriverMethods.GetTheCurrentURL()).to eq(redirectURL)
    DriverMethods.SwitchToANewTab(0)
end