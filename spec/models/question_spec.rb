require 'spec_helper'

describe Question do
  it { should have_many :answers }
  it { should belong_to :user }  
  it { should validate_presence_of :content }

  let(:question) {  Question.new(content: "This shit is bananas") }
    it "should default to zero" do
     question.rating.should eq 0
   end
end