function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Schere','Lib','Mboze','TH')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Caladbolg','Liberator','Anguta','Apoc','Lycurgos','Club','Redemption','Naegling','Malv')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind ` gs c cycle OffenseMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring"}
	sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +3"}
	sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +3"}
	sets.precast.JA['Blood Weapon'] = {"Fallen's cuirass +3"}
	sets.precast.JA['Dark Seal'] = {head="Fallen's burgeonet +3"}
	sets.precast.JA['Last Resort'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring",feet="Fallen's sollerets +3",back="Ankou's Mantle"}
	sets.precast.JA['Valiance'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring"}
	sets.precast.JA['Vallation'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring"}
	sets.precast.JA['Pflug'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring"}
	sets.precast.JA['Swordplay'] = {body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		ring1="Supershear Ring",ring2="Provocare Ring"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+13','"Fast Cast"+5','Mag. Acc.+10',}},
		hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Flume Belt +1",legs="Enif Cosciales",
		feet={ name="Odyssean Greaves", augments={'Attack+4','"Fast Cast"+5','CHR+1',}}}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
		
	-- Midcast Sets
	
	sets.midcast['Endark II'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Mani Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3",ring1="Archon Ring",ring2="Evanescence Ring",
		back="Niht Mantle",waist="Casso Sash",legs="Heath. Flanchard +3",feet="Ratri sollerets"}
		
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Mani Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3",ring1="Archon Ring",ring2="Evanescence Ring",
		back="Niht Mantle",waist="Casso Sash",legs="Heath. Flanchard +3",feet="Ratri sollerets"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Moonlight Ring",ring2="Stikini Ring +1",
		back="Niht Mantle",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	   
	sets.midcast['Dread Spikes'] = {main="Crepuscular Scythe",ammo="Pemphredo Tathlum",
		head="Ratri Sallet",neck="Incanter's Torque",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Heathen's Cuirass +3",hands="Ratri Gadlings",ring1="Moonlight Ring",ring2="Regal Ring",
		back="Moonlight Cape",waist="Plat. Mog. Belt",legs="Ratri cuisses",feet="Ratri sollerets"}
	
	sets.midcast.Absorb = {ammo="Pemphredo Tathlum",
		head="Ig. Burgonet +3",neck="Erra Pendant",ear1="Dark Earring",ear2="Mani Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Chuparrosa Mantle",waist="Casso Sash",legs="Fall. Flanchard +3",feet="Ratri sollerets"}
	
	sets.midcast['Absorb-TP'] = {ammo="Pemphredo Tathlum",
		head="Ig. Burgonet +3",neck="Erra Pendant",ear1="Digni. Earring",ear2="Mani Earring",
		body="Carm. Sc. Mail +1",hands="Heath. Gauntlets +2",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Chuparrosa Mantle",waist="Casso Sash",legs="Fall. Flanchard +3",feet="Ratri sollerets"}
           
	sets.midcast.Stun = {ammo="Sapience Orb",
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring",
		hands="Nyame Gauntlets",ring1="Supershear Ring",ring2="Provocare Ring",
		back={ name="Ankou's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Trance Belt",legs="Nyame flanchard",feet="Nyame Sollerets"}
	
	sets.midcast['Absorb-INT'] = {ammo="Sapience Orb",
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring",
		hands="Nyame Gauntlets",ring1="Supershear Ring",ring2="Provocare Ring",
		back={ name="Ankou's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Trance Belt",legs="Nyame flanchard",feet="Nyame Sollerets"}
	
	sets.midcast['Absorb-MND'] = {ammo="Sapience Orb",
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring",
		hands="Nyame Gauntlets",ring1="Supershear Ring",ring2="Provocare Ring",
		back={ name="Ankou's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Trance Belt",legs="Nyame flanchard",feet="Nyame Sollerets"}
	
	sets.midcast['Absorb-CHR'] = {ammo="Sapience Orb",
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring",
		hands="Nyame Gauntlets",ring1="Supershear Ring",ring2="Provocare Ring",
		back={ name="Ankou's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Trance Belt",legs="Nyame flanchard",feet="Nyame Sollerets"}
	
	
	--sets.midcast.Stun = {ammo="Per. Lucky Egg",
		--head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		--body="Emet Harness +1",ear1="Cryptic Earring",ear2="Trux Earring",
		--hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		--back="Niht Mantle",waist="Eschan Stone",legs="Volte Hose",feet="Flam. Gambieras +2"}
	
	sets.midcast['Flash']  = {amm="Sapience Orb",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Cryptic Earring",ear2="Trux Earring,",
		body="Emet Harness +1",hand="Nyame gauntlets",ring1="Supershear Ring",ring2="Provocare Ring",
		back={ name="Ankou's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}
                   
	sets.midcast.Drain = {ammo="Pemphredo Tathlum",
		head="Fall. Burgeonet +3",neck="Erra Pendant",ear1="Hirudinea Earring",ear2="Mani Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3",ring1="Archon Ring",ring2="Evanescence Ring",
		back="Niht Mantle",waist="Orpheus's Sash",legs="Fall. Flanchard +3",feet="Ratri sollerets"}
	

	
	set_combine(sets.midcast['Dark Magic'])
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	
-- WEAPONSKILL SETS
	
	-- Default set for any weaponskill that isn't any more specifically defined
	
    sets.precast.WS = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Beithir Ring",ring2="Karieyh Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	    waist="Fotia Belt",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
	sets.precast.WS.SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
	-- SomeAcc is defined for Attack Cap. Press Alt + F9 to switch to SomeAcc WS mode when Attack Capped
	
--GREATSWORD WS
		
	--Torcleaver (1000-1300 TP)

	sets.precast.WS['Torcleaver'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
	sets.precast.WS['Torcleaver'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Ephramad's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	--Resolution (2000-2300 TP)
	 
	 sets.precast.WS['Resolution'] = {ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
    sets.precast.WS['Resolution'].SomeAcc = {ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Schere Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings",}
	
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	--Scourge (1000-1300 TP)
	
	sets.precast.WS['Scourge'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Scourge'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
--SCYTHE WS

	--Insurgency (2000-2300 TP)

	sets.precast.WS['Insurgency'] = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		 back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Insurgency'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Dagon Breast.",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		 back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Sakpata's leggings",}
	
	--sets.precast.WS['Insurgency'].SomeAcc = {ammo="Knobkierrie",
		--head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		--body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		--back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		--waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Heath. Sollerets +3",}
	
	--Quietus (2000-2300 TP)
	
	sets.precast.WS['Quietus'] = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Quietus'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Dagon Breast.",hands="Sakpata's Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Sakpata's Leggings",}
		
	--sets.precast.WS['Quietus'].SomeAcc = {ammo="Knobkierrie",
		--head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Schere Earring",
		--body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		--back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		--waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	
	
	--Entropy (1000-1300 TP)
	
	sets.precast.WS['Entropy'] = {ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Metamor. Ring +1",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets",}
	
	sets.precast.WS['Entropy'].SomeAcc = {ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Sroda Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Nyame Sollerets",}
	
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	--Catasrophe (1000-1300 TP)
	
	sets.precast.WS['Catastrophe'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
    sets.precast.WS['Catastrophe'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Heath. Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Fotia Belt",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})	
	
	--Cross Reaper (2000-2300 TP)
	
	sets.precast.WS['Cross Reaper'] = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Cross Reaper'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Dagon Breast.",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Sakpata's Leggings",}
	
	--sets.precast.WS['Cross Reaper'].SomeAcc = {ammo="Knobkierrie",
		--head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Heath. Earring +1",
		--body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		--back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		--waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}

--GREAT AXE WS

	--Fell Cleave (1000 TP) (Applies TH+4)
	
	sets.precast.WS['Fell Cleave'] = {ammo="Knobkierrie",
		head="Volte Cap",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body={ name="Valorous Mail", augments={'Rng.Acc.+17','Weapon Skill Acc.+11','"Treasure Hunter"+2',}},
		hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	 --Armor Break (3000 TP) (Maximize Magic Acc. to land Defense Down)
	
	sets.precast.WS['Armor Break'] = {ammo="Pemphredo Tathlum",
		head="Heath. Bur. +3",neck="Erra Pendant",ear1="Malignance Earring",ear2="Heath. Earring +1",
		body="Heath. Cuirass +3",hands="Heath. Gauntlets +3",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
		back={ name="Ankou's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Eschan Stone",legs="Heath. Flanchard +3",feet="Heath. Sollerets +3",}

--SWORD WS

	--Savage Blade (1500-1800 TP)
	
	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Ephramad's Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Savage Blade'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Ephramad's Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
--CLUB WS
	
	--Judgment (1500-1800 TP)
	
	sets.precast.WS['Judgment'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Beithir Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
	
	sets.precast.WS['Judgment'].SomeAcc = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Heath. Sollerets +3",}
		
--DAGGER WS
	
	--Aeolian Edge (TP ?)
	
	sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly Tathlum +1",
		head="Nyame Helm",body="Nyame Mail",
		neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Moonshade Earring",
		hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Metamor. Ring +1",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		waist="Hachirin-no-Obi",legs="Nyame flanchard",feet="Nyame sollerets",}
         
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring",}
     
            -- Idle sets
           
    sets.idle = {ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Tuisto earring",
        body="Sakpata's Plate",hands="Sakpata's gauntlets",ring1="Moonlight Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {head="Fellen's Burgeonet +3"} --head="Fallen's Burgeonet +3"
	sets.buff.Elvorseal = {body="Hervor Haubert",hands="Hervor mouffles",feet="Hervor sollerets"}
     
	-- Engaged sets
	
	sets.engaged = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim Torque +1",ear1="Cessance Earring",ear2="Telos earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Nyame Sollerets"}
	
	sets.engaged.Schere = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim Torque +1",ear1="Cessance Earring",ear2="Schere earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Nyame Sollerets"}
		
	sets.engaged.Lib = {ammo="Coiste Bodhar",
		head="Hjarrandi Helm",neck="Abyssal Beads +2",ear1="Schere Earring",ear2="Dedition Earring",
		body="Hjarrandi Breast.",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",legs="Volte Tights",feet="Sakpata's Leggings"}
	
	sets.engaged.Mboze = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Telos Earring",ear2="Digni. Earring",
		body="Dagon Breast.",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Nyame Sollerets"}
		
	sets.engaged.TH = {ammo="Coiste Bodhar",
		head="Volte Cap",neck="Vim Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body={ name="Valorous Mail", augments={'Rng.Acc.+17','Weapon Skill Acc.+11','"Treasure Hunter"+2',}},
		hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		waist="Ioskeha Belt +1",
		legs={ name="Herculean Trousers", augments={'INT+1','Pet: Mag. Acc.+19','"Treasure Hunter"+2',}},
		feet="Sakpata's Leggings"}
	
	sets.Phalanx_Received = {head={ name="Odyssean Helm", augments={'Pet: "Regen"+2','"Rapid Shot"+2','Phalanx +5','Accuracy+4 Attack+4',}},
		body={ name="Odyss. Chestplate", augments={'"Dbl.Atk."+4','"Mag.Atk.Bns."+15','Phalanx +4','Accuracy+13 Attack+13','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
		hands="Souv. Handsch. +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}

 
	

--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
	
-- Apocalypse melee sets
    sets.engaged.Apocalypse = {}
	sets.engaged.Apocalypse.SomeAcc = {}
	sets.engaged.Apocalypse.Acc = {}
	sets.engaged.Apocalypse.FullAcc = {}
	sets.engaged.Apocalypse.Fodder = {}
	
    sets.engaged.Apocalypse.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.Adoulin = {}
	sets.engaged.Apocalypse.Acc.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.Adoulin = {}
	
    sets.engaged.Apocalypse.AM = {}
	sets.engaged.Apocalypse.SomeAcc.AM = {}
	sets.engaged.Apocalypse.Acc.AM = {}
	sets.engaged.Apocalypse.FullAcc.AM = {}
	sets.engaged.Apocalypse.Fodder.AM = {}
	
    sets.engaged.Apocalypse.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.Adoulin.AM = {}

	sets.engaged.Apocalypse.PDT = {}
	sets.engaged.Apocalypse.SomeAcc.PDT = {}
	sets.engaged.Apocalypse.Acc.PDT = {}
	sets.engaged.Apocalypse.FullAcc.PDT = {}
	sets.engaged.Apocalypse.Fodder.PDT = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Apocalypse.PDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.AM = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Apocalypse.PDT.Charge = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Apocalypse.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Apocalypse.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Apocalypse.MDT = {}
	sets.engaged.Apocalypse.SomeAcc.MDT = {}
	sets.engaged.Apocalypse.Acc.MDT = {}
	sets.engaged.Apocalypse.FullAcc.MDT = {}
	sets.engaged.Apocalypse.Fodder.MDT = {}
	
	sets.engaged.Apocalypse.MDT.Adoulin = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.Acc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.FullAcc.MDT.Adoulin = {}
	sets.engaged.Apocalypse.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Apocalypse.MDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.AM = {}
	
	sets.engaged.Apocalypse.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.Adoulin.AM = {}
	
-- Ragnarok melee sets
    sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
    sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
    sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Liberator = {main="Liberator",sub="Utu Grip"}
	sets.weapons.Apoc = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Khonsu"}
	sets.weapons.Club = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Redemption = {main="Redemption",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Malv = {main="Malevolence",sub="Malevolence"}
	
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 8)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 8)
    else
        set_macro_page(2, 8)
    end
end