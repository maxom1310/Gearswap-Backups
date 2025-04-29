-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:64

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
		In-game macro: /console gs c scholar xxx

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    state.MagicBurst = M(false, 'Magic Burst')
	
        info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder", 
	                   "Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
					   "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
					   "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
	                   "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
    info.mid_nukes = S{}
    info.high_nukes = S{}
	

	send_command('bind ^` gs c toggle MagicBurst')
	send_command('bind f11 gs c cycle IdleMode')
	send_command('bind f9 gs c reset DefenseMode')
	send_command('bind f12 gs enable all;gs equip sets.idle.Field;wait 1; gs disable main; gs disable sub;input /echo Locked weapon')
	send_command('bind !f12 gs enable all;gs equip sets.idle.Field;wait 1; input /echo Unlocked Weapon')
	send_command('bind !f11 gs enable all;gs equip sets.idle.PDT;wait 1; gs disable main; gs disable sub;input /echo Malignance Pole Locked')
    select_default_macro_book()
end

function user_unload()

	send_command('unbind ^`')
	send_command('unbind f9')
	send_command('unbind f11')
	send_command('unbind f12; gs enable all;')
	send_command('unbind !f11')
	send_command('unbind !f12')



end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Dark Arts'] = {"Academic's Gown +1"}
	sets.precast.JA['Light Arts'] = {"Academic's Pants +1"}
	
	organizer_items = {}


	-- Fast cast sets for spells

	sets.precast.FC = {
    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body="Merlinic Jubbah",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Enchanter's Earring +1",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
		}  --12
