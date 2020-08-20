require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it "nameの値が空の場合、エラーを返すこと" do
      user = User.new(name: "", email: "test@example.com")
      expect(user.valid?).to eq(false)
    end

    it "emailの値が空の場合、エラーを返すこと" do
      user = User.new(name: "TestUser", email: "")
      expect(user.valid?).to eq(false)
    end
  end
end
