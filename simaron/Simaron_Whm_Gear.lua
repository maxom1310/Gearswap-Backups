-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons','Misery')


		-- Additional local binds


    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {}
	sets.weapons.DualWeapons = {}
	sets.weapons.Misery = {main="Asclepius",sub="Genmei Shield"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {    ammo="Incantor Stone",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+7','MND+8','"Mag.Atk.Bns."+7',}},
    legs="Volte Brais",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +3"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
	sets.precast.JA.Devotion = {head="Piety Cap +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		
		body="Piety Bliaut +3",hands="Telchine Gloves",
		waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Epaminondas's Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
    sets.precast.WS.Dagan = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Epaminondas's Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {right_ring="Shneddick Ring",}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg",legs={ name="Chironic Hose", augments={'INT+2','MND+1','"Treasure Hunter"+2',}},waist="Chaac Belt",})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Vanya Slops",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
    neck="Elite Royal Collar",
    waist="Austerity Belt",
    left_ear="Gwati Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Kishar Ring",
    right_ring="Defending Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
    sets.midcast.FastRecast = {      ammo="Incantor Stone",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Zendik Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
    -- Cure sets

	sets.midcast['Full Cure'] = {    main={ name="Asclepius", augments={'Path: C',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Glorious Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.midcast['Arise'] = {    main={ name="Asclepius", augments={'Path: C',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Zendik Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
		sets.midcast['Raise III'] = {    main={ name="Asclepius", augments={'Path: C',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Zendik Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
			sets.midcast['Raise II'] = {    main={ name="Asclepius", augments={'Path: C',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Zendik Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
			sets.midcast['Raise'] = {    main={ name="Asclepius", augments={'Path: C',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Zendik Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	
	
	sets.midcast.Cure = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.CureSolace = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightWeatherCure = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightWeatherCureSolace = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightDayCureSolace = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightDayCure = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Curaga = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightWeatherCuraga = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightDayCuraga = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Cure.DT = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
     right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Glorious Earring",
    right_ear="Ebers Earring +1", 
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {    main={ name="Yagrush", augments={'DMG:+4',}},
    sub="Genmei Shield",
    ammo="Hasty Pinion +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +3",
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Th. Pant. +3",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Debilis Medallion",
    waist="Cornelia's Belt",
    left_ear="Meili Earring",
    right_ear="Ebers Earring +1",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.StatusRemoval = {    main={ name="Yagrush", augments={'DMG:+4',}},
    sub="Genmei Shield",
    ammo="Hasty Pinion +1",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck={ name="Clr. Torque +2", augments={'Path: A',}},})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {    main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','DMG:+2',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back="Perimede Cape",}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +3"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",head="Chironic Hat",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {body="Piety Bliaut +3", hands="Ebers Mitts +3",legs="Th. Pant. +3",})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = {main="Beneficus",
	    sub="Ammurapi Shield",
    ammo="Hasty Pinion +1",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Crepuscular Cloak",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		legs="Chironic Hose",}
		
	sets.midcast['Elemental Magic'] = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Elemental Magic'].Resistant = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
   waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Luminohelix'] = {
	   main="Daybreak",
    sub="Culminus",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
	
	sets.midcast['Divine Magic'] = {main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Holy = {main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Dark Magic'] = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

    sets.midcast.Drain = {    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+29','Accuracy+1 Attack+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Ebers Earring +1",
    left_ring="Evanescence Ring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

    sets.midcast.Drain.Resistant = {    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+29','Accuracy+1 Attack+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Ebers Earring +1",
    left_ring="Evanescence Ring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Hasty Pinion +1",
    head="Ebers Cap +3",
    body="Inyanga Jubbah +2",
    hands="Ebers Mitts +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+27','Pet: Accuracy+5 Pet: Rng. Acc.+5','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast.Stun.Resistant = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Hasty Pinion +1",
    head="Ebers Cap +3",
    body="Inyanga Jubbah +2",
    hands="Ebers Mitts +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+27','Pet: Accuracy+5 Pet: Rng. Acc.+5','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Dispel = {    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Inyanga Jubbah +2",
    hands="Ebers Mitts +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+27','Pet: Accuracy+5 Pet: Rng. Acc.+5','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Ebers Earring +1",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    left_ring="Kishar Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+29','Accuracy+1 Attack+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Ebers Earring +1",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    left_ring="Kishar Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+29','Accuracy+1 Attack+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Ebers Earring +1",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 3"},
    left_ring="Kishar Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.PDT = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.MDT = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.Weak = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    -- Defense sets

	sets.defense.PDT = {  main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MDT = {   main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.defense.MEVA = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {  
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.engaged.Acc = {      ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.engaged.DW = {      ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.engaged.DW.Acc = {       ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Elite Royal Collar",
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +3",back="Mending Cape"}

	sets.HPDown = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Pixie Hairpin +1",
    body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Mimir Earring",
    right_ear="Meili Earring",
    left_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.HPCure = {main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Nourish. Earring",
    right_ear="Nourish. Earring +1",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Naji's Loop",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.Phalanx_Received = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'"Fast Cast"+5','Pet: CHR+8','Phalanx +2','Accuracy+12 Attack+12',}},
    body={ name="Chironic Doublet", augments={'Attack+29','Pet: "Regen"+1','Phalanx +3',}},
    hands={ name="Chironic Gloves", augments={'Pet: Mag. Acc.+3','STR+3','Phalanx +4',}},
    legs={ name="Chironic Hose", augments={'"Fast Cast"+3','CHR+5','Phalanx +5','Accuracy+5 Attack+5',}},
    feet={ name="Chironic Slippers", augments={'INT+8','Rng.Atk.+4','Phalanx +5','Accuracy+7 Attack+7',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Regal Earring",
    right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {main="Lorg Mor"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(6, 1)
end
function user_job_lockstyle()
if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 020')
			else
				windower.chat.input('/lockstyleset 020') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 020')
			else
				windower.chat.input('/lockstyleset 020') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 020')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 020')
			else
				windower.chat.input('/lockstyleset 020') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 020')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 020')
	else
		windower.chat.input('/lockstyleset 020')
	end
end