module UsersHelper

    def to_slug string
        string.parameterize.truncate 80, omission: ""
      end
      
end



