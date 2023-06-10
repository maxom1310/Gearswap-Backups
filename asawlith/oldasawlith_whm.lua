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
    banishes = S{'Banish','Banish II','Banish III','Holy','Holy II','Banishga','Banishga II'}
    enfMND = S{'Paralyze','Slow'}
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
    ammo="Sapience Orb",
    head={ name="Chironic Hat", augments={'"Fast Cast"+4','INT+11',}},
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge Torque",
    waist="Embla sash",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
	}
    -- Healing Magic --		
    sets.precast.Cure = set_combine(sets.precast.FC, {
		sub="Sors Shield",
		head="Vanya Hood",
		ear1="Nourish. Earring +1",
		ear2="Mendi. Earring",
        legs="Ebers Pant. +2",
		feet="Vanya Clogs"})
    sets.precast.Lyna = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})		
    sets.precast.Encumbrance = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Sapience Orb",
    head="Ebers Cap +2",
    body="Ebers Bliaut +2",
    hands="Ebers Mitts +2",
    legs="Ebers Pant. +2",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Loricate Torque +1",
    waist="Embla sash",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Haoma's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	-- Enhancing --
	sets.precast.Enhancing = set_combine(sets.precast.FC, {})	
	sets.precast.Stoneskin = set_combine(sets.precast.FC, {})	
	-- Elemental --
    sets.precast['Impact'] = {
		ammo="Sapience Orb",
		head=empty,
		body="Twilight Cloak",
		hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
		legs="Aya. Cosciales +2",
		feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
		neck="Voltsurge Torque",
		waist="Embla sash",
		left_ear="Etiolation Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
	}	
    -- Job Abilities --
	sets.JA = {}
	sets.JA['Benediction'] = {body="Piety Bliaut +1"}
	sets.JA['Devotion'] = {head="Piety Cap +1"}		
	-- WS sets --
	sets.WS = {}
	sets.WS['Hexa Strike'] = {
	    ammo="Hydrocera",
	    head="Befouled Crown",
	    neck="Nuna Gorget +1",
	    ear1="Nourish. Earring +1",
	    body="Chironic Doublet",
	    hands="Theophany Mitts +1",
	    ring1="Rufescent Ring",
		ring2="Levia. Ring +1",
	    back="Aurist's Cape +1",
	    waist="Luminary Sash",
		legs="Telchine Braconi",
	    feet="Ebers Duckbills+1"}	
	sets.WS['Dagan'] = {
	    ammo="Hydrocera",
	    head="Kaykaus Mitra",
	    neck="Nuna Gorget +1",
	    ear1="Loquacious Earring",
		ear2="Etiolation Earring",
	    body="Ebers Bliaut +2",
	    hands="Fanatic Globes",
	    ring1="Sangoma Ring",
		ring2="Janniston Ring",
	    back="Aurist's Cape +1",
	    waist="Luminary Sash",
		legs="Sifahir Slacks",
	    feet="Ebers Duckbills+1"}		
	sets.WS['Mystic Boon'] = {
	    ammo="Hydrocera",	
	    head="Befouled Crown",
	    neck="Nuna Gorget +1",
	    ear1="Nourish. Earring +1",
	    body="Chironic Doublet",
	    hands="Theophany Mitts +1",
	    ring1="Rufescent Ring",
		ring2="Levia. Ring +1",
	    back="Aurist's Cape +1",
	    waist="Luminary Sash",
		legs="Telchine Braconi",
	    feet="Ebers Duckbills+1"}
	sets.WS['Realmrazer'] = {
	    ammo="Hydrocera",	
	    head="Befouled Crown",
	    neck="Nuna Gorget +1",
	    ear1="Nourish. Earring +1",
	    body="Chironic Doublet",
	    hands="Theophany Mitts +1",
	    ring1="Rufescent Ring",
		ring2="Levia. Ring +1",
	    back="Aurist's Cape +1",
	    waist="Luminary Sash",
		legs="Telchine Braconi",
	    feet="Ebers Duckbills +2"}
