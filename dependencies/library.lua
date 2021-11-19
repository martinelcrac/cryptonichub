--[[

  These are global functions used in the script, mainly, these contain functions from various exploits to make sure it is fully working on most paid exploits.
  If your exploit has a different function, create an issue so we can update it. 

]]
local githubUsername = "martinelcrac"
local gitRepName = "cryptonichub"
local dependenciesFolderName = "dependencies"
local libraryFileName = "library"


local githubRep = {
    Profile = "https://github.com/" .. githubUsername,
    Repository = githubRep["Profile"] .. "/" .. gitRepName,
    Main = githubRep["Repository"] .. "/tree/main",
    Dependencies = githubRep["Main"] .. "/" .. dependenciesFolderName,
    Lib = githubRep["Dependencies"] .. "/" .. libraryFileName .. ".lua"
}
local globalMethods = {
    checkCaller = checkcaller,
    newCClosure = newcclosure,
    hookFunction = hookfunction,
    getGc = getgc,
    getInfo = debug.getinfo or getinfo,
    getSenv = getsenv,
    getMenv = getmenv or getsenv,
    getScriptClosure = get_script_function or getscriptclosure,
    getNamecallMethod = getnamecallmethod,
    getCallingScript = getcallingscript,
    getLoadedModules = getloadedmodules or get_loaded_modules,
    getConstants = debug.getconstants or getconstants or getconsts,
    getUpvalues = debug.getupvalues or getupvalues or getupvals,
    getProtos = debug.getprotos or getprotos,
    getStack = debug.getstack or getstack,
    getConstant = debug.getconstant or getconstant or getconst,
    getUpvalue = debug.getupvalue or getupvalue or getupval,
    getProto = debug.getproto or getproto,
    getMetatable = getrawmetatable or debug.getmetatable,
    setClipboard = setclipboard or writeclipboard,
    setConstant = debug.setconstant or setconstant or setconst,
    setUpvalue = debug.setupvalue or setupvalue or setupval,
    setStack = debug.setstack or setstack,
    setReadOnly = setreadonly,
    isLClosure = islclosure or (iscclosure and function(closure) return not iscclosure(closure) end),
    isReadOnly = isreadonly,
    isXClosure = is_synapse_function or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or checkclosure
}

