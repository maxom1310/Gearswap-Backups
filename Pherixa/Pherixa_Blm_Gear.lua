function user_job_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal','Resistant','Fodder','Proc','OccultAcumen')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal','PDT','DTHippo')
	state.Weapons:options('None','BurstWeapons','Khatvanga','Marin')

	gear.obi_cure_waist = "Hachirin-no-Obi"
	gear.obi_low_nuke_waist = "Hachirin-no-Obi"
	gear.obi_high_nuke_waist = "Hachirin-no-Obi"
	
	gear.nuke_jse_back = {name="Taranus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.stp_jse_back = {name="Taranus's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') 
	send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons Default;gs c reset CastingMode;gs c reset DeathMode;gs c reset MagicBurstMode')
	--send_command('bind !r gs c set DeathMode Single;gs c set MagicBurstMode Single')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir III" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.BurstWeapons = {main="Marin Staff +1",sub="Khonsu"}
	sets.weapons.Marin = {main="Marin Staff +1",sub="Khonsu"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Knonsu"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}	
	
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=gear.nuke_jse_back,feet="Wicce Sabots +3"}

    sets.precast.JA.Manafont = {} --body="Sorcerer's Coat +2"
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
	ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Weatherspoon Ring",
       back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
	}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {right_ear="Mendi. Earring", legs="Vanya Slops",})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

	sets.precast.FC.Death = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Sapience Orb",
    head="Amalric Coif +1", 
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
	feet={name="Amalric Nails +1",priority=10},
    neck="Voltsurge Torque",
    waist="Luminary Sash",
    left_ear="Andoaa Earring",
    right_ear="Etiolation Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',},priority=9},
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
	}
	sets.precast.FC.Impact.Death = set_combine(sets.precast.FC.Death, {head=empty,body="Crepuscular Cloak"})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.precast.WS['Myrkr'] = {   
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Regal Cuffs",
    legs="Wicce Chausses +3",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Dualism Collar +1",
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Etiolation Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Vengeful Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.MaxTPMyrkr = {ear1="Evans Earring",ear2="Etiolation Earring"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {	ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+6%','INT+6','Mag. Acc.+6','"Mag.Atk.Bns."+15',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Defending Ring",
    back="Perimede Cape",}

    sets.midcast.Cure = {    ammo="Crepuscular Pebble",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Aurist's Cape +1",}
		
    sets.midcast.LightWeatherCure = {    ammo="Crepuscular Pebble",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Aurist's Cape +1",}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {    ammo="Crepuscular Pebble",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Aurist's Cape +1",}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring",back="Oretan. Cape +1"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    waist="Embla Sash",
    left_ring="Stikini Ring +1",
    back="Perimede Cape",}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    waist="Embla Sash",
    left_ring="Stikini Ring +1",
    back="Perimede Cape",})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Chironic Hat",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast['Enfeebling Magic'] = {    ammo="Pemphredo Tathlum",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Regal Cuffs",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Enfeebling Magic'].Resistant = {     ammo="Pemphredo Tathlum",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Regal Cuffs",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {legs="Arch. Tonban +3",feet="Arch. Sabots +3"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {legs="Arch. Tonban +3",feet="Arch. Sabots +3"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {    ammo="Sapience Orb",
	head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+6%','INT+6','Mag. Acc.+6','"Mag.Atk.Bns."+15',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back="Perimede Cape",}

    sets.midcast.Drain = {
    ammo="Sapience Orb",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +8','AGI+2','Mag. Acc.+15',}},
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back="Perimede Cape",}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {      main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.midcast.Death = {     main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',},priority=10},
    right_ring="Archon Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},}
	
			sets.midcast["Comet"] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Archon Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
	
		sets.midcast["Comet"].Death = {
	   main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Archon Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
		sets.midcast['Absorb-TP'] = {  
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Sapience Orb",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
	}
	
	sets.midcast['Absorb-TP'].Death = {  
	main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Wicce Sabots +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},
	}

    sets.midcast.Stun = {    ammo="Sapience Orb",
    head="Amalric Coif +1",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Voltsurge Torque",
    waist="Cetl Belt",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast.Stun.Resistant = {    ammo="Sapience Orb",
    head="Amalric Coif +1",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Voltsurge Torque",
    waist="Cetl Belt",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.midcast.BardSong = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Regal Earring",
        body="Zendik Robe",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Merlinic Shalwar",feet="Medium's Sabots"}
		
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {   ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Resistant = {   ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {   ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck={ name="Src. Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {    head="Wicce Petasos +3",
	body="Wicce Coat +3",
    legs="Wicce Chausses +3",})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {  head="Wicce Petasos +3",
	body="Wicce Coat +3",
    legs="Wicce Chausses +3",})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, { head="Wicce Petasos +3",
	body="Wicce Coat +3",
    legs="Wicce Chausses +3",})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Loquac. Earring",
        body="Spaekona's Coat +3",hands="Hagondes Cuffs +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.stp_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Crepuscular Cloak"})	
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Crepuscular Cloak"})
	sets.midcast.Impact.Death = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Crepuscular Cloak"})	
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Crepuscular Cloak"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {   
    ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {   
	main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {   
	main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {  
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Voltsurge Torque",
    waist="Fucho-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Damage taken-5%',}},}

    sets.idle.Weak = {  
	main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    -- Defense sets

    sets.defense.PDT = {      ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.defense.MDT = {       ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		
    sets.defense.MEVA = {      ammo="Crepuscular Pebble",
    head="Wicce Petasos +3",
    body="Wicce Coat +3",
    hands="Wicce Gloves +3",
    legs="Wicce Chausses +3",
    feet="Wicce Sabots +3",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.Kiting = {right_ring="Shneddick Ring",}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Genmei Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Tempered Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {back="Taranus's Cape",
	feet="Wicce Sabots +3"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = { 
	body="Spaekona's Coat +3"}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {} 
	--ring1="Mujin Band"}
	sets.ResistantMagicBurst = {} 
	--ring1="Mujin Band"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main="Marin Staff +1",
    sub="Khonsu",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelet +1", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shifting Neck. +1",
    waist="Grunfeld Rope",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 7)
end