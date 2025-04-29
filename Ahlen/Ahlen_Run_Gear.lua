function user_job_setup()

	state.OffenseMode:options('Normal')
	state.HybridMode:options('Normal','Tank','DD')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Epeo','Lionheart','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind !pause gs c toggle AutoRuneMode')
--	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	--send_command('bind !delete input /ma "Cure IV" <stal>')
--send_command('bind @delete input /ma "Flash" <stnpc>')
--	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	--send_command('bind @\\\\ input /ma "Shell V" <t>')
--	send_command('bind !\\\\ input /ma "Crusade" <me>')
	--send_command('bind ^backspace input /ja "Lunge" <t>')
	--send_command('bind @backspace input /ja "Gambit" <t>')
--	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	--send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {  ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    right_ear="Cryptic Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
		 
    sets.Enmity.SIRD = {  ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    right_ear="Cryptic Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
		
    sets.Enmity.SIRDT = {  ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    right_ear="Cryptic Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}

    sets.Enmity.DT = {  
	    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Aqreqaq Bomblet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
   legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    right_ear="Cryptic Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
	}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +2",legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Boots"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{    ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Cryptic Earring",
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +2", legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist Boots"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{    ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body={ name="Emet Harness +1", augments={'Path: A',}},
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Cryptic Earring",
    left_ring="Moonlight Ring",
    right_ring="Eihwaz Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +3",neck="Incanter's Torque",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
	    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Eschan Stone",
    right_ear="Etiolation Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Kishar Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
			
	sets.precast.FC.DT = {
	    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Eschan Stone",
    right_ear="Etiolation Earring",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Kishar Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS.SomeAcc = {    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS.Acc = {    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS.HighAcc = {    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}
	sets.precast.WS.FullAcc = {    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear="Sherida Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
			
	sets.midcast.FastRecast.DT = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
		
	sets.midcast.FastRecast.SIRD = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{head="Erilaz Galea +3",legs="Futhark Trousers +3",hands="Regal Gauntlets",})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{left_ear="Mimir Earring",  head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'Rng.Acc.+15','Damage taken-1%','Phalanx +5',}},
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+25','Pet: Crit.hit rate +1','Phalanx +4','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1",}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +3"}) 
	sets.midcast['Temper'] = set_combine(sets.midcast['Enhancing Magic'],{    ammo="Staunch Tathlum +1",
    head="Carmine Mask +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Runeist Mitons +3",
    legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    feet="Erilaz Greaves +3",
    neck="Melic Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
        neck="Sacro Gorget",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear="Roundel Earring",
    left_ring="Naji's Loop",
    right_ring="Stikini Ring +1",
    back={ name="Ogma's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Damage taken-5%',}},}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Sacro Gorget",
    waist="Gishdubar Sash",
    left_ear="Mendi. Earring",
    right_ear="Roundel Earring",
    left_ring="Defending Ring",
    right_ring="Kunaji Ring",
    back={ name="Ogma's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Damage taken-5%',}},}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	sets.Phalanx_Received = {   head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'Rng.Acc.+15','Damage taken-1%','Phalanx +5',}},
     hands={ name="Herculean Gloves", augments={'Mag. Acc.+25','Pet: Crit.hit rate +1','Phalanx +4','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+2 Attack+2','Mag. Acc.+9','Phalanx +4','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle,{})
			
	sets.idle.Tank = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.KiteTank = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.idle.Weak = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.Kiting = {right_ring="Shneddick Ring",}
	
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeo = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.defense.PDT_HP = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.defense.MDT = {     ammo="Yamarang",
    head="Erilaz Galea +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.defense.MDT_HP = {    ammo="Yamarang",
    head="Erilaz Galea +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.defense.BDT = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.defense.BDT_HP = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	sets.defense.MEVA = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	sets.defense.MEVA_HP = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.defense.Death = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}

	sets.defense.DTCharm = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.defense.Charm = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {       ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
    sets.engaged.SomeAcc = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
     left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.Acc = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.HighAcc = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.FullAcc = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
    sets.engaged.DTLite = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
    sets.engaged.SomeAcc.DTLite = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.Acc.DTLite = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.HighAcc.DTLite = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.FullAcc.DTLite = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
    sets.engaged.Tank = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
       waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.Tank_HP = {    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
       waist="Ioskeha Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	right_ear="Erilaz Earring +2",
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}
	sets.engaged.DD = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'SCH' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'BLU' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'SAM' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'DRK' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	else
		set_macro_page(5, 2)
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
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
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

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 017')
	else
		windower.chat.input('/lockstyleset 017')
	end
end