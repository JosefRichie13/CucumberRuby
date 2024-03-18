require 'selenium-webdriver'
require 'cucumber'

Before do
   $browser = Selenium::WebDriver.for :firefox
  end

After do |scenario|
  temp_file = Tempfile.new(['screenshot', '.png'])
  $browser.save_screenshot(temp_file.path)
  screenshot_data = File.open(temp_file.path, 'rb') { |f| f.read }
  temp_file.close!
  attach(screenshot_data, 'image/png')
  $browser.quit
end