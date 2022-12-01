require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "the avg should equal 0" do
    article = Article.new(title:"Test", body:"Titre d'un article test", status:"public")
    assert article.noteAvg == 0
  end

  test "the avg should be between 0 and 5" do
    article = Article.new(title:"test", body:"Titre d'un article test", status:"public")
    article.save
    note1 = article.notes.create(note:1)
    note2 = article.notes.create(note:2)
    note3 = article.notes.create(note:3)
    note4 = article.notes.create(note:5)
    assert (article.noteAvg > 0 && article.noteAvg <= 5)
  end
end
