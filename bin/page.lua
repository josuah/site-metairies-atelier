#!/command/lua

function dump(path)
  f = io.open(path) assert(f, 'could not open "'..path..'"')
  for l in f:lines() do print(l) end
  f:close()
end

function gallery_it(f)
  local list = {}
  local inside = false

  for line in f:lines() do
    if line == '' then
      if inside then break end
    else
      inside = true
      list[#list + 1] = line
    end
  end

  if #list > 0 then return list else return nil end
end

if #arg ~= 1 then
  print('usage: lua/gallery.lua gallery.txt')
  os.exit(1)
end

dump('t/head.html')

f = io.open(arg[1]) assert(f, 'could not open "'..arg[1]..'"')

for pack in gallery_it,f do
  print()

  if pack[1]:sub(1, 3) == '/i/' then

    if #pack == 1 then
      print('<img src="'..pack[1]..'">')

    else
      print('<article class="gallery">')
      for i in ipairs(pack) do print('<img src="'..pack[i]..'">') end
      print('</article>')
    end

  else
    for i in ipairs(pack) do dump("."..pack[i]) end
  end
end

dump('t/foot.html')
