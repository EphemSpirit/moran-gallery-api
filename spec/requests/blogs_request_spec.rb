require 'rails_helper'

RSpec.describe :Blogs, type: :request do
    describe "GET /api/v1/blogs" do
        it "returns all blogs" do
            user = create(:user, :admin)
            4.times do
                Blog.create(content: "test", user_id: user.id)
            end
            get '/api/v1/blogs'
            json = JSON.parse(response.body)
            expect(json.length).to eq 4
        end
    end

    describe "POST /api/v1/blogs" do
        context "when admin user" do
            it "creates a new blog" do
                user = create(:user, :admin)
                sign_in user 
                params = {
                    blog: {
                        content: "This is a test",
                        user_id: user.id
                    }
                }
                post '/api/v1/blogs', params: params
                json = JSON.parse(response.body)
                expect(response).to have_http_status(200)
            end
        end

        context "when not admin" do
            it "does not post the blog" do
                user = create(:user, :customer)
                sign_in user
                params = {
                    blog: {
                        content: "this shouldn't post",
                        user_id: user.id
                    }
                }
                post '/api/v1/blogs', params: params
                expect(response).to have_http_status(422)
            end
        end
    end

    describe "PUT /api/v1/blogs/:id" do
        context "when admin" do
            it "updates the blog" do
                user = create(:user, :admin)
                blog = create(:blog, :with_admin)
                sign_in user
                new_text = "this is changed"
                put "/api/v1/blogs/#{blog.id}", params: { blog: { content: new_text } }
                expect(response).to have_http_status(200)
            end
        end

        context "when customer user" do
            it "does not do anything" do
                user = create(:user, :customer)
                blog = create(:blog, :with_admin)
                sign_in user
                new_text = "I shouldn't be allowed to do this"
                put "/api/v1/blogs/#{blog.id}", params: { blog: { content: new_text } }
                expect(response).to have_http_status(422)
            end
        end
    end

    describe "DELETE /api/v1/blogs/:id" do
        context "when admin" do
            it "deletes the record" do
                user = create(:user, :admin)
                blog = create(:blog, :with_admin)
                sign_in user 
                delete "/api/v1/blogs/#{blog.id}"
                expect(response).to have_http_status(200)
            end            
        end

        context "when not admin" do
            it "does not delete the record" do
                user = create(:user, :customer)
                blog = create(:blog, :with_admin)
                sign_in user 
                delete "/api/v1/blogs/#{blog.id}"
                expect(response).to have_http_status(422)
            end
        end
    end
end
