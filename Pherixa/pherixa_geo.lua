----- Credit: Krystela of Asura | Last Update: 21 june 2016 ---->
---- .:: This was entirely created by me, it's not based off anyone's file ::. ---->
---- Always visit http://pastebin.com/u/KrystelaRose to look for possible updates ---->
---- .:: Please leave credit where it's due ::. ---->
---- .:: If you have any problem contact me via ffxiah: http://www.ffxiah.com/player/Asura/Krystela ::. ---->
	send_command('wait 5; input /lockstyleset 20')
function user_unload()
    send_command('unbind ^f1')
    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')	
end
function get_sets()
-- Binds for modes
    send_command('bind ^f1 gs c C1')
	send_command('bind ^f9 gs c C9')
	send_command('bind ^f10 gs c C10')	
	send_command('bind ^f11 gs c C11')		
-- Modes --
    MagicIndex = 1
    MagicArray = {"Normal","Magic Burst"} -- Press ctrl + F1 to circle through Magic modes --
	LuopanIndex = 1	
    LuopanArray = {"Normal","Regen","PDT"} -- Press ctrl + F9 to circle through Idle modes --
	Melee = 'OFF' -- Press ctrl + F10 for Weapon Lock--	
    Capacity = 'OFF' -- Press ctrl + F11 to have Capacity cape on while Idle --
-- Gears --
    gear = {}
-- Set macro book/set --
    send_command('input /macro book 3;wait .1;input /macro set 1') -- set macro book/set here --
---- .::Spellmaps::. ---->			
    enfMND = S{'Paralyze','Slow'}
    enfINT = S{'Blind'}
    eleGeo = S{'Fira', 'Fira II', 'Fira III', 'Blizzara', 'Blizzara II', 'Blizzara III', 'Aerora', 'Aerora II','Aerora III', 'Stonera', 'Stonera II','Stonera III', 'Thundara', 'Thundara II','Thundara III', 'Watera', 'Watera II', 'Watera III'} 	
-- Area mapping --	
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
	         "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
	         "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}
---- Precast ----
    sets.precast = {}
    sets.precast.FC = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs="Geomancy Pants +3",
      feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's loop",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
    sets.precast.Geomancy = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, --3
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},  --14
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}}, --12
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}}, --7
    legs="Geomancy Pants +3",  --13
      feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}}, --9
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash", --5
    left_ear="Malignance Earring", --4
    right_ear="Etiolation Earring", --1
    left_ring="Kishar Ring", --4
    right_ring="Naji's loop",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	}
	
	    sets.precast['Dispelga'] = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs="Geomancy Pants +3",
      feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's loop",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
    sets.precast.Cure = set_combine(sets.precast.FC, {})
    sets.precast.Enhancing = set_combine(sets.precast.FC, {})
    sets.precast['Stoneskin'] = set_combine(sets.precast.FC, {})
	sets.precast.Elemental = set_combine(sets.precast.FC, {})
	sets.precast['Impact'] = {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head=empty,
    body="Crepuscular Cloak",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs="Geomancy Pants +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}, --10
		}	
---- Job Abilities ----
    sets.JA ={}
    sets.JA['Bolster'] = {body="Bagua Tunic +1"}
	sets.JA['Full Circle'] = {head="Azimuth Hood +3", hands="Bagua Mitaines +1"}
    sets.JA['Life Cycle'] = {body="Geomancy Tunic +3", back="Nantosuelta's Cape"}
	sets.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
