function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','DT')
	state.Weapons:options('None','CarnSW','NaeglingSW','DualCarn','DualNaegling','DualTauret','DualNaeglingAcc')
			send_command('bind f11 gs c toggle AutoSambaMode')	
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
	sets.precast.FC = { 
    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Chironic Hose", augments={'Damage taken-1%','INT+9','"Fast Cast"+7','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    feet="Nyame Sollerets",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",})
	
	sets.precast.FC.BardSong = { 
	    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    head="Fili Calot +3",  --14
    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Chironic Hose", augments={'Damage taken-1%','INT+9','"Fast Cast"+7','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    feet="Nyame Sollerets",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{ range="Gjallarhorn",})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{ range="Gjallarhorn",})
	sets.precast.FC.Lullaby = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
   	 legs="Nyame Flanchard",
  feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
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
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Savage Blade"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
   	 legs="Nyame Flanchard",
  feet="Nyame Sollerets",
     neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Ishvara Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {   
    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands="Nyame Gauntlets",
    legs={ name="Chironic Hose", augments={'Damage taken-1%','INT+9','"Fast Cast"+7','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    feet="Nyame Sollerets",
    neck="Voltsurge Torque",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},	}

	-- Gear to enhance certain classes of songs
		sets.midcast.Ballad = {legs="Fili Rhingrave +3"}
	sets.midcast.Lullaby = { 
    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast.Lullaby.Resistant = {    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby'] = {   main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby'].Resistant = {    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby'].AoE = {   main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby II'] = {   main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby II'].Resistant = {   main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast['Horde Lullaby II'].AoE = {    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Blurred harp +1",
    head="C. Palug Crown",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Crepuscular Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	sets.midcast.Madrigal = {head="Fili Calot +3"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +3"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Mambo = {feet="Mousai crackows +1"}
	sets.midcast["Army's Paeon IV"] = {    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Daurdabla",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.midcast["Army's Paeon V"] = {    main={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Daurdabla",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +3"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter's Earring +1",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
   back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
}
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {  main="Carnwenhan",
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Gjallarhorn",
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Haste+1','MND+10','Mag. Acc.+13',}},
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Crep. Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
		sets.midcast.SongDebuff.DW = {main="Carnwenhan",
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = { main="Carnwenhan",
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Gjallarhorn",
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Haste+1','MND+10','Mag. Acc.+13',}},
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Crep. Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {   
    range="Daurdabla",
    head="C. Palug Crown",
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Chironic Hose", augments={'Damage taken-1%','INT+9','"Fast Cast"+7','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Voltsurge Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		


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
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",}
		
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
	sets.resting = {
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.idle = {
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.Refresh = {
 	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.DT = {
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	-- Defense sets

	sets.defense.PDT = {
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MDT = {
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.Kiting = {right_ring="Shneddick Ring",}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {    main="Naegling", sub="Genmei Shield",
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
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
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+3','Quadruple Attack +3',}},
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
	sets.engaged.DW = {main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+3','Quadruple Attack +3',}},
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
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
sets.engaged.DW.AM = {main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+3','Quadruple Attack +3',}},
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
     back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.engaged.DW.Acc = {main="Naegling", sub="Crepuscular Knife",
    range={ name="Linos", augments={'Accuracy+18','"Dbl.Atk."+3','Quadruple Attack +3',}},
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
function user_job_lockstyle()
if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 004')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 004')
			else
				windower.chat.input('/lockstyleset 004') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 004')
			else
				windower.chat.input('/lockstyleset 004') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 004')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 004')
			else
				windower.chat.input('/lockstyleset 004') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 004')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 004')
	else
		windower.chat.input('/lockstyleset 004')
	end
end