---- .::Midcast Sets::. ---->	
    sets.midcast = {}
	-- Base Set --
    sets.midcast.Recast = {
        main="Sucellus", 
        sub="Chanter's Shield",
        ammo="Sapience Orb",
        head={ name="Chironic Hat", augments={'"Fast Cast"+4','INT+11',}},
        neck="Voltsurge Torque",
        ear1="Malignance Earring",
        ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",
        hands="Fanatic Gloves",
        ring1="Prolix Ring",
        ring2="Kishar Ring",
        back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
        waist="Embla sash",
		legs="Lengo Pants",
        feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},}
    sets.midcast.ConserveMP = {
        main="Septoptic", 
        sub="Genmei Shield",
        ammo="Pemphredo Tathlum",		
        neck="Incanter's Torque",		
        ear1="Gwati Earring",
        ear2="Magnetic Earring",
        body="Kaykaus Bliaut +1",
		hands="Fanatic Gloves",
		back="Aurist's Cape +1",
		belt="Luminary Sash",
		legs="Lengo Pants",
		feet="Medium's Sabots"}		
    -- Healing Magic --	
    sets.midcast.Cure = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +2",
    body="Ebers Bliaut +2",
    hands="Ebers Mitts +2",
    legs="Ebers Pant. +2",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Loricate Torque +1",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Haoma's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
} 
	sets.midcast.Cure.Enmity = set_combine(sets.midcast.Cure, {})	
	sets.midcast.Cure.Conserve = set_combine(sets.midcast.Cure, {})
	sets.midcast.Cure.Weak = set_combine(sets.midcast.Cure.Conserve, {})	
	sets.midcast.Cure.Reive = set_combine(sets.midcast.Cure, {})
	sets.midcast.Cure.Weather = set_combine(sets.midcast.Cure, {
	    waist="Hachirin-no-Obi"}) 
    sets.midcast.Cure.Engaged = set_combine(sets.midcast.Cure, {
		ring1="Lebeche Ring"})       	
    sets.midcast.Curaga = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +2",
    body="Ebers Bliaut +2",
    hands="Ebers Mitts +2",
    legs="Ebers Pant. +2",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Loricate Torque +1",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Haoma's Ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.Curaga.Enmity = set_combine(sets.midcast.Curaga, {})
    sets.midcast.Curaga.Conserve = set_combine(sets.midcast.Curaga, {})
	sets.midcast.Curaga.Weak = set_combine(sets.midcast.Curaga.Enmity, {})
    sets.midcast.Curaga.Weather = set_combine(sets.midcast.Curaga, {back="Twilight Cape",waist="Hachirin-no-Obi"})
    sets.midcast.Curaga.Reive = set_combine(sets.midcast.Curaga, {})	
    sets.midcast.Curaga.Engaged = set_combine(sets.midcast.Curaga, {}) 	
	sets.midcast.Lyna = set_combine(sets.midcast.Recast, {
		legs="Ebers Pant. +2",
})	
	sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
		head="Vanya Hood",
        neck="Debilis Medallion",
        hands="Fanatic Gloves",
		ring1="Haoma's Ring",
        ring2="Haoma's Ring",
        back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
		legs="Ebers Pant. +2",
        feet="Vanya Clogs"})	
	sets.midcast['Divine Caress'] = set_combine(sets.midcast.Recast, {
        hands="Ebers Mitts +2",
		legs="Ebers Pant. +2",})	
	-- Enhancing Magic --	
	sets.midcast['Stoneskin'] = set_combine(sets.midcast.ConserveMP, {
	    head="Telchine Cap",
   		body="Telchine Chas.",
		waist="Embla sash",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})		
	sets.midcast.Regen = set_combine(sets.midcast.ConserveMP, {
	    main="Bolelabunga",
	    head="Marduk's Tiara +1",
        body="Piety Bliaut +1",
		waist="Embla sash",
        hands="Ebers Mitts +2",
        legs="Theo. Pant. +1",
		feet="Telchine Pigaches"})	
	sets.midcast.Enhancing = set_combine(sets.midcast.ConserveMP, {
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
   		body="Telchine Chas.",
		waist="Embla sash",
		hands="Telchine Gloves",
		back="Mending Cape",
		ear2="Mimir Earring",
		legs="Telchine Braconi",
		feet="Ebers Duckbills +1"})
	sets.midcast.Duration =  set_combine(sets.midcast.Recast, {	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		hands="Telchine Gloves",
		waist="Embla sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})		
	sets.midcast.Barspell = set_combine(sets.midcast.ConserveMP, {	
        head="Ebers Cap +2",
        neck="Enhancing Torque",
        body="Ebers Bliaut +2",
		waist="Embla sash",
        hands="Inyanga dastanas +2",
		back="Mending Cape",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
        legs="Piety Pantaln. +1",
        feet="Piety Duckbills +1"})	
	sets.midcast.Buffs = set_combine(sets.midcast.ConserveMP, {	
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
    neck="Enhancing Torque",
    waist="Embla sash",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
    back="Perimede Cape",})	
    sets.midcast['Auspice'] = set_combine(sets.midcast.ConserveMP, {
		head="Telchine Cap",
   		body="Telchine Chas.",
		waist="Embla sash",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
	    feet="Ebers Duckbills +1"})	
    -- Divine Magic --
    sets.midcast['Repose'] = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
    neck="Voltsurge Torque",
    waist="Luminary Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Vertigo Ring",
    right_ring="Globidonta Ring",
    back="Pahtli Cape",}
    sets.midcast.Banish = set_combine(sets.midcast.ConserveMP, {
		hands="Fanatic Gloves",
})
    sets.midcast.Flash = set_combine(sets.midcast.Recast, {})	
	-- Dark Magic --
	sets.midcast.Aspir = set_combine(sets.midcast.Recast, {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
    neck="Voltsurge Torque",
    waist="Luminary Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Vertigo Ring",
    right_ring="Globidonta Ring",
    back="Pahtli Cape",})
    -- Enfeebling Magic --
    sets.midcast.Enfeebling = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
    neck="Voltsurge Torque",
    waist="Luminary Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Vertigo Ring",
    right_ring="Globidonta Ring",
    back="Pahtli Cape",}
    sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, {})
    sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, {})	
	-- Elemental --
    sets.midcast.Elemental = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Afflatus Misery" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Afflatus Solace" effect',}},
    neck="Voltsurge Torque",
    waist="Luminary Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Vertigo Ring",
    right_ring="Globidonta Ring",
    back="Pahtli Cape",}
    sets.midcast['Impact'] = {
	        main="Daybreak",
			sub="Genmei Shield",
			ammo="Pemphredo Tathlum",
			head=empty,
			body="Twilight Cloak",
			hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
			legs="Lengo Pants",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
			neck="Sanctity Necklace",
			waist="Luminary Sash",
			left_ear="Gwati Earring",
			right_ear="Malignance Earring",
			left_ring="Vertigo Ring",
			right_ring="Archon Ring",
			back="Solemnity Cape",
	}	
