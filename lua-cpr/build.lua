print("Building cpr-lua")

if io.open("/usr/local/include/cpr/cpr.h") ~= nil then
    print("Found CPR.h, network enabled!")
    os.execute("make use_net=yes")
end