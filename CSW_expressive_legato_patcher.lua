--[[
Cinematic Studio Woodwinds (CSW) Expressive Legato Patcher
CSW_expressive_legato_patcher.lua
Copyright (c) 2022 3YY3, MIT License
Not affiliated with Cinematic Studio Series in any way.
]]--

legato_slow = 220
legato_medium = 130
legato_fast = 90

function takeError()
  reaper.ShowMessageBox("Please, open some MIDI item in editor first.", "Error", 0)
end

function patchLegato()
  item = reaper.GetMediaItem(0, 0)
  position = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
  offset = reaper.GetMediaItemTakeInfo_Value(take, 'D_STARTOFFS')
  qn = reaper.TimeMap2_timeToQN(nil, position - offset)
  ppq = reaper.MIDI_GetPPQPosFromProjQN(take, qn + 1)
  take_name = reaper.GetTakeName(take)
  bpm, bpi = reaper.GetProjectTimeSignature2()
  totalcnt, notecnt, cccnt = reaper.MIDI_CountEvts(take);
  sel_mode = false
  
  if string.match(take_name, " #LEG") then
    reaper.ShowMessageBox("This take has already been patched for legato!", "Error", 0)
  else
    local ticktime = 60000 / (bpm * ppq)
    for i=notecnt, 0, -1 do
      local all, sel, muted, nstart, nend, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
      if sel ~= false then
        sel_mode = true
      end
    end
    for i=notecnt, 0, -1 do
      local all, sel, muted, nstart, nend, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
      if sel_mode == true and sel == false then
        goto continue
      elseif vel >= 0 and vel <= 64 then
        local diff = legato_slow / ticktime
        math.floor(diff)
        reaper.MIDI_SetNote(take, i, false, false, nstart - diff)
      elseif vel >= 65 and vel <= 100 then
        local diff = legato_medium / ticktime
        math.floor(diff)
        reaper.MIDI_SetNote(take, i, false, false, nstart - diff)
      elseif vel >= 101 and vel <= 127 then
        local diff = legato_fast / ticktime
        math.floor(diff)
        reaper.MIDI_SetNote(take, i, false, false, nstart - diff)
      end
      ::continue::
    end
    reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", take_name .. " #LEG_W(" .. string.format("%d", bpm) .. " BPM)", true)
    drawInfo()
  end
  reaper.UpdateArrange()
end

function drawInfo()
  if sel_mode == true then
    sel_mode = "ONLY SELECTED"
    else sel_mode = "ALL"
  end
  reaper.ShowMessageBox("Take '" .. take_name .. "' was patched for CSW Expressive legato.\n\n" .. sel_mode .. " notes in the take were affected using following parameters:\nBPM: " .. string.format("%d", bpm) .. "\nPPQ: " .. string.format("%d", ppq) .. "\n\nDo not forget to rearrange each first note.", "Information", 0)
end

function Main()
  take = reaper.MIDIEditor_GetTake(reaper.MIDIEditor_GetActive())
  if take then
    patchLegato()
    else takeError()
  end
end

Main()
