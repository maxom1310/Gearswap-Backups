function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','DT')
	state.Weapons:options('None','CarnSW','NaeglingSW','DualCarn','DualNaegling','DualTauret','DualNaeglingAcc')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
 

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.CarnSW = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.NaeglingSW = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.DualCarn = {main="Carnwenhan",sub="Crepuscular Knife"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Fusetto +2"}
	sets.weapons.DualTauret = {main="Tauret",sub="Crepuscular Knife"}
	sets.weapons.DualNaeglingAcc = {main="Malevolence",sub="Crepuscular Knife"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},    --7
	sub="Genmei Shield",
    range="Marsyas",
    head="Fili Calot +1",  --14
    body="Inyanga Jubbah +2",  --13
     hands="Leyline Gloves",  --7
    legs="Ayanmo cosciales +2",  --6
    feet="Bihu Slippers +3",--10
    neck="Voltsurge torque",  --4
    waist="Embla sash",  --5
    left_ear="Etiolation Earring",  --1
    right_ear="Enchanter's Earring +1",  --2
    left_ring="Lebeche Ring",
    right_ring="Kishar ring", --4
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, }

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Blurred Harp +1",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Telchine Pigaches"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{ range="Gjallarhorn",})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{ range="Gjallarhorn",})
	sets.precast.FC.Lullaby = {range="Blurred Harp +1"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
   	 legs="Nyame Flanchard",
  feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS["Mordant Rime"] = {
   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
       hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Regal Earring", 
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Savage Blade"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
   	 legs="Nyame Flanchard",
  feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Ishvara Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},
	sub="Genmei Shield",
    head="Chironic Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Ayanmo cosciales +2",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter's Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Marsyas"}
	sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'] = {feet={ name="Chironic Slippers", augments={'Attack+4','Mag. Acc.+9','"Treasure Hunter"+1',}},waist="Chaac Belt"}
	sets.midcast['Horde Lullaby'].Resistant = {feet={ name="Chironic Slippers", augments={'Attack+4','Mag. Acc.+9','"Treasure Hunter"+1',}},waist="Chaac Belt"}
	sets.midcast['Horde Lullaby'].AoE = {feet={ name="Chironic Slippers", augments={'Attack+4','Mag. Acc.+9','"Treasure Hunter"+1',}},waist="Chaac Belt"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast.Threnody = {body="Mou. Manteel +1",}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast["Dragonfoe Mambo"] = {feet="Mousai crackows +1"}
	sets.midcast["Sheepfoe Mambo"] = {feet="Mousai crackows +1"}
	sets.midcast["Army's Paeon IV"] = {range="Daurdabla"}
	sets.midcast["Army's Paeon V"] = {range="Daurdabla"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {     	 main="Carnwenhan",
	  sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
   back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",
    sub="Crepuscular Knife",
	    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
   back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Mou. Manteel +1",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	
		sets.midcast.SongDebuff.DW = {    main="Carnwenhan",
    sub="Crepuscular Knife",
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Mou. Manteel +1",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Carnwenhan",
    sub="Crepuscular Knife",
    range="Gjallarhorn",
    head="Bihu Roundlet +3",
    body="Inyanga Jubbah +2",
    hands="Bihu Cuffs +3",
    legs="Bihu Cannions +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {range="Blurred Harp +1",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +2"}
		


	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {    main="Daybreak",
	sub="Genmei Shield",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Inyanga Dastanas +2",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Healing Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Sirona's Ring",
    back="Solemnity cape",}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
		
	sets.midcast['Enhancing Magic'] = {
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Intarabus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {		neck="Debilis Medallion",
        ring1="Haoma's Ring",
        ring2="Haoma's Ring",
		hands="Inyanga Dastanas +2",
		head="Vanya Hood",
		body="Vanya Robe",
		legs="Vanya Slops",
		feet="Vanya Clogs",})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	-- Resting sets
	sets.resting = {main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}
	
	sets.idle = {			main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}
		
	sets.idle.Refresh = {	main="Daybreak",
	sub="Genmei Shield",
    range="Nibiru Harp",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'Pet: Accuracy+4 Pet: Rng. Acc.+4','Weapon Skill Acc.+1','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
   	neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}

	sets.idle.DT = {			main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}
	
	-- Defense sets

	sets.defense.PDT = {			main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}

	sets.defense.MDT = {			main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},}

	sets.Kiting = {feet="Fili Cothurnes +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {    main="Naegling", sub="Genmei Shield",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.Acc = {main="Naegling", sub="Genmei Shield",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.DW = {main={ name="Carnwenhan", augments={'Path: A',}}, sub="Crepuscular Knife",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.DW.Acc = {main={ name="Carnwenhan", augments={'Path: A',}}, sub="Crepuscular Knife",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
end