---version 3.1 9/12/21
include('organizer-lib')
	def_mode = false
	melee_mode = false
	burst_mode = false
	WSacc_mode = false
	text = require('texts')
	dcs = 'TP:${TP|Mage}|Weap:${Weap|Unlocked}'
	display = text.new()
	display:text(dcs)
	display:font("Consolas")
	display:size(10)
	display:pos(805,615)
	display:show()
	dcs2 = 'Def:${Def|OFF}|Melee:${Melee|OFF}'
	display2 = text.new()
	display2:text(dcs2)
	display2:font("Consolas")
	display2:size(10)
	display2:pos(805,630)
	display2:show()
	dcs3 = 'WSacc:${WSacc|OFF}|Nuke:${Nuke|Free}'
	display3 = text.new()
	display3:text(dcs3)
	display3:font("Consolas")
	display3:size(10)
	display3:pos(805,645)
	display3:show()
	dcs4 = 'Idle:${Idle|Refresh}'
	display4 = text.new()
	display4:text(dcs4)
	display4:font("Consolas")
	display4:size(10)
	display4:pos(805,660)
	display4:show()	


function file_unload()
	send_command('unbind numpad1')
	send_command('unbind numpad2')
	send_command('unbind numpad3')
	send_command('unbind numpad4')
	send_command('unbind numpad5')
	send_command('unbind numpad6')
	send_command('unbind numpad7')
	send_command('unbind numpad8')
	send_command('unbind numpad9')
	send_command('unbind numpad0')
	send_command('unbind numpad*')
	send_command('unbind numpad-')
	send_command('unbind f5')
	send_command('unbind f6')
end

function get_sets()
	send_command('wait 5; input /lockstyleset 61')
	send_command('wait 4; input /macro book 17')
	send_command('bind numpad7 gs c toggle tp set')
	send_command('bind numpad8 gs c weapon swap')
	send_command('bind numpad4 gs c def mode')
	send_command('bind numpad5 gs c melee mode')
	send_command('bind numpad1 gs c WSacc')
	send_command('bind numpad2 gs c toggle nuke set')
	send_command('bind numpad0 gs c toggle idle set')
	send_command('bind numpad9 input /item "Remedy" <me>')
	send_command('bind numpad6 input /item "Holy Water" <me>')
	send_command('bind numpad/ input /equip ring2 "Warp Ring";input /echo Warping; wait 11; input /item "Warp Ring" <me>;')
	send_command('bind numpad* input /equip ring2 "Dim. Ring (Holla)";input /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
	send_command('bind numpad- send @all input //mr') ---turn on mount roulette for this to work
	
	me = windower.ffxi.get_player().name
	send_command('bind f11 send @others input /follow '..me)
	send_command('bind f12 send @others exec unfollow')

	magic_ws = S{'Sanguine Blade','Seraph Blade','Burning Blade','Red Lotus Blade','Shining Blade',}
	enspell = {['Earth']="Enstone",['Water']="Enwater",['Wind']="Enaero",['Fire']="Enfire",['Ice']="Enblizzard",['Lightning']="Enthunder",['Light']="Enthunder",['Dark']="Enblizzard"}
	
	AccuracyIndex = 1
	AccuracyArray = {'EnSword','Atk','MidAcc','HighAcc'}
	DefIndex = 1
	DefArray = {'Dt','Hybrid',}
	DwIndex = 0
	DwArray = {'LowDW'}
	
sets.precast = {}
sets.precast.TH = {
	head={ name="Merlinic Hood", augments={'Pet: STR+4','"Blood Boon"+7','"Treasure Hunter"+2','Accuracy+20 Attack+20','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
	feet="Volte Boots",
	waist="Chaac Belt",
}
sets.precast['Chainspell'] = {body="Viti. Tabard +3",}

sets.precast['Saboteur'] = {hands="Leth. Ganth. +3"}

sets.precast['Convert'] = {main="Murgleis"}

sets.precast.FC={
    ammo="Impatiens",
    head="Atrophy Chapeau +3",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    waist="Witful Belt",
    right_ring="Lebeche Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
---Weaponskill Sets--
---.Acc after the set name if you want an acc ws set. will use WS.Acc if WSacc_mode is on or if your in any acc array.
sets.WS = {}
sets.WS['Sanguine Blade'] = {
	head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Jhakri Cuffs +2",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Freke Ring",
    back="Argocham. Mantle",
}
sets.WS['Seraph Blade'] = {
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Weather. Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}},
}
sets.WS['Shining Blade'] = sets.WS['Seraph Blade']
sets.WS['Burning Blade'] = {
	head="C. Palug Crown",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Jhakri Cuffs +2",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back="Argocham. Mantle",
}
sets.WS['Black Halo'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Sherida Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}},
}
sets.WS['Black Halo'].Acc = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}},
}
sets.WS['Red Lotus Blade'] = sets.WS['Burning Blade']
sets.WS['Savage Blade'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
sets.WS['Mercy Stroke'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
sets.WS['Death Blossom'] = sets.WS['Savage Blade']
sets.WS.Melee = {
	ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Rufescent Ring",
    back="Argocham. Mantle",
}
sets.WS.Melee.Acc = {
	
}


---Midcast Sets---
sets.midcast = {}
sets.midcast.Dia={
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Obstin. Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},
}

sets.midcast.Gravity={
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24','CHR+9','Accuracy+10 Attack+10','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Obstin. Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},
}
sets.midcast.EnfeebMnd={ --use for slow I/II, paralyze I/II, addle I/II, blind I/II, frazzle I/II and distract I/II
    main="Daybreak",
    sub="Ammurapi Shield",
    range="Ullr",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},
}
sets.midcast.EnfeebMAC={ --use for bind sleeps silence break--
    main="Murgleis",
    sub="Ammurapi Shield",
    range="Ullr",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.midcast.Frazzle3={ --use for frazzle3/distract3/poison
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24','CHR+9','Accuracy+10 Attack+10','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Vor Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}},
}
sets.midcast.EnhanceSkill={ --for temper and enspells
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +3",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+1','Enh. Mag. eff. dur. +15',}},
}
	
