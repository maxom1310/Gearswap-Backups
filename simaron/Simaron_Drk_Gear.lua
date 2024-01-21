function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Prime','Anguta','Savage')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
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
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +3",}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {head={ name="Fall. Burgeonet +2", augments={'Enhances "Dark Seal" effect',}},}
	sets.precast.JA['Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.precast.JA['High Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {     ammo="Sapience Orb",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Heath. Cuirass +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+1','Mag. Acc.+5','"Mag.Atk.Bns."+5','"Fast Cast"+1',}},
    legs={ name="Odyssean Cuisses", augments={'"Fast Cast"+6','Mag. Acc.+9',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+6','CHR+2','"Mag.Atk.Bns."+5',}},
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {    ammo="Sapience Orb",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Heath. Cuirass +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+1','Mag. Acc.+5','"Mag.Atk.Bns."+5','"Fast Cast"+1',}},
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','Damage taken-5%',}},}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = { ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Metamor. ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
           
	sets.midcast['Enfeebling Magic'] = { ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Metamor. ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], { ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Chuparrosa Mantle",})
           
	sets.midcast.Stun = { ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','Damage taken-5%',}},}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Evanescence Ring",ring2="Archon Ring",back="Niht Mantle"})
	
	sets.midcast['Absorb-TP'] = {  ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Weapon skill damage +3%',}},
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	    sets.midcast['Elemental Magic'] = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.DrainWeapon = {}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	--sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 	
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    body="Crepuscular Cloak",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Odyssean Cuisses", augments={'"Fast Cast"+6','Mag. Acc.+9',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Oneiros Rope",
    left_ear="Wyvern Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Weapon skill damage +3%',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     
	
	    sets.precast.WS['Origin'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Origin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Origin'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Origin'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Origin'].Fodder = set_combine(sets.precast.WS.Fodder, {})  
           
		   
		   
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
     
            -- Idle sets
           
    sets.idle = {    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.idle.PDT = {    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
     
	sets.Kiting = {right_ring="Shneddick Ring",}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {} --head="Fallen's Burgeonet +3"
     
	-- Engaged sets
	sets.engaged = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    sets.engaged.SomeAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	sets.engaged.Acc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    sets.engaged.FullAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    sets.engaged.Fodder = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Hetairoi Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
--Example sets:
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
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Prime = {main="Foenaria", sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta", sub="Utu Grip"}
	sets.weapons.Savage = {main="Naegling",sub="Blurred Shield +1"}

	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end
end