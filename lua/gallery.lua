#!/command/lua

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

f = io.open('html/head.html') for l in f:lines() do print(l) end f:close()

f = io.open(arg[1]) assert(f)

for pack in gallery_it,f do
  print()

  if #pack == 1 then
    print('<img src="/img/'..pack[1]..'">')

  else
    print('<article class="gallery">')
    for p in ipairs(pack) do print('<img src="/img/'..pack[1]..'">') end
    print('</article>')
  end
end

f = io.open('html/foot.html') for l in f:lines() do print(l) end f:close()
