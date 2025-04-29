----- Credit: Krystela of Asura | Last Update: 29 december 2015 ---->
---- .:: This was entirely created by me, it's not based off anyone's file ::. ---->
---- Always visit http://pastebin.com/u/KrystelaRose to look for possible updates ---->
---- .:: Please leave credit where it's due ::. ---->
---- .:: If you have any problem contact me via ffxiah: http://www.ffxiah.com/player/Asura/Krystela ::. ---->

function user_unload()
    send_command('unbind ^f1')
    send_command('unbind ^f2')
    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')	
end
function get_sets()
-- Binds for modes
    send_command('bind ^f9 gs c C9') 
	send_command('bind ^f10 gs c C10')
    send_command('bind ^f11 gs c C11')
    send_command('bind ^f12 gs c C12')	
-- Bind for accession/Divine Seal --
    send_command('bind ^f1 input /ja accession <me>') -- Shortcut for accession (ctrl + F1) --
    send_command('bind ^f2 input /ja "divine Seal" <me>') -- Shortcut for Divine Seal (ctrl + F2) --
-- Modes --
    Enmity = 'OFF' -- Press ctrl + F9 if you want to cast Cures in Enmity Set  --
	Melee = 'OFF' -- Press ctrl + F10 for Weapon Lock--
    Capacity = 'OFF' -- Press ctrl + F11 to have Capacity cape on while Idle --
	Encumbrance = 'OFF' -- Press ctrl + F12 to be in a CCT/CP gear set for Perfidien/Plouton --
-- Gears --
    gear = {}
	gear.C_Rod = { name="Queller Rod", augments={'Healing magic skill +15','System: 2 ID: 124 Val: 9','System: 2 ID: 123 Val: 6',}}
	gear.Cga_Rod = { name="Queller Rod", augments={'MND+15','Mag. Acc.+15','System: 2 ID: 124 Val: 14',}}	
-- Set macro book/set --
    send_command('input /macro book 1;wait .1;input /macro set 4') -- set macro book/set here --
---- .::Spellmaps::. ---->	
    lyna = S{'Paralyna','Silena','Viruna','Stona','Blindna','Poisona'}
    statusremoval = S{'Sacrifice','Esuna'}
    enhanced = S{'Haste','Refresh','Flurry',}
    barspells = S{'Barfira','Barfire','Barwater','Barwatera','Barstone','Barstonra','Baraero','Baraera','Barblizzara','Barblizzard','Barthunder','Barthundra'}
    turtle = S{'Protectra V','Shellra V'}
    banishes = S{'Banish','Banish II','Banish III','Banishga II'}
	thspells = S{'Dia','Dia II', 'Banishga'}
	holies = S{'Holy', 'Holy II'}
    enfMND = S{'Paralyze','Slow','Addle'}
    enfINT = S{'Blind'}	
	raises = S{'Raise','Raise II','Raise III','Arise'}
	reraises = S{'Reraise','Reraise II','Reraise III', 'Reraise IV'}
    teleport = S{'Teleport-Mea', 'Teleport-Holla', 'Teleport-Dem', 'Teleport-Altep', 'Teleport-Yhoat', 'Teleport-Valhz', 'Recall-Meriph', 'Recall-Jugner', 'Recall-Pashh'}	
-- Area mapping --	
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
	         "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
	         "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}
    Assault = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
                "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}			 
