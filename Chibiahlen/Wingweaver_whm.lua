---version 2.0
include('organizer-lib')
	idle_auto = true
	weapon_lock = false
	text = require('texts')
	dcs = 'Idle:${Idle|Def}|IdleAuto:${IdleAuto|ON}'  
	display = text.new()
	display:text(dcs)
	display:font("Consolas")
	display:size(10)
	display:pos(805,645)
	display:show()
	dcs2 = 'WeaponLock:${WeaponLock|OFF}'
	display2 = text.new()
	display2:text(dcs2)
	display2:font("Consolas")
	display2:size(10)
	display2:pos(805,660)
	display2:show()
	
function file_unload()
	send_command('unbind numpad1')
	send_command('unbind numpad2')
	send_command('unbind numpad3')
	send_command('unbind numpad4')
	send_command('unbind numpad5')
	send_command('unbind numpad7')
	send_command('unbind numpad8')
	send_command('unbind numpad0')
	send_command('unbind numpad-')	
	send_command('unbind f11')
	send_command('unbind f12')
end

function get_sets()
	send_command('wait 4; input /lockstyleset 5')
	send_command('wait 5; input /macro book 12')
	send_command('bind numpad7 gs c idle set')
	send_command('bind numpad8 gs c idle auto')
	send_command('bind numpad4 gs c weapon lock')
	send_command('bind numpad- send @all input //mr') ---turn on mount roulette for this to work
	me = windower.ffxi.get_player().name
	
	fc_midcast = S{'Teleport-Holla','Teleport-Dem','Teleport-Mea','Teleport-Yhoat','Teleport-Altep','Teleport-Vahzl',
	'Arise','Raise','Raise II','RaiseIII','Recall-Jugner','Recall-Pashh','Recall-Meriph','Escape','Warp','Tractor',}
	
