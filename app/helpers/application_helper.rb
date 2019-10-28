module ApplicationHelper

    def group
        @group ||= Group.new
    end
    
end