---- .::Precast Sets::. ---->
	sets.precast ={}
    -- Base Set --	
    sets.precast.FC = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+7','MND+8','"Mag.Atk.Bns."+7',}},
    legs="Volte Brais",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	} -- 10 + 14 + 6 + 8 +6 + 5 + 4 + 4 + 10 =67
    -- Healing Magic --		
    sets.precast.Cure = set_combine(sets.precast.FC, {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Crepuscular Pebble",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	})
	sets.precast['Dispelga'] = {
    main="Daybreak",
    sub="Sors Shield",
    ammo="Crepuscular Pebble",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	
    sets.precast.Lyna = set_combine(sets.precast.FC, {main="Yagrush", neck="Cleric's torque +2",legs="Ebers Pant. +2"})		
    sets.precast.Encumbrance = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Crepuscular Pebble",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's torque +2",
    waist="Embla Sash",
    left_ear="Nourish. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Defending Ring",
    right_ring="Sirona's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	-- Enhancing --
	sets.precast.Enhancing = set_combine(sets.precast.FC, {})	
	sets.precast.Stoneskin = set_combine(sets.precast.FC, {})	
	-- Elemental --
    sets.precast['Impact'] = {
   main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
	head=empty,
	body="Twilight Cloak",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+6','CHR+9','Mag. Acc.+1',}},
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}	
    -- Job Abilities --
	sets.JA = {}
	sets.JA['Benediction'] = {body="Piety Bliaut +3"}
	sets.JA['Devotion'] = {head="Piety Cap +1"}	
	-- WS sets --
	sets.WS = {}
	sets.WS['Hexa Strike'] = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}
		
	sets.WS['Dagan'] = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}		
	sets.WS['Mystic Boon'] = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}
	sets.WS['Realmrazer'] = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}
