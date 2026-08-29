function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Enspell','EnspellonlyDW')
    state.HybridMode:options('Normal','DT','Enspell','EnspellOnlyDW')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','AutoMeleeMND','AutoMeleeStr','AutoMeleeDex','AutoInt')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT','MDT','Aminon')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Sequence','DualWeapons','DualSavage','DualWeaponsAcc','DualEvisceration','DualClubs','DualAeolian','EnspellOnly','EnspellDW')
	

		-- Additional local binds
	
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
--	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
--	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
		send_command('bind !f9 input /equipset 13;wait1;input /echo Prime Weapon')
		send_command('bind @f9 input /equipset 14;wait1;input /echo Savage Blade;wait1;aws use savage blade')
		send_command('bind !^@f9 input /equipset 58;wait1;input /echo TP Croc' )
		send_command('bind ^@f9 input /equipset 57;wait1;input /echo Excal' )
		send_command('bind ^f9 input /equipset 15;wait1;input /echo Seraph Blade;wait1;aws use seraph blade')
		send_command('bind !^f9 input /equipset 16;wait1;input /echo Aeolian')	
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +4"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {     ammo="Impatiens",
    head={ name="Bunzi's Hat", augments={'Path: A',}},   
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Leth. Ganth. +3",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Leth. Earring +2",
    left_ring="Murky Ring",
    right_ring="Lebeche Ring",
    back="Perimede Cape",}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,    ammo="Impatiens",
    body="Crepuscular Cloak",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Sworn Brais",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Leth. Earring +2",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Perimede Cape",})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {     ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Leth. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS.Proc = 	{    ammo="Aurgelmir Orb +1",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Sworn Sabatons",
    neck="Fotia Gorget",
      waist="Shadow Belt",
    left_ear="Sherida Earring",
    right_ear="Leth. Earring +2",
     left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Chant du Cygne'] = {    
  
    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Sworn Platemail",
    hands="Malignance Gloves",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Leth. Earring +2",
    right_ring="Ephramad's Ring",
    left_ring="murky Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant du Cygne']

	sets.precast.WS['Savage Blade'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
   neck="Rep. Plat. Medal",
   waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Leth. Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
   	sets.precast.WS['Mercy Stroke'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
   neck="Rep. Plat. Medal",
   waist="Sailfi Belt +1",
    right_ear="Leth. Earring +2",
    left_ear="Sherida Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	   
	      	sets.precast.WS['Knights of Round'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
   neck="Rep. Plat. Medal",
   waist="Sailfi Belt +1",
    right_ear="Leth. Earring +2",
    left_ear="Hoxne Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	   
	sets.precast.WS['Black Halo'] = {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Leth. Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	   
	sets.precast.WS['Imperator'] = { ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
	feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Leth. Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Ruthless Stroke'] = { ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Sanguine Blade'] = {
		head="Pixie Hairpin +1",    ammo="Regal Gem",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    right_ear="Regal Earring",
    left_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Archon Ring",
	    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Seraph Blade'] = {    ammo="Regal Gem",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Regal Gem",
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    right_ear="Moonshade Earring",
    left_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
	 back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}
	 
	 	sets.precast.WS['Red Lotus Blade'] = {ammo="Regal Gem",
	head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    right_ear="Moonshade Earring",
    left_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
	 back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg",waist="Chaac Belt",})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
	sets.midcast.FastRecast = {    ammo="Sapience Orb",
    head="Bunzi's Hat",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear="Leth. Earring +2", 
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back="Perimede Cape",}

    sets.midcast.Cure = {     ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},}
		
    sets.midcast.LightWeatherCure = {     ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {    ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	sets.midcast['Enhancing Magic'] = {    ammo="Crepuscular Pebble",
    head="Telchine Cap",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy gloves +4",
    legs="Telchine Braconi",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={name="Alabaster Earring",priority=10,},
    right_ear="Lethargy Earring +2",
    left_ring="Murky Ring",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +3",
		body="Lethargy Sayon +3",hands="Atrophy gloves +4",
		legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},head="Befouled Crown",--neck="Incanter's Torque",
	  neck="Hoxne Torque",  left_ear="Andoaa Earring",
	ear2="Mimir Earring",hands="Viti. Gloves +4",back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +4",  feet="Leth. Houseaux +3",    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",}
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +4",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = set_combine(sets.EnhancingSkill, {neck="Hoxne Torque"})
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {neck="Hoxne Torque"})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {})
	sets.midcast.BoostStat = {hands="Viti. Gloves +4"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast['Enfeebling Magic'].Resistant = {       ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {hands="Regal Cuffs",})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",legs="Leth. Fuseau +3"})--ear1="Vor Earring",hands="Leth. Ganth. +3",legs="Psycloth Lappas"})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Elemental Magic'] = {
    ammo="Ghastly Tathlum +1",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Resistant = {      ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Volte Harness",
    hands="Malignance Gloves",
    legs="Perdition Slops",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {       ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.midcast['Elemental Magic'].Proc = {       ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	head=empty,
    body="Crepuscular Cloak",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Oneiros Rope",
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	--sets.midcast.Impact = {    ammo="Regal Gem",
--	head=empty,
   -- body="Crepuscular Cloak",
  --  hands="Leth. Ganth. +3",
  --  legs="Leth. Fuseau +3",
   -- feet="Leth. Houseaux +3",
 --   neck={ name="Dls. Torque +2", augments={'Path: A',}},
 --   waist="Luminary Sash",
 --   left_ear="Malignance Earring",
  --  right_ear="Leth. Earring +2", 
 --   left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
 --   right_ring="Stikini Ring +1",
--    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Dark Magic'] = {    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +3",
    body="Sworn Platemail",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Erra Pendant",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.midcast.Drain = {   ammo="Sapience Orb",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +11','CHR+6',}},
    hands={ name="Chironic Gloves", augments={'Mag. Acc.+28','"Drain" and "Aspir" potency +10','CHR+4',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+28','"Drain" and "Aspir" potency +11','MND+3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +10','Mag. Acc.+2',}},
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Mani Earring",
    right_ear="Leth. Earring +2",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {    ammo="Regal Gem",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
	right_ear="Leth. Earring +2",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.midcast['Absorb-TP'] = {
    ammo="Regal Gem",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','"Dbl.Atk."+7','STR+13 DEX+13',}},
    left_ring="Murky Ring",
	right_ring="Stikini Ring +1",
    back="Null Shawl",}
		
	sets.midcast.Stun.Resistant = {    ammo="Regal Gem",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
	right_ear="Leth. Earring +2",
    right_ring="Stikini Ring +1",
	left_ring="Murky Ring",
   back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	
	sets.HPDown = {    ammo="Staunch Tathlum +1",
    head="Pixie Hairpin +1",
    body="Bunzi's Robe",
    hands={ name="Merlinic Dastanas", augments={'Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','AGI+7','Phalanx +3',}},
    legs="Shedir Seraweels",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+3 "Mag.Atk.Bns."+3','"Fast Cast"+7','CHR+8','Mag. Acc.+6',}},
    neck="Elite Royal Collar",
    waist="Null Belt",
    left_ear="Mendi. Earring",
    right_ear="Hoxne Earring",
    right_ring="Metamor. Ring +1",
    left_ring="Murky Ring",
    back="Swith Cape +1",}
		
    sets.HPCure = {    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Viti. Tabard +4",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atro. Tights +4",
    feet="Sworn Sabatons",
    neck="Null Loop",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Mendi. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Eihwaz Ring",
    back="Moonlight Cape",}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    right_ear="Etiolation Earring",
    left_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
	

	-- Idle sets
	sets.idle = {    ammo="Homiliary",
    head="Viti. Chapeau +4",
    body="Lethargy Sayon +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
		
	sets.idle.PDT = {    ammo="Homiliary",
    head="Sworn Crown",
    body="Lethargy Sayon +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
	
		sets.idle.Aminon = {       ammo="Homiliary",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    right_ear="Dedition Earring",
    left_ear="Sherida Earring",
    left_ring="Stikini Ring +1",
    right_ring="Roller's Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
		
	sets.idle.MDT = {    ammo="Ghastly Tathlum +1",
	head="Sworn Crown",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
		
	sets.idle.Weak = {   ammo="Homiliary",
    head="Viti. Chapeau +4",
    body="Lethargy Sayon +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})
	
	-- Defense sets
	sets.defense.PDT = {   ammo="Homiliary",
    head="Sworn Crown",
    body="Lethargy Sayon +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {   ammo="Ghastly Tathlum +1",
    head="Sworn Crown",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Carrier's Sash",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
		
    sets.defense.MEVA = {    ammo="Crepuscular Pebble",
    head="Sworn Crown",
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Carrier's Sash",
    right_ear="Etiolation Earring",
    left_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Null Shawl",}
		
	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.Self_Phalanx = {    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Sworn Brais",
    feet="Sworn Sabatons",}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.Almace = {main="Almace",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {}
	sets.weapons.DualSavage = {main="Naegling",sub="Thibron"}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Almace"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Almace"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Daybreak"}
	sets.weapons.EnspellOnly = {main="Hedron Dagger",sub="Ammurapi Shield"}    
	sets.weapons.EnspellDW = {main="Hedron Dagger",sub="Ceremonial Dagger"}
	sets.weapons.DualBlackHalo = {main="Maxentius",sub="Thibron"}
	sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Malignance Tights",
    neck="Anu Torque",
    waist="Windbuffet Belt +1", 
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
	
	sets.engaged.Prime = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Malignance Tights",
    neck="Anu Torque",
    waist="Windbuffet Belt +1", 
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
		
	sets.engaged.Enspell = {
	ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn brais",
    neck="Anu Torque",
    waist="Sailfi Belt +1", 
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",
		}

	sets.engaged.Acc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
    waist="Sailfi Belt +1", 
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}	
		
	sets.engaged.FullAcc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Null Loop",
    waist="Sailfi Belt +1", 
    right_ear="Leth. Earring +2",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}

	sets.engaged.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.Acc.DT = {     ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.FullAcc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.DW = {     ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Malignance Tights",
    feet="Sworn Sabatons",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
	
		sets.engaged.DW.Prime = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    legs="Malignance Tights",
    feet="Sworn Sabatons",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring={name="Chirich Ring +1",bag="Wardrobe 6"},
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    back="Null Shawl",}
		
	sets.engaged.DW.Acc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Malignance Tights",
    neck="Anu Torque",
	waist="Reiki Yotai",
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.DW.FullAcc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
	waist="Windbuffet Belt +1", 
    right_ear="Telos Earring",
    left_ear="Sherida Earring",
	right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.DW.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.DW.Acc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
		
	sets.engaged.DW.FullAcc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",}
	
	sets.engaged.DW.Enspell = {
   ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Sworn Brais",
    neck="Anu Torque",
	waist="Sailfi Belt +1",  
    right_ear="Telos Earring",
    left_ear="Alabaster Earring",
    right_ring={name="Chirich Ring +1",bag="Wardrobe 8"},
    left_ring="Murky Ring",
    back="Null Shawl",
		}
			sets.engaged.DW.EnspellonlyDW = {
    ammo="Sroda Tathlum",
    head="Bunzi's Hat",
    body="Sworn Platemail",
    hands="Sworn Gauntlets",
    feet="Sworn Sabatons",
    legs="Malignance Tights",
    neck="Null Loop",
    waist="Orpheus's Sash",
    right_ear="Leth. Earring +2",
    left_ear="Alabaster Earring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
	back="Null Shawl",
		}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 7)
	else
		set_macro_page(1, 7)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end
