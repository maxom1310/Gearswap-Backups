-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')


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
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {      ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Zendik Robe",
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+22','"Fast Cast"+7',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+5','"Fast Cast"+7','"Mag.Atk.Bns."+6',}},
    feet={ name="Chironic Slippers", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','CHR+5',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +3"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
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
    left_ring="Gurebu's Ring",
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
    left_ring="Gurebu's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {}
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
	
	sets.ConserveMP = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Nyame Mail",
    hands={ name="Fanatic Gloves", augments={'MP+25','Healing magic skill +2','"Conserve MP"+2',}},
    legs="Ebers Pant. +3",
    feet="Hygieia Clogs",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Calamitous Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back="Thauma. Cape",}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
    sets.midcast.FastRecast = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','CHR+5',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.CureSolace = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightWeatherCure = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightWeatherCureSolace = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightDayCureSolace = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.LightDayCure = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Curaga = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightWeatherCuraga = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.LightDayCuraga = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Cure.DT = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {        main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Ebers Earring +1",
    left_ring="Janniston Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
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
    hands="Fanatic Gloves",
    legs="Th. Pant. +3",
    feet="Vanya Clogs",
    neck="Debilis Medallion",
    waist="Embla Sash",
    left_ear="Meili Earring",
    right_ear="Ebers Earring +1",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.StatusRemoval = {    main={ name="Yagrush", augments={'DMG:+4',}},
    sub="Genmei Shield",
    ammo="Hasty Pinion +1",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Ebers Pant. +3",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck={ name="Clr. Torque +2", augments={'Path: A',}},})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = { 
    
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','MND+7','Mag. Acc.+5','"Mag.Atk.Bns."+12',}},
	sub="Ammurapi Shield",
    ammo="Crepuscular Pebble",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
    neck="Loricate Torque",
    waist="Embla Sash",
    left_ear="Calamitous Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +3"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +3",})  --body="Piety Bliaut +3", legs="Th. Pant. +3",
	
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
    neck="Loricate Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		legs="Chironic Hose",}
		
	sets.midcast['Elemental Magic'] = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
	left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast['Elemental Magic'].Resistant = {    main={ name="Bunzi's Rod", augments={'Path: A',}},
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
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

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
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
	right_ear="Ebers Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
	right_ear="Ebers Earring +1",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
	right_ear="Ebers Earring +1",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
	right_ear="Ebers Earring +1",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
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
    left_ear="Malignance Earring",
	right_ear="Ebers Earring +1",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
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
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {     main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast['Enfeebling Magic'].Resistant = {     main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
		
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
	sets.resting = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.PDT = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.MDT = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.Weak = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    -- Defense sets

	sets.defense.PDT = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MDT = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.defense.MEVA = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {  
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.engaged.Acc = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.engaged.DW = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.engaged.DW.Acc = {      main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +3",back="Mending Cape"}

	sets.HPDown = {       main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.HPCure = {    main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Ebers Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Ebers Pant. +3",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Gurebu's Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

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