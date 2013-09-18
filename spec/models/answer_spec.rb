require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should belong_to :user }  
  it { should validate_presence_of :content }

  let(:answer) { Answer.new(content: "This shit is bananas") }
    it "should default to zero" do
     answer.rating.should eq 0
   end
end