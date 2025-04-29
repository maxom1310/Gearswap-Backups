-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    -- List of pet weaponskills to check for
    petWeaponskills = S{"Slapstick", "Knockout", "Magic Mortar",
        "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
        "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}
    
    -- Map automaton heads to combat roles
    petModes = {
        ['Harlequin Head'] = 'Melee',
        ['Sharpshot Head'] = 'Ranged',
        ['Valoredge Head'] = 'Tank',
        ['Stormwaker Head'] = 'Magic',
        ['Soulsoother Head'] = 'Heal',
        ['Spiritreaver Head'] = 'Nuke'
        }

    -- Subset of modes that use magic
    magicPetModes = S{'Nuke','Heal','Magic'}
    
    -- Var to track the current pet mode.
    state.PetMode = M{['description']='Pet Mode', 'None', 'Melee', 'Ranged', 'Tank', 'Magic', 'Heal', 'Nuke'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Fodder')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    -- Default maneuvers 1, 2, 3 and 4 for each pet mode.
    defaultManeuvers = {
        ['Melee'] = {'Fire Maneuver', 'Thunder Maneuver', 'Wind Maneuver', 'Light Maneuver'},
        ['Ranged'] = {'Wind Maneuver', 'Fire Maneuver', 'Thunder Maneuver', 'Light Maneuver'},
        ['Tank'] = {'Earth Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Wind Maneuver'},
        ['Magic'] = {'Ice Maneuver', 'Light Maneuver', 'Dark Maneuver', 'Earth Maneuver'},
        ['Heal'] = {'Light Maneuver', 'Dark Maneuver', 'Water Maneuver', 'Earth Maneuver'},
        ['Nuke'] = {'Ice Maneuver', 'Dark Maneuver', 'Light Maneuver', 'Earth Maneuver'}
    }

    update_pet_mode()
    select_default_macro_book()
end


-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ear2="Etiolation Earring"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}
    
    sets.precast.JA['Repair'] = {ammo="Can of automaton oil +3", ear1="Pratik earring"}

    sets.precast.JA.Maneuver = {neck="Buffoon's Collar",body="Karagoz Farsetto +1",hands="Foire Dastanas +1",back="Visucius's mantle"}
	
	sets.precast.JA['Steal'] = {waist="Chaac belt",ring1="Gorney Ring"}
	sets.precast.JA['Mug'] = {waist="Chaac belt",ring1="Gorney Ring"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Whirlpool Mask",ear1="Roundel Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",legs="Nahtirah Trousers",feet="Thurandaut Boots +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Dignitary's Earring",
        body="Manibozho Jerkin",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Dispersal Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Spiral Ring",waist="Fotia Belt"})
    sets.precast.WS['Stringing Pummel'].Mod = set_combine(sets.precast.WS['Stringing Pummel'], {legs="Nahtirah Trousers"})

    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",
        waist="Fotia Belt"})

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})

    
    -- Midcast Sets

    sets.midcast.FastRecast = {}
        

    -- Midcast sets for pet actions
	sets.midcast['Dia'] = {}
	
    sets.midcast.Pet.Cure = {}

    sets.midcast.Pet['Elemental Magic'] = {}

    sets.midcast.Pet.WeaponSkill = {}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Pitre Taj",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets

    sets.idle = {
	head="Anwig Salade",
	neck="Elite Royal Collar",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	right_ring="Shneddick Ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}

    sets.idle.Town = set_combine(sets.idle, {main="Tinhaspa"})

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = sets.idle

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
	head="Anwig Salade",
	neck="Shepherd's Chain",
	ear1="Rimeice earring",
	  right_ear="Enmerkar Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	right_ring="Shneddick Ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {hands="Cirque Guanti +2",legs="Cirque Pantaloni +2"})

    sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {legs="Cirque Pantaloni +2",feet="Cirque Scarpe +2"})

    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {legs="Cirque Pantaloni +2",feet="Cirque Scarpe +2"})


    -- Defense sets

    sets.defense.Evasion = {
	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	right_ring="Shneddick Ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}

    sets.defense.PDT = {
	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	right_ring="Shneddick Ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}

    sets.defense.MDT = {
	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	right_ring="Shneddick Ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}

    sets.Kiting = {right_ring="Shneddick Ring",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	  right_ear="Enmerkar Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	ring2="Overbearing ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}
    sets.engaged.Acc ={	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	  right_ear="Enmerkar Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	ring2="Overbearing ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}
    sets.engaged.DT = {	head="Anwig Salade",
	neck="Empath Necklace",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
    body="Rao Togi +1",
	hands="Rao Kote +1",
	ring1="Thurandaut Ring",
	ring2="Overbearing ring",
    back="Visucius's mantle",
	waist="Isa belt",
	legs="Rao Haidate +1",
	feet="Rao sune-ate +1"}
    sets.engaged.Acc.DT = {
	head="Anwig Salade",
	neck="Shepherd's Chain",
	ear1="Rimeice earring",
	ear2="Domesticator's Earring",
     body="Karagoz Farsetto +1",hands="Rao Kote +1",ring1="Gorney Ring",ring2="Dark Ring",
        back="Visucius's mantle",waist="Chaac belt",legs="Rao Haidate +1",feet="Rao sune-ate"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when pet is about to perform an action
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if petWeaponskills:contains(spell.english) then
        classes.CustomClass = "Weaponskill"
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == 'Wind Maneuver' then
        handle_equipping_gear(player.status)
    end
end

-- Called when a player gains or loses a pet.
-- pet == pet gained or lost
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(pet, gain)
    update_pet_mode()
end

-- Called when the pet's status changes.
function job_pet_status_change(newStatus, oldStatus)
    if newStatus == 'Engaged' then
        display_pet_status()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_pet_mode()
end


-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_pet_status()
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'maneuver' then
        if pet.isvalid then
            local man = defaultManeuvers[state.PetMode.value]
            if man and tonumber(cmdParams[2]) then
                man = man[tonumber(cmdParams[2])]
            end

            if man then
                send_command('input /pet "'..man..'" <me>')
            end
        else
            add_to_chat(123,'No valid pet.')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Get the pet mode value based on the equipped head of the automaton.
-- Returns nil if pet is not valid.
function get_pet_mode()
    if pet.isvalid then
        return petModes[pet.head] or 'None'
    else
        return 'None'
    end
end

-- Update state.PetMode, as well as functions that use it for set determination.
function update_pet_mode()
    state.PetMode:set(get_pet_mode())
    update_custom_groups()
end

-- Update custom groups based on the current pet.
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end

-- Display current pet status.
function display_pet_status()
    if pet.isvalid then
        local petInfoString = pet.name..' ['..pet.head..']: '..tostring(pet.status)..'  TP='..tostring(pet.tp)..'  HP%='..tostring(pet.hpp)
        
        if magicPetModes:contains(state.PetMode.value) then
            petInfoString = petInfoString..'  MP%='..tostring(pet.mpp)
        end
        
        add_to_chat(122,petInfoString)
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WHM' then
        set_macro_page(7, 1)
    elseif player.sub_job == 'COR' then
        set_macro_page(7, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(7, 1)
    else
        set_macro_page(7, 1)
    end
end


