require("Vector3")
--local vector3 = Vector3()
--print('This is a:',type(Vector3))

loc = {3,6,9}
print('loc:',loc)
for i, dat in ipairs(loc) do
    print('test table:',dat)
end
test1 = {1,2,3}
print('test1:',test1)
test2 = {2,4,6}
print('test2:',test2)

superarray = {loc,test1,test2}
print(superarray[2][1])