-- 2+15+5+2+1+12+7+2+4+3+7+12= 72
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
   ammo="Staunch Tathlum +1",
    head="Pixie Hairpin +1",
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
    back="Moonlight Cape",
	}


	-- Midcast Sets

	sets.midcast.FastRecast = {     ammo="Staunch Tathlum +1",
    head="Agwu's Cap",
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Elite Royal Collar",
    waist="Cornelia's Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",}

	-- Cure Sets
	
	sets.midcast.Cure = {
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','"Cure" potency +7%',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Mendi. Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",}

	sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {
	    waist="Hachirin-no-obi"})

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {
	main="Bolelabunga",
	sub="Ammurapi shield",
	head="Arbatel Bonnet +1",
	neck="Elite Royal Collar",
	ear1="Etiolation Earring",
	ear2="Genmei Earring",
	body="Telchine Chasuble",
	left_ring="Defending Ring",
	right_ring="Vocane Ring",
	back="Bookworm's Cape",
	hands="Telchine Gloves",
	waist="Embla sash",
	legs="Telchine Braconi",
	feet="Telchine Pigaches"}
	
	-- Enhancing Magic Sets
	
	sets.midcast['Enhancing Magic'] = {
	main="Gada",
	sub="Ammurapi shield",
	head="Telchine Cap",
	ear1="Andoaa Earring",
	ear2="Mimir Earring",
	neck="Elite Royal Collar",
	left_ring="Defending Ring",
	right_ring="Stikini Ring +1",
	body="Telchine Chasuble",
	back="Moonlight Cape",
	hands="Telchine Gloves",
	waist="Embla sash",
	legs="Telchine Braconi",
	feet="Telchine Pigaches"
	}

	sets.midcast.Cursna = {
		neck="Malison Medallion",left_ring="Haoma's Ring",right_ring="Ephedra Ring",feet="Gendewitha Galoshes +1"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Storm = {
	main="Daybreak",
	sub="Ammurapi Shield",
	head="Telchine Cap",
	ear1="Andoaa Earring",
	body="Telchine Chasuble",
	hands="Telchine Gloves",
	waist="Hachirin-no-obi",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",
	}

	sets.midcast.Protect = {left_ring="Sheltered Ring",
		main="Daybreak",
	sub="Ammurapi Shield",
	head="Telchine Cap",
	ear1="Andoaa Earring",
	body="Telchine Chasuble",
	hands="Telchine Gloves",
	waist="Hachirin-no-obi",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",}
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = {
		main="Daybreak",
	sub="Ammurapi Shield",
	left_ring="Sheltered Ring",
		head="Telchine Cap",
	ear1="Andoaa Earring",
	body="Telchine Chasuble",
	waist="Hachirin-no-obi",
	hands="Telchine Gloves",
	legs="Telchine Braconi",
	feet="Telchine Pigaches",}
	sets.midcast.Shellra = sets.midcast.Shell
	sets.midcast.Haste = sets.midcast.Storm
	sets.midcast.Erase = sets.midcast.FastRecast


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    body={ name="Chironic Doublet", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+2','MND+1','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet="Nyame Sollerets",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles

	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
	
	sets.midcast.Kaustra = sets.midcast['Elemental Magic']

	sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+11%','"Mag.Atk.Bns."+14',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Crep. Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Erra pendant",
		waist="Fucho-no-obi"
		})

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    body={ name="Chironic Doublet", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+2','MND+1','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}},
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Agwu's Cap",
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Bookworm's Cape",
	 }

	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic'] 

	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'] )
	


	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].HighTierNuke)
	


	sets.midcast.Impact = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body="Twilight Cloak",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','AGI+6',}},
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Barkaro. Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
	sets.midcast.Helix = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Agwu's Cap",
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
	left_ring="Freke Ring",
    right_ring="Metamor. Ring +1",
    back="Bookworm's Cape",
	}

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	}


	sets.idle.Field = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	}

	sets.idle.Weak = sets.idle.Field
	
	-- Defense sets

	sets.idle.PDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	} 
	
	sets.defense.PDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	}

	sets.defense.MDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	}

	sets.Kiting = {feet="Herald's Gaiters"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Lugalbanda Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back="Bookworm's Cape",
	}--



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
--	sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
	sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
	sets.buff['Penury'] = {legs="Arbatel Pants +1"}
	sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Alacrity'] = {head="Nahtirah Hat",feet="Pedagogy Loafers +1"}
	sets.buff['Stormsurge'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1"}
	sets.midcast.Noctohelix = set_combine(sets.midcast.Helix, {head="Pixie Hairpin +1",right_ring="Archon Ring"})
	sets.midcast['Noctohelix II'] = set_combine(sets.midcast.Helix, {head="Pixie Hairpin +1",right_ring="Archon Ring"})
	sets.midcast.Luminohelix = set_combine(sets.midcast.Helix, {main="Daybreak",})
	sets.midcast['Luminohelix II'] = set_combine(sets.midcast.Helix, {main="Daybreak",})

	
	
	
	sets.magic_burst = {}

	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
	if spell.skill == ('Elemental Magic' and spell.element == world.day_element or 'Elemental Magic' and spell.element == world.weather_element) and spell.skill ~= 'Helix' then
        equip ({waist="Hachirin-no-Obi"})
    
    end
	if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value then
        equip(sets.magic_burst)
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
    if buff == "Sublimation: Activated" then
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
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false
    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


function display_current_caster_state()
	local msg = ''

	if state.OffenseMode.value ~= 'None' then
		msg = msg .. 'Melee'

		if state.CombatForm.has_value then
			msg = msg .. ' (' .. state.CombatForm.value .. ')'
		end
        
		msg = msg .. ', '
	end

	msg = msg .. 'Idle ['..state.IdleMode.value..'], Casting ['..state.CastingMode.value..']'

	add_to_chat(122, msg)
	local currentStrats = get_current_strategem_count()
	local arts
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		arts = 'Light Arts'
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		arts = 'Dark Arts'
	else
		arts = 'No Arts Activated'
	end
	add_to_chat(122, 'Current Available Strategems: ['..currentStrats..'], '..arts..'')
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use
	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	end

	local currentStrats = get_current_strategem_count()
	local newStratCount = currentStrats - 1
	local strategem = cmdParams[2]:lower()
	
	if currentStrats > 0 and strategem ~= 'light' and strategem ~= 'dark' then
		add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
	elseif currentStrats == 0 then
		add_to_chat(122, '***Out of strategems! Canceling...***')
		return
	end

	if strategem == 'light' then
		if buffactive['light arts'] then
			send_command('input /ja "Addendum: White" <me>')
			add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
		elseif buffactive['addendum: white'] then
			add_to_chat(122,'Error: Addendum: White is already active.')
		elseif buffactive['dark arts']  or buffactive['addendum: black'] then
			send_command('input /ja "Light Arts" <me>')
			add_to_chat(122, '***Changing Arts! Current Charges Available: ['..currentStrats..']***')
		else
			send_command('input /ja "Light Arts" <me>')
		end
	elseif strategem == 'dark' then
		if buffactive['dark arts'] then
			send_command('input /ja "Addendum: Black" <me>')
			add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
        elseif buffactive['addendum: black'] then
			add_to_chat(122,'Error: Addendum: Black is already active.')
		elseif buffactive['light arts'] or buffactive['addendum: white'] then
			send_command('input /ja "Dark Arts" <me>')
			add_to_chat(122, '***Changing Arts! Current Charges Available: ['..currentStrats..']***')
		else
			send_command('input /ja "Dark Arts" <me>')
		end
	elseif buffactive['light arts'] or buffactive['addendum: white'] then
		if strategem == 'cost' then
			send_command('@input /ja Penury <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Celerity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Accession <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Rapture <me>')
		elseif strategem == 'duration' then
			send_command('@input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Altruism <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Tranquility <me>')
		elseif strategem == 'skillchain' then
			add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: White" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	elseif buffactive['dark arts']  or buffactive['addendum: black'] then
		if strategem == 'cost' then
			send_command('@input /ja Parsimony <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Alacrity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Manifestation <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Ebullience <me>')
		elseif strategem == 'duration' then
			add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Focalization <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Equanimity <me>')
		elseif strategem == 'skillchain' then
			send_command('@input /ja Immanence <me>')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: Black" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		add_to_chat(123,'No arts has been activated yet.')
	end
end

function get_current_strategem_count()
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]

	local maxStrategems = math.floor(player.main_job_level + 10) / 20

	local fullRechargeTime = 5*33

	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
	
	return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 8)	
    elseif player.sub_job == 'WHM' then
        set_macro_page(2, 8)
	end	
end
