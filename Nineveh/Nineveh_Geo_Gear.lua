function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.WeaponskillMode:options('Match','Acc')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','DualWeapons','Max','MaxDual')

	


	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds

	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back="Nantosuelta's Cape"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants +3",feet="Azimuth Gaiters +3",
	back="Lifestream Cape",}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25','"Fast Cast"+7','DEX+2','"Mag.Atk.Bns."+4',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +11','MND+10',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +2','Indi. eff. dur. +20','Pet: Damage taken -1%',}},
}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {      range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=empty,
    body="Crepuscular Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +11','MND+10',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +2','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = { ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Cornelia's Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.precast.WSAcc = {  main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Chirich Ring +1",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Exudation"] = {     main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Exudation"].Acc = {  main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Chirich Ring +1",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.precast.WS["Judgment"] = {  main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.precast.WS["Judgment"].Acc = {  main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Chirich Ring +1",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.precast.WS['Flash Nova'] = {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Cornelia's Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Lifestream Cape",
}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {     range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Azimuth Gloves +3",
    legs="Geomancy Pants +3",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+12','CHR+2','"Fast Cast"+7',}},
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}

	sets.midcast.Geomancy = {    main={ name="Idris", augments={'Path: A',}},
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Bagua tunic +1",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back="Lifestream Cape",legs="Bagua Pants +3",feet="Azimuth Gaiters +3"})
		
    sets.midcast.Cure = {  main="Daybreak",    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
    sets.midcast.LightWeatherCure = { main="Daybreak",    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {  main="Daybreak",    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {     range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25','"Fast Cast"+7','DEX+2','"Mag.Atk.Bns."+4',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +11','MND+10',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +2','Indi. eff. dur. +20','Pet: Damage taken -1%',}},})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast['Elemental Magic'].Resistant = {        main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Proc = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {     main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].HighTierNuke = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {        main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Dark Magic'] = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Azimuth Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast.Drain = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+29','"Drain" and "Aspir" potency +11',}},
    hands="Azimuth Gloves +3",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +11','Mag. Acc.+6',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Mani Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back="Perimede Cape",}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast.Stun.Resistant = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast.Impact = {	head=empty,
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Crepuscular Cloak",
    hands="Regal Cuffs",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast.Dispel = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",})
		
	sets.midcast['Absorb-TP'] = {     range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +2','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}

	sets.midcast['Enfeebling Magic'] = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Regal Cuffs",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +1", 
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lifestream Cape", augments={'Geomancy Skill +2','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}

	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {   main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- Idle sets

	sets.idle = {       main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
		
	sets.idle.PDT = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {        main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.PDT.Pet = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {     main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- Defense sets
	
	sets.defense.PDT = {       main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	sets.defense.MDT = {       main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
    sets.defense.MEVA = {      main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shneddick Ring",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {left_ring="Shneddick Ring",}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {     ammo="Per. Lucky Egg",
    feet="Volte Boots",
    waist="Chaac Belt",})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",right_ring="Purity Ring",})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {      range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
		
	sets.engaged.DW = {     range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	sets.ResistantMagicBurst = {}
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Idris = {main='Idris',sub='Ammurapi Shield'}
	sets.weapons.DualWeapons = {main='Idris',sub={ name="Bunzi's Rod", augments={'Path: A',}}}
	sets.weapons.Max = {main='Maxentius',sub='Ammurapi Shield'}
	sets.weapons.MaxDual = {main='Maxentius',sub="Bunzi's Rod"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end