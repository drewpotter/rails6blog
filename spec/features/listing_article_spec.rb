require "rails_helper"

RSpec.feature "List Articles" do
  before do
    @article1 = Article.create(title: "The first article", body: "Lorem ipsum")
    @article2 = Article.create(title: "The second article", body: "Body of second article")
  end

  scenario "A user lists all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "A user has no articles" do
    Article.delete_all

    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)
    within("h1#article__noarticles") do
    expect(page).to have_content("No articles created")
    end
  end
end
