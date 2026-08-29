function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder','Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Tizbron','Maxbron','Naegbron','Prime','MagicWeapons')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	gear.obi_cure_waist = "Hachirin-no-obi"
	gear.obi_nuke_waist = "Hachirin-no-obi"
	gear.obi_cure_back = "Hachirin-no-obi"

	-- Additional local binds
		send_command('bind !f9 input /equipset 8;wait1;input /echo Club Magic Weapons')
		send_command('bind @f9 input /equipset 13;wait1;input /echo Prime Weapon')
		send_command('bind ^f9 input /equipset 9;wait1;input /echo Sword melee Weapons')
		send_command('bind !^f9 input /equipset 10;wait1;input /echo Club Melee Weapons')
		send_command('bind !@^f9 input /equipset 12;wait1;input /echo Naegling')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	--send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +3"}
	sets.buff['Chain Affinity'] = {}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})

	sets.HPDown = {    ammo="Staunch Tathlum +1",
    head="Pixie Hairpin +1",
    body="Emet Harness +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Mimir Earring",
    left_ring="Vengeful Ring",
    right_ring="murky ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}
	
	
	sets.precast.RA = {
	ammo=Empty,
	    range="Albin Bane",
    head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Snapshot"+5','"Snapshot"+5',}},
    body="Volte Harness",
    hands="Carmine Fin. Ga. +1",
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Sworn Sabatons",
    neck="Null Loop",
    waist="Yemaya Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Crepuscular Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
	}
	
	
	sets.precast.JA['Valiance'] = {  ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Cryptic Earring",
    left_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}}
	sets.precast.JA['Vallation'] = {  ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Cryptic Earring",
    left_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}}
	sets.precast.JA['Pflug'] = {  ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Cryptic Earring",
    left_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}}
	sets.precast.JA['Swordplay'] = {  ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Cryptic Earring",
    left_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}}
	


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Nyame Mail",
    hands="Hashi. Bazu. +3",
    legs="Dashing Subligar",
    feet="Nyame Sollerets",
    neck="Unmoving Collar +1",
    waist="Chaac Belt",
    left_ear="Alabaster Earring",
    right_ear="Hoxne Earring",
    left_ring="Murky Ring",
    right_ring="Valseur's Ring",
    back="Moonlight Cape",}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {    ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.precast.Flourish1 = {    ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring="Murky Ring",
    back="Null Shawl",}

	-- Fast cast sets for spells

	sets.precast.FC = {		ammo="Impatiens", --0
    head="Pinga Crown +1", --10
    body="Pinga Tunic +1", --15
    hands="Leyline Gloves", --8
    legs="Pinga Pants +1", --13
    feet="Carmine Greaves +1", --8
    neck="Orunmila's Torque", --5
    waist="Witful Belt", --3  +3 oc 
    right_ear="Enchntr. Earring +1", --2
    left_ear="Alabaster Earring", --0
    left_ring="Lebeche Ring", --0
    right_ring="Kishar Ring", --4
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},--0   +4 oc
	}  

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +3",})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Crepuscular Pebble",
	head="Hashishin Kavuk +3",
     body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.Acc = {
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.FullAcc = {
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.DT = {
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.Fodder = {
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {	ammo="Crepuscular Pebble",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="murky ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})
	
	sets.precast.WS['Imperator'] = set_combine(sets.precast.WS, {       ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
	hands="Nyame gauntlets", 
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
   left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	 
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
	hands="Nyame gauntlets", 
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
   left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
	hands="Nyame gauntlets", 
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
   left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
	body="Nyame Mail",
	hands="Nyame gauntlets", 
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
   left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
     body="Nyame Mail",
	hands="Nyame gauntlets", 
  legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
   left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {   
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {    
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, { 
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {  
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {      
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
      back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Flash Nova'] = {	    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
					 
	sets.precast.WS['Flash Nova'].DT = set_combine(sets.precast.WS.DT, {	    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",left_ear="Enchntr. Earring +1",right_ear="Loquac. Earring",
		body="Hashishin Mintan +3",hands="Hashi. Bazu. +3",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Hashishin Tayt +3",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {	       ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.midcast['Blue Magic'].Physical.Resistant = {	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.midcast['Blue Magic'].Physical.Fodder = {	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.midcast['Blue Magic'].PhysicalAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {    ammo="Ghastly Tathlum +1",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {	    ammo="Ghastly Tathlum +1",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
	   sets.midcast.RA = {ammo=empty,
	 range="Albin Bane",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back="Null Shawl",}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{     ammo="Ghastly Tathlum +1",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},})

	sets.midcast['Blue Magic'].Magical.Fodder = {	ammo="Ghastly Tathlum +1",
      head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
   neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Quanpur Necklace",})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {     ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Enfeebling Magic'] = {     ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
		sets.midcast['Reaving Wind'] = {     ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Sworn Platemail",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back="Null Shawl",}
	
	sets.midcast['Feather Tickle'] = {    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Sworn Platemail",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back="Null Shawl",}
	
	sets.midcast['Absorb-TP'] = {     ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Sworn Platemail",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back="Null Shawl",}
	
	

	sets.midcast['Enhancing Magic'] = {head="Telchine Cap",neck="Incanter's Torque",left_ear="Andoaa Earring",right_ear="Mimir Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{	   
    ammo="Staunch Tathlum +1",
    head={ name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','Blood Pact Dmg.+2','Phalanx +4','Accuracy+15 Attack+15',}},
    body="Sworn Platemail",
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+25','Pet: Crit.hit rate +1','Phalanx +4','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+2 Attack+2','Mag. Acc.+9','Phalanx +4','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet="Sworn Sabatons",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast['Divine Magic'] = {	ammo="Sapience Orb",
		head="Nyame Helm",
		body="Emet Harness +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Elite Royal Collar",
		waist="Null Belt",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Vengeful Ring",
		right_ring="Supershear Ring",
		   back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.midcast['Elemental Magic'] = {      ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Elemental Magic'].Resistant = {    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"
	
	

	sets.midcast.Cure = {    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    right_ear="Mendi. Earring",
    left_ear="Alabaster Earring",
    left_ring="Kunaji Ring",
    right_ring="murky ring",
    back="Moonlight Cape",}
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {	ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {     ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Sworn Platemail",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",}

	sets.midcast['Blue Magic'].Stun.Resistant = {    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Sworn Platemail",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {    ammo="Staunch Tathlum +1",  
    head="Sworn Crown",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
    feet="Sworn Sabatons",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    right_ear="Mendi. Earring",
    left_ear="Alabaster Earring",
    left_ring="Kunaji Ring",
    right_ring="murky ring",
    back="Moonlight Cape",}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
    feet="Sworn Sabatons",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    right_ear="Mendi. Earring",
    left_ear="Alabaster Earring",
    left_ring="Kunaji Ring",
    right_ring="murky ring",
    back="Null Shawl",}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {       ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Assim. Jubbah +4",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Njordr Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},}

	sets.midcast['Blue Magic'].Buff = {    ammo="Pemphredo Tathlum",
	head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +10',}},
    body="Hashishin Mintan +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    right_ear="Mendi. Earring",
    left_ear="Alabaster Earring",
    left_ring="Vengeful Ring",
    right_ring="murky ring",
    back="Moonlight Cape",}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",})
	sets.midcast['Blue Magic']['Fantod'] = {
    ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hashishin Tayt +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Agema Cape",
	   -- back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
	}
		sets.midcast['Blue Magic']['Jettatura'] = {
    ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hashishin Tayt +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Agema Cape",
		   -- back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
	}

		sets.midcast['Blue Magic']['Flash'] = {
	    ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    right_ear="Cryptic Earring",
    left_ear="Alabaster Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {	ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Hashishin Mintan +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Elite Royal Collar",
     waist="Null belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Vengeful Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	-- Idle sets
	sets.idle = {	ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Hashishin Mintan +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Null belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Shneddick Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.idle.Sphere = set_combine(sets.idle, {})

	sets.idle.PDT = {    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
     waist="Null belt",
    right_ear="Etiolation Earring",
	left_ear="Alabaster Earring",
    left_ring="Shneddick Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
     waist="Null belt",
    right_ear="Etiolation Earring",
    left_ear="Alabaster Earring",
    left_ring="Shneddick Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.defense.MDT = {    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
     waist="Null belt",
    right_ear="Etiolation Earring",
    left_ear="Alabaster Earring",
    left_ring="Shneddick Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

    sets.defense.MEVA = {    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Null belt",
    right_ear="Etiolation Earring",
    left_ear="Alabaster Earring",
    left_ring="Shneddick Ring",
    right_ring="murky ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {}--legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Treasure Hunter"+2',}},
			feet={ name="Herculean Boots", augments={'MND+8','Pet: "Dbl. Atk."+1','"Treasure Hunter"+2','Accuracy+13 Attack+13','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},})
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Tizbron = {main="Tizona",sub="Thibron"}
	sets.weapons.Maxbron = {main="Maxentius",sub="Thibron"}
	sets.weapons.Prime = {main="Caliburnus",sub="Thibron"}
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Seqbron = {main="Sequence",sub="Thibron"}
	sets.weapons.Sequalmace = {main="Sequence",sub="Almace"}
	sets.weapons.Naegbron = {main="Naegling",sub="Thibron"}
	sets.weapons.Naegmace = {main="Naegling",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Bunzi's Rod",sub="Sakpata's Sword"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {    ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}
	
	sets.engaged.Prime = {     ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
	


	sets.engaged.AM = {		ammo="Aurgelmir Orb +1", --3
        head="Sworn Crown",  --6
		neck="Mirage Stole +2", 
		left_ear="Alabaster Earring",
		right_ear="Hashi. Earring +2",
		body="Sworn Platemail",
		hands="Sworn Gauntlets", --5
		ring1="Chirich Ring +1",  
		ring2="murky ring", --10
        back="Null Shawl", --5
		waist="Sailfi Belt +1",
		legs="Sworn Brais", --7
		feet="Sworn Sabatons",}


	sets.engaged.Acc = {    ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl", }

	sets.engaged.Acc.AM = { ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",  }

	sets.engaged.FullAcc = {   ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl", }

	sets.engaged.FullAcc.AM = {	 ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl", }

	sets.engaged.Fodder = {   ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.Fodder.AM = {    ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.DT = {   ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.DT.AM = {  ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.Acc.DT = {  ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}
				
	sets.engaged.Acc.DT.AM = { ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.FullAcc.DT = {   ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.Fodder.DT = {   ammo="Coiste Bodhar",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.Fodder.DT.AM = {   ammo="Aurgelmir Orb +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','"Dbl.Atk."+6','STR+9 INT+9',}},
    left_ring="Epona's Ring",
    right_ring="Murky Ring",
    back="Null Shawl",}

	sets.Self_Healing = {ring1="Kunaji Ring",ring2="murky ring",}
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="murky ring",}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {ring1="Mujin Band",}
	
	sets.Phalanx_Received = 	{
    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs={ name="Herculean Trousers", augments={'Accuracy+2 Attack+2','Mag. Acc.+9','Phalanx +4','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet="Sworn Sabatons",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
		}
	sets.recphalanx = 	{
    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs={ name="Herculean Trousers", augments={'Accuracy+2 Attack+2','Mag. Acc.+9','Phalanx +4','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet="Sworn Sabatons",
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
	right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
		}	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(7, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(7, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 1)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 1)
	elseif player.sub_job == 'THF' then
		set_macro_page(7, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(7, 1)
	else
		set_macro_page(7, 1)
	end
end

--Job Specific Trust Override
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end