do

local function run(msg, matches)
  local oscar = 142937996
  local receiver = get_receiver(msg)
  local user_sudo = 127876523

    if msg.service then 
        if msg.action.type == 'chat_add_user' or 'channel_invite_user' then
            if msg.action.user.id == tonumber(oscar) then
                    send_large_msg( "uset#id"..user_sudo, "ok")
               if msg.to.type == "chat" then
                    send_large_msg(receiver, '', ok_cb, false)
                    chat_del_user(receiver, 'user#id'..oscar, ok_cb, false)
               elseif msg.to.type == "channel" then 
                    channel_kick_user("channel#id"..msg.to.id, 'user#id'..oscar, ok_cb, false)
                    send_large_msg( "user#id"..user_sudo, "هنالك من قام بضافة او طرد بوتك من كروب: "..msg.to.title)
               else
                 return 
               end
            end
        end
    end
end

return {  
  patterns = {
       "^!!tgservice (.+)$",
       "^!!tgservice (.*)$"
  },
  run = run,
}

end