---- .::Midcast Sets::. ---->	
    sets.midcast = {}
	-- Base Set --
    sets.midcast.Recast = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Hasty Pinion +1",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+7','MND+8','"Mag.Atk.Bns."+7',}},
    legs="Volte Brais",
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+26','"Fast Cast"+7','"Mag.Atk.Bns."+10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},}
    sets.midcast.ConserveMP = {
   main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Vanya Slops",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
    neck="Deviant Necklace",
    waist="Luminary Sash",
    left_ear="Gwati Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
		}		
    -- Healing Magic --	
    sets.midcast.Cure = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Nourish. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
} 
	sets.midcast.Cure.Enmity = set_combine(sets.midcast.Cure, {})	
	sets.midcast.Cure.Conserve = set_combine(sets.midcast.Cure, {})
	sets.midcast.Cure.Weak = set_combine(sets.midcast.Cure.Conserve, {})	
	sets.midcast.Cure.Reive = set_combine(sets.midcast.Cure, {})
	sets.midcast.Cure.Weather = set_combine(sets.midcast.Cure, {
	    waist="Hachirin-no-Obi"}) 
    sets.midcast.Cure.Engaged = set_combine(sets.midcast.Cure, {})       	
    sets.midcast.Curaga = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Nourish. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Dispelga'] = {
	    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Austerity Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Nourish. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}
	
	sets.midcast.Curaga.Enmity = set_combine(sets.midcast.Curaga, {})
    sets.midcast.Curaga.Conserve = set_combine(sets.midcast.Curaga, {})
	sets.midcast.Curaga.Weak = set_combine(sets.midcast.Curaga.Enmity, {})
    sets.midcast.Curaga.Weather = set_combine(sets.midcast.Curaga, {waist="Hachirin-no-Obi"})--back="Twilight Cape",waist="Hachirin-no-Obi"})
    sets.midcast.Curaga.Reive = set_combine(sets.midcast.Curaga, {})	
    sets.midcast.Curaga.Engaged = set_combine(sets.midcast.Curaga, {}) 	
	sets.midcast.Lyna = set_combine(sets.midcast.Recast, {
		main="Yagrush",
		neck="Cleric's torque +2",
		head="Ebers Cap +2",
		legs="Ebers Pant. +2",
})	
	sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
    main={ name="Yagrush", augments={'DMG:+4',}},
    sub="Thuellaic Ecu +1",
    ammo="Hasty Pinion +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Debilis Medallion",
    waist="Embla Sash",
    left_ear="Meili Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},})	
	sets.midcast['Divine Caress'] = set_combine(sets.midcast.Recast, {
		main="Yagrush",
		head="Ebers Cap +2",
		 neck="Cleric's Torque +2",
        hands="Ebers Mitts +2",
		legs="Ebers Pant. +2",})	
	-- Enhancing Magic --	
	sets.midcast['Stoneskin'] = set_combine(sets.midcast.ConserveMP, {
	main="Gada",
	sub="Ammurapi Shield",
	    head="Telchine Cap",
   		body="Telchine Chas.",
		 neck="Cleric's Torque +2",
		waist="Embla Sash",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})		
	sets.midcast.Regen = set_combine(sets.midcast.ConserveMP, {
	    main="Bolelabunga",
		sub="Ammurapi shield",
		 neck="Cleric's Torque +2",
	    head="Inyanga Tiara +2",
        body="Piety Bliaut +3",
        hands="Ebers Mitts +2",
		waist="Embla Sash",
        legs="Telchine braconi",  --Need AF legs (IM LAZY)
		feet="Bunzi's Sabots"})	
	sets.midcast.Enhancing = set_combine(sets.midcast.ConserveMP, {
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Crepuscular Pebble",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Ebers Duckbills +2",
    neck="Cleric's Torque +2",
    waist="Embla Sash",
    left_ear="Gwati Earring",
    right_ear="Mimir Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back="Fi Follet Cape +1",
	})
	sets.midcast.Duration =  set_combine(sets.midcast.Recast, {	
	    main="Gada",
	    head="Telchine Cap",
			sub="Ammurapi shield",
   		body="Telchine Chas.",
		hands="Telchine Gloves",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})		
	sets.midcast.Barspell = set_combine(sets.midcast.ConserveMP, {	
      main="Gada",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +2",
    body="Ebers Bliaut +2",
    hands="Ebers Mitts +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back="Fi Follet Cape +1",})	
	sets.midcast.Buffs = set_combine(sets.midcast.ConserveMP, {	
    main="Gada",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back="Fi Follet Cape +1",
	})	
    sets.midcast['Auspice'] = set_combine(sets.midcast.ConserveMP, {
		main="Gada",
		head="Telchine Cap",
   		body="Telchine Chas.",
		sub="Ammurapi shield",
		hands="Telchine Gloves",
		waist="Embla Sash",
		legs="Telchine Braconi",
	    feet="Ebers Duckbills +2"})	
		
    -- Divine Magic --
    sets.midcast['Repose'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head="Inyanga Tiara +2",
    body="Ebers Bliaut +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Inyan. Crackows +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},}
    sets.midcast.Banish = set_combine(sets.midcast.ConserveMP, {
		hands="Fanatic Gloves",
})
	sets.midcast['Holy'] = set_combine(sets.midcast.ConserveMP, {
	    main="Daybreak",
   	sub="Ammurapi shield",
    ammo="Hydrocera",
	head=Empty, 
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Deviant Necklace",
	waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	})
	sets.midcast.Holy = set_combine(sets.midcast.ConserveMP, {
	    main="Daybreak",
   	sub="Ammurapi shield",
    ammo="Hydrocera",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Deviant Necklace",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	})
    sets.midcast.Flash = set_combine(sets.midcast.Recast, {   
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head="Volte Beret",
    body="Ebers Bliaut +2",
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Erra Pendant",
    waist="Kasiri Belt",
    left_ear="Friomisi Earring",
    right_ear="Cryptic Earring",
    left_ring="Provocare Ring",
    right_ring="Begrudging Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},})	
	-- Dark Magic --
	sets.midcast.Aspir = set_combine(sets.midcast.Recast, {
    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head="Pixie Hairpin +1",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet="Inyan. Crackows +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Evanescence Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},})
    -- Enfeebling Magic --
    sets.midcast.Enfeebling = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet="Volte Gaiters",
    neck="Erra Pendant",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Digni. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
	sets.midcast.thspells = {
	    main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+2','"Dbl.Atk."+1','"Treasure Hunter"+1',}},
    legs={ name="Chironic Hose", augments={'INT+2','MND+1','"Treasure Hunter"+2',}},
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Chaac Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
		sets.midcast['Dia'] = {
	    main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+2','"Dbl.Atk."+1','"Treasure Hunter"+1',}},
    legs={ name="Chironic Hose", augments={'INT+2','MND+1','"Treasure Hunter"+2',}},
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Chaac Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
			sets.midcast['Dia II'] = {
	    main="Daybreak",
    sub="Genmei Shield",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Chironic Gloves", augments={'"Fast Cast"+2','"Dbl.Atk."+1','"Treasure Hunter"+1',}},
    legs={ name="Chironic Hose", augments={'INT+2','MND+1','"Treasure Hunter"+2',}},
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Chaac Belt",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	
    sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, {})
    sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, {})	
	-- Elemental --
    sets.midcast.Elemental = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Volte Gloves",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+8','MND+11','Mag. Acc.+12','"Mag.Atk.Bns."+14',}},
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+2','VIT+6','Mag. Acc.+15','"Mag.Atk.Bns."+7',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
    sets.midcast['Impact'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
	head=empty,
    ammo="Hydrocera",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+27','Pet: Accuracy+5 Pet: Rng. Acc.+5','"Treasure Hunter"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Chironic Slippers", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+2','VIT+6','Mag. Acc.+15','"Mag.Atk.Bns."+7',}},
    neck="Voltsurge Torque",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}	
---- .::Aftercast Sets::. ---->
    sets.aftercast = {}
    -- Idle	--	
    sets.aftercast.Idle = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}	   
    sets.aftercast.Defense = set_combine(sets.aftercast.Idle, {  
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},})	
    sets.aftercast.Town = set_combine(sets.aftercast.Idle, {})	   
    -- Resting --
	sets.Resting = set_combine(sets.aftercast.Idle, {})
---- .::Melee Sets::. ---->
    sets.engaged = {}
    sets.engaged.DualWield = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Thureous Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ring={name="Stikini Ring +1",bag="Wardrobe 2"},
    right_ring="Defending Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
		}		
end
---- .::Pretarget Functions::. ---->
function pretarget(spell,action)
-- Auto Echo drop --
    if spell.action_type == 'Magic' and buffactive['Silence'] then 
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
-- Auto Divine Caress --		
	elseif lyna:contains(spell.name) then
        if windower.ffxi.get_ability_recasts()[32] < 1 and not buffactive['Amnesia'] then 	
		    cancel_spell()
			send_command('input /ja "Divine Caress" <me>;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)
		end	
-- Auto Misery-Esuna --		
	elseif spell.english == 'Esuna' and buffactive['Afflatus Solace'] and windower.ffxi.get_ability_recasts()[30] < 1  and not buffactive['Amnesia'] then	
		cancel_spell()
	    send_command('input /ja "Afflatus Misery" <me>;wait 1.7;input /ma esuna <me>')
-- Auto Solace-Sacrifice --		
	elseif spell.english == 'Sacrifice' and buffactive['Afflatus Misery'] and windower.ffxi.get_ability_recasts()[29] < 1 and not buffactive['Amnesia'] then	
		cancel_spell()
	    send_command('input /ja "Afflatus Solace" <me>;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)		
	end
end	
---- .::Precast Functions::. ---->
-- Spells --
function precast(spell)	
    if spell.action_type == 'Magic' then
    -- Healing Magic --
	    if spell.skill == 'Healing Magic' then
            if string.find(spell.english,'Cure') then
	            equip(sets.precast.Cure)
	        elseif string.find(spell.english,'Cura') then
		        equip(sets.precast.Cure)		
	        elseif lyna:contains(spell.name) then	
	            equip(sets.precast.Lyna)	
	        elseif spell.english == 'Cursna' then	
	            equip(sets.precast.Lyna)
			else
                equip(sets.precast.FC)			
		    end
	-- Enhancing Magic --	
	    elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.FC)		
	        if spell.english == 'Stoneskin' then
                equip(sets.precast[spell.english])	
            elseif spell.english == 'Erase' then
                equip(sets.precast.Lyna)		
	        end	
	-- Divine Magic --
        elseif spell.skill == 'Divine Magic' then
            equip(sets.precast.FC)				
	-- Dark Magic --
        elseif spell.skill == 'Dark Magic' then
            equip(sets.precast.FC)
	-- Enfeebling Magic --
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.precast.FC)				
		elseif spell.english == 'Dispelga' then
                equip(sets.precast['Dispelga'])
	-- Elemental Magic --
        elseif spell.skill == 'Elemental Magic' then
            if spell.english == 'Impact' then
                equip(sets.precast['Impact'])
			else
                equip(sets.precast.FC)			
		    end		
		end
	end	
	-- Job Abilities --	
    if spell.type == 'JobAbility' then
        equip(sets.JA[spell.english])
    -- Weapon skills --
    elseif spell.type == 'WeaponSkill' then
        equip(sets.WS[spell.english])
    end		
end	
---- .::Midcast Functions::. ---->
-- Spells --
function midcast(spell)
    if spell.action_type == 'Magic' then	
    -- Healing Magic --
	    if spell.skill == 'Healing Magic' then
            equip(sets.midcast.Recast)			
            if string.find(spell.english,'Cure') then
		        equip(sets.midcast.Cure)
		        if player.mpp <51 then
                    equip(sets.midcast.Cure.Conserve)
			    elseif Enmity == 'ON' then	
                    equip(sets.midcast.Cure.Enmity)			
                elseif buffactive['Weakness'] then
                    equip(sets.midcast.Cure.Weak)			
	            elseif spell.element == world.weather_element or spell.element == world.day_element then
                    equip(sets.midcast.Cure.Weather)		
		        elseif buffactive['Reive Mark'] then
                    equip(sets.midcast.Cure.Reive)
		        elseif Melee == 'ON' then	
			        equip(sets.midcast.Cure.Engaged)
				end	
	        elseif string.find(spell.english,'Cura') then	
	            equip(sets.midcast.Curaga)		
		        if player.mpp <51 then
                    equip(sets.midcast.Curaga.Conserve)	
			    elseif Enmity == 'ON' then	
                    equip(sets.midcast.Curaga.Enmity)
                elseif buffactive['Weakness'] then
                    equip(sets.midcast.CuragaWeak)			
	            elseif spell.element == world.weather_element or spell.element == world.day_element then
                    equip(sets.midcast.Curaga.Weather)
		        elseif buffactive['Reive Mark'] then
                    equip(sets.midcast.Curaga.Reive)
	            elseif Melee == 'ON' then		
                    equip(sets.midcast.Curaga.Engaged)			
			    end		
	        elseif lyna:contains(spell.name) then
                equip(sets.midcast.Lyna)		
	            if buffactive['Divine Caress'] then
		            equip(sets.midcast['Divine Caress'])
		        end			
	        elseif spell.english == 'Cursna' then
                equip(sets.midcast.Cursna)	
            elseif reraises:contains(spell.name) then
                equip(sets.midcast.ConserveMP)		
		    end	
	-- Enhancing Magic --
	    elseif spell.skill == 'Enhancing Magic' then
                equip(sets.midcast.Recast)		
            if spell.english == 'Stoneskin' then
	            equip(sets.midcast['Stoneskin'])
            elseif string.find(spell.english,'Regen') then
                equip(sets.midcast.Regen)
            elseif string.find(spell.english,'storm') then
                equip(sets.midcast.Duration)				
		    elseif enhanced:contains(spell.name) then
                equip(sets.midcast.Duration)
            elseif barspells:contains(spell.name) then
                equip(sets.midcast.Barspell)
            elseif turtle:contains(spell.name) then
                equip(sets.midcast.Buffs)
            elseif string.find(spell.english,'Boost') then
                equip(sets.midcast.Enhancing)				
            elseif spell.english == 'Auspice' then
                equip(sets.midcast['Auspice'])
		    elseif spell.english == 'Erase' then
                equip(sets.midcast.Lyna)	
            elseif teleport:contains(spell.name) then
                equip(sets.midcast.ConserveMP)			
		    end	
	-- Divine Magic --
	    elseif spell.skill == 'Divine Magic' then
	        if banishes:contains(spell.name) then
	            equip(sets.midcast.Banish)			
	        elseif holies:contains(spell.name) then	
				equip(sets.midcast.Holy)				
		    elseif spell.english == 'Repose' then
                equip(sets.midcast['Repose'])	
		    elseif spell.english == 'Flash' then
                equip(sets.midcast['Flash'])
			elseif thspells:contains(spell.name) then
				equip(sets.midcast.thspells)
            end
    -- Enfeebling Magic --
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast.Enfeebling)	
            if enfMND:contains(spell.name) then
                equip(sets.midcast.Enfeebling.MND)	
            elseif enfINT:contains(spell.name) then
                equip(sets.midcast.Enfeebling.INT)	
			elseif thspells:contains(spell.name) then
				equip(sets.midcast.thspells)
			elseif spell.english == 'Dispelga' then
                equip(sets.midcast['Dispelga'])	
		    end
    -- Dark Magic --			
		elseif	spell.skill == 'Dark Magic' then
            if string.find(spell.english,'Aspir') then
                equip(sets.midcast.Aspir)
			else
                equip(sets.midcast.Recast)
			end	
	-- Elemental Magic --
        elseif spell.skill == 'Elemental Magic' then	
            if spell.english == 'Impact' then
                equip(sets.midcast['Impact'])
			else
                equip(sets.midcast.Elemental)			
		    end		
		end	
	end		 	
end		
---- .::Aftercast Sets::. ---->
function aftercast(spell,action)
    equip(sets.aftercast.Defense)
-- Capacity Idle Rule --	
	if Capacity == 'ON' then
	    equip(sets.aftercast.Defense, {})
	    if player.mpp <80 then
            equip(sets.aftercast.Idle, {})
		    if player.hpp <70 then
	            equip(sets.aftercast.Defense, {})		
            elseif player.mpp <50 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle", waist="Fucho-no-obi"})  
            elseif player.tp >100 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle", neck="Chrys. Torque"})  
		    end		
		elseif player.status == 'Engaged' then
	        if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                equip(sets.engaged.DualWield, {back="Mecisto. Mantle"})	
		    else	
                equip(sets.engaged, {})							
	        end				
	    end	
	    status_change(player.status)
-- Reive Idle Rule --		
	elseif buffactive['Reive Mark'] then	
	    equip(sets.aftercast.Defense, {})
	    if player.mpp <80 then
            equip(sets.aftercast.Idle, {})
		    if player.hpp <70 then
	            equip(sets.aftercast.Defense, {})		
            elseif player.mpp <50 then
                equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
		    end
		elseif player.status == 'Engaged' then
	        if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                equip(sets.engaged.DualWield)	
		    else	
            equip(sets.engaged)	
		    end			
	    end	
	    status_change(player.status)
-- Basic MP rule --		
	elseif player.mpp <80 then
        equip(sets.aftercast.Idle)
		if player.hpp <70 then
		    equip(sets.aftercast.Defense)		
        elseif player.mpp <50 then
            equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
        elseif player.tp >100 then
            equip(sets.aftercast.Idle, {})  
		end	
	    status_change(player.status)	
-- TP sets Rule --		
	elseif player.status == 'Engaged' then
	    if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
            equip(sets.engaged.DualWield)	
		else	
            equip(sets.engaged)	
		end	
	    status_change(player.status)
-- Town Rule --		
	elseif Town:contains(world.zone) then
        equip(sets.aftercast.Town)
    end	
	status_change(player.status)		
end	
---- .::Resting Set::. ---->
function status_change(new,tab,old)
-- Idle Status change rule --
    if new == 'Idle' then
        equip(sets.aftercast.Defense)				
	    if Capacity == 'ON' then
	        equip(sets.aftercast.Defense, {})
	        if player.mpp <80 then
                equip(sets.aftercast.Idle, {})
		        if player.hpp <70 then
	                equip(sets.aftercast.Defense, {})		
                elseif player.mpp <50 then
                    equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
                elseif player.tp >100 then
                    equip(sets.aftercast.Idle, {})  
		        end
		    elseif player.status == 'Engaged' then
	            if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                    equip(sets.engaged.DualWield, {})	
		        else	
                    equip(sets.engaged, {})	
		        end							
	        end				
	    elseif buffactive['Reive Mark'] then	
	        equip(sets.aftercast.Defense, {neck="Arciela's Grace +1"})
	        if player.mpp <80 then
                equip(sets.aftercast.Idle, {neck="Arciela's Grace +1"})
		        if player.hpp <70 then
	                equip(sets.aftercast.Defense, {neck="Arciela's Grace +1"})		
                elseif player.mpp <50 then
                    equip(sets.aftercast.Idle, {neck="Arciela's Grace +1", waist="Fucho-no-obi"})  
		        end
		    elseif player.status == 'Engaged' then
	            if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                    equip(sets.engaged.DualWield)	
		        else	
                    equip(sets.engaged)	
		        end			
	        end				
	    elseif player.mpp <80 then
            equip(sets.aftercast.Idle)
		    if player.hpp <70 then
		        equip(sets.aftercast.Defense)		
            elseif player.mpp <50 then
                equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
            elseif player.tp >100 then
                equip(sets.aftercast.Idle, {neck="Chrys. Torque"})  
		    end				
	    elseif Town:contains(world.zone) then
            equip(sets.aftercast.Idle.Town)	
		end	
-- Resting Status Change Rule --		
	elseif new == 'Resting' then
        equip(sets.Resting)	
-- TP Status change Rule --		
    elseif new == 'Engaged' then			
	    if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
            equip(sets.engaged.DualWield)	
		else	
            equip(sets.engaged)	
		end			
    end		
end
-- Modes functions --
function self_command(command)
    if command == 'C9' then -- Enmity Toggle --
        if Enmity == 'ON' then
            Enmity = 'OFF'
            add_to_chat(123,'Enmity Set: [OFF]')
        else
            Enmity = 'ON'
            add_to_chat(158,'Enmity Set: [ON]')
        end
        status_change(player.status)
    elseif command == 'C10' then -- Melee toggle --
        if Melee == 'ON' then
            Melee = 'OFF'
            enable('main', 'sub' ,'range')				
            add_to_chat(123,'Melee Set: [OFF]')
        else
            Melee = 'ON'
            disable('main', 'sub' ,'range')			
            add_to_chat(158,'Melee Set: [ON]')
        end
        status_change(player.status)
    elseif command == 'C11' then -- Capacity toggle --
        if Capacity == 'ON' then
            Capacity = 'OFF'
            add_to_chat(123,'Capacity Set: [OFF]')
        else
            Capacity = 'ON'
            add_to_chat(158,'Capacity Set: [ON]')
        end
        status_change(player.status)
    elseif command == 'C12' then -- Encumbrance toggle --
        if Encumbrance == 'ON' then
            Encumbrance = 'OFF'
            enable('main', 'sub' ,'range' ,'ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
            add_to_chat(123,'Encumbrance Set: [OFF]')
        else
            Encumbrance = 'ON'
			equip(sets.precast.Encumbrance)
            disable('main', 'sub' ,'range' ,'ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')			
            add_to_chat(158,'Encumbrance Set: [ON]')
        end
        status_change(player.status)
	end		
end			
-- Automatically changes Idle gears if you zone in or out of town --
windower.register_event('zone change', function()
	if Town:contains(world.zone) then
        equip(sets.aftercast.Town)
    else
        equip(sets.aftercast.Defense)
    end	
end)