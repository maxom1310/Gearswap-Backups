-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','DT')
	state.RangedMode:options('Normal','Acc','Fodder')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('None','Default','DualWeapons','DualSavageWeapons','DualKclub','DualEviscerationWeapons','DualMagicWeapons','DualMalevolence','Armageddon','Annihilator','Gandiva','Fomalhaut','Gastraphetes' )
	
	--Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20
	
	WeaponType =  {['Fail-Not'] = "Bow",
				   ['Fomalhaut'] = "Gun",
				   ['Ataktos'] = "Gun",
				   ['Annihilator'] = "Gun",
				   ['Armageddon'] = "Gun",
				   ['Gandiva'] = "Bow",
				   ['Gastraphetes'] = "Crossbow",
				   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Eminent Arrow",
					['WS'] = "Chrono Arrow",
					['Acc'] = "Chrono Arrow",
					['Magic'] = "Chrono Arrow",
					['MagicAcc'] = "Chrono Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Devastating Bullet",
					['Magic'] = "Devastating Bullet",
					['MagicAcc'] = "Devastating Bullet",
					['Unlimited'] = "Hauksbok Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Animikii Bullet"},
					
		['Crossbow'] = {['Default'] = "Eminent Bolt",
						['WS'] = "Quelling Bolt",
						['Acc'] = "Quelling Bolt",
						['Magic'] = "Quelling Bolt",
						['MagicAcc'] = "Quelling Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.snapshot_jse_back = {name="Belenus's Cape",augments={'"Snapshot"+10',}}
	
	    -- Additional local binds
	send_command('bind @f9 gs c cycle RangedMode') 

	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +3"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +4"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +3"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}


	-- Fast cast sets for spells

	sets.precast.FC = {
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
	head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Snapshot"+5','"Snapshot"+5',}}, --10
    body="Amini Caban +3",
	neck="Scout's Gorget +2", --4
    hands="Carmine Fin. Ga. +1", --8
    legs="Adhemar Kecks +1", --10
    feet="Meg. Jam. +2",  --10
    waist="Impulse Belt",  --3
    right_ring="Crepuscular Ring", --3
    back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},} --38
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {						 head="Orion Beret +4",
						body="Amini Caban +3",
						hands="Carmine Fin. Ga. +1", --8
							neck="Scout's Gorget +2", --4
						legs="Adhemar Kecks +1", --10
						feet="Meg. Jam. +2",  --40
						waist="Yemaya Belt",
						  right_ring="Crepuscular Ring",  --3
						back={ name="Belenus's Cape", augments={'Snapshot+10',}},})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {						 head="Orion Beret +4",
						body="Amini Caban +3",
						hands="Carmine Fin. Ga. +1", --8
							neck="Scout's Gorget +2", --4
						legs="Adhemar Kecks +1", --10
						feet="Meg. Jam. +2",  --40
						waist="Yemaya Belt",
						  right_ring="Crepuscular Ring",  --3
						back={ name="Belenus's Cape", augments={'Snapshot+10',}},})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Amini Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS.Acc = {
    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Amini Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS['Wildfire'] = {
		   head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS['Wildfire'].Acc = {
	   head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Aeolian Edge'] = {
	    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Trueflight'] = {
		    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS['Trueflight'].Acc = {
		    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Last Stand'] = {    head="Orion Beret +4",
    body="Ikenga's Vest",
    hands="Nyame Gauntlets",
    legs={ name="Arc. Braccae +4", augments={'Enhances "Eagle Eye Shot" effect',}},
    feet="Amini Bottillons +3",
   neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Last Stand'].Acc = {      head="Orion Beret +4",
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Arc. Braccae +4", augments={'Enhances "Eagle Eye Shot" effect',}},
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','Crit.hit rate+8','STR+15 AGI+15',}},
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Detonator'] = {    head="Orion Beret +4",
    body="Ikenga's Vest",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
	neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Detonator'].Acc = {    head="Orion Beret +4",
    body="Ikenga's Vest",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
	neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS['Coronach'] = {    head="Orion Beret +4",
    body="Amini Caban +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Hoxne Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Coronach'].Acc = {     head="Orion Beret +4",
    body="Amini Caban +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Arc. Braccae +4", augments={'Enhances "Eagle Eye Shot" effect',}},
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Hoxne Earring",
    right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','Crit.hit rate+8','STR+15 AGI+15',}},
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Slug Shot'] = {    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Hoxne Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS['Slug Shot'].Acc = {    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear="Hoxne Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS['Refulgent Arrow'] = {    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
   back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS['Refulgent Arrow'].Acc = {    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
   back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS['Sidewinder'] = {    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
   back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Sidewinder'].Acc = {	    head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Scout's Gorget +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
   back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS['Namas Arrow'] = { head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Hoxne Earring",
    right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','Crit.hit rate+8','STR+15 AGI+15',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Namas Arrow'].Acc = { head="Orion Beret +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear={ name="Amini Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','Crit.hit rate+8','STR+15 AGI+15',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Belenus's Cape", augments={'STR+20','Rng.Acc.+20 Rng.Atk.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS["Jishnu's Radiance"] = {    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Amini Caban +3",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Amini Bottillons +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Amini Earring +2",
	left_ring="Murky Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},}
	
	sets.precast.WS["Jishnu's Radiance"].Acc = {    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Amini Caban +3",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Amini Bottillons +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Amini Earring +2",
    left_ring="Murky Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},}
	
	sets.precast.WS['Hot Shot'] = {	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Hot Shot'].Acc = {	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Amini Earring +2",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Savage Blade'] = {   ammo="hauksbok Arrow",
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
	back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Savage Blade'].Acc = {  ammo="hauksbok Arrow",
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
	back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Adhemar Jacket +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
		
	-- Ranged sets

	sets.midcast.RA = {
    head={ name="Arcadian Beret +4", augments={'Enhances "Recycle" effect',}},
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ilabrat Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.midcast.RA.Acc = {
    head="Orion Beret +4",
    body="Orion Jerkin +4",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},}
		
	sets.midcast.RA.Fodder = {
    head={ name="Arcadian Beret +4", augments={'Enhances "Recycle" effect',}},
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Yemaya Belt",
	left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ilabrat Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +4"}
	sets.buff.Camouflage.Acc = {}
	sets.buff['Double Shot'] = {}
	sets.buff['Double Shot'].Acc = {}
	sets.buff.Barrage = {hands="Orion Bracers +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
    head="Null Masque",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
	
	-- Defense sets
	sets.defense.PDT = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}

	sets.defense.MDT = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
		
	sets.defense.MEVA = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}

	sets.Kiting = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}
	
	-- Weapons sets
	sets.weapons.Default = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Armageddon = {main="Perun +1",sub="Nusku Shield",range="Armageddon"}
	sets.weapons.Annihilator = {main="Perun +1",sub="Nusku Shield",range="Annihilator"}
	sets.weapons.Gandiva = {main="Oneiros Knife",sub="Nusku Shield",range="Gandiva"}
	sets.weapons.Fomalhaut = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Gastraphetes = {main="Tauret",sub="Nusku Shield",range="Gastraphetes"}
	sets.weapons.DualWeapons = {main="Kustawi +1",sub="Kustawi",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Crepuscular Knife",range="Sparrowhawk +2"}
	sets.weapons.DualKclub = {main="Naegling",sub="Kraken Club",range="Sparrowhawk +2"}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualMalevolence = {main="Malevolence",sub="Malevolence",range="Fomalhaut"}
	sets.weapons.DualMagicWeapons = {main="Tauret",sub="Naegling",range="Fomalhaut"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Normal melee group
	sets.engaged = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
	
	sets.engaged.Acc = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}

	sets.engaged.DTLite = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Murky Ring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
		
	sets.engaged.DT = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Murky Ring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}

	sets.engaged.DW = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
	left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
		
	sets.engaged.DW.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
    left_ring="Murky Ring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
	
	sets.engaged.DW.Acc = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
     waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
   back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",right_ring="Purity Ring"})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'NIN' then
		set_macro_page(3, 19)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 19)
	elseif player.sub_job == 'DRG' then
		set_macro_page(3, 19)
	else
		set_macro_page(3, 19)
	end
end
