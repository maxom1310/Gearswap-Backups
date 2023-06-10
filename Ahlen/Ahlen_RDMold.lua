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
    state.Buff.Saboteur = buffactive.saboteur or false
end
    function file_unload()
	
        send_command('unbind @f9')
        send_command('unbind !f9')
        send_command('unbind ^f9')
		send_command('unbind !^f9')

       
 
    end   
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Melee', 'ZeroTP')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.GainSpell = M{['description']='GainSpell', 'Gain-STR', 'Gain-INT', 'Gain-AGI', 'Gain-VIT', 'Gain-DEX', 'Gain-MND', 'Gain-CHR'}
    gear.default.obi_waist = ""
    select_default_macro_book()
	
		send_command('bind !f9 input /equipset 13;wait1;input /echo Daybreak + shield')
		send_command('bind @f9 input /equipset 14;wait1;input /echo Savage Blade')
		send_command('bind ^f9 input /equipset 15;wait1;input /echo Seraph Blade')
		send_command('bind !^f9 input /equipset 16;wait1;input /echo Zero TP ')	
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
  
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +1"}
	sets.precast.JA['Saboteur'] = {hands="Lethargy Gantherots +1"}
    
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {
		ammo="Sapience Orb", --2
		head={ name="Merlinic Hood", augments={'Mag. Acc.+1','"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+2',}}, --15
		neck="Orunmila's Torque", --5
		ear1="Enchanter Earring +1", --2%
		ear2="Malignance Earring", --4
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
		hands="Gendewitha Gages +1", --7
		left_ring="Kishar Ring", 
		right_ring="Prolix Ring", --2
		back="swith cape +1", --4
		waist="Witful Belt",  --3
		legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}}, --7
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}}}

	sets.precast.FC['Healing Magic'] = {
		ammo="Sapience Orb", --2
		head={ name="Merlinic Hood", augments={'Mag. Acc.+1','"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+2',}}, --15
		neck="Orunmila's Torque", --5
		ear1="Enchanter Earring +1", --2%
		ear2="Malignance Earring", --1
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},  --12
		hands="Gendewitha Gages +1", --7
		left_ring="Kishar Ring", 
		right_ring="Prolix Ring", --2
		back="swith cape +1", --4
		waist="Witful Belt",  --3
		legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}}, --7
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}}}
		
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. Houseaux +3",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Shukuyu Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",legs="Carmine Cuisses +1",feet="Nyame Sollerets", ring1="Ilabrat Ring",
		ring2="Apate Ring", back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Fotia Belt",ammo="Coiste Bodhar"}
		
	sets.precast.WS['Savage Blade'] =	{
     ammo="Crepuscular Pebble",
    head="Nyame helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck="Dls. Torque +2",
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}

    sets.precast.WS['Sanguine Blade'] = {    
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Jhakri Cuffs +2",
    legs="Amalic Slops +1",
    feet="Leth. Houseaux +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
     back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	 }
    
	sets.precast.WS['Aeolian Edge'] = {
	    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
    -- Midcast Sets
	sets.precast.WS['Seraph Blade'] = {
	    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="fotia gorget",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS['Red Lotus Blade'] = {
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Jhakri Cuffs +2",
    legs="Amalric Slops +1",
    feet="Leth. Houseaux +3",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
     back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
    
    sets.midcast.FastRecast = {    
	ammo="Impatiens",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+1','"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+2',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+12','"Fast Cast"+6','MND+7','"Mag.Atk.Bns."+11',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
  legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+8',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
	}
	
	sets.midcast['Flash'] = {ammo="Sapience Orb",
        head="Rabid Visor",neck="Warder's Charm +1",ear1="Cryptic Earring",ear2="Friomisi earring",
        body="Emet Harness +1",hands="Leyline Gloves",ring1="Supershear Ring",ring2="Eihwaz Ring",
        back="Reiki Cloak",waist="Tempus Fugit",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
	
	sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Chironic Doublet", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+2','MND+1','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs="Nyame Flanchard",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Lebeche Ring",
    back="Sucellos's Cape",
		}
	
   sets.midcast['Cursna'] = {head="Vanya Hood",
    body="Rosette Jaseran +1",hands="Kaykaus Cuffs",ring1="Haoma's Ring",ring2="Haoma's Ring",
	ear1="Etiolation Earring",ear2="Magnetic Earring",ammo="Staunch Tathlum +1", neck="Debilis Medallion",
    waist="Gishdubar Sash",legs="Atrophy Tights +1",feet="Vanya Clogs",
	back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}}}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {neck="Phalaina Locket",ring2="Vocane Ring +1",waist="Gishdubar Sash",hands="Buremte gloves"}

	sets.midcast['Enhancing Magic'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands="Atrophy gloves +1",
    legs="Carmine Cuisses +1",
    feet="Leth. Houseaux +3",
   neck="Dls. Torque +2",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ghostfyre cape",
	}
		
	sets.midcast['Haste'] = sets.midcast['Enhancing Magic']
	sets.midcast['Haste II'] =sets.midcast['Enhancing Magic']
    sets.midcast.Stoneskin = {}
	sets.midcast['Flurry II'] = sets.midcast['Enhancing Magic']
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {waist="Emphatikos Rope", main="Vadose Rod", head="amalric coif +1"})
	
	sets.midcast['Enfire'] = {     
	ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Carmine Cuisses +1",
    feet="Leth. Houseaux +3",
    neck="Melic Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},}
   	
	sets.midcast['Temper II'] = {
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Carmine Cuisses +1",
    feet="Leth. Houseaux +3",
    neck="Melic Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	}

	sets.midcast['Gain-MND'] = {
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	}
	
	sets.midcast['Gain-INT'] = sets.midcast['Gain-MND'] 
	sets.midcast['Gain-DEX'] = sets.midcast['Gain-MND'] 
	sets.midcast['Gain-STR'] = sets.midcast['Gain-MND']  
	sets.midcast['Enwater'] = sets.midcast['Enfire']
	sets.midcast['Enstone'] = sets.midcast['Enfire']
	sets.midcast['Enthunder'] = sets.midcast['Enfire']
	sets.midcast['Enaero'] = sets.midcast['Enfire']
	sets.midcast['Enblizzard'] = sets.midcast['Enfire']
	sets.midcast['Enfire II'] = sets.midcast['Enfire']
	sets.midcast['Enwater II'] = sets.midcast['Enfire']
	sets.midcast['Enstone II'] = sets.midcast['Enfire']
	sets.midcast['Enthunder II'] = sets.midcast['Enfire']
	sets.midcast['Enaero II'] = sets.midcast['Enfire']
	sets.midcast['Enblizzard II'] = sets.midcast['Enfire']
	
	
	sets.midcast['Phalanx II'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands="Atrophy Gloves +1",
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	}

	sets.midcast['Phalanx'] = sets.midcast['Phalanx II']
	
    sets.midcast.Refresh = {
    ammo="Impatiens",
    head="Amalric Coif +1",
      body="Atrophy Tabard +3",
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Lebeche Ring",
    right_ring="Defending Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	
	}
	
	sets.midcast['Refresh III'] = sets.midcast.Refresh
	sets.midcast['Refresh II'] = sets.midcast.Refresh
	
	sets.midcast['Enfeebling Magic'] = {
    ammo="Regal Gem",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
	body="Atrophy Tabard +3",
    hands="Kaykaus Cuffs +1",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	   
   sets.midcast['Distract III'] = {
     ammo="Regal Gem",
    head="Ea Hat +1",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.midcast['Frazzle III'] = sets.midcast['Distract III']
	sets.midcast['Frazzle II'] = sets.midcast['Distract III']
	sets.midcast['Frazzle'] = sets.midcast['Distract III']
	sets.midcast['Distract II'] = sets.midcast['Distract III']
	sets.midcast['Distract'] = sets.midcast['Distract III']
		
	sets.midcast['Blind II'] = {
    ammo="Regal Gem",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
	     
	sets.midcast['Blind'] = sets.midcast['Blind II']
	sets.midcast['Gravity'] = sets.midcast['Blind II']
	sets.midcast['Gravity II'] = sets.midcast['Blind II']
	sets.midcast['Sleep II'] = sets.midcast['Blind II']
	sets.midcast['Sleep'] = sets.midcast['Blind II']
	sets.midcast['Sleepga'] = sets.midcast['Blind II']
	sets.midcast['Break'] = sets.midcast['Blind II']
	sets.midcast['Poison II'] = sets.midcast['Blind II']
	sets.midcast['Dispel'] = sets.midcast['Blind II']
	
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +1"})
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +1"})
    
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	 }
		
	sets.midcast.mb = {    
	ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}
        
    sets.midcast['Impact'] = {
    ammo="Pemphredo Tathlum",
	head=empty,
    body="Twilight Cloak",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

    sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ea Slops +1",
    feet="Leth. Houseaux +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

   sets.midcast['Stun'] = {
    ammo="Regal Gem",
    head="Malignance Chapeau",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+1',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-Obi", head="Pixie hairpin +1",ring1="Evanescence ring",ring2="Archon Ring"})
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Fire III'] = sets.midcast.mb
	sets.midcast['Fire IV'] = sets.midcast.mb
	sets.midcast['Fire V'] = sets.midcast.mb
	sets.midcast['Water III'] = sets.midcast.mb
	sets.midcast['Water IV'] = sets.midcast.mb
	sets.midcast['Water V'] = sets.midcast.mb
	sets.midcast['Stone III'] = sets.midcast.mb
	sets.midcast['Stone IV'] = sets.midcast.mb
	sets.midcast['Stone V'] = sets.midcast.mb
	sets.midcast['Aero III'] = sets.midcast.mb
	sets.midcast['Aero IV'] = sets.midcast.mb
	sets.midcast['Aero V'] = sets.midcast.mb
	sets.midcast['Blizzard III'] = sets.midcast.mb
	sets.midcast['Blizzard IV'] = sets.midcast.mb
	sets.midcast['Blizzard V'] = sets.midcast.mb
	sets.midcast['Thunder III'] = sets.midcast.mb
	sets.midcast['Thunder IV'] = sets.midcast.mb
	sets.midcast['Thunder V'] = sets.midcast.mb
	
	sets.midcast.Dia = {head="White Rarab cap +1", waist="Chaac Belt", 
	legs={ name="Merlinic Shalwar", augments={'Accuracy+1','Magic dmg. taken -1%','"Treasure Hunter"+2','Accuracy+10 Attack+10',}}}
	sets.midcast.Diaga = {head="White Rarab cap +1", waist="Chaac Belt", 
	legs={ name="Merlinic Shalwar", augments={'Accuracy+1','Magic dmg. taken -1%','"Treasure Hunter"+2','Accuracy+10 Attack+10',}}}
	sets.midcast['Dia II'] = {head="White Rarab cap +1", waist="Chaac Belt", 
	legs={ name="Merlinic Shalwar", augments={'Accuracy+1','Magic dmg. taken -1%','"Treasure Hunter"+2','Accuracy+10 Attack+10',}}}

    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration ={
    ammo="Pemphredo Tathlum",
    head="Telchine Cap",
    body="Telchine Chas.", 
    hands="Atrophy Gloves +1", 
    legs="Telchine Braconi",
    feet="Leth. Houseaux +3",
    neck="Dls. Torque +2",
    waist="Hachirin-no-Obi",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	}

    sets.buff.Saboteur = {}
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Atrophy Tabard +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}
    
    -- Idle sets
    sets.idle = {    
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Atrophy Tabard +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}
  
    sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Atrophy Tabard +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}

    sets.idle.PDT = {	
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}

    sets.idle.MDT = {	
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}
    
    -- Defense sets
    sets.defense.PDT = {	
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}

    sets.defense.MDT = {	
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Sucellos's Cape",
	}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
     sets.engaged = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
		}
		
	sets.engaged.Melee = {   
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
	
	sets.engaged.ZeroTP = {
	--	Main="Ceremonial Dagger",
	--	sub="Ceremonial Dagger",
    ammo="Regal Gem",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Dls. Torque +1",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
		}
		
		

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
			equip(sets.buff.Saboteur)
	
	elseif spell.skill == 'Enhancing Magic' then
			if spell.english:startswith('Gain') then
			equip(sets.midcast['Gain-MND']) 
			else
        equip(sets.midcast.EnhancingDuration)
		end
				
       if buffactive.composure and spell.target.type == 'PLAYER' then
           equip(sets.buff.ComposureOther)
        end
	
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end 

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast.mb, {waist="Hachirin-No-Obi"})
        end
		if spell.english == 'Impact' then
		equip(sets.midcast['Impact'],{waist="Hachirin-No-Obi"})
    end
	end
	 if spell.skill == 'Dark Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Dark Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function midcast(spell)
    if spell.name == 'Utsusemi: Ichi' then
        send_command('cancel Copy Image|Copy Image (2)')
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'SCH' then
        set_macro_page(3, 4)
	 elseif player.sub_job == 'PLD' then
        set_macro_page(3, 4)	
    else
        set_macro_page(3, 4)
    end
end

