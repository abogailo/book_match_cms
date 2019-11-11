module BooksHelper

    def favorite_matches?(r)
        if !current_user.favorited_books.empty?
           current_user.favorited_books.include? r
        end
    end

    def match_count(array)
        

        return count
    end
end
