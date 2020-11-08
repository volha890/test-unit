require 'selenium-webdriver'
require 'rspec'

describe 'Feedback collection' do
  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize

    @wait = Selenium::WebDriver::Wait.new(timeout: 10)

    @driver.navigate.to 'https://www.knotch-cdn.com/standalone/unit.html?id=9f8c92ce-b11f-411c-80f6-a59f6f877d8e'
  end

  describe 'when on the page' do
    it 'should render The Knotch Unit correctly' do
      unit = @driver.find_element(:id, 'knotchFullPage')
      expect(unit).to be_truthy
      expect(unit.displayed?).to be true
    end

    describe 'when in the iframe' do
      before(:each) do
        @driver.manage.delete_all_cookies
        @driver.navigate.refresh

        @driver.switch_to.frame @driver.find_element(:id, 'knotchframe_9f8c92ce-b11f-411c-80f6-a59f6f877d8e')
      end

      it 'should render 5 user response options' do
        @wait.until { @driver.find_elements(:class, 'answer')[0].displayed? }
        options = @driver.find_elements(:class, 'answer')
        expect(options.size).to be 5
        expect(options[0].text).to eql('Extremely Negative')
        expect(options[1].text).to eql('Negative')
        expect(options[2].text).to eql('Neutral')
        expect(options[3].text).to eql('Positive')
        expect(options[4].text).to eql('Extremely Positive')
      end

      it 'should display the correct messaging based on the user positive response' do
        tool_container = @driver.find_element(:class, 'tool')
        answer = @driver.find_elements(:class, 'answer')[3]

        @driver.action
               .move_to(tool_container)
               .move_to(answer)
               .click(answer)
               .perform

        @wait.until { @driver.find_element(:class, 'thanksMessage').displayed? }
        expect(@driver.find_element(:class, 'thanksMessage').text).to eql('Great ty!')
      end

      it 'should display the correct messaging based on the user negative response' do
        tool_container = @driver.find_element(:class, 'tool')
        answer = @driver.find_elements(:class, 'answer')[1]

        @driver.action
               .move_to(tool_container)
               .move_to(answer)
               .click(answer)
               .perform

        @wait.until { @driver.find_element(:class, 'thanksMessage').displayed? }
        expect(@driver.find_element(:class, 'thanksMessage').text).to eql('Maybe Try Doom!')
      end

      it 'should display the correct messaging based on the user extremely positive response' do
        tool_container = @driver.find_element(:class, 'tool')
        answer = @driver.find_elements(:class, 'answer')[4]

        @driver.action
               .move_to(tool_container)
               .move_to(answer)
               .click(answer)
               .perform

        @wait.until { @driver.find_element(:class, 'thanksMessage').displayed? }
        expect(@driver.find_element(:class, 'thanksMessage').text).to eql('Great ty!')
      end
    end
  end
end
