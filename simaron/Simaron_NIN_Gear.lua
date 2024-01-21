-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
	state.HybridMode:options('Normal','DT','Tank','Evasion')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.CastingMode:options('Normal','Proc','Resistant')
	state.IdleMode:options('Normal','Evasion')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Prime','Heishi','Savage','Evis','Tank')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}

	gear.wsd_jse_back = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.da_jse_back = {name="Andartia's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle Stance')


	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {ammo="Paeapua",
        head="Dampening Tam",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Moonlight Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Amm Greaves"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +3"}
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}

    sets.precast.Flourish1 = {ammo="Togakushi Shuriken",
        head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Mekosu. Harness",hands="Adhemar Wrist. +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Andartia's Mantle",waist="Olseni Belt",legs="Hattori Hakama +1",feet="Malignance Boots"}

    -- Fast cast sets for spells

    sets.precast.FC = {    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+23','"Fast Cast"+6',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+18','"Fast Cast"+6','MND+7','Mag. Acc.+5',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+6','MND+10',}},
    feet={ name="Herculean Boots", augments={'"Fast Cast"+6','MND+5','"Mag.Atk.Bns."+15',}},
    neck="Voltsurge Torque",
    waist="Kasiri Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",feet="Hattori Kyahan +3"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {8})

    -- Snapshot for ranged
    sets.precast.RA = {}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Proc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Jin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Jin'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Jin'].Fodder = set_combine(sets.precast.WS['Blade: Jin'], {})

	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Light Belt",
    left_ear="Lugra Earring +1",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
	    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Sroda Ring",
	right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	
	
	sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {
		    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear="Hattori Earring +2",
    left_ring="Regal Ring",
	right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	sets.precast.WS['Blade: Metsu'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Metsu'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Metsu'].Fodder = set_combine(sets.precast.WS['Blade: Metsu'], {})
	
	sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS, {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
    sets.precast.WS['Blade: Chi'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Chi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Chi'].Fodder = set_combine(sets.precast.WS['Blade: Chi'], {})

    sets.precast.WS['Aeolian Edge'] = {    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Hattori Tekko +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}


	sets.precast.WS['Savage Blade'] = {
	ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS['Zesho Meppo'] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS['Blade: Kamu'] = {
	ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Lugra Earring +1",
    right_ear="Hattori Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS['Blade: Ku'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Light Belt",
    left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
    ammo="Staunch Tathlum +1",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Voltsurge Torque",
    waist="Kasiri Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.midcast.ElementalNinjutsu = {    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Hattori Tekko +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Hermetic Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Mujin Band",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})

	sets.MagicBurst = {}

    sets.midcast.NinjutsuDebuff = {    ammo="Pemphredo Tathlum",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands="Hattori Tekko +3",
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Hattori Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
	sets.midcast['Absorb-TP'] = {    ammo="Pemphredo Tathlum",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands="Hattori Tekko +3",
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Hattori Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+23','"Fast Cast"+6',}},
    body="Hattori Ningi +3",
    hands="Leyline Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Voltsurge Torque",
    waist="Kasiri Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},})

    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+23','"Fast Cast"+6',}},
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Voltsurge Torque",
    waist="Kasiri Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},})

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",right_ear="Hattori Earring +2",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",    right_ear="Hattori Earring +2",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {    ammo="Staunch Tathlum +1",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands="Hattori Tekko +3",
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Elite Royal Collar",
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Cryptic Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.idle.Evasion = set_combine(sets.idle, {      ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands="Hattori Tekko +3",
    legs="Hattori Hakama +3",
    feet="Hattori Kyahan +3",
    neck="Bathy Choker +1",
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},})

    sets.defense.PDT = {    ammo="Staunch Tathlum +1",
    head="Hattori Zukin +3",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Mpaca's Gloves",
    legs="Hattori Hakama +3",
    feet="Mpaca's Boots",
    neck="Elite Royal Collar",
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Cryptic Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

    sets.defense.MDT = {    ammo="Staunch Tathlum +1",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Mpaca's Gloves",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Mpaca's Boots",
    neck="Elite Royal Collar",
    waist="Kasiri Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.MEVA = {    ammo="Staunch Tathlum +1",
    head="Hattori Zukin +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Cryptic Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}


    sets.Kiting = {right_ring="Shneddick Ring",}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance tights",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.SomeAcc = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.Acc = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.FullAcc = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.Fodder = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.Crit = {    ammo="Date Shuriken",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Mpaca's Gloves",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Mpaca's Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Odr Earring",
	right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.DT = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.SomeAcc.DT = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Acc.DT = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.FullAcc.DT = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder.DT = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.engaged.Tank = {      ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.SomeAcc.Tank = {       ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Acc.Tank = {     ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.FullAcc.Tank = {     ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Fodder.Tank = {      ammo="Date Shuriken",
    head="Hattori Zukin +3",
    body="Hattori Ningi +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ilabrat Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.Evasion = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +3",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Hattori Earring +2",
    left_ring="Hizamaru Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},}

	sets.engaged.SomeAcc.Evasion = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +3",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Hattori Earring +2",
    left_ring="Hizamaru Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},}

	sets.engaged.Acc.Evasion = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +3",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Hattori Earring +2",
    left_ring="Hizamaru Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},}

	sets.engaged.FullAcc.Evasion = {    ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +3",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Hattori Earring +2",
    left_ring="Hizamaru Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},}

	sets.engaged.Fodder.Evasion = {     ammo="Date Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +3",
    hands="Malignance Gloves",
    legs="Hattori Hakama +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bathy Choker +1", augments={'Path: A',}},
    waist="Kasiri Belt",
    left_ear="Infused Earring",
    right_ear="Hattori Earring +2",
    left_ring="Hizamaru Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Evasion+15',}},}
	
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {}
    sets.buff.Yonin = {legs="Hattori Hakama +3"} 
    sets.buff.Innin = { head="Hattori Zukin +3"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	sets.Phalanx_Received = {    hands={ name="Herculean Gloves", augments={'Pet: DEX+4','Attack+6','Phalanx +4','Accuracy+4 Attack+4','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Herculean Trousers", augments={'Spell interruption rate down -4%','Pet: STR+3','Phalanx +4',}},
    feet={ name="Herculean Boots", augments={'Pet: STR+8','Phalanx +3','Accuracy+8 Attack+8',}}}
	-- Weapons sets
	sets.weapons.Prime = {main="Dokoku",sub="Uzura +2"}
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Yagyu Darkblade"}
	sets.weapons.Savage = {main="Naegling",sub="Yagyu Darkblade"}
	sets.weapons.Evis = {main="Tauret",sub="Yagyu Darkblade"}
	sets.weapons.Tank = {main="Tsuru", sub="Yagyu Darkblade"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end