sets.midcast.EnhanceDuration={ --Use for Barspells, Phalanx I/II, Blink, invisible, sneak, deodorize, Haste I/II, 
    main="Pukulatmuj +1",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Telchine Cap", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
    sets.midcast.Phalanx = {
    main="Sakpata's Sword",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Taeon Chapeau", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +9','Mag. Acc.+7','Enh. Mag. eff. dur. +20',}},
}

sets.midcast.Gain= set_combine(sets.midcast.EnhanceDuration, {hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},})
	
sets.midcast.Regen= set_combine(sets.midcast.EnhanceDuration, {})
	
sets.midcast.Aquaveil= set_combine(sets.midcast.EnhanceDuration, {head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}}})
  
sets.midcast.Stoneskin= set_combine(sets.midcast.EnhanceDuration,{neck="Nodens Gorget"},{waist="Siegel Sash",})

sets.midcast.Refresh= {
    sub="Ammurapi Shield",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body="Atrophy Tabard +3",
    hands="Atrophy Gloves +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Gishdubar Sash",
    left_ear="Snotra Earring",
    right_ear={ name="Lethargy Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

sets.midcast.Others=sets.midcast.EnhanceDuration

sets.midcast.ConserveMP={ --use for Tractor, Escape, Warp I/II, Pro/shell on others, Raise I/II

}

sets.midcast.ProShell= set_combine(sets.midcast.ConserveMP, {left_ring="Sheltered Ring"})	 --ring or earring here

sets.midcast.Elefeeb={
	main="Contemplator +1",
    sub="Enki Strap",
    ammo="Regal Gem",
    head="Ea Hat +1",
    body="Ea Houppelande +1",
    hands="Nyame Gauntlets",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+2','MND+10','"Mag.Atk.Bns."+8',}},
    feet="Nyame Sollerets",
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9',}},
}
sets.midcast.Drain={
	main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Sacro Bulwark",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+28','"Drain" and "Aspir" potency +8','"Mag.Atk.Bns."+4',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+24','"Drain" and "Aspir" potency +9',}},
    legs="Volte Brais",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +7','"Mag.Atk.Bns."+9',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mani Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back="Perimede Cape",
}	
sets.midcast.Stun={
	main="Contemplator +1",
    sub="Enki Strap",
    ammo="Regal Gem",
    head="Ea Hat +1",
    body="Zendik Robe",
    hands="Leth. Ganth. +3",
    legs="Volte Brais",
    feet={ name="Merlinic Crackows", augments={'DEX+14','"Fast Cast"+5','Haste+2','Accuracy+1 Attack+1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    neck="Erra Pendant",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Mani Earring",
    left_ring="Weather. Ring",
    right_ring="Evanescence Ring",
    back="Perimede Cape",
}
	sets.midcast['Absorb-TP'] = {
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Snotra Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.midcast.Bio={ --Dot effect based on dark skill, no cap(max dot is 400)--
	main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Sacro Bulwark",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body={ name="Psycloth Vest", augments={'Mag. Acc.+10','Spell interruption rate down +15%','MND+7',}},
    hands="Nyame Gauntlets",
    legs="Volte Brais",
    feet={ name="Merlinic Crackows", augments={'DEX+14','"Fast Cast"+5','Haste+2','Accuracy+1 Attack+1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    neck="Erra Pendant",
    waist="Casso Sash",
    left_ear="Malignance Earring",
    right_ear="Mani Earring",
    left_ring="Weather. Ring",
    right_ring="Evanescence Ring",
    back="Perimede Cape",
}
sets.midcast.Helix={
    
}
sets.midcast.Cure={
    ammo="Regal Gem",
    head="Bunzi's Hat",
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Snotra Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
sets.midcast.Cursna={
    
}

sets.midcast.Impact={
    ammo="Pemphredo Tathlum",
    head="empty",
    body="Crepuscular Cloak",
    hands={ name="Merlinic Dastanas", augments={'"Occult Acumen"+10','INT+3','Mag. Acc.+6','"Mag.Atk.Bns."+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Occult Acumen"+11','MND+9','Mag. Acc.+14','"Mag.Atk.Bns."+5',}},
    neck="Anu Torque",
    waist="Oneiros Rope",
    left_ear="Sherida Earring",
    right_ear="Dedition Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Chirich Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.midcast.FC={
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Volte Brais",
    feet={ name="Merlinic Crackows", augments={'DEX+14','"Fast Cast"+5','Haste+2','Accuracy+1 Attack+1','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring",
    right_ring="Lebeche Ring",
    back="Perimede Cape",
}

nuke_Index = 1
nuke_Set_Names = {'Free','Burst'}
sets.nuke = {}
sets.nuke.Free={
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
sets.nuke.Burst={
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops +1",
    feet="Bunzi's Sabots",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

---melee sets w/shield
---do not change the first 4 set names (EnSword/Atk/MidAcc/HighAcc) add w/e you like after them
sets.Melee = {}
sets.Melee.EnSword = {
	head="Malignance Chapeau",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Hetairoi Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9',}},
}
sets.Melee.Atk = {
    head="Malignance Chapeau",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
sets.Melee.MidAcc = {
	
}
sets.Melee.HighAcc = {
	
}
sets.Nin = {} ---nin sub gives 25% but you will still need +11 for lowDW and as much as you can for low or no haste
---low acc/max dual wield set with low or no haste
sets.Nin.EnSword = { 
    range="Ullr",
    head="Bunzi's Hat",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Viti. Tights +3",
    feet="Malignance Boots",
    neck={ name="Dls. Torque +1", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Snotra Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +10',}},
}
---low acc/low dual wield set with max haste (+11 wield gear to cap)
sets.Nin.EnSword.LowDW = { 
    range="Ullr",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs={ name="Viti. Tights +3", augments={'Enspell Damage','Accuracy',}},
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Mag. Acc.+10','Enh. Mag. eff. dur. +15',}},
}
---low acc/max dual wield set with low or no haste
sets.Nin.Atk = { 
	head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Hetairoi Ring",
    right_ring="Ilabrat Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
---low acc/low dual wield set with max haste (+11 wield gear to cap)
sets.Nin.Atk.LowDW = { 
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Bunzi's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
-----------------------------
---mid acc/max dual wield set with low or no haste
sets.Nin.MidAcc = { 

}
---mid acc/low dual wield set (+11 wield gear to cap)
sets.Nin.MidAcc.LowDW = { 

}
-----------------------------
---high acc/max dual wield set with low or no haste
sets.Nin.HighAcc = { 

}
---high acc/low dual wield set (+11 wield gear to cap)
sets.Nin.HighAcc.LowDW = { 

}

---defense sets 
---for melee none dual wield
sets.MeleeDef = {}
sets.MeleeDef.Dt = {
    
}
sets.MeleeDef.Hybrid = {
    
}

sets.MeleeDef.Doom = {  ---this set will be auto equiped if you are Doomed
    
}

---defense sets 
---for sub nin (hybrid will have a dual wield array)
sets.NinDef = {}
sets.NinDef.Dt = {
	
}
---Max dual wield hybrid
sets.NinDef.Hybrid = {
	
}
---low dual wield hybrid
sets.NinDef.Hybrid.LowDW = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Bunzi's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}	


---dual wield weapons
DwWeaponIndex = 1
DwWeaponArray = {'Murgleis','Crocea','Crocea_Day','Maxentius','Mandau','Odin','AE','Naegling',}
sets.DwWeapon = {}
sets.DwWeapon.Murgleis = {
	main="Murgleis",
    sub="Crepuscular Knife",
}
sets.DwWeapon.Crocea = {
	main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Enriching Sword",
}
sets.DwWeapon.Crocea_Day = {
	main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Daybreak",
}
sets.DwWeapon.Maxentius = {
	main="Maxentius",
    sub="Thibron",
}
sets.DwWeapon.Mandau = {
	main="Mandau",
    sub="Crepuscular Knife",
}
sets.DwWeapon.Odin = {
	main="Aern Dagger",
    sub="Aern Dagger II",
}
sets.DwWeapon.AE = {
	main="Tauret",
    sub="Crepuscular Knife",
}
sets.DwWeapon.Naegling = {
	main="Naegling",
    sub="Thibron",
}
---single wield weapons
SwWeaponIndex = 1
SwWeaponArray = {'Murgleis','Crocea','Maxentius','Mandau','Odin','AE','Naegling',}
sets.SwWeapon = {}
sets.SwWeapon.Murgleis = {
	main="Murgleis",
	sub={ name="Forfend +1", augments={'Path: A',}},
}
sets.SwWeapon.Crocea = {
	main={ name="Crocea Mors", augments={'Path: C',}},
	sub="Sacro Bulwark",
}
sets.SwWeapon.Maxentius = {
	main="Maxentius",
	sub={ name="Forfend +1", augments={'Path: A',}},
}
sets.SwWeapon.Mandau = {
	main="Mandau",
	sub={ name="Forfend +1", augments={'Path: A',}},
}
sets.SwWeapon.Odin = {
	main="Aern Dagger",
	sub="Sacro Bulwark",
}
sets.SwWeapon.AE = {
	main="Tauret",
	sub="Sacro Bulwark",
}	
sets.SwWeapon.Naegling = {
	main="Naegling",
	sub={ name="Forfend +1", augments={'Path: A',}},
}
IdleIndex = 1
IdleArray = {'Refresh','Dt',}
sets.Idle = {}				
sets.Idle.Refresh = {
    ammo="Homiliary",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Snotra Earring",
    right_ear="Lethargy Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
sets.Idle.Dt = {
    ammo="Homiliary",
    head="Malignance Chapeau",
    body="shamash robe",
    hands="Malignance Gloves",
    legs="Malignance tights",
    feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Snotra Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

sets.organizer = {}
sets.organizer.stuff = {
    hands="Leth. Ganth. +3",
	head="Pixie Hairpin +1",
	body="Twilight Cloak",
	waist="Hachirin-no-Obi",
	ear2="Moonshade Earring",
}
end

function precast(spell)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
	elseif spell.name == 'Stoneskin' then
            windower.ffxi.cancel_buff(37)
            equip(sets.precast.FC)
	elseif spell.english:startswith('Cure') or spell.english:startswith('Cura') then
			equip(sets.precast.FC)
	elseif spell.english == 'Sneak' then
		if spell.target.type == 'SELF' and buffactive.Sneak then
			cast_delay(0.2)
			send_command('cancel Sneak')
			equip(sets.precast.FC)
		else
			equip(sets.precast.FC)		
		end
	elseif spell.english == 'Impact' then
		equip(sets.precast.FC, {head="empty"}, {body="Crepuscular Cloak"})
    elseif spell.english ==  'Spectral Jig' or spell.english == 'Monomi: Ichi' and buffactive.Sneak then
        cast_delay(0.2)
        send_command('cancel Sneak')
	elseif spell.type == "WeaponSkill" then
		equipSet = sets.WS
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		else
			equipSet = sets.WS.Melee
		end
		if WSacc_mode == 'ON' then
			if equipSet["Acc"] then
				equipSet = equipSet.Acc
			end
		end
		if magic_ws[spell.name] then
			if spell.element == world.weather_element or spell_element == world.day_element then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
		elseif player.equipment.main == '' then ---Aeonic here
			if player.tp < 2250 then
				equipSet = set_combine(equipSet,{ear2="Moonshade Earring"})	
			end
		elseif player.tp < 2750 then
			equipSet = set_combine(equipSet,{ear2="Moonshade Earring"})
		end
		equip(equipSet)
	elseif spell.english == "Dia" or spell.english == "Bio" then
		equip(sets.precast.TH)
	elseif sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif sets.precast[spell.skill] then
        equip(sets.precast[spell.skill])
    elseif spell.action_type == 'Magic' then
        equip(sets.precast.FC)
	end		
end	
	
function midcast(spell)	
	if spell.english:startswith('Cure') or spell.english:startswith('Cura') then
		equip(sets.midcast.Cure)
	elseif spell.english == "Dia" or spell.english == "Bio" then
		equip(sets.precast.TH)
	elseif spell.english:startswith('Dia') then
		equip(sets.midcast.Dia)
	elseif spell.english == 'Blind II' or spell.english == 'Blind' or spell.english == 'Slow' or spell.english == 'Slow II' or spell.english == 'Paralyze' or spell.english == 'Paralyze II' or spell.english == 'Addle' or spell.english == 'Addle II' or spell.english == 'Distract' or spell.english == 'Distract II' or spell.english == 'Frazzle' or spell.english == 'Frazzle II' then
		if buffactive['Saboteur'] then
			equip(sets.midcast.EnfeebMnd, {hands="Leth. Ganth. +3"})
		else
			equip(sets.midcast.EnfeebMnd)
		end
	elseif spell.english == 'Dispel' or spell.english == 'Bind' or spell.english == 'Silence' or spell.english == 'Break' or spell.english == 'Sleep' or spell.english == 'Sleep II' or spell.english == 'Sleepga' or spell.english == 'Inundation' then
		if buffactive['Saboteur'] then
			equip(sets.midcast.EnfeebMAC, {hands="Leth. Ganth. +3",})
		else
			equip(sets.midcast.EnfeebMAC)
		end
	elseif spell.english == 'Gravity' or spell.english == 'Gravity II' then
		if buffactive['Saboteur'] then
			equip(sets.midcast.Gravity, {hands="Leth. Ganth. +3"})
		else
			equip(sets.midcast.Gravity)
		end
	elseif spell.english == 'Distract III' or spell.english == 'Frazzle III' or spell.english == 'Poison' or spell.english == 'Poison II' or spell.english == 'Poisonga' then
		if buffactive['Saboteur'] then
			equip(sets.midcast.Frazzle3, {hands="Leth. Ganth. +3"})
		else
			equip(sets.midcast.Frazzle3)
		end	
	elseif spell.skill == 'Enfeebling Magic' then
		if buffactive['Saboteur'] then
			equip(sets.midcast.EnfeebMnd, {hands="Leth. Ganth. +3"})
		else
			equip(sets.midcast.EnfeebMnd)
		end		
	elseif spell.english == 'Aquaveil' then
		equip(sets.midcast.Aquaveil)
	elseif spell.english == 'Choke' or spell.english == 'Burn' or spell.english == 'Frost' or spell.english == 'Rasp' or spell.english == 'Shock' or spell.english == 'Drown' then
		equip(sets.midcast.Elefeeb)
	elseif spell.english == 'Noctohelix' then 
		equip(sets.midcast.Helix, {head="Pixie Hairpin +1"})
	elseif spell.english == 'Luminohelix' then
		equip(sets.midcast.Helix, {ring2="Weatherspoon Ring"})
	elseif spell.english:endswith('helix') then
		equip(sets.midcast.Helix)
	elseif spell.english:startswith('Bio') then
		equip(sets.midcast.Bio)
	elseif spell.english:startswith('Drain') or spell.english:startswith('Aspir') then
		equip(sets.midcast.Drain)
	elseif spell.english == 'Stun' then
		equip(sets.midcast.Stun)
	elseif spell.english == spell.english == 'Erase' or spell.english == 'Poisona' or spell.english == 'Paralyna' or spell.english == 'Blindna' or spell.english == 'Silena' or spell.english == 'Viruna' then
		equip(sets.midcast.FC)
	elseif spell.english:startswith('Protect') or spell.english:startswith('Shell') or spell.english:startswith('Raise') or spell.english:startswith('Warp') or spell.english == 'Tractor' or spell.english == 'Escape' or spell.english:startswith('Reraise') then 
		equip(sets.midcast.ConserveMP)
	elseif spell.english == 'Stoneskin' then
		if (buffactive['Stoneskin']) then
			equip(sets.midcast.Stoneskin) 
			send_command('@wait 1.0;cancel Stoneskin')
        else 
			equip(sets.midcast.Stoneskin)
		end
	elseif spell.english:startswith('Refresh') then
	    if spell.target.type == "SELF" then	
			equip(sets.midcast.Refresh)
		else
			equip(sets.midcast.Others)
		end	
	elseif spell.english:startswith('Temper') or spell.english:startswith('En') then
		equip(sets.midcast.EnhanceSkill)
	elseif spell.english:startswith('Gain') then
	    equip(sets.midcast.Gain)
	elseif spell.english:startswith('Phalanx') then
	    equip(sets.midcast.Phalanx)
	elseif spell.skill == 'Enhancing Magic' then
		if spell.target.type == "SELF" then		
			equip(sets.midcast.EnhanceDuration)
		else
			equip(sets.midcast.Others)
		end
	elseif spell.english == 'Impact' then 
		equip(sets.midcast.Impact)
	elseif spell.skill == 'Elemental Magic' then
		if spell.element == world.weather_element or spell_element == world.day_element then
			equip(sets.nuke[nuke_Set_Names[nuke_Index]], {waist="Hachirin-no-Obi"})
		else
			equip(sets.nuke[nuke_Set_Names[nuke_Index]])
		end
	elseif sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])				
	elseif sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
    elseif spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
        send_command('@wait 1.7;cancel Copy Image*')
	end
end

function aftercast(spell)
	status_change(player.status)
end

function status_change(new,old)
	determine_enspell_weather()
	if melee_mode == true then
		if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
			equip(sets.DwWeapon[DwWeaponArray[DwWeaponIndex]])
		else
			equip(sets.SwWeapon[SwWeaponArray[SwWeaponIndex]])
		end
		disable('main','sub','range','ammo')
	end
	if Doom == true then
		equip(sets.MeleeDef.Doom)
	elseif player.status == 'Engaged' then
		if def_mode == true then
			if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
				equipSet = sets.NinDef
				if equipSet[NinDefArray[NinDefIndex]] then
					equipSet = equipSet[NinDefArray[NinDefIndex]]
				end
				if equipSet[DwArray[DwIndex]] then
					equipSet = equipSet[DwArray[DwIndex]]
				end
				equip(equipSet)
			else		
				equipSet = sets.MeleeDef
				if equipSet[DefArray[DefIndex]] then
					equipSet = equipSet[DefArray[DefIndex]]
				end
				equip(equipSet)
			end
		elseif player.sub_job == 'NIN' or player.sub_job == 'DNC' then
			equipSet = sets.Nin
			if equipSet[AccuracyArray[AccuracyIndex]] then
				equipSet = equipSet[AccuracyArray[AccuracyIndex]]
			end
			if equipSet[DwArray[DwIndex]] then
				equipSet = equipSet[DwArray[DwIndex]]
			end
			if AccuracyArray[AccuracyIndex] == 'EnSword' and enspell_weather == true then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
			equip(equipSet)
		else
			equipSet = sets.Melee
			if equipSet[AccuracyArray[AccuracyIndex]] then
				equipSet = equipSet[AccuracyArray[AccuracyIndex]]
			end
			if AccuracyArray[AccuracyIndex] == 'EnSword' and enspell_weather == true then
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
			equip(equipSet)
		end
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if melee_mode == true then
			equipSet = set_combine(equipSet,{ammo="empty"})
		end
		equip(equipSet)
	end
	weapon_lock()
end
function weapon_lock()
	if melee_mode == true then
		disable('main','sub','range','ammo')
	else
		enable('main','sub','range','ammo')
	end
end
function buff_change(buff,gain)
	if S{'haste', 'march', 'mighty guard', 'embrava', 'geo-haste', 'indi-haste'}:contains(buff:lower()) then
        determine_haste_group()
        if not gain then
            haste = nil
        end
        if player.status == 'Engaged' then
			if not midaction() then
				status_change(player.status)
			end
        end
    end
	if buff == 'doom' then
        if gain then
            send_command('@input /p Doomed')
			Doom = true
			status_change(player.status)
        else
            send_command('@input /p Doom Is Off')
			Doom = false
			status_change(player.status)
        end
    end
end
function determine_enspell_weather()
	if buffactive[enspell[world.weather_element]] or buffactive[enspell[world.day_element]]then
		enspell_weather = true	
	else
		enspell_weather = nil
	end	
end

--//gs c adden		activates addendum" white or if already active, addendum: black
--//gs c mp		    activates 1/2 MP strategem regardless of grimore
--//gs c fast		activates reduced casting/recast strategem regardless of grimore
--//gs c aoe		activates area of effect strategem regardless of grimore
--//gs c potency	activates potency strategem regardless of grimore
--//gs c duration	activates x2 duration in light arts/ ad: wht or Skillchaining in dark arts/ ad: blk
function self_command(command)
	if command == 'toggle tp set' then
		if melee_mode == false then
			display.TP = "Mage"
		elseif def_mode == true then	
			DefIndex = (DefIndex % #DefArray) + 1
			display.TP = DefArray[DefIndex]
		else
			AccuracyIndex = (AccuracyIndex % #AccuracyArray) + 1
			display.TP = AccuracyArray[AccuracyIndex]
		end
    elseif command == 'weapon swap' then
		if melee_mode == true then
			enable('main','sub','range','ammo')
			if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
				DwWeaponIndex = (DwWeaponIndex % #DwWeaponArray) + 1
				display.Weap = DwWeaponArray[DwWeaponIndex]
			else
				SwWeaponIndex = (SwWeaponIndex % #SwWeaponArray) + 1
				display.Weap = SwWeaponArray[SwWeaponIndex]
			end
		end
	elseif command == 'def mode' then
		if melee_mode == false then
			return
        elseif def_mode == false then
            def_mode = true
			display2.Def = "ON"
			display.TP = DefArray[DefIndex]
		else
			def_mode = false
			display2.Def = "OFF"
			display.TP = AccuracyArray[AccuracyIndex]
        end
	elseif command == 'toggle nuke set' then
		nuke_Index = nuke_Index +1
		if nuke_Index > #nuke_Set_Names then nuke_Index = 1 end
		display3.Nuke = nuke_Set_Names[nuke_Index]
	elseif command == 'WSacc' then
        if WSacc_mode == false then
            WSacc_mode = true
            display3.WSacc = "ON"
		else
			WSacc_mode = false
            display3.WSacc = "OFF"
		end
	elseif command == 'melee mode' then
		enable('main','sub','range','ammo')
        if melee_mode == false then
			melee_mode = true
			display2.Melee = "ON"
			send_command('input /macro book 17; wait .1; input /macro set 1') --will jump your macros to your melee sets
			if def_mode == false then				
				if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
					display.Weap = DwWeaponArray[DwWeaponIndex]
					display.TP = AccuracyArray[AccuracyIndex]
				else
					display.Weap = SwWeaponArray[SwWeaponIndex]
					display.TP = AccuracyArray[AccuracyIndex]
				end	
			elseif player.sub_job == 'NIN' or player.sub_job == 'DNC' then
					display.Weap = DwWeaponArray[DwWeaponIndex]
					display.TP = DefArray[DefIndex]
			else
				display.Weap = SwWeaponArray[SwWeaponIndex]
				display.TP = DefArray[DefIndex]
			end
        else
            melee_mode = false
			send_command('input /macro book 17; wait .1; input /macro set 1') --will jump your macros to your mage sets
			display.Weap = "Unlocked"
			display2.Melee = "OFF"
            display.TP = "Mage"
        end
	elseif command == 'toggle idle set' then
		IdleIndex = (IdleIndex % #IdleArray) + 1
		display4.Idle = IdleArray[IdleIndex]
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
--Read incoming packet to differentiate between Haste I and II
windower.register_event('action', 
    function(act)
        --check if you are a target of spell
        local actionTargets = act.targets
        playerId = windower.ffxi.get_player().id
        isTarget = false
        for _, target in ipairs(actionTargets) do
            if playerId == target.id then
                isTarget = true
            end
        end
        if isTarget == true then
            if act.category == 4 then
                local param = act.param
                if param == 57 and haste ~=2 then
                   ---add_to_chat(122, 'Haste Status: Haste I (Haste)')
                    haste = 1
                elseif param == 511 then
                   ---add_to_chat(122, 'Haste Status: Haste II (Haste II)')
                    haste = 2
                end
            elseif act.category == 5 then
                if act.param == 5389 then
                   ---add_to_chat(122, 'Haste Status: Haste II (Spy Drink)')
                    haste = 2
                end
            elseif act.category == 13 then
                local param = act.param
                --595 haste 1 -602 hastega 2
                if param == 595 and haste ~=2 then 
                   ---add_to_chat(122, 'Haste Status: Haste I (Hastega)')
                    haste = 1
                elseif param == 602 then
                   ---add_to_chat(122, 'Haste Status: Haste II (Hastega2)')
                    haste = 2
                end
            end
        end
    end)

function determine_haste_group()
    -- Assuming the following values:

    -- Haste - 15%
    -- Haste II - 30%
    -- Haste Samba - 5%
    -- Honor March - 15%
	-- Advancing March - 15%
	-- Mighty Guard (buffactive[604]) - 15%
    -- Victory March - 28% (im rounding up to  30% so it will equip mid dual wield)   
    -- Embrava - 25% (im rounding up to  30% so it will equip mid dual wield)
    -- Geo-Haste (buffactive[580]) - 30%
	
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if haste == 2 then
			if ( buffactive[33] and ( buffactive.march or buffactive[580] or buffactive.embrava or buffactive[604]) ) then -- hatse 2 + anything
				---add_to_chat(8, '-------------Max-Haste Mode Enabled--------------')
				DwArray[DwIndex] = 'LowDW'
			elseif ( buffactive[33] ) then -- haste 2 only
				---add_to_chat(8, '-------------Mid-Haste 30%-------------')
				DwArray[DwIndex] = 0
			end	
		elseif ( buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604] ) ) or  -- geo haste + anything
				( buffactive.embrava and ( buffactive.march or buffactive[33] or buffactive[604] )) or  -- embrava + anything
				( buffactive.march and ( buffactive[33] or buffactive[604] )) or -- victory march from ghorn + anything
				( buffactive.march  == 2 )  then  -- two marches from ghorn
				---add_to_chat(8, '-------------Max Haste Mode Enabled--------------')
				DwArray[DwIndex] = 'LowDW'
		elseif ( buffactive[580] or buffactive.embrava or buffactive.march ) or -- geo haste or embrava or victory march from ghorn
				( buffactive[33] and ( buffactive[604] ) ) then  -- haste 1 with MG
				---add_to_chat(8, '-------------Mid-Haste 30%-------------')
				DwArray[DwIndex] = 0
		elseif ( buffactive[33] or buffactive[604] ) then -- haste 1 or mighty guard
				---add_to_chat(8, '-------------Low-Haste 15%-------------')
				DwArray[DwIndex] = 0
		else
			---add_to_chat(8, '-------------No Haste-------------')
			DwArray[DwIndex] = 0
		end
	end
end

sets.MoveSpeed = {
legs="Carmine Cuisses +1",}

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