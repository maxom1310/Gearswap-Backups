function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.WeaponskillMode:options('Match','Acc')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','DualWeapons','Max')

	


	
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
	sets.precast.JA.Bolster = {body="Bagua Tunic"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back="Nantosuelta's Cape"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants",feet="Azimuth Gaiters +3",
	back="Lifestream Cape",}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Attack+21','"Fast Cast"+7',}},
    body="Zendik Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Geomancy Pants +3",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -1%',}},
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
    body="Twilight Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Geomancy Pants +3",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -1%','Damage taken-2%',}},
}
sets.precast.WS['Judgment'] = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -1%','Damage taken-2%',}},
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
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Moonshade Earring", 
    left_ring="Chirich Ring +1",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Azimuth Gloves +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+5',}},
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    right_ear="Loquac. Earring",
    left_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -1%','Damage taken-2%',}},}

	sets.midcast.Geomancy = {    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -1%',}},}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -1%',}},legs="Bagua Pants",feet="Azimuth Gaiters +3"})
		
    sets.midcast.Cure = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
    sets.midcast.LightWeatherCure = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {    head={ name="Merlinic Hood", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+4','INT+4','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Debilis Medallion",
    waist="Embla Sash",
    right_ear="Meili Earring",
    left_ear="Malignance Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -1%','Damage taken-2%',}},})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast['Elemental Magic'].Resistant = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Proc = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].HighTierNuke = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
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
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
    sets.midcast.Drain = {    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Pixie Hairpin +1",
    body="Azimuth Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    right_ear="Azimuth Earring +2",
    left_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
    
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
    right_ear="Azimuth Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Stun.Resistant = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Impact = { main="Prime Maul",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=empty,
    body="Twilight Cloak",
    hands="Regal Cuffs",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
		
	sets.midcast.Dispel = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",})
		
	sets.midcast['Absorb-TP'] = {     range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Azimuth Earring +2",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

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
    right_ear="Azimuth Earring +2",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}

	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
		
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
    right_ear="Azimuth Earring +2",
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
	sets.resting = {     main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
   -- body="Zendik Robe",
	body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- Idle sets

	sets.idle = {      main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
   -- body="Zendik Robe",
	body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
		
	sets.idle.PDT = {      main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
   -- body="Zendik Robe",
	body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {     main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
   -- body="Zendik Robe",
	body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.PDT.Pet = {      main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
   -- body="Zendik Robe",
	body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {      main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	-- Defense sets
	
	sets.defense.PDT = {      main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}

	sets.defense.MDT = {       main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
		
    sets.defense.MEVA = {     main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Damage taken-6%','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
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
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg",
    head="Volte Cap",
    hands="Volte Bracers",
    waist="Chaac Belt",})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
		
	sets.engaged.DW = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
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
	sets.weapons.Idris = {main='Idris',sub="Ammurapi Shield",}
	sets.weapons.DualWeapons = {main='Idris',sub={ name="Bunzi's Rod", augments={'Path: A',}}}
	sets.weapons.Max = {main='Maxentius',sub={ name="Bunzi's Rod", augments={'Path: A',}}}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end