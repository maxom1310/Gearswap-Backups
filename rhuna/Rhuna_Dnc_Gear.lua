-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Twashtar','Aeneas','Tauret')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AutoContradanceMode = M(false, 'Auto Contradance Mode')
	
	gear.stp_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.wsd_jse_back = {name="Senuna's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	
	-- Weapons sets
	sets.weapons.Twashtar = {main="Twashtar",sub="Fusetto +2"}
	sets.weapons.Tauret = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Twashtar"}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {} --body="Horos Casaque +1"

    sets.precast.JA['Trance'] = {head="Horos Tiara +1"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Maxixi Casaque +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Sjofn Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {back="Senuna's Mantle", head="Maxixi Tiara +2"}

    sets.precast.Jig = {} --legs="Horos Tights", feet="Maxixi Toe Shoes"

    sets.precast.Step = {    ammo="C. Palug Stone",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.Enmity = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chaac Belt",
    left_ear="Friomisi Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Ilabrat Ring",
    back="Agema Cape",}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="C. Palug Stone",
        head="Dampening Tam",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle"} --hands="Charis Bangles +2"

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --body="Charis Casaque +2"
    sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara +3"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Weather. Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Maculele Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {head="Maculele Tiara +3"})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {     ammo="Charis Feather",
    head="Gleti's Mask",
    body="Meg. Cuirie +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Maculele Earring +1",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {      ammo="Charis Feather",
    head="Gleti's Mask",
    body="Meg. Cuirie +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Maculele Earring +1",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {       ammo="Charis Feather",
    head="Gleti's Mask",
    body="Meg. Cuirie +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Maculele Earring +1",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {       ammo="Charis Feather",
    head="Gleti's Mask",
    body="Meg. Cuirie +2",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Maculele Earring +1",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",hands="Adhemar Wrist. +1",feet=gear.herculean_ta_feet})
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet +1",hands="Adhemar Wrist. +1",})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Pyrrhic Kleos'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Pyrrhic Kleos'].Fodder = set_combine(sets.precast.WS['Pyrrhic Kleos'], {})

    sets.precast.WS['Aeolian Edge'] = {    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Odr Earring",ear2="Maculele Earring +1"}
	sets.AccMaxTP = {ear1="Odr Earring",ear2="Maculele Earring +1"}
	
    sets.Skillchain = {} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Malignance Boots"}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle, {})
    
    -- Defense sets

    sets.defense.PDT = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
   right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.defense.MDT = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.defense.MEVA = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.Kiting = {right_ring="Shneddick Ring",} --feet="Skd. Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.DTLite = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.SomeAcc = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
	sets.engaged.Acc = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.FullAcc = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.Fodder = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.PDT = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.SomeAcc.PDT = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.Acc.PDT = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.FullAcc.PDT = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
     left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.Fodder.PDT = {    ammo="Yamarang",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Maculele Tiara +3"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(10, 9)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(9, 9)
    elseif player.sub_job == 'THF' then
        set_macro_page(8, 9)
    else
        set_macro_page(10, 9)
    end
end