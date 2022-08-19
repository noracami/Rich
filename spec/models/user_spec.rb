require 'rails_helper'

RSpec.describe User, type: :model do
  it "hi" do
    #Arrange
    a=1
    b=2
    #Act
    result = a+b
    #Assert
    expect(result).to be 3
  end
  # TODO test
  # pending "add some examples to (or delete) #{__FILE__}"
end
