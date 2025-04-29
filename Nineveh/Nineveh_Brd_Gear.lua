function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','DT')
	state.Weapons:options('None','CarnSW','NaeglingSW','DualCarn','PrimeSW','DualPrime','DualTwash','DualNaegling','DualTauret','DualNaeglingAcc','Staff')
			send_command('bind f11 gs c toggle AutoSambaMode')	
			send_command('bind ^f7 gs c cycle UnlockWeapons')	
			
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Loughnashade'
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
	sets.weapons.CarnSW = {main="Carnwenhan",sub="Ammurapi Shield",}
	sets.weapons.NaeglingSW = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.PrimeSW = {main="Mpu Gandring",sub="Ammurapi Shield"}
	sets.weapons.DualCarn = {main="Carnwenhan",sub="Gleti's Knife"}
	sets.weapons.DualPrime = {main="Mpu Gandring",sub="Fusetto +2"}
	sets.weapons.DualTwash = {main="Twashtar",sub="Fusetto +2"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Fusetto +2"}
	sets.weapons.DualTauret = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.DualNaeglingAcc = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.Staff = {main="Xoanon",sub="Enki Strap"}
	

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {   
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +3",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Fili Earring +2",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {     range="Marsyas",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +3",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Fili Earring +2",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}, }

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{ range="Loughnashade",})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{ range="Loughnashade",})
	sets.precast.FC.Lullaby = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})	
	sets.precast.FC['Aria of Passion'] = {    range="Loughnashade",
    head="Fili Calot +3",
    body="Bunzi's Robe",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Aya. Cosciales +2",
    feet="Fili Cothurnes +3",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Fili Earring +2",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
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
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
		sets.precast.WS["Rudra's Storm"] = {   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
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
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
			sets.precast.WS["Ruthless Stroke"] = {   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
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
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS["Mordant Rime"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Aeolian Edge"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail", 
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Hachirin-no-Obi",
    left_ear="Moonshade Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
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
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
			sets.precast.WS["Retribution"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
				sets.precast.WS["Shell Crusher"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Fili Calot +3",
    body="Nyame Mail",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Crep. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Fast Blade"] = {   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
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
    right_ring="Cornelia's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Ishvara Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {   
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Fili Earring +2",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +3"}

	sets.midcast.Lullaby = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred Harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Lullaby.Resistant = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred Harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast['Horde Lullaby'] = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    neck="Mnbw. Whistle +1",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
	feet="Volte Boots",
	waist="Chaac Belt"}

	sets.midcast['Horde Lullaby'].Resistant = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.midcast['Horde Lullaby'].AoE = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast['Horde Lullaby II'] = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast['Horde Lullaby II'].Resistant = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred Harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast['Horde Lullaby II'].AoE = {   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred Harp +1",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Madrigal = {head="Fili Calot +3"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes +3"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast['Aria of Passion'] = {
	main="Carnwenhan",
    range="Loughnashade",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Enchanter's Earring +1",
	right_ear="Fili Earring +2",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
   back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	sets.midcast.Threnody = {body="Mou. Manteel +1"}
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Mambo = {feet="Mousai crackows +1"}
	
	sets.midcast["Army's Paeon IV"] = {range="Loughnashade",    head="Chironic Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Fili Rhingrave +3",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Enchanter's Earring +1",
	right_ear="Fili Earring +2",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},}
	
	sets.midcast["Army's Paeon V"] = {range="Loughnashade",    head="Chironic Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Fili Rhingrave +3",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Enchanter's Earring +1",
	right_ear="Fili Earring +2",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +3"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",
    range="Loughnashade",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Enchanter's Earring +1",
	right_ear="Fili Earring +2",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
   back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",
    sub="Gleti's Knife",
}
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = { main="Carnwenhan",
     range="Loughnashade",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.midcast['Absorb-TP'] = {    
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Mnbw. Whistle +1",
    waist="Cornelia's Belt",
    left_ear="Crep. Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
		sets.midcast.SongDebuff.DW = {    main="Carnwenhan",
    sub="Gleti's Knife",
}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {    main={ name="Carnwenhan", augments={'Path: A',}},
    range="Loughnashade",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Orunmila's Torque",
    waist="Cornelia's Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Fili Earring +2",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
		


	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {     main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Naji's Loop",
    right_ring="Sirona's Ring",
    back="Solemnity Cape",}
		
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
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Fortified Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.idle = {
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Fortified Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.Refresh = {
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head="Fili Calot +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.DT = {
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Fortified Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	-- Defense sets

	sets.defense.PDT = {
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Fortified Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MDT = {
    range={ name="Linos", augments={'Evasion+15','"Fast Cast"+6','AGI+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Infused Earring",
    right_ear="Fili Earring +2",
    left_ring="Fortified Ring",
    right_ring="Shneddick Ring",
    back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}

	sets.Kiting = {right_ring="Shneddick Ring",}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.buff.Sleep = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",right_ring="Purity Ring",})
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {    main="Naegling",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Acc = {     main="Naegling",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
   head="Bunzi's Hat",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
	right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.DW = {    main="Naegling",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.DW.AM = {    main="Naegling",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
	right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.DW.Acc = {    main="Naegling",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Ilabrat Ring",
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