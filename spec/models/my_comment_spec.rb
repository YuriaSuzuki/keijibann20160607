require 'rails_helper'

describe MyComment do
  it "is valid with a title" do
    my_comment = MyComment.new(
     id: 1,
     title: "comment"
    )
    expect(my_comment).to be_valid
  end

  it "is invalid without a title" do
    my_comment = MyComment.new(title: nil)
    my_comment.valid?
    expect(my_comment.errors[:title]).to include("can't be blank")
    #expect{raise MyComment.new(title: nil)}.to raise_error(TypeError)
  end
end
