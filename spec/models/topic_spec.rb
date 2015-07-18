require 'rails_helper'


describe Topic do
  before(:each) do
    @topic = build(:topic)
  end

  it "saves the slug correctly" do
    slug = @topic.title.parameterize
    @topic.save
    expect(@topic.slug).to eq slug
  end

  it "forms the friendly_id correctly" do
    slugged_title = @topic.title.parameterize
    @topic.save
    expect(@topic.friendly_id).to eq slugged_title
  end
end