-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Amin', 'SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','Amin','DTLite','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Prime','Twash','Tauret','Karam')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AutoContradanceMode = M(false, 'Auto Contradance Mode')
	

	
    -- Additional local binds

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
	sets.weapons.Prime = {main="Mpu Gandring",sub="Fusetto +2"}
	sets.weapons.Twash = {main="Twashtar",sub="Fusetto +2"}
	sets.weapons.Tauret = {main="Tauret",sub="Mpu Gandring"}
	sets.weapons.Karam = {main="Karambit"}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {} --body="Horos Casaque +1"

    sets.precast.JA['Trance'] = {head="Horos Tiara +1"}
	
		sets.precast.JA['Jump'] = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.precast.JA['High Jump'] = {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Maxixi Casaque +3",
    hands="Macu. Bangles +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Sjofn Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Defending Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+5','"Rev. Flourish"+30',}},}
		
	sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {body="Maxixi Casaque +3",}
    
    sets.precast.Samba = {back="Senuna's Mantle", head="Maxixi Tiara +1"}

    sets.precast.Jig = {legs="Horos Tights +2"} 

    sets.precast.Step = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body="Malignance Tabard",
    hands="Maxixi Bangles +3",
    legs="Malignance Tights",
    feet={ name="Horos T. Shoes +3", augments={'Enhances "Closed Position" effect',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
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
    sets.precast.Flourish2['Reverse Flourish'] = {back="Toetapper Mantle",hands="Macu. Bangles +3",} 

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --body="Charis Casaque +2"
    sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele Tiara +3"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Taeon Tabard", augments={'Evasion+25','"Fast Cast"+4','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Evasion+15','"Fast Cast"+5','Phalanx +3',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Taeon Boots", augments={'Evasion+20','"Fast Cast"+5','Phalanx +3',}},
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Odr Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Macu. Earring +1", 
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
	
	    sets.precast.WS["Ruthless Stroke"] = set_combine(sets.precast.WS, {hands="Maxixi Bangles +3",})
    sets.precast.WS["Ruthless Stroke"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Ruthless Stroke"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Ruthless Stroke"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Ruthless Stroke"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {       ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Pyrrhic Kleos'].FullAcc = set_combine(sets.precast.WS.FullAcc, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Pyrrhic Kleos'].Fodder = set_combine(sets.precast.WS['Pyrrhic Kleos'], {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Macu. Earring +1", 
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Senuna's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})

    sets.precast.WS['Aeolian Edge'] = {    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	
    sets.Skillchain = {} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Taeon Tabard", augments={'Evasion+25','"Fast Cast"+4','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Evasion+15','"Fast Cast"+5','Phalanx +3',}},
    legs="Malignance Tights",
    feet={ name="Taeon Boots", augments={'Evasion+20','"Fast Cast"+5','Phalanx +3',}},
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Odr Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Defending Ring",
    right_ring="Naji's Loop",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {   ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle, {})
    
    -- Defense sets

    sets.defense.PDT = {     ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.defense.MDT = {       ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.defense.MEVA = {       ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.Kiting = {right_ring="Shneddick Ring",} --feet="Skd. Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.AM = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.Amin  = {    ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body="Gleti's Cuirass",
    hands="Regal Gloves",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Ainia Collar",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Roller's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},	
	}
		
    sets.engaged.DTLite = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.SomeAcc = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
	sets.engaged.Acc = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.FullAcc = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.Fodder = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.PDT = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.SomeAcc.PDT = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.Acc.PDT = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.FullAcc.PDT = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.Fodder.PDT = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Maculele Tiara +3"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",right_ring="Purity Ring",})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end