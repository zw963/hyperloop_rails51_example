class BookList < Hyperloop::Component
  render(UL) do
    Book.all.each do |book|
      LI { book.title.to_s }
    end
  end
end
