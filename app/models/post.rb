class Post < ApplicationRecord
    validates :title, presence: true
    validates :summary, length: {maximum: 250}
    validates :content, length: {minimum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction) }
    # validates :title, inclusion: {in: "Won't Believe"}

    validate :is_not_click_bait

    private

    def is_not_click_bait
        # byebug
    if title

       bait = (title.include?( "Won't Believe" )) || (title.include? ("Secret")) || (title.include? ("Top [number]")) || (title.include? ("Guess")) 
        #   byebug
        unless bait
            errors.add :title, "must be click bait"
        end
    
    end

    end
    

end


# conditions = [ "Won't Believe","Secret", "Top", "Guess"  ]

# is_click_bait = false

# conditions.each do |e| 
#    if title.include? e
#      is_click_bait = true 
#    end