-- WS sets --
	sets.WS = {}
    sets.WS['Realmrazer'] = {}
    sets.WS['Exudation'] = {     head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}	

	sets.WS['Flash Nova'] = { ammo="Sroda Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.WS['Seraph Strike'] = { ammo="Sroda Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Hachirin-no-Obi",
    left_ear="Moonshade Earring",
	right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.WS['Black Halo'] = {
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Luminary Sash",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		sets.WS['Judgment'] = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS = {    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.WS['Moonlight'] = {ear1="Moonshade Earring"}
	sets.WS['Shell Crusher'] = { 
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Khonsu",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Combatant's Torque",
    waist="Luminary Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
---- Midcast ----
    sets.midcast = {}
    sets.midcast.Recast = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +3",
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Kishar Ring",
    right_ring="Naji's Loop",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
    sets.midcast.ConserveMP = {}
-- Healing Magic --
    sets.midcast.Cure = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
    sets.midcast.Cure.WeaponLock = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
-- Enhancing Magic --
    sets.midcast.Enhancing = set_combine(sets.midcast.ConserveMP, {
   main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Perimede Cape",
		})
	sets.midcast.Duration =  set_combine(sets.midcast.Recast, {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Telchine Cap",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Perimede Cape",
		})		
	sets.midcast.Phalanx = set_combine(sets.midcast.Duration, {
	head={ name="Merlinic Hood", augments={'Potency of "Cure" effect received+3%','STR+10','Phalanx +3','Accuracy+7 Attack+7','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	feet={ name="Merlinic Crackows", augments={'"Resist Silence"+4','AGI+5','Phalanx +4','Accuracy+19 Attack+19',}},})
		
	sets.midcast.Refresh =  set_combine(sets.midcast.Duration, {
	head="Amalric Coif +1",})	
    sets.midcast['Stoneskin'] = set_combine(sets.midcast.ConserveMP, {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Perimede Cape",
		})	
-- Enfeebling Magic --
    sets.midcast.Enfeebling = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}	
	    sets.midcast['Dispelga'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth gloves +3",
    legs="Geomancy Pants +3",
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}	
    sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, {})
    sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, {back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},})	
-- Dark Magic --
	sets.midcast.Dark = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Bagua Galero +1", augments={'Enhances "Primeval Zeal" effect',}},
    body="Geomancy Tunic +3",
    hands="Geo. Mitaines +3",
    legs="Azimuth Tights +3",
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
    sets.midcast.Drain = set_combine(sets.midcast.Recast, {})
    sets.midcast['Stun']  = set_combine(sets.midcast.Recast, {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Amalric Coif +1",
     body={ name="Merlinic Jubbah", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +8','AGI+2','Mag. Acc.+15',}},
    hands="Geo. Mitaines +3",
    legs="Geomancy Pants +3",
      feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cetl Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Stikini Ring +1",
    right_ring="Metamor. Ring +1",
       back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	})		
	    sets.midcast['Absorb-TP']  =  {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    right_ring="Stikini Ring +1",
    left_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
-- Elemental Magic --
    sets.midcast.Elemental = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth hood +3",
    body="Azimuth Coat +3",
    hands="Agwu's Gages",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Freke Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	} 
	sets.midcast['Warp II'] = {
	    main="Solstice",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+7',}},
    body={ name="Merlinic Jubbah", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+2',}},
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+7','Mag. Acc.+1','"Mag.Atk.Bns."+6',}},
    legs="Geomancy Pants +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+6',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Malignance Earring",
    right_ear="Gwati Earring",
    right_ring="Gelatinous Ring +1",
    left_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	sets.midcast.Elemental.MB = set_combine(sets.midcast.Elemental, {})	
	sets.midcast.Elemental.Geo = set_combine(sets.midcast.Elemental, {head="Azimuth hood +3",hands="Agwu's Gages",})	
	sets.midcast['Impact'] = {
		main="Idris",
		sub="Ammurapi Shield",
        range="Dunna",
	    head=empty,
		neck="Bagua Charm +2",
	    ear1="Malignance Earring",
	    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
	    body="Crepuscular Cloak",
	    hands="Geo. Mitaines +3",
	    ring1="Metamor. Ring +1",
		ring2="Freke Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	    waist="Eschan Stone",
	    legs="Geomancy Pants +3",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		}		
-- Geomancy Magic --
    sets.midcast.Geomancy = set_combine(sets.midcast.ConserveMP, {
   main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +8','Indi. eff. dur. +20','Pet: Damage taken -4%','Damage taken-3%',}},
	})
---- Aftercast ----
    sets.aftercast = {}
    sets.aftercast.Idle = {
     main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	
    sets.aftercast.Defense = set_combine(sets.aftercast.Idle, {    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},})	
    sets.aftercast.Luopan =  {
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	
    sets.aftercast.Luopan.Regen =  set_combine(sets.aftercast.Luopan, {
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})	
	
    sets.aftercast.Luopan.Defense = set_combine(sets.aftercast.Luopan, {
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})
    sets.aftercast.Town = {    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},}
-- Resting Sets --
    sets.resting = {    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Lugalbanda Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},}
-- Melee Sets --
    sets.engaged = {	
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cetl Belt",
    left_ear="Telos Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},
	}
    sets.engaged.DualWield = {
    main="Idris",
    sub="Daybreak",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Cetl Belt",
    left_ear="Telos Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+20','Damage taken-8%','INT+15 MND+15',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},
	}	
end	
---- .::Pretarget Functions::. ---->
function pretarget(spell,action)
-- Auto-Echo drop :D --
    if spell.action_type == 'Magic' and buffactive['Silence'] then 
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
-- Auto Blaze of Glory for lazies :p --		
--	elseif string.find(spell.english, 'Geo-') then
--        if not buffactive['Bolster'] and not buffactive['Amnesia'] and not pet.isvalid and windower.ffxi.get_ability_recasts()[247] < 1	then
--		    cancel_spell()
--			send_command('input /ja "Blaze of Glory" <me>;wait 2;input /ma "'..spell.english..'" '..spell.target.name)
--	    end
-- Auto Entrust if you are targeting someone else than you --	
--	elseif string.find(spell.english, 'Indi-') then	
--        if spell.target.type == 'PLAYER' and windower.ffxi.get_ability_recasts()[93] < 1 and not buffactive['Entrust'] and not buffactive['Amnesia']  then
 --       cancel_spell()
--        send_command('input /ja "entrust" <me>;wait 1.5;input /ma "'..spell.name..'" '..spell.target.name..';')		
--		end
	end
end	
---- .::Precast Functions::. ---->
function precast(spell)	
    if spell.action_type == 'Magic' then	
-- Healing Magic --	
	    if spell.skill == 'Healing Magic' then
            if string.find(spell.english,'Cure') then
	            equip(sets.precast.Cure)
	        elseif string.find(spell.english,'Cura') then
		        equip(sets.precast.Cure)
			else
                equip(sets.precast.FC)			
		    end
-- Enhancing Magic --		
        elseif spell.skill == 'Enhancing Magic' then
  	        equip(sets.precast.FC)
            if spell.english == 'Stoneskin' then
                equip(sets.precast[spell.english])
            end
-- Dark Magic
        elseif spell.skill == 'Dark Magic' then
            equip(sets.precast.FC)	
-- Enfeebling Magic
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.precast.FC)			
-- Elemental Magic --		
	    elseif spell.skill == 'Elemental Magic' then
			if spell.english == 'Impact' then
			    equip(sets.precast['Impact'])
			else
                equip(sets.precast.Elemental)			
			end				
-- Geomancy Magic --		
        elseif spell.skill == 'Geomancy' then
            equip(sets.precast.Geomancy)
			if string.find(spell.english, 'Indi') then
       			windower.send_command('timers c "Indi-Spell" 300')
			    if buffactive['Entrust'] then
                    equip(sets.precast.Geomancy, {main="Solstice"})				
                end					
			end							
        end	
    end		
-- Job Abilities --	
    if spell.type == 'JobAbility' then
        equip(sets.JA[spell.english])
		if spell.english == 'Radial Arcana' then
		    equip(sets.JA[spell.english])
			disable('feet')
		end			
-- Weapon skills --
    elseif spell.type == 'WeaponSkill' then
        equip(sets.WS[spell.english])
	end		
end		
---- .::Midcast Functions::. ---->
function midcast(spell)
    if spell.action_type == 'Magic' then
-- Healing Magic --	
	    if spell.skill == 'Healing Magic' then
		    equip(sets.midcast.Recast)
			if WeaponLock == 'ON' then
                if string.find(spell.english,'Cure') then
	                equip(sets.midcast.Cure.WeaponLock)
	            elseif string.find(spell.english,'Cura') then
	    	        equip(sets.midcast.Cure.WeaponLock)
				end
            elseif string.find(spell.english,'Cure') then
	            equip(sets.midcast.Cure)
	        elseif string.find(spell.english,'Cura') then
	    	    equip(sets.midcast.Cure)				
	    	end
-- Enhancing Magic --		
	    elseif spell.skill == 'Enhancing Magic' then
		    equip(sets.midcast.Recast)		
	        if spell.english == 'Phalanx' then
	    	    equip(sets.midcast.Phalanx)
	    	elseif string.find(spell.english, 'Bar') then
		        equip(sets.midcast.Enhancing)
            elseif spell.english == 'Stoneskin' then
                equip(sets.midcast[spell.english])
            elseif spell.english == 'Haste' then
                equip(sets.midcast.Duration)
            elseif spell.english == 'Refresh' then
                equip(sets.midcast.Refresh)	
            elseif spell.english == 'Aquaveil' then
                equip(sets.midcast.Duration)				
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
        elseif spell.skill == 'Dark Magic' then
		    equip(sets.midcast.Recast)
            if string.find(spell.english, 'Aspir') then
                equip(sets.midcast.Drain)
            elseif string.find(spell.english, 'Drain') then
                equip(sets.midcast.Drain)
            elseif spell.english == 'Stun' then
                equip(sets.midcast['Stun'])	
			elseif spell.english == 'Absorb-TP' then
			equip(sets.midcast['Absorb-TP'])	
	    	end	
-- Elemental Magic --		
        elseif spell.skill == 'Elemental Magic' then
		    if spell.english == 'Impact' then
				equip(sets.midcast['Impact'])			
	        elseif MagicArray[MagicIndex] == 'Normal' then
		        equip(sets.midcast.Elemental)			
	            if spell.element == world.weather_element or spell.element == world.day_element then	
                    equip(sets.midcast.Elemental,{waist="Hachirin-no-Obi"})			
                elseif eleGeo:contains(spell.name) then
                    equip(sets.midcast.Elemental.Geo)	
				end	
	        elseif MagicArray[MagicIndex] == 'Magic Burst' then
                equip(sets.midcast.Elemental.MB)
				if spell.english == 'Impact' then
				    equip(sets.midcast.Impact)				
	            elseif spell.element == world.weather_element or spell.element == world.day_element then	
                    equip(sets.midcast.Elemental.MB, {waist="Hachirin-no-Obi"})
				end	
			end	
-- Geomancy Magic --		
        elseif spell.skill == 'Geomancy' then
            equip(sets.midcast.Geomancy)
            if string.find(spell.english, 'Indi-') then
			    if buffactive['Entrust'] then
                    equip(sets.midcast.Geomancy, {main="Solstice",legs="Bagua Pants +3",feet="Azimuth Gaiters +3",})          
				else 
				equip(sets.midcast.Geomancy, {legs="Bagua Pants +3",})
				end
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
            if player.mpp <50 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle", waist="Fucho-no-obi"})  
            elseif player.tp >100 then
                equip(sets.aftercast.Idle, {neck="Chrys. Torque", back="Mecisto. Mantle"}) 	
			end		
	    elseif pet.isvalid and LuopanArray[LuopanIndex] == 'Normal' then
            equip(sets.aftercast.Luopan, {back="Mecisto. Mantle"})
			if player.mpp <80 then
                equip(sets.aftercast.Luopan, {back="Mecisto. Mantle"})
	            if player.mpp <50 then
                    equip(sets.aftercast.Luopan, {back="Mecisto. Mantle", waist="Fucho-no-obi"})	
                elseif player.tp >100 then
                    equip(sets.aftercast.Luopan, {neck="Chrys. Torque", back="Mecisto. Mantle"}) 
		        end	
		    end	
		end	
	    status_change(player.status)		
-- Luopan Rules --		
	elseif pet.isvalid then
        if LuopanArray[LuopanIndex] == 'Normal' then	
            equip(sets.aftercast.Luopan)
			if player.mpp <50 then
                equip(sets.aftercast.Luopan, {waist="Fucho-no-obi"})	
                if player.tp >100 then
                    equip(sets.aftercast.Luopan, {neck="Chrys. Torque"}) 
                end
			end			
        elseif LuopanArray[LuopanIndex] == 'Regen' then	
            equip(sets.aftercast.Luopan.Regen)				
        elseif LuopanArray[LuopanIndex] == 'PDT' then	
            equip(sets.aftercast.Luopan.Defense)				
		end
	status_change(player.status)		
-- Idle Rules --		
	elseif player.mpp <80 then
        equip(sets.aftercast.Idle)
        if player.mpp <50 then
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
-- Town Rules --		
	elseif Town:contains(world.zone) then
        equip(sets.aftercast.Town)			
    end
	status_change(player.status)	
end
--- .:: Status Changes ::.. --->
function status_change(new,tab,old)
-- Idle rules --
    if new == 'Idle' then
	    if Capacity == 'ON' then
	        equip(sets.aftercast.Defense, {})
		    if player.mpp <80 then
                equip(sets.aftercast.Idle, {})
                if player.mpp <50 then
                    equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
                elseif player.tp >100 then
                    equip(sets.aftercast.Idle, {}) 	
			    end		
	        elseif pet.isvalid and LuopanArray[LuopanIndex] == 'Normal' then
                equip(sets.aftercast.Luopan, {})
			    if player.mpp <80 then
                    equip(sets.aftercast.Luopan, {})
	                if player.mpp <50 then
                        equip(sets.aftercast.Luopan, {waist="Fucho-no-obi"})	
                    elseif player.tp >100 then
                        equip(sets.aftercast.Luopan, {}) 
		            end	
		     	end	
			end	
	    elseif pet.isvalid then
            if LuopanArray[LuopanIndex] == 'Normal' then	
                equip(sets.aftercast.Luopan)
			    if player.mpp <50 then
                    equip(sets.aftercast.Luopan, {waist="Fucho-no-obi"})	
                    if player.tp >100 then
                        equip(sets.aftercast.Luopan, {}) 
                    end
			    end			
            elseif LuopanArray[LuopanIndex] == 'Regen' then	
                equip(sets.aftercast.Luopan.Regen)				
            elseif LuopanArray[LuopanIndex] == 'PDT' then	
                equip(sets.aftercast.Luopan.Defense)				
		    end
	    elseif player.mpp <80 then
            equip(sets.aftercast.Idle)
            if player.mpp <50 then
                equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  
            elseif player.tp >100 then
                equip(sets.aftercast.Idle, {}) 	
		    end	
	    elseif Town:contains(world.zone) then
            equip(sets.aftercast.Town)	
        end			
	elseif new == 'Resting' then
		equip(sets.resting)	
-- TP Status change Rule --		
    elseif new == 'Engaged' then			
	    if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
            equip(sets.engaged.DualWield)	
		else	
            equip(sets.engaged)	
		end			
    end		
end
--- ..:: Pet Status change ::.. --->
function pet_change(pet,gain_or_loss)
    status_change(player.status)
    if not gain_or_loss then
        enable('feet')
		send_command('input /echo ..:: Luopan died ::..')
    end	
end
--- ..:: Modes functions ::.. --->
function self_command(command)	
	if command == 'C1' then -- Magic Acc Cycle --		
        MagicIndex = (MagicIndex % #MagicArray) + 1
        add_to_chat(158,'Magic Set: ' .. MagicArray[MagicIndex])
        status_change(player.status)
	elseif command == 'C9' then -- Luopan Idle Cycle --		
        LuopanIndex = (LuopanIndex % #LuopanArray) + 1
        add_to_chat(158,'Luopan Idle Set: ' .. LuopanArray[LuopanIndex])
        status_change(player.status)
    elseif command == 'C10' then -- Melee toggle --
        if Melee == 'ON' then
           Melee = 'OFF'
           enable('main', 'sub' ,'range' ,'ammo')				
           add_to_chat(123,'Melee Set: [OFF]')
        else
           Melee = 'ON'
           disable('main', 'sub' ,'range' ,'ammo')			
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