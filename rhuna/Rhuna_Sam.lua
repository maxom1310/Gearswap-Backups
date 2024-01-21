-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Meva','Hybrid','Nyame','Subtle')
    state.HybridMode:options()--'Normal', 'PDT', 'Reraise'
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options()--'PDT', 'Reraise')

    update_combat_form()
    
    -- Additional local binds
	send_command('bind f9 gs c cycle OffenseMode')
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
		send_command('bind ^f9 input /equipset 21;wait1;input /echo Doji')
		send_command('bind !f9 input /equipset 22;wait1;input /echo Soboro')
		send_command('bind @f9 input /equipset 24;wait1;input /echo Masamune')	
		send_command('bind ^!f9 input /equipset 23;wait1;input /echo Shining One')
		send_command('bind !f11 gs disable main;wait1;input /echo Disable Main')
		send_command('bind !f12 gs enable main;wait1;input /echo Enable Main')
		
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
	        send_command('unbind @f9')
			   send_command('unbind f9')
        send_command('unbind !f9')
        send_command('unbind ^f9')
		send_command('unbind !^f9')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto",hands="Sakonji Kote +3", back="Smertrios's Mantle"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}
	sets.precast.JA['Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands="Wakido Kote +3",
    legs="Kasuga Haidate +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Weapon skill damage +3%',}},
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring +1",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.precast.JA['High Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands="Wakido Kote +3",
    legs="Kasuga Haidate +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Weapon skill damage +3%',}},
    left_ring="Ilabrat Ring",
    right_ring="Chirich Ring +1",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main="Dojikiri Yasutsuna",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Samurai's Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {waist="Sailfi Belt +1",})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Samurai's Nodowa +2",})
    sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {})

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {head="Mpaca's Cap", })
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget"})
    sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Fotia Belt"})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Samurai's Nodowa +2",feet="Nyame Sollerets",})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {helm="Nyame Helm",
	neck="Samurai's Nodowa +2",left_ear="Digni. Earring",
    left_ring="Regal Ring", right_ring="Metamor. Ring +1",})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Kasuga Haidate +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Ephramad's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {  
    main="Shining One",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},})

    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	sets.precast.WS['Tachi: Kagero'] = set_combine(sets.precast.WS, {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
		sets.precast.WS['Tachi: Koki'] = set_combine(sets.precast.WS, {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	})


    -- Midcast Sets
    sets.midcast.FastRecast = {
    ammo="Sapience Orb",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Orunmila's Torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Prolix Ring",
    back="Moonlight Cape",}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",
	}
    
    sets.idle.Field = {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",}

    sets.idle.Weak = {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Thrud Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",}
    
    -- Defense sets
    sets.defense.PDT = {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",
    hands="Wakido Kote +3",
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}

    sets.defense.Reraise = {
        ammo="Staunch Tathlum +1",
        head="Twilight Helm",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Zennaroi Earring",
        body="Twilight Mail",
		hands="Kurys Gloves",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"}

    sets.defense.MDT = {
    main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Mpaca's Doublet",
    hands="Wakido Kote +3",
    legs="Mpaca's Hose",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}

    sets.Kiting = {}--feet="Danzo Sune-ate"}

    sets.Reraise = {}--head="Twilight Helm",body="Twilight Mail"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged.Normal = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands="Nyame Gauntlets",
    legs="Kasuga Haidate +3",
    feet="Ken. Sune-Ate +1",
    neck="Moonlight Nodowa",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    right_ring="Niqmaddu Ring",
    left_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
		
    sets.engaged.Meva = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ken. Jinpachi +1",
    body="Kasuga Domaru +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Kasuga Haidate +3",
    feet="Ken. Sune-Ate +1",
    neck="Moonlight Nodowa",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    right_ring="Niqmaddu Ring",
    left_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	sets.engaged.Hybrid = {
    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Kasuga Domaru +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Kasuga Haidate +3",
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Moonlight Nodowa",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    right_ring="Niqmaddu Ring",
    left_ring="Defending Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
		
	
	sets.engaged.Nyame = {
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Kasuga Domaru +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Kasuga Haidate +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Moonlight Nodowa",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    right_ring="Niqmaddu Ring",
    left_ring="Ilabrat Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	
	sets.engaged.Subtle = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ken. Jinpachi +1",
    body="Dagon Breast.",
    hands="Wakido Kote +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Ken. Sune-Ate +1",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Digni. Earring",
    right_ring="Niqmaddu Ring",
    left_ring="Defending Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	
    sets.engaged.Meva.PDT = {
      main={ name="Dojikiri Yasutsuna", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1",
    body="Ken. Samue +1",
    hands="Wakido Kote +3",
    legs="Ken. Hakama +1",
    feet="Ken. Sune-Ate +1",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
  }
		
    sets.engaged.Reraise = {
		ammo="Staunch Tathlum +1",
        head="Twilight Helm",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Zennaroi Earring",
        body="Twilight Mail",
		hands="Wakido Kote +3",
		ring1="Defending Ring",
		ring2="Vocane Ring",
    back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Valorous Hose",
		feet="Amm Greaves"}
		
    sets.engaged.Meva.Reraise = {
		ammo="Staunch Tathlum +1",
        head="Twilight Helm",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Zennaroi Earring",
        body="Twilight Mail",
		hands="Kurys Gloves",
		ring1="Defending Ring",
		ring2="Vocane Ring",
    back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Valorous Hose",
		feet="Amm Greaves"}
        


    sets.buff.Sekkanoki = {}--hands="Unkai Kote +2"}
    sets.buff.Sengikori = {}--feet="Unkai Sune-ate +2"}
    sets.buff['Meikyo Shisui'] = {}--feet="Sakonji Sune-ate"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        -- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
        if player.equipment.main=='Quint Spear' or player.equipment.main=='Quint Spear' then
            if spell.english:startswith("Tachi:") then
                send_command('@input /ws "Penta Thrust" '..spell.target.raw)
                eventArgs.cancel = true
            end
        end
    end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function update_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
    --    state.CombatForm:set('Adoulin')
    else
        state.CombatForm:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 2)
    else
        set_macro_page(2, 2)
    end
end
