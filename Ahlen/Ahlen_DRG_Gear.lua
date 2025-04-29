-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula','Shining','Naegling','NaeglingDW')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon"} --hands="Ptero. Fin. G. +1"
	
	sets.precast.JA.Jump = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Crepuscular Mail",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}

	sets.precast.JA['Ancient Circle'] = {} --legs="Vishap Brais"
	
	sets.precast.JA['High Jump'] = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Crepuscular Mail",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.precast.JA['Soul Jump'] = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Crepuscular Mail",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.precast.JA['Spirit Jump'] = {   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Crepuscular Mail",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.precast.JA['Super Jump'] = {feet="Pelt. Schyn. +3"}
	sets.precast.JA['Spirit Link'] = {hands="Pel. Vambraces +3"} --head="Vishap Armet",hands="Lnc. Vmbrc. +2"
	sets.precast.JA['Call Wyvern'] = {} --body="Ptero. Mail +1"
	sets.precast.JA['Deep Breathing'] = {} --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Surge'] = {} --body="Ptero. Mail +1"
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.HealingBreath = {back="Brigantia's Mantle"}
	--sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.taeon_pet_body,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Founder's Hose",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body=gear.taeon_pet_body,hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Hose",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {     ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Pel. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Crit.hit rate+7','STR+13 VIT+13',}},
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Pel. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Crit.hit rate+7','STR+13 VIT+13',}},
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Sroda Ring",
	right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})

	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})

	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, { ammo="Crepuscular Pebble",
    head="Peltast's Mezail +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
   head="Peltast's Mezail +3",
      body="Pelt. Plackart +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
   head="Peltast's Mezail +3",
     body="Pelt. Plackart +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {    ammo="Crepuscular Pebble",
    head="Peltast's Mezail +3",
      body="Pelt. Plackart +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
   head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs="Pelt. Cuissots +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Impulse Drive'].SomeAcc = set_combine(sets.precast.WS.Acc, {    ammo="Knobkierrie",
   head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
       legs="Pelt. Cuissots +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS.Acc, {    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
        legs="Pelt. Cuissots +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Impulse Drive'].Fodder = set_combine(sets.precast.WS.Fodder, {    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Pelt. Cuissots +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	-- Sets to return to when not performing an action.
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, { 
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Pel. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Crit.hit rate+7','STR+13 VIT+13',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
			sets.precast.WS["Wheeling Thrust"] = set_combine(sets.precast.WS, {    ammo="Knobkierrie",
   head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Pelt. Cuissots +3",
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Peltast's Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring="Shneddick Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
		
	sets.idle.Refresh = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Crepuscular Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring="Shneddick Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail",})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
   left_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail",})

	sets.defense.MDT = {ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
   left_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail",})
		
	sets.defense.MEVA = {ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    left_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

	sets.Kiting = {left_ring="Shneddick Ring",}
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
    sets.passive.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.Shining = {main="Shining one", sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub=Empty}
	sets.weapons.NaeglingDW = {main="Naegling", sub="Demers. Degen +1"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Peltast's Earring +1"}
	sets.AccMaxTP = {ear1="Sherida Earring",ear2="Peltast's Earring +1"}
	sets.AccDayMaxTPWSEars = {ear1="Sherida Earring",ear2="Peltast's Earring +1"}
	sets.DayMaxTPWSEars = {ear1="Sherida Earring",ear2="Peltast's Earring +1"}
	sets.AccDayWSEars = {ear1="Sherida Earring",ear2="Peltast's Earring +1"}
	sets.DayWSEars = {ear1="Sherida Earring",ear2="Peltast's Earring +1",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Vim Torque +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
    sets.engaged.SomeAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Sroda Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
	sets.engaged.Acc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
    sets.engaged.FullAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
    sets.engaged.Fodder = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    right_ear="Sroda Earring",
    left_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 9)
    else
        set_macro_page(1, 9)
    end
end
function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 020')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 020')
		else
			windower.chat.input('/lockstyleset 020') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 020')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 020')
		else
			windower.chat.input('/lockstyleset 020') --Catchall just in case something's weird.
		end
	end
end