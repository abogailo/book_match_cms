module BooksHelper
    #class methods
    def favorite_matches?(book)
        if !current_user.favorited_books.empty?
           current_user.favorited_books.include? book
        end
    end

    def match_count(array)
        intersection = (array & current_user.favorited_books)
        count = intersection.length
        return count
    end

    def suggest_count?(count)
        if count >= 1
            return true
        end
    end
end
