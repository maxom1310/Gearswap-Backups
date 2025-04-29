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
	state.Weapons:options('None','Tizbron','Maxbron','Naegbron','MagicWeapons')

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
		send_command('bind @f9 input /equipset 11;wait1;input /echo Magic Sword Weapons')
		send_command('bind ^f9 input /equipset 9;wait1;input /echo Sword melee Weapons')
		send_command('bind !^f9 input /equipset 10;wait1;input /echo Club Melee Weapons')
		send_command('bind !@^f9 input /equipset 12;wait1;input /echo Naegling')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
--	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
--	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {}
	sets.buff['Chain Affinity'] = {}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {    ammo="Staunch Tathlum +1",
    head="Pixie Hairpin +1",
    body="Emet Harness +1",
    hands="Hashi. Bazu. +3",
    legs={ name="Herculean Trousers", augments={'"Fast Cast"+6','STR+6','"Mag.Atk.Bns."+9',}},
    feet="Hashi. Basmak +3",
    neck="Elite Royal Collar",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Mimir Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask +1",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +3",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Fast cast sets for spells

	sets.precast.FC = {	
	    ammo="Crepuscular Pebble",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6','INT+6',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6','Mag. Acc.+4',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+6','MND+5','Mag. Acc.+15',}},
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
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
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.Acc = {
    ammo="Crepuscular Pebble",
   head="Hashishin Kavuk +3",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.FullAcc = {
    ammo="Crepuscular Pebble",
   head="Hashishin Kavuk +3",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.DT = {
    ammo="Crepuscular Pebble",
   head="Hashishin Kavuk +3",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.Fodder = {
    ammo="Crepuscular Pebble",
   head="Hashishin Kavuk +3",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
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
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's boots",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Mache Earring +1",
    left_ring="Epona's Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
     left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
      left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
	hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
      left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {    ammo="Crepuscular Pebble",
   head="Hashishin Kavuk +3",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
     left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder
	
	       sets.precast.WS['Black Halo'] = {
	    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
   head="Nyame Helm",
    body="Nyame Mail",
  hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {     ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Dbl.Atk."+6','STR+7 INT+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {      ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Dbl.Atk."+6','STR+7 INT+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {     ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Dbl.Atk."+6','STR+7 INT+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {      ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Dbl.Atk."+6','STR+7 INT+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {     ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Hashi. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Dbl.Atk."+6','STR+7 INT+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Luhlaza Shalwar +3",
    feet="Hashi. Basmak +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
      back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Luhlaza Shalwar +3",
    feet="Hashi. Basmak +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
      back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	sets.precast.WS['Flash Nova'] = {		ammo="Pemphredo Tathlum",
	head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Luhlaza Shalwar +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {		ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Luhlaza Shalwar +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
		head="Carmine Mask +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Luhlaza Jubbah +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {		ammo="Honed tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
  legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ilabrat Ring",
    back="Cornflower cape",}

	sets.midcast['Blue Magic'].Physical.Resistant = {	ammo="Honed tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
  legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ilabrat Ring",
    back="Cornflower cape",}

	sets.midcast['Blue Magic'].Physical.Fodder = {	ammo="Honed tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
  legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ilabrat Ring",
    back="Cornflower cape",}

	sets.midcast['Blue Magic'].PhysicalAcc = {	ammo="Honed tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
  legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ilabrat Ring",
    back="Cornflower cape",}

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

	sets.midcast['Blue Magic'].Magical = {
    ammo="Pemphredo Tathlum",
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
					 
	sets.midcast['Blue Magic'].Magical.Proc = {	    ammo="Pemphredo Tathlum",
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
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{    ammo="Pemphredo Tathlum",
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
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},})

	sets.midcast['Blue Magic'].Magical.Fodder = {    ammo="Pemphredo Tathlum",
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

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {neck="Quanpur Necklace",})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = { 
	  ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Aurist's Cape +1",}

	sets.midcast['Enfeebling Magic'] = {    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	 back="Aurist's Cape +1",}

	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Enhancing Magic'] = {head="Telchine Cap",neck="Melic Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{		ammo="Staunch Tathlum +1",
		 head={ name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','Blood Pact Dmg.+2','Phalanx +4','Accuracy+15 Attack+15',}},
		neck="Melic Torque",
		ear1="Mimir earring",
		ear2="Andoaa Earring",
		body={ name="Herculean Vest", augments={'Enmity+2','MND+15','Phalanx +4','Accuracy+2 Attack+2',}},
		hands="Taeon Gloves",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",
        back="Fi Follet cape +1",
		waist="Olympus sash",
		legs="Taeon Tights",
		feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},})

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
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Vengeful Ring",
		right_ring="Supershear Ring",
		   back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sanctity necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck="Sanctity necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {
	    ammo="Hydrocera",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {
	    ammo="Hydrocera",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Aurist's Cape +1",}

	sets.midcast['Blue Magic'].Stun.Resistant = {
	    ammo="Hydrocera",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Hashi. Bazu. +3",
    legs="Hashishin Tayt +3",
    feet="Hashi. Basmak +3",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Aurist's Cape +1",}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
	    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
	    ammo="Hydrocera",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = { 
	    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
    hands="Nyame Gauntlets",
    legs="Hashishin Tayt +3",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},}

	sets.midcast['Blue Magic'].Buff = { 
	    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {
	    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Hashishin Mintan +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	-- Idle sets
	sets.idle = {	
	    ammo="Crepuscular Pebble",
    head="Nyame Helm",
   body="Hashishin Mintan +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.idle.Sphere = set_combine(sets.idle, {})

	sets.idle.PDT = {    
	    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {        ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.defense.MDT = {      ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

    sets.defense.MEVA = {     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {left_ring="Shneddick Ring",}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",}
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
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Seqbron = {main="Sequence",sub="Thibron"}
	sets.weapons.Sequalmace = {main="Sequence",sub="Almace"}
	sets.weapons.Naegbron = {main="Naegling",sub="Thibron"}
	sets.weapons.Naegmace = {main="Naegling",sub="Almace"}
	sets.weapons.MagicWeapons = {main="Bunzi's Rod",sub="Sakpata's Sword"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.AM = {		    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}


	sets.engaged.Acc = {    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Acc.AM = {		    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}, }

	sets.engaged.FullAcc = {    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.FullAcc.AM = {		    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder = {	    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hashi. Earring +2",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder.AM = {	    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.DT = {     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.DT.AM = {       ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Acc.DT = {    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
				
	sets.engaged.Acc.DT.AM = {     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.FullAcc.DT = {     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder.DT = {      ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder.DT.AM = {     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {ring1="Mujin Band",}
	sets.recphalanx = 	{
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Herculean Vest", augments={'Enmity+2','MND+15','Phalanx +4','Accuracy+2 Attack+2',}},
    hands={ name="Herculean Gloves", augments={'Attack+12','Blood Pact Dmg.+9','Phalanx +5','Accuracy+15 Attack+15','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
		}	
	sets.Phalanx_Received = {
    ammo="Crepuscular Pebble",
    head={ name="Herculean Helm", augments={'CHR+9','Pet: INT+2','Phalanx +5','Accuracy+14 Attack+14',}},
    body={ name="Herculean Vest", augments={'Enmity+2','MND+15','Phalanx +4','Accuracy+2 Attack+2',}},
    hands={ name="Herculean Gloves", augments={'Attack+12','Blood Pact Dmg.+9','Phalanx +5','Accuracy+15 Attack+15','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Herculean Boots", augments={'Damage taken-1%','Pet: Haste+1','Phalanx +4','Accuracy+18 Attack+18',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
		}	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(3, 2)
	else
		set_macro_page(3, 2)
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