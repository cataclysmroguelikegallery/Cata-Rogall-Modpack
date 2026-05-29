gdebug.log_info("transformers: main")

local mod = game.mod_runtime[game.current_mod]

function deactivate (monster, id, position)
  gapi.add_msg(string.format("deactivating"))
  local deactivated_id = id:gsub("mon", "bot")
  local detached = gapi.create_item(ItypeId.new(deactivated_id), 1)
  monster:erase()
  gapi.get_map():add_item(position, detached)
end

game.add_hook("on_try_monster_interaction", function(params)
  --gdebug.log_info("on_try_monster_interaction")
  local monster = params.monster
  local id = params.monster:get_type():str()
  if 
    id ~= "mon_sq_mech_light" and
    id ~= "mon_sq_mech_balance" and
    id ~= "mon_sq_mech_heavy" and
    id ~= "mon_sq_mech_light_2" and
    id ~= "mon_sq_mech_balance_2" and
    id ~= "mon_sq_mech_heavy_2" then
      return 0
  end
  local avatar = gapi.get_avatar()
  if avatar:get_movement_mode() ~= 2 then return 0 end
  local position = params.monster:get_pos_ms()
  if 
    id == "mon_sq_mech_light" or
    id == "mon_sq_mech_balance" or
    id == "mon_sq_mech_heavy" then
    --gapi.add_msg(string.format("this is rideable version of a mech"))
    --local id_without_mod = id:gsub("_rideable", "")
    local main_menu = UiList.new()
    main_menu:add(1, locale.gettext("Cancel"))
    main_menu:add(2, locale.gettext("Convert to standalone"))
    main_menu:add(3, locale.gettext("Deactivate"))
    local main_choice = main_menu:query()
    --gapi.add_msg(string.format("main_choice: "..main_choice))
    if main_choice < 2 then
      gapi.add_msg(string.format("cancelled"))
      return false
    elseif main_choice == 2 then
      gapi.add_msg(string.format("converting to standalone"))
      monster:erase()
      local monster_to_spawn = id.."_2"
      --gapi.add_msg(string.format("monster id to spawn: "..monster_to_spawn))
      local new_monster = gapi.place_monster_at(MonsterTypeId.new(monster_to_spawn), position)
      new_monster:make_pet()
      return false
    elseif main_choice == 3 then
      deactivate(monster, id, position)
      return false
    end
  end
  if
    id == "mon_sq_mech_light_2" or
    id == "mon_sq_mech_balance_2" or
    id == "mon_sq_mech_heavy_2" then
    --gapi.add_msg(string.format("this is standalone version of a mech"))
    --local id_without_mod = id:gsub("_standalone", "")
    local main_menu = UiList.new()
    main_menu:add(1, locale.gettext("Cancel"))
    main_menu:add(2, locale.gettext("Convert to rideable"))
    main_menu:add(3, locale.gettext("Deactivate"))
    local main_choice = main_menu:query()
    --gapi.add_msg(string.format("main_choice: "..main_choice))
    if main_choice < 2 then
      gapi.add_msg(string.format("cancelled"))
      return false
    elseif main_choice == 2 then
      gapi.add_msg(string.format("converting to rideable"))
      monster:erase()
      local monster_to_spawn = id:gsub("_2", "")
      --gapi.add_msg(string.format("monster id to spawn: "..monster_to_spawn))
      local new_monster = gapi.place_monster_at(MonsterTypeId.new(monster_to_spawn), position)
      new_monster:make_pet()
      return false
    elseif main_choice == 3 then
      deactivate(monster, id, position)
      return false
    end
  end    
end)