sets.precast = {}
sets.precast.Devotion = {head={ name="Piety Cap +1", augments={'Enhances "Devotion" effect',}},}
sets.precast.Benediction = {body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},}
sets.precast['Afflatus Solace'] = {body="Ebers Bliaut +3",}
sets.precast['Divine Caress'] = {
	hands="Ebers Mitts +3",
	back='Mending Cape'
}
sets.precast.FC={ ---80 fc /25 haste
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    feet="Volte Gaiters",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring +1",
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
}
sets.precast.Cure={ ---80 fc /26 haste /7 quick cast
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    feet="Volte Gaiters",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring +1",
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
}
sets.precast.Arise={ ---81 fc /25 haste /11 quick cast
    sub="Chanter's Shield",
    ammo="Impatiens",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    feet="Volte Gaiters",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Weather. Ring +1",
    back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
}
sets.WS = {}
sets.WS['Mystic Boon'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
sets.WS.Melee = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
sets.midcast = {}
sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head="Inyanga Tiara +2",
    body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +3",
    legs="Th. Pant. +3",
    feet="Theo. Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}
sets.midcast.Cure={
    main="daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Ebers Bliaud +2",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Bishop's Sash",
    left_ear="Glorious Earring",
    right_ear="Mendi. Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring="Janniston Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast.Curaga={
    main="daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Glorious Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Janniston Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast.WeatherCure={
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Shukuyunoibuki",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Ebers Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Glorious Earring",
    right_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast.WeatherCuraga={
    main="Chatoyant Staff",
    sub="Enki Strap",
    ammo="Shukuyunoibuki",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Glorious Earring",
    right_ear="Magnetic Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast.Cursna={
    main="Yagrush",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +3",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Th. Pant. +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Meili Earring",
    right_ear="Ebers Earring +1",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast['Enfeebling Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Theophany Cap +3",
    body="Theo. Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','"Conserve MP"+2','MND+12','"Mag.Atk.Bns."+5',}},
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Glorious Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.midcast['Enhancing Magic'] ={
    main="Gada", 
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Mendi. Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}
sets.midcast.StatRemoval = {
    main="Yagrush",
    neck="Clr. Torque +2",
    head="Ebers Cap +2",
    legs="ebers Pantaloons +3"}
sets.midcast.BarElement = { ---500 enhancing skill
    main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Ebers Cap +3",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
    feet="ebers Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}
sets.midcast.BarStatus = { 
    main="Gada", 
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Sroda Necklace",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}

sets.midcast.Aquaveil = { ---spell interruption 94
	main="Gada",
    sub="Culminus",
    ammo="Staunch Tathlum",
    head={ name="Chironic Hat", augments={'Attack+11','Mag. Acc.+10 "Mag.Atk.Bns."+10','"Refresh"+1','Accuracy+11 Attack+11',}},
    body="Nyame Mail",
    hands={ name="Chironic Gloves", augments={'Attack+4','Rng.Acc.+5','"Refresh"+1','Accuracy+12 Attack+12',}},
    legs="Nyame Flanchard",
    feet="Theo. Duckbills +2",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Emphatikos Rope",
    left_ear="Halasz Earring",
    right_ear="Mimir Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
    sets.midcast.Auspice = {
    main="Gada", 
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="ebers Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Mendi. Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}
sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget"},{waist="Siegel Sash"})
    sets.midcast.Refresh = {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Mendi. Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}

    sets.midcast.Protect = {    
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Mendi. Earring",
    left_ring="sheltered ring",
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}

    sets.midcast.Shell = {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Mendi. Earring",
    left_ring="sheltered ring",
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Mending Cape", augments={'Healing magic skill +8','Enha.mag. skill +10','Mag. Acc.+1','"Cure" potency +1%',}},
}
    sets.midcast.Holy = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Weather. Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
IdleIndex = 1
IdleArray = {'Def','Hybrid','Refresh'}
sets.Idle = {}				
sets.Idle.Def={
    main="Yagrush",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Shamash Robe",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="ebers Duckbills +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Hearty Earring",
	right_ear="Ebers Earring +1",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.Idle.Hybrid={
    main="Yagrush",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Nyame Helm",
    body="Theo. Bliaut +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Chironic Slippers", augments={'Chance of successful block +2','"Mag.Atk.Bns."+10','"Refresh"+2','Accuracy+5 Attack+5','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Hearty Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Mephitas's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
sets.Idle.Refresh={
    main="Yagrush",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Volte Beret",
    body="Shamash Robe",
    hands="Bunzi's Gloves",
    legs={ name="Assid. Pants +1", augments={'Path: A',}},
    feet="Bunzi's Sabots",
    neck="Sibyl Scarf",
    waist="Embla Sash",
    left_ear="Glorious Earring",
    right_ear="Hearty Earring",
    left_ring={ name="Stikini Ring +1", bag="wardrobe2"},
    right_ring={ name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10','Damage taken-5%',}},
}
sets.Idle.weaponlock = {

}
sets.Idle.Engaged = {
    ammo="Crepuscular Pebble",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Sanctity Necklace",
    waist="Cornelia's Belt",
    left_ear="Digni. Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}
sets.organizer = {}
sets.organizer.stuff = {
	waist="Korin Obi",
	feet="Herald's Gaiters",
}
end
function precast(spell)
	if (spell.type:endswith('Magic') or spell.type == 'Ninjutsu' or spell.type == "Trust") and buffactive.silence then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "Trust" then
		equip(sets.precast.FC)
	elseif (spell.name:startswith 'Cur')then			
			equip(sets.precast.Cure)
	elseif (spell.name:startswith 'Aris') then
			equip(sets.precast.Arise)
	elseif spell.english == 'Sneak' then
		if spell.target.type == 'SELF' and buffactive.Sneak then
			cast_delay(0.2)
			send_command('cancel Sneak')
			equip(sets.precast.FC)	
		else
			equip(sets.precast.FC)	
		end
	elseif spell.type == "WeaponSkill" then
		equipSet = sets.WS
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		else
			equipSet = sets.WS.Melee
		end
    elseif spell.english ==  'Spectral Jig' or spell.english == 'Monomi: Ichi' and buffactive.Sneak then
        cast_delay(0.2)
        send_command('cancel Sneak')
	elseif sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	elseif sets.precast[spell.skill] then
		equip(sets.precast[spell.skill])
	elseif spell.action_type == 'Magic' then
        equip(sets.precast.FC)
	end
	set_priorities(gearswap.equip_list,gearswap.equip_list_history,'mp')
end	
function midcast(spell)
    if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
        send_command('@wait 1.7;cancel Copy Image*')
    elseif spell.english == 'Stoneskin' then
		if (buffactive['Stoneskin']) then
			equip(sets.midcast.Stoneskin) 
			send_command('@wait 1.0;cancel Stoneskin')
        else 
			equip(sets.midcast.Stoneskin)
		end
	elseif spell.english == 'Barstonra' or spell.english == 'Barwatera' or spell.english == 'Baraera' or
        spell.english == 'Barfira' or spell.english == 'Barblizzara' or spell.english == 'Barthundra'then
        equip(sets.midcast.BarElement)
	elseif fc_midcast[spell.name] then
		equip(sets.precast.FC)
	elseif (spell.name:startswith 'Bar') then
		equip(sets.midcast.BarStatus)
	elseif (spell.name:startswith 'Pro') then
			equip(sets.midcast.Protect)
	elseif (spell.name:startswith 'Shell') then
			equip(sets.midcast.Shell)
	elseif (spell.name:startswith 'Holy') then
			equip(sets.midcast.Holy)
	elseif spell.english == 'Cursna' then
		equip(sets.midcast.Cursna)
	elseif (spell.name:startswith 'Regen') then
		equip(sets.midcast.Regen)		
	elseif (spell.name:endswith 'na') or spell.english == 'Erase' then
			equip(sets.midcast.StatRemoval)
	elseif (spell.name:startswith 'Cure') then
		if (buffactive['Aurorastorm']) then
			equip(sets.midcast.WeatherCure)
		else
			equip(sets.midcast.Cure)
		end
	elseif (spell.name:startswith 'Cura') then
		if (buffactive['Aurorastorm']) then
			equip(sets.midcast.WeatherCuraga)
		else
			equip(sets.midcast.Curaga)
		end
	elseif sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])				
	elseif sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	set_priorities(gearswap.equip_list,gearswap.equip_list_history,'mp')
end
function aftercast(spell)
	if spell.english == 'Full Cure' and idle_auto == true then
		equip(sets.Idle.Refresh)
		display.Idle = "Refresh"
	else
		status_change(player.status)
	end
end
function status_change(new,old)
	if player.status == 'Idle' then
		if idle_auto == true then
			if not player.in_combat then
				if buffactive['weakness'] then
					equip(sets.Idle.Refresh)
					display.Idle = "Refresh"
				elseif player.mpp < 70 then
					equip(sets.Idle.Refresh)
					display.Idle = "Refresh"
				else
					equip(sets.Idle.Def)
					display.Idle = "Def"
				end
			elseif player.mpp < 50 then
				equip(sets.Idle.Hybrid)
				display.Idle = "Hybrid"
			else
				equip(sets.Idle.Def)
				display.Idle = "Def"
			end	
		else
			equipSet = sets.Idle
			if equipSet[IdleArray[IdleIndex]] then
				equipSet = equipSet[IdleArray[IdleIndex]]
			end
			equip(equipSet)
		end
	elseif player.status == 'Resting' then
		equip(sets.Idle.Refresh)
	elseif player.status == 'Engaged' then
		equip(sets.Idle.Engaged)
	end
end
function weapon()
	if weapon_lock == true then
		disable('main','sub')
	else
		enable('main','sub')
	end
end
function buff_change(buff,gain)
	if S{'curse', 'Max MP Down', 'weakness',}:contains(buff:lower()) then
		if not gain then
			if not midaction() then
				status_change(player.status)
			end
        end
    end
end
windower.register_event('zone change',function(new,old)
	if new then
		status_change(player.status)
	end
end)
function set_priorities(future,current,key)
    function get_val(piece)
        if piece and type(piece)=='table' and piece[key] and type(piece[key])=='number' then
            return piece[key]
        end
        return 0
    end
    local diff = {}
    for i,v in pairs(future) do
        if type(v) == 'table' then
            future[i].priority = get_val(future[i]) - get_val(current[i])
        else
            future[i] = {name=v,priority=get_val(v) - get_val(current[i])}
        end
    end
end

--//gs c adden		activates addendum" white or if already active, addendum: black
--//gs c mp		    activates 1/2 MP strategem regardless of grimore
--//gs c fast		activates reduced casting/recast strategem regardless of grimore
--//gs c aoe		activates area of effect strategem regardless of grimore
--//gs c potency	activates potency strategem regardless of grimore
--//gs c duration	activates x2 duration in light arts/ ad: wht or Skillchaining in dark arts/ ad: blk
function self_command(command)
	if command == 'idle set' then
		if idle_auto == false then
			IdleIndex = (IdleIndex % #IdleArray) + 1
			display.Idle = IdleArray[IdleIndex]
		end
	elseif command == 'weapon lock' then
		if weapon_lock == true then
            weapon_lock = false
			display2.WeaponLock = "OFF"
			enable('main','sub')
        else
            weapon_lock = true
			equip(sets.Idle.weaponlock)
			disable("main","sub")
            display2.WeaponLock = "ON"
        end
	elseif command == 'idle auto' then
		if idle_auto == true then
            idle_auto = false
			display.IdleAuto = "OFF"
			display.Idle = IdleArray[IdleIndex]
        else
			idle_auto = true
            display.IdleAuto = "ON"
        end
	elseif command == 'adden' then
		if buffactive['Light Arts'] then
			send_command('@input /ja "Addendum: White" <me>')
		elseif buffactive['Dark Arts'] then
			send_command('@input /ja "Addendum: Black" <me>')
        end
	elseif command == 'mp' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('@input /ja "Penury" <me>')
		elseif  buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('@input /ja "Parsimony" <me>')
        end
	elseif command == 'fast' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('@input /ja "Celerity" <me>')
		elseif  buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('@input /ja "Alacrity" <me>')
        end
	elseif command == 'aoe' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('@input /ja "Accession" <me>')
		elseif  buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('@input /ja "Manifestation" <me>')
        end
	elseif command == 'potency' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('@input /ja "Rapture" <me>')
        elseif  buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('@input /ja "Ebullience" <me>')
        end
	elseif command == 'duration' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('@input /ja "Perpetuance" <me>')
		elseif  buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('@input /ja "Immanence" <me>')
        end
	end
	status_change(player.status)
end

sets.MoveSpeed = {
feet="Herald's Gaiters",}

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;

if  player.status == 'Idle' and mov.counter>15 then
    local pl = windower.ffxi.get_mob_by_index(player.index)
    if pl and pl.x and mov.x then
        local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
        if movement and not moving then
            send_command('gs equip sets.MoveSpeed')
            moving = true
        elseif not movement and moving then
            send_command('gs c update')
            moving = false
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
else
    return
end
end)