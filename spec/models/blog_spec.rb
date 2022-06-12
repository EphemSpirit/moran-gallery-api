require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "blog createion" do
    context "when admin" do
      it "creates and saves  a blog record" do
        user = create(:user, :admin)
        blog_content = "this is a test post"
        expect{ Blog.create(content: blog_content, user_id: user.id) }.to change(Blog, :count).by 1
      end
    end

    context "when not admin" do
      it "does not create a record" do
        user = create(:user, :customer)
        blog_content = "this post shouldn't save"
        expect{ Blog.create(content: blog_content, user_id: user.id) }.to change(Blog, :count).by 0
      end
    end
  end
end
