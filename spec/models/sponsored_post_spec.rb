require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:my_topic) { create(:topic) }
  let(:sponsored_post) { create(:post, my_topic)}

  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(sponsored_post).to have_attributes(title: title, body: body)
    end
  end
end