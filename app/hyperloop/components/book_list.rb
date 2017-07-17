# 这个例子演示了如何在 Client 端直接访问 ActiveRecord 的 Model 类.

class BookList < Hyperloop::Component
  render(UL) do
    Book.all.each do |book|
      LI { book.title.to_s }
    end
  end
end
