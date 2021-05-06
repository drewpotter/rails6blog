require "rails_helper"

RSpec.feature "Show an article" do

  before do
    @article = Article.create(title: "Show an article", body: "Lorem ipsum")
  end

  scenario "A user shows an article" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
