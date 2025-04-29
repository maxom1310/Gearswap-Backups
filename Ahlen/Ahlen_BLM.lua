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

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Death')
    state.IdleMode:options('Normal', 'Death')
    
    state.MagicBurst = M(false, 'Magic Burst')
	state.Spaekona = M(false, 'Spaekona')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
    
    -- Additional local binds
    send_command('bind !` gs c toggle Spaekona')
    send_command('bind ^` gs c toggle MagicBurst')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind !`')
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
  --  sets.precast.JA['Mana Wall'] = {feet="Wicce sabots +1"}

    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

   sets.precast.FC = {
main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Sapience Orb", --2
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1','"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+2',}}, --15
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
    hands="Amalric gages +1", 
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}}, --7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}}, --12
    neck="Orunmila's Torque", --5
    waist="Witful Belt", --3
    ear2="Malignance Earring", --4
    ear1="Etiolation Earring", --1
    left_ring="Prolix Ring", --2
    right_ring="Kishar Ring", --4
    back="Taranus's cape", --0
}
sets.precast.FC['Impact'] = {
main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Sapience Orb", --2
	head=Empty,
	body="Twilight Cloak",
    hands="Amalric gages +1", 
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}}, --7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}}, --12
    neck="Orunmila's Torque", --5
    waist="Witful Belt", --3
    ear2="Malignance Earring", --4
    ear1="Etiolation Earring", --1
    left_ring="Prolix Ring", --2
    right_ring="Kishar Ring", --4
    back="Taranus's cape",
	}
   sets.precast.FC.Death = {
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum", --2
    head="amalric coif +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
    hands="Amalric gages +1", 
    legs="Amalric Slops",--7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}},--12
    neck="Orunmila's Torque", --5
    waist="Luminary sash", --3
    right_ear="loquacious Earring", --2
    left_ear="Etiolation Earring", --1
    left_ring="Prolix Ring", --2
    right_ring="Fenrir Ring +1",
    back="Swith cape +1", --4
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendicant's earring"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Digni. Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
		}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Digni. Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
		}
    
	sets.precast.WS['Myrkr'] = {
    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Lebeche Ring",
    right_ring="Fenrir Ring +1",
    back="Taranus's cape",
		}
		sets.precast.WS['Starlight'] =
		{
		    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Lebeche Ring",
    right_ring="Fenrir Ring +1",
    back="Taranus's cape",
	}
    
    ---- Midcast Sets ----
	sets.Utility = {}
	sets.Utility.Weather = {waist="Hachirin-no-obi"}
	
    sets.midcast.FastRecast = {
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Sapience Orb", --2
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1','"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+2',}}, --15
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
    hands="Amalric gages +1", 
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}}, --7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}}, --12
    neck="Orunmila's Torque", --5
    waist="Witful Belt", --3
    ear2="Malignance Earring", --2
    ear1="Etiolation Earring", --1
    left_ring="Prolix Ring", --2
    right_ring="Kishar Ring", --4
    back="Swith Cape +1", --4
}
    sets.midcast.Cure = {  --10 +5 + 16 + 3 + 7 = 41
    head="Vanya Hood",  --10
	ammo="Staunch Tathlum +1",
	neck="Elite Royal Collar",
	ear1="Etiolation earring",
	ear2="Mendicant's earring", --5
    body="Vanya Robe",
	hands="Telchine Gloves", --16
	ring1="Stikini Ring +1",
	ring2="Lebeche ring", --3
    back="Taranus's cape",
	waist="Hachirin-No-Obi",
	feet="Medium's Sabots" --7
	}
    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cure.Death = {   
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum", --2
    head="amalric coif +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
    hands="Amalric gages +1", 
    legs="Amalric Slops",--7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}},--12
    neck="Orunmila's Torque", --5
    waist="Luminary sash", --3
    right_ear="loquacious Earring", --2
    left_ear="Etiolation Earring", --1
    left_ring="Lebeche Ring", --2
    right_ring="Fenrir Ring +1",
    back="Swith cape +1", --4
	}
	
	sets.midcast['Enhancing Magic'] = {
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'DEF+18','Spell interruption rate down -9%','Enh. Mag. eff. dur. +10',}},
    neck="Melic Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Perimede Cape",
	}
	sets.midcast['Refresh'] =
	{    
	ammo="Staunch Tathlum +1",
    head="Amalric Coif +1",
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'DEF+18','Spell interruption rate down -9%','Enh. Mag. eff. dur. +10',}},
    neck="Enhancing Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Perimede Cape",
	}
	sets.midcast ['Haste'] = sets.midcast['Enhancing Magic']
	
	sets.midcast['Enhancing Magic'].Death = {ammo="Ghastly Tathlum",
        head="amalric coif +1",ear1="Etiolation Earring",ear2="Loquacious Earring",neck="Orunmila's Torque",
        body="Amalric Doublet",ring1="Prolix Ring",ring2="Fenrir Ring +1",
        back="Swith Cape +1",waist="Witful Belt",legs="Amalric slops",feet="Amalric nails"}	
   
    sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    body="Spaekona's Coat +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast['Impact'] = {
		main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head="Empty",
	body="Twilight Cloak",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
     legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
	
		
	 sets.midcast['Enfeebling Magic'].Death = {ammo="Pemphredo tathlum",
        head="amalric coif +1",neck="Orunmila's Torque",ear1="Dignitary's Earring",ear2="Loquacious earring",
        body="Amalric Doublet",hands="Amalric Gages +1",ring1="Fenrir Ring +1",ring2="Prolix Ring",
        back="Taranus's cape",waist="Eschan stone",legs="Psycloth lappas",feet="Amalric nails +1"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = { 
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
    hands="Amalric gages +1",
     legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}},
    neck="Mizu. Kubikazari",
    waist="Embla Sash",
    left_ear="Barkarole Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}

     sets.midcast.Drain = { 
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
    hands="Amalric gages +1",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}},
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-obi",
    left_ear="Barkarole Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
	hands="Nyame Gauntlets",
     legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
	feet="Nyame Sollerets",
    neck="Orunmila's Torque",
    waist="Luminary Sash",
   left_ear="Barkarole Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}
	
	sets.midcast['Death'] = {
	ammo="Pemphredo tathlum",
        head="Pixie hairpin +1",
		neck="Mizukage-no-kubikazari",
		ear1="Barkarole Earring",
		ear2="Malignance Earring",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
		hands="Amalric Gages +1",
		ring1="Archon ring",
		ring2="Metamor. Ring +1",
        back="Taranus's cape",
		waist="Hachirin-No-Obi",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}}	
		
	 sets.midcast['Dark Magic'].Death = {
		ammo="Pemphredo tathlum",
        head="Pixie hairpin +1",
		neck="Mizukage-no-kubikazari",
		ear1="Barkarole Earring",
		ear2="Malignance Earring",
        body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		ring1="Archon ring",
		ring2="Metamor. Ring +1",
        back="Taranus's cape",
		waist="Hachirin-No-Obi",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}}	
	
	sets.midcast['Death'].Death = {
		ammo="Ghastly Tathlum",
        head="Pixie hairpin +1",
		neck="Mizukage-no-kubikazari",
		ear2="Malignance Earring",
		ear1="Barkarole Earring",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
		hands="Amalric Gages +1",
		ring1="Archon ring",
		ring2="MEtamor. Ring +1",
        back="Taranus's cape",
		waist="Hachirin-No-Obi",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}}	
		
	sets.midcast.Drain.Death = {
		ammo="Ghastly tathlum",
        head="Pixie hairpin +1",
		neck="Erra Pendant",
		ear1="Barkarole Earring",
		ear2="Malignance Earring",
        body="Amalric doublet +1",
		hands="Amalric Gages +1",
		ring1="Archon ring",
		ring2="Metamor. Ring +1",
        back="Taranus's cape",
		waist="fucho-no-obi",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}
		}		

	sets.midcast.Stun.Death = {ammo="Pemphredo tathlum",
        head="amalric coif +1",neck="Mizukage-no-kubikazari",ear2="Malignance Earring",ear1="Barkarole Earring",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
		hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Fenrir ring +1",
        back="Taranus's cape",waist="Hachirin-No-Obi",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}}		
		
	sets.midcast['Aspir'].Death = sets.midcast.Drain.Death
	

    sets.midcast.BardSong = {ammo="Pemphredo Tathlum",
        head="Nahtirah Hat",neck="Incanter's torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = { 
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
	
    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Death = {
		ammo="Pemphredo tathlum",
        head="amalric coif +1",
		neck="Mizukage-no-kubikazari",
		ear1="Barkarole Earring",
		ear2="Malignance Earring",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
		hands="Amalric Gages +1",
		ring1="Shiva Ring +1",
		ring2="Metamor. Ring +1",
        back="Taranus's cape",
		waist="Orpheus's Sash",
		legs="Amalric slops",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}}
	}		

    -- Sets to return to when not performing an action.
    
    -- Resting sets
sets.resting = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Genmei Earring",
	body="Amalric Doublet +1",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",
	}
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Odnowa Earring +1",
	body="Amalric Doublet +1",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",}
    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.Death = {
		legs="Amalric slops +1",
		feet="Amalric nails +1",
        head="amalric coif +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
        body="Amalric Doublet +1",
		hands="Amalric gages +1",
		ring1="Defending ring",
		ring2="Mephitas's Ring +1",
        back="Pahtli cape",
		waist="Fucho-no-obi",
		ammo="Staunch Tathlum +1",
		neck="Elite Royal Collar",
		}

    -- Defense sets

     sets.idle.PDT = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",}
	
    sets.defense.MDT = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",}
	
	    sets.idle.Weak = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",}
    
    -- Town gear.
    sets.idle.Town = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet="Nyame Sollerets",}
        
    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Wicce sabots +1",back="Taranus's cape"}

    sets.magic_burst = {    
	head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, 
	neck="Mizukage-no-Kubikazari", 
	left_ring="Metamor. ring +1",
	right_ring ="Mujin Band"
	}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
	head="Nyame Helm",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Genmei Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Vocane Ring",
	right_ring="Defending Ring",
	back="Taranus's cape",
	waist="Eschan Stone",
	legs="Assiduity Pants +1",
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Phys. dmg. taken -4%','CHR+3','Mag. Acc.+4',}}}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.element == world.day_element or spell.element == world.weather_element then
		   equip(sets.Utility.Weather)
	end

    if spell.skill == 'Elemental Magic' and state.MagicBurst.value and spell.english ~= 'Impact' then
        equip(sets.magic_burst)
    end
	 if spell.skill == 'Elemental Magic' and state.Spaekona.value and spell.english ~= 'Impact' then
        equip({body="Spaekona's Coat +2"})
    end

end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet','back')
            equip(sets.buff['Mana Wall'])
            disable('feet','Back')
        elseif spell.skill == 'Elemental Magic' then
    --       state.MagicBurst:reset()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet','back')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 12)
end