---- .::Aftercast Sets::. ---->
    sets.aftercast = {}
    -- Idle	--	
    sets.aftercast.Idle = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Inyanga tiara +2",
    body="Ebers Bliaut +2",
    hands={ name="Chironic Gloves", augments={'Pet: Accuracy+4 Pet: Rng. Acc.+4','Weapon Skill Acc.+1','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    legs="Inyanga shalwar +2",
    feet="Inyanga crackows +2",
    neck="Loricate Torque +1",
    waist="Hachirin-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga ring",
    back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},}	   
    sets.aftercast.Defense = set_combine(sets.aftercast.Idle, {
        ear1="Etiolation Earring",	   
        feet="Inyanga crackows +2"})	
    sets.aftercast.Town = set_combine(sets.aftercast.Idle, {
})	   
    -- Resting --
	sets.Resting = set_combine(sets.aftercast.Idle, {})
---- .::Melee Sets::. ---->
    sets.engaged = {}
    sets.engaged.DualWield = {
	    head="Kaykaus Mitra +1",
	    neck="Asperity Necklace",
	    ear1="Dudgeon Earring",
	    ear2="Heartseeker Earring",
        body="Kaykaus Bliaut +1",
	    hands="Dynasty Mitts",
	    ring1="Rajas Ring",
	    ring2="Apate Ring",
	    back="Umbra Cape",
	    waist="Shetal Stone",
	    legs="Telchine Braconi",
	    feet="Battlecast Gaiters"}		
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
		    elseif spell.english == 'Repose' then
                equip(sets.midcast['Repose'])	
		    elseif spell.english == 'Flash' then
                equip(sets.midcast['Flash'])				
            end
    -- Enfeebling Magic --
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast.Enfeebling)	
            if enfMND:contains(spell.name) then
                equip(sets.midcast.Enfeebling.MND)	
            elseif enfINT:contains(spell.name) then
                equip(sets.midcast.Enfeebling.INT)					
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
	    equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})
	    if player.mpp <80 then
            equip(sets.aftercast.Idle, {back="Mecisto. Mantle"})
		    if player.hpp <70 then
	            equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})		
            elseif player.mpp <50 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle", waist="Fucho-no-obi"})  
            elseif player.tp >100 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle", neck="Chrys. Torque"})  
		    end		
		elseif player.status == 'Engaged' then
	        if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                equip(sets.engaged.DualWield, {back="Mecisto. Mantle"})	
		    else	
                equip(sets.engaged, {back="Mecisto. Mantle"})							
	        end				
	    end	
	    status_change(player.status)
-- Reive Idle Rule --		
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
	    status_change(player.status)
-- Basic MP rule --		
	elseif player.mpp <80 then
        equip(sets.aftercast.Idle)
		if player.hpp <70 then
		    equip(sets.aftercast.Defense)		
        elseif player.mpp <50 then
            equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
        elseif player.tp >100 then
            equip(sets.aftercast.Idle, {neck="Chrys. Torque"})  
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
	        equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})
	        if player.mpp <80 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle"})
		        if player.hpp <70 then
	                equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})		
                elseif player.mpp <50 then
                    equip(sets.aftercast.Idle, {back="Mecisto. Mantle", waist="Fucho-no-obi"})  
                elseif player.tp >100 then
                    equip(sets.aftercast.Idle, {back="Mecisto. Mantle", neck="Chrys. Torque"})  
		        end
		    elseif player.status == 'Engaged' then
	            if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
                    equip(sets.engaged.DualWield, {back="Mecisto. Mantle"})	
		        else	
                    equip(sets.engaged, {back="Mecisto. Mantle"})	
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