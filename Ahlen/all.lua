-- Initialization function for this job file.
 
local jobs = T{ "ahlen_WAR", "ahlen_BLM", "ahlen_RDM", "ahlen_RNG", "ahlen_BLU", "ahlen_MoNK", "ahlen_NIN", "ahlen_RUN", "ahlen_SCH", "ahlen_SAM" }
 
mysets = {}
 
for k,v in pairs(jobs) do
    include(v .. '.lua')
    get_sets()
    mysets[v] = sets
    sets = {}
 end
 
 
function get_sets()
    for k,v in pairs(mysets) do sets[k] = v end
end