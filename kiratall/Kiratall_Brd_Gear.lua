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
	sets.weapons.DualTauret = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.DualNaeglingAcc = {main="Naegling",sub="Gleti's Knife"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},
	sub="Genmei Shield",
    head="Chironic Hat",
    body="Inyanga Jubbah +2",
      hands="Gende. Gages +1", 
    legs="Ayanmo cosciales +2",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter's Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, }

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {  range="Marsyas",
    head="Fili Calot +3",  --14
    body="Inyanga Jubbah +2",  --13
     hands="Gende. Gages +1",  --7
     legs={ name="Chironic Hose", augments={'Enmity+6','Attack+17','"Fast Cast"+8','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}, --8
    feet="Telchine Pigaches",--13
    neck="Voltsurge torque",  --4
    waist="Embla sash",  --5
    left_ear="Etiolation Earring",  --1
    right_ear="Enchanter's Earring +1",  --2
    left_ring="Lebeche Ring",
    right_ring="Kishar ring", --4
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, }

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
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
    right_ear="Moonshade Earring",
    left_ring="Karieyh Ring",
    right_ring="Cornelia's Ring",
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
    left_ring="Karieyh Ring",
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Aeolian Edge"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Hachirin-no-Obi",
    left_ear="Moonshade Earring",
    right_ear="Regal Earring",
    left_ring="Karieyh Ring",
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Savage Blade"] = {
    range={ name="Linos", augments={'Accuracy+12 Attack+12','Weapon skill damage +3%','STR+7',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Karieyh Ring",
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Ishvara Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {   
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +3"}

	sets.midcast.Lullaby = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
     head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast.Lullaby.Resistant = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Inyanga Tiara +2",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast['Horde Lullaby'] = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
     head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    neck="Mnbw. Whistle +1",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},feet={ name="Chironic Slippers", augments={'Attack+4','Mag. Acc.+9','"Treasure Hunter"+1',}},waist="Chaac Belt"}

	sets.midcast['Horde Lullaby'].Resistant = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
     head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	
	sets.midcast['Horde Lullaby'].AoE = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
      head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast['Horde Lullaby II'] = {  main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
      head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast['Horde Lullaby II'].Resistant = {   main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
      head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast['Horde Lullaby II'].AoE = {   main="Naegling",
   sub="Genmei Shield",
    range="Blurred harp +1",
      head={ name="Bihu Roundlet +3", augments={'Enhances "Con Anima" effect',}},
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}

	sets.midcast.Madrigal = {head="Fili Calot +3"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +3"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	--sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Mambo = {feet="Mousai crackows +1"}
	
	sets.midcast["Army's Paeon IV"] = {range="Daurdabla",   head="Chironic Hat",
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
	
	sets.midcast["Army's Paeon V"] = {range="Daurdabla",   head="Chironic Hat",
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
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +3"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = set_combine(sets.midcast.SongRecast,{main="Carnwenhan",
    range="Gjallarhorn",
   head="Fili Calot +3",
   body="Fili Hongreline +3",
   hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
   feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
 --   waist="Luminary Sash",
  --  left_ear="Etiolation Earring",
  --  right_ear="Enchanter's Earring +1",
  --  left_ring="Defending Ring",
  --  right_ring="Inyanga Ring",
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},})
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",
    sub="Kali",
}
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Naegling",
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
	
		sets.midcast.SongDebuff.DW = {    main="Naegling",
    sub="Crepuscular Knife",
}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Carnwenhan",
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
	sets.midcast.SongRecast = {   
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}
		


	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = set_combine(sets.midcast.SongRecast,{range=info.ExtraSongInstrument})

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
    main="Naegling",
	sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.idle = {
    main="Naegling",
  sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.Refresh = {
    main="Naegling",
	sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.DT = {
    main="Naegling",
	sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	-- Defense sets

	sets.defense.PDT = {
    main="Naegling",
	sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MDT = {
    main="Naegling",
	sub="Fusetto +2",
    range="Blurred Harp +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Domin. Earring +1",
    right_ear="Dominance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.Kiting = {feet="Fili Cothurnes +3"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {    main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Bunzi's Gloves",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.Acc = {main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Bunzi's Gloves",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.DW = {     main="Naegling",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Bunzi's Gloves",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
sets.engaged.DW.AM = {main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
     head="Bunzi's Hat",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
   feet="Fili Cothurnes +3",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
     back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.engaged.DW.Acc = {main="Naegling", sub="Fusetto +2",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
     head="Bunzi's Hat",
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
	set_macro_page(9, 1)
end
function user_job_lockstyle()
if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 002')
			else
				windower.chat.input('/lockstyleset 002') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 002')
			else
				windower.chat.input('/lockstyleset 002') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 002')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 002')
			else
				windower.chat.input('/lockstyleset 002') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 002')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 002')
	else
		windower.chat.input('/lockstyleset 002')
	end
end