-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc','Crit')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualSavage','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualRanged','SWSavage','SWWildfire','Low','DualWildMelee','None')
	state.CompensatorMode:options('Always','300','1000','Never')
	
	send_command('lua l autocor')
    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')

--	send_command('bind !f7 gs c toggle CompensatorMode')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')


    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {}--legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

    sets.precast.CorsairRoll = {main={ name="Rostam", augments={'Path: C',}},
	  range="Compensator",
    head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Regal Necklace",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +3"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+3','"Mag.Atk.Bns."+29','Damage taken-3%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},feet="Chass. Bottes +1"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+3','"Mag.Atk.Bns."+29','Damage taken-3%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},feet="Chass. Bottes +1"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+3','"Mag.Atk.Bns."+29','Damage taken-3%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+3','"Mag.Atk.Bns."+29','Damage taken-3%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})
	
	sets.precast.CorsairShot['Earth Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Voltsurge Torque",
    waist="Orpheus's Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.RAbullet,
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="Oshosi Vest",
    hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
	legs="Chas. Culottes +3",
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Impulse belt",
    left_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
     head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
    sets.precast.WS.Acc = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}		
		
    sets.precast.WS.Proc = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Chasseur's Gants +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Commodore charm +2",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Chasseur's Gants +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Commodore charm +2",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
	waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
    head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck="Sibyl Scarf",
   -- waist="Hachirin-no-Obi",
	 waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,   head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
   -- waist="Hachirin-no-Obi",
	 waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
    head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
   -- waist="Hachirin-no-Obi",
	 waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast['Evisceration'] = {
	   range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    head="Mummu Bonnet +2",
    body="Meg. Cuirie +2",
    hands="Chasseur's Gants +3",
    legs="Mummu Kecks +2",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Odr Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epona's Ring",
	back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    sets.precast.WS['Hot Shot'] = {ammo=gear.MAbullet,
	  head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
   -- waist="Hachirin-no-Obi",
	 waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
    sets.precast.WS['Hot Shot'].Acc = {ammo=gear.MAbullet,
	  head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore Charm +2",
   -- waist="Hachirin-no-Obi",
	 waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {	
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},}
	
			sets.precast.WS['Fast Blade'] = {
	    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
	}
		sets.precast.WS['Flat Blade'] = {
	    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {}
        
    -- Specific spells

	sets.midcast.Cure = {
       ear2="Mendi. Earring",
      hands="Leyline Gloves",ring2="Lebeche Ring",
}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},}
		
		sets.midcast.RA.Crit = {ammo=gear.RAbullet,
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Damage taken-5%',}},}	
	
	sets.midcast.RA.AM = {ammo=gear.RAbullet,
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +2",
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Begrudging Ring",
    right_ring="Mummu Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10','Damage taken-5%',}},}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +3",
		hands="Lanun gants +3",
		feet="Oshosi Leggings +1",}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}

    sets.defense.MDT = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
   right_ring="Shneddick Ring",
    back={ name="Camulus's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},}

    sets.Kiting = {right_ring="Shneddick Ring",}--legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}

	-- Weapons sets
	sets.weapons.Default = {main="Naegling",sub="Blurred Knife +1", range="Anarchy +2",}
	sets.weapons.SWSavage = {main="Naegling",sub="Nusku Shield",range="Anarchy +2",}
	sets.weapons.DualSavage = {main="Naegling",sub="Blurred Knife +1", range="Anarchy +2",}
	sets.weapons.DualLeadenRanged = {main={ name="Rostam", augments={'Path: B',}},sub="Tauret",range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.DualLeadenMelee = {main={ name="Rostam", augments={'Path: B',}},sub="Tauret",range={ name="Death Penalty", augments={'Path: A',}},}
	sets.weapons.DualAeolian = {main={ name="Rostam", augments={'Path: B',}},sub="Tauret",range="Anarchy +2",}
	sets.weapons.DualRanged = {main={ name="Rostam", augments={'Path: B',}},sub="Gleti's Knife",range="Death Penalty",}
	sets.weapons.SWWildfire = {main={ name="Rostam", augments={'Path: B',}},sub="Nusku Shield",range="Death Penalty",}
	sets.weapons.DualWildMelee = {main={ name="Rostam", augments={'Path: B',}},sub="Tauret",range="Death Penalty",}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
    sets.engaged.Acc = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
    sets.engaged.Acc.DT = {
     head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

    sets.engaged.DW = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
    sets.engaged.DW.Acc = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
    sets.engaged.DW.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    
    sets.engaged.DW.Acc.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 11)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 11)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 11)
    else
        set_macro_page(1, 11)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 003')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 003')
		else
			windower.chat.input('/lockstyleset 003') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 003')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 003')
		else
			windower.chat.input('/lockstyleset 003') --Catchall just in case something's weird.
		end
	end
end