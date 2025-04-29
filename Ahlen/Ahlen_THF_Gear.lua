-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','DT','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Prime','Mandau','Aeneas','Aeolian','Savage','Maxtp','ProcWeapons','Evisceration','Throwing','SwordThrowing')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')



    -- Additional local binds

	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {feet="Skulk. Poulaines +3"}
    sets.Kiting = {left_ring="Shneddick Ring"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",ring1="Purity Ring"})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {}
	sets.DWMax = {body="Adhemar Jacket +1",waist="Reiki Yotai"}
	sets.Parry = {}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Prime = {main="Mpu Gandring",sub="Fusetto +2"}
	sets.weapons.Mandau = {main="Mandau",sub="Gleti's Knife"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Gleti's Knife"}
	sets.weapons.Aeolian = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Savage = {main="Naegling",sub="Fusetto +2"}
	sets.weapons.Maxtp = {main="Aeneas",sub="Fusetto +2"}
	sets.weapons.ProcWeapons = {main="Crepuscular Knife",sub="Gleti's Knife"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Throwing = {main="Mandau",sub="Gleti's Knife",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.SwordThrowing = {main="Naegling",sub="Fusetto +2",range="Raider's Bmrng.",ammo=empty}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {} 
    sets.precast.JA['Steal'] = {} --feet="Pillager's Poulaines +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines +3"} --legs="Skulker's Culottes",
    sets.precast.JA['Perfect Dodge'] = {}  --hands="Plunderer's Armlets +1"
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Skulk. Poulaines +3",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Enchntr. Earring +1",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Valseur's Ring",
    back="Moonlight Cape",}

	sets.Self_Waltz = {}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {    ammo="Impatiens",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Skulk. Poulaines +3",
    neck="Orunmila's Torque",
    waist="Chaac Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring="Prolix Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Asn. Gorget +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Rudra's Storm"].DT = set_combine(sets.precast.WS["Rudra's Storm"],{})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
	
	    sets.precast.WS["Ruthless Stroke"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Ruthless Stroke"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Ruthless Stroke"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Ruthless Stroke"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Ruthless Stroke"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
	sets.precast.WS["Ruthless Stroke"].DT = set_combine(sets.precast.WS["Rudra's Storm"],{})
    sets.precast.WS["Ruthless Stroke"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Ruthless Stroke"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Ruthless Stroke"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"],{})
	sets.precast.WS["Savage Blade"].DT = set_combine(sets.precast.WS["Savage Blade"],{})
    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1"})

    sets.precast.WS.Proc = {    ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.precast.WS['Last Stand'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Empyreal Arrow'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Aeolian Edge'] = {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Toutatis's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Skulk. Poulaines +3",
    neck="Orunmila's Torque",
    waist="Cornelia's Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Prolix Ring",
    back="Moonlight Cape",}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {    ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Svelt. Gouriz +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {}

    -- Defense sets

    sets.defense.PDT = {    ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Svelt. Gouriz +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.defense.MDT = {    ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Svelt. Gouriz +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
	sets.defense.MEVA = {    ammo="Aurgelmir Orb +1",
    head="Turms Cap +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Svelt. Gouriz +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.SomeAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
    
	sets.engaged.Acc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.FullAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Moonlight Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.Fodder = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Epona's",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.DT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.SomeAcc.DT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Acc.DT = {   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}

    sets.engaged.FullAcc.DT = {   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.engaged.Fodder.DT = {   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear={ name="Skulk. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Defending Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 1)
    else
        set_macro_page(3, 1)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 060')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 060')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 060')
		else
			windower.chat.input('/lockstyleset 060') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 060')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 060')
		else
			windower.chat.input('/lockstyleset 060') --Catchall just in case something's weird.
		end
	end
end

autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['Throwing']="Rudra's Storm",['SwordThrowing']='Savage Blade',['Evisceration']='Evisceration',['ProcWeapons']='Wasp Sting',['Bow']='Empyreal Arrow'}