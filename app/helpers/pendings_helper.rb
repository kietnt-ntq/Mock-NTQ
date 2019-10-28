module PendingsHelper

    def pending_item
        @contents_pending = Content.where(group_id: @group.id, status: 2)
        @members_pending = Role.where(group_id: @group.id, status: 2)
        @pending_item = @contents_pending.size + @members_pending.size 
    end

    def role_permiss?
       
    end
end
