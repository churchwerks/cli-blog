require 'spec_helper'

RSpec.describe Post do

  context 'attributes' do
    it 'defines id, title, and body' do
      post = Post.new

      expect(post).to respond_to(:id)
      expect(post).to respond_to(:id=)
      expect(post).to respond_to(:title)
      expect(post).to respond_to(:title=)
      expect(post).to respond_to(:body)
      expect(post).to respond_to(:body=)

      post.id = 1
      expect(post.id).to eq(1)
      post.title = "The Title of the Post"
      expect(post.title).to eq("The Title of the Post")
      post.body = "The Body of the Post"
      expect(post.body).to eq("The Body of the Post")
    end
  end

  context 'persistance' do
    context '.all' do
      it 'returns an array' do
        expect(Post.all).to be_a(Array)
      end
    end

    context '#save' do
      it 'persists the post' do
        post = Post.new
        post.save

        expect(Post.all).to include(post)
      end
    end
  end

  context 'finders' do
    context '.find_by_id' do
      it 'returns the post by id' do
        post = Post.new
        post.save

        expect(Post.find_by_id(post.id)).to eq(post)
      end
    end
  end
end 
