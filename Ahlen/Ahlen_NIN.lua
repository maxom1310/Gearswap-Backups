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
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

end
	
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Hybrid','DT','Nyame','DWgear')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal','Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Danzo Sune-ate"
    
    select_movement_feet()
    select_default_macro_book()
end

function job_setup()
    state.Utsusemi = 3
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {body="Hattori ningi"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Kendatsuba samue +1"}
	
	sets.precast.JA['Lunge'] = {ammo="Pemphredo tathlum",
        head="Mochizuki hatsuburi +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Nyame Mail",hands="Hattori Tekko +1",ring1="Fenrir ring +1",ring2="Shiva ring +1",
        back="Toro Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Hachiya Kyahan +3"}
		
	sets.precast.JA['Swipe'] = {ammo="Pemphredo tathlum",
        head="Mochizuki hatsuburi +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Nyame Mail",hands="Hattori Tekko +1",ring1="Fenrir ring +1",ring2="Shiva ring +1",
        back="Toro Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Hachiya Kyahan +3"}	

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Felistris Mask",
        body="Kendatsuba samue +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
        back="Andartia's mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body="Taeon Tabard",
    hands="Leyline Gloves",
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
   feet={ name="Herculean Boots", augments={'Mag. Acc.+17','"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
    neck="Orunmila's Torque",
    waist="Audumbla Sash",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1", 	
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Andartia's Mantle", augments={'"Fast Cast"+10',}},
	}

    -- Snapshot for ranged
    sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="C. Palug Stone",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Hattori Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.-
	sets.precast.WS['Blade: Shun'] = {
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="C. Palug Stone",
    head="Ken. Jinpachi +1",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Kendatsuba Sune-ate +1",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Hattori Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.precast.WS['Blade: Chi'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	
	
	sets.precast.WS['Blade: Hi'] = {
    ammo="C. Palug Stone",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    Left_ear="Moonshade Earring",
	right_ear="Hattori Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
	sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']	
	sets.precast.WS['Blade: Jin'] = sets.precast.WS['Blade: Hi']
    sets.precast.WS['Vorpal blade'] = sets.precast.WS['Blade: Hi']	
	sets.precast.WS['Tachi: Jinpu'] = sets.precast.WS['Blade: Chi']	
		
	sets.precast.WS['Blade: Ten'] = {
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Crepuscular Pebble",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
	sets.precast.WS['Savage Blade'] = {
	    ammo="Crepuscular Pebble",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.precast.WS['Blade: Metsu'] = {
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="C. Palug Stone",
    head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','DEX+7','Attack+8',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Jokushu Haidate",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
	
    sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
		
	sets.precast.WS['Blade: Yu'] = sets.precast.WS['Aeolian Edge']		
	sets.precast.WS['Sanguine Blade'] = sets.precast.WS['Aeolian Edge']
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body="Adhemar Jacket +1",
    hands="Leyline Gloves",
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17','"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
    neck="Orunmila's Torque",
    waist="Audumbla sash",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Andartia's Mantle", augments={'"Fast Cast"+10',}},
	}
        
	sets.midcast.NinjutsuBuff = sets.midcast.FastRecast	
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {feet="Hattori Kyahan +2",})

    sets.midcast.ElementalNinjutsu = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

	sets.midcast['Kurayami: Ni'] = 	{
    ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Andartia's Mantle", augments={'"Fast Cast"+10',}},
	}
	
	sets.midcast['Kurayami: Ichi']= sets.midcast['Kurayami: Ni']
	sets.midcast['Hojo: Ichi']= sets.midcast['Kurayami: Ni']
	sets.midcast['Hojo: Ni']= sets.midcast['Kurayami: Ni']
	sets.midcast['Jubaku: Ichi']= sets.midcast['Kurayami: Ni']
	sets.midcast['Yurin: Ichi']= sets.midcast['Kurayami: Ni']
	sets.midcast['Aisha: Ichi']= sets.midcast['Kurayami: Ni']
	

    sets.midcast.Enmity = {
    ammo="Sapience Orb",
    head="Nyame Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    right_ring="Vengeful Ring",
    left_ring="Supershear Ring",
    back="Agema Cape",
	}
	
	sets.midcast.Flash = sets.midcast.Enmity
	sets.midcast['Gekka: Ichi'] = sets.midcast.Enmity
	sets.midcast['Sentinel'] = sets.midcast.Enmity
	sets.midcast['Holy Circle'] = sets.midcast.Enmity
	sets.midcast['Yonin'] = sets.midcast.Enmity
	
	
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ear="Etiolation Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
	}

    sets.Kiting = {left_ring="Shneddick Ring",}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {    
	ammo="Date Shuriken",
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Ken. Hakama +1",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','DEX+10','Attack+13',}},
    neck="Ninja Nodowa +2",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
		sets.engaged.Hybrid = {  --32
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Date Shuriken",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}	
		
	sets.engaged.DT = {  --6+9+5+9+4+3+10+5= 49
    main="Heishi Shorinken",
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
	ammo="Date Shuriken", 
    head="Malignance Chapeau",  --6
    body="Malignance Tabard", --9
    hands="Malignance Gloves",  --5 
    legs="Mpaca's Hose", --9
    feet="Malignance Boots",  --4
    neck="Ninja Nodowa +2",  
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Odnowa Earring +1", --3
    left_ring="Gere Ring",  
    right_ring="Defending Ring", --10
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}, --5
		}	
	    sets.engaged.Nyame = {
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Kanaria", augments={'"Triple Atk."+3','DEX+15','Accuracy+17','Attack+10','DMG:+8',}},
    ammo="Date Shuriken", 
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Ninja Nodowa +2",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}	
	 sets.engaged.DWgear = {
	    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}

    sets.buff.Migawari = {}
    sets.buff.Doom = {neck="Nicander's Necklace"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
	sets.buff['Sange'] = {}--ammo="Happo Shuriken"}
end

local utsusemi = {
    ["Utsusemi: Ichi"] = 1,
    ["Utsusemi: Ni"] = 2,
    ["Utsusemi: San"] = 3,
}

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


function job_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Utsusemi' then
        if state.Utsusemi > utsusemi[spell.name] then
            if buffactive['Copy Image'] then
                windower.ffxi.cancel_buff(66)
            elseif buffactive['Copy Image (2)'] then
                windower.ffxi.cancel_buff(444)
            elseif buffactive['Copy Image (3)'] then
                windower.ffxi.cancel_buff(445)
            elseif buffactive['Copy Image (4+)'] then
                windower.ffxi.cancel_buff(446)
            end
        end
    end
end
 
function job_aftercast(spell, action, spellMap, eventArgs)
    if (not spell.interrupted) and spellMap == 'Utsusemi' then
        state.Utsusemi = utsusemi[spell.name]
    end
end


function select_movement_feet()
    if world.time > 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Sange' then
            enable('ammo')
            equip(sets.buff['Sange'])
            disable('ammo')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
function job_buff_change(buff, gain)
    if buff == "Sange" and not gain then
        enable('ammo')
        handle_equipping_gear(player.status)
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 1)
	elseif player.sub_job == 'PLD' then
        set_macro_page(4, 1)	
    else
        set_macro_page(4, 1)
    end
end

