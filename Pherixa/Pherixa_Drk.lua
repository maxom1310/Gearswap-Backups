-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Rag', 'RagAcc', 'RagHighAcc', 'Apoc', 'ApocAcc', 'ApocHighAcc', 'NoStpTrait', 'DW')
    state.HybridMode:options ('Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
     
    select_default_macro_book()
 
     
 
end
 
    -- Define sets and vars used by this job file.
    function init_gear_sets()
            --------------------------------------
            -- Start defining the sets
            --------------------------------------
            -- Precast Sets
            sets.WSDayBonus = {}
 
            -- Precast sets to enhance JAs
            sets.precast.JA['Diabolic Eye'] = {hands="Fallen's finger gauntlets +1"}
            sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +1"}
            sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
            sets.precast.JA['Souleater'] = {head="Ignominy Burgeonet +1"}
            sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +1"}
            sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",feet="Abyss Sollerets"}
            sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet"}
            sets.precast.JA['Blood Weapon'] = {head="Fallen's Cuirass"}
 
             
           -- Waltz set (chr and vit)
    sets.precast.Waltz = {}        
            
            -- Fast cast sets for spells
                      
            -- Precast Sets
    sets.precast.FC = {}
                    
            -- Specific spells
    sets.midcast.Utsusemi = {}
      
    sets.midcast.DarkMagic = {}
             
    sets.midcast.Endark = {}
             
    sets.midcast['Endark II'] = sets.midcast.Endark
            
    sets.midcast['Dread Spikes'] = {}
             
    sets.midcast['Elemental Magic'] = {}
             
    sets.midcast['Enfeebling Magic'] = {}
            
    sets.midcast.Stun = {}
             
    sets.midcast.Absorb = {}
                    
    sets.midcast.Drain = {}
                    
    sets.midcast['Aspir'] = {}
                 
    sets.midcast['Aspir II'] = {}
             
 
    sets.midcast['Drain II'] = {}
             
    sets.midcast['Drain III'] = {}
 
                                            
            -- Weaponskill sets
            -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Weapon skill damage +2%',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},

	}
 
 
            -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Catastrophe'] = {    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Weapon skill damage +2%',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Catastrophe'].Acc = {}
                     
    sets.precast.WS['Sanguine Blade'] = {}
      
    sets.precast.WS['Torcleaver'] = {    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Weapon skill damage +2%',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Torcleaver'].Acc = {}
 
    sets.precast.WS['Scourge'] = {}
 
    sets.precast.WS['Scourge'].Acc = {}
 
    sets.precast.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	    sets.precast.WS['Fimbulvetr'] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
             
    sets.precast.WS['Requiescat'] = {}
             
    sets.precast.WS['Cross Reaper'] = {    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Weapon skill damage +2%',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Cross Reaper'].Acc = {}
                     
    sets.precast.WS['Quietus'] = {}
                     
    sets.precast.WS['Quietus'].Acc = {}
                     
    sets.precast.WS['Entropy'] = {}
 
                     
    sets.precast.WS['Entropy'].Acc = {}
 
    sets.precast.WS['Insurgency'] = {}
 
                     
    sets.precast.WS['Insurgency'].Acc = {}
                     
    sets.precast.WS['Resolution'] = {
	    main={ name="Montante +1", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
                     
    sets.precast.WS['Resolution'].Acc = {}
                                
            -- Sets to return to when not performing an action.
            
            -- Resting sets
    sets.resting = {}
            
      
            -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
 
            -- Defense sets
    sets.defense.PDT = {}
      
    sets.defense.Reraise = {}
      
    sets.defense.MDT = {}
      
      
      
            -- Engaged sets
             
    sets.engaged.Rag = {
    ammo="Coiste Bodhar",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
             
    sets.engaged.RagAcc = {}
             
    sets.engaged.RagHighAcc = {}
     
    sets.engaged.NoStpTrait = {}    
     
    sets.engaged.Apoc = {}
     
    sets.engaged.ApocAcc = {}
             
    sets.engaged.ApocHighAcc = {}       
             
    sets.engaged.DW = {}
     
     
    end
     
function precast(spell,abil)
    --equips favorite weapon if disarmed
    if player.equipment.main == "empty" or player.equipment.sub == "empty" then
        equip({main="Ragnarok",
        sub="Nepenthe Grip +1"})
    end
end
 
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end
------------------------------------------------------------------------------
function job_post_midcast(spell, action, spellMap, eventArgs)
    if (skillchain_elements[spell.skillchain_a]:contains(world.day_element) or skillchain_elements[spell.skillchain_b]:contains(world.day_element) or skillchain_elements[spell.skillchain_c]:contains(world.day_element))
        then 
    end
end 
 
 
function job_post_midcast(spell, action, spellMap, eventArgs)
    if S{"Drain","Drain II","Drain III"}:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
        equip({waist="Hachirin-no-obi"})
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
    if buff:lower()=='sleep' then
        if gain and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
            equip({neck="Vim Torque +1"})
        elseif not gain then -- Take Berserker's off
            handle_equipping_gear(player.status)
        end
    end
end
 
function customize_melee_set(meleeSet)
    if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{neck="Vim Torque +1"})
    end
    return meleeSet
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end