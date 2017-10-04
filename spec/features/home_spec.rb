require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end
    #click_button 'CONVERTER'
 
    puts find_field('result').value
    save_and_open_page
    expect(page).to have_content(find_field('result').value)
  end
end