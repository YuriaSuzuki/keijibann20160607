require 'rails_helper'

describe OurThread do

  it "has a valid factory" do
    expect(build(:our_thread)).to be_valid
  end

  it "is invalid without a title" do
    our_thread = build(:our_thread, title: nil)
    our_thread.valid?
    expect(our_thread.errors[:title]).to include("can't be blank")
    #expect{raise OurThread.new(title: nil)}.to raise_error(TypeError)
  end

  it "is invalid without a created_at" do
    expect{raise OurThread.new(created_at: nil)}.to raise_error(TypeError)
  end

  it "is invalid without an updated_at" do
    expect{raise OurThread.new(updated_at: nil)}.to raise_error(TypeError)
  end

  it "is invalid without an user_id" do
    expect{raise OurThread.new(user_id: nil)}.to raise_error(TypeError)
  end
end
