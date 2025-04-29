----- Credit: Krystela of Asura | Last Update: 27 July 2016 ---->
---- .:: This was entirely created by me, it's not based off anyone's file ::. ---->
---- Always visit http://pastebin.com/u/KrystelaRose to look for possible updates ---->
---- .:: Please leave credit where it's due ::. ---->
---- .:: If you have any problem contact me via ffxiah: http://www.ffxiah.com/player/Asura/Krystela ::. ---->


function user_unload()
    send_command('unbind ^f1')
    send_command('unbind ^f2')
    send_command('unbind ^f3')	
    send_command('unbind ^f10')
    send_command('unbind ^f11')		
end
function get_sets()

-- Binds for modes
    send_command('bind ^f1 gs c C1')
	send_command('bind ^f10 gs c C10')
	send_command('bind ^f11 gs c C11')
-- Binds for Mana wall and Enmity Douse --	
    send_command('bind ^f2 input /ja Mana wall <me>')
    send_command('bind ^f3 input /ja Enmity Douse <t>')		
-- Modes --
    MagicIndex = 1
    MagicArray = {"Normal","Death","Magic Burst"} -- Press ctrl + F1 to circle through Magic modes --
	WeaponLock = 'OFF' -- Press ctrl + F10 to Lock Weapon/sub/range/ammo --	
	Capacity = 'OFF' -- Press ctrl + F11 to have Capacity cape on while Idle --
-- Gears --
    gear = {}
	gear.FC_Body ={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Fast Cast"+5','MND+9','"Mag.Atk.Bns."+15',}}
	gear.FC_Feet = { name="Merlinic Crackows", augments={'"Fast Cast"+5','Mag. Acc.+13','"Mag.Atk.Bns."+11',}}
	gear.Macc_Body ={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}}
    gear.MB_Head ={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+24','Magic burst dmg.+10%','INT+9','Mag. Acc.+15',}}
	gear.MB_Body = { name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}}
    gear.MB_Feet  ={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}}
    gear.Death_Hands = { name="Amalric Gages +1", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
    gear.MB_Hands =	{ name="Amalric Gages +1", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
	gear.MB_Legs ={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+3',}}
-- Set macro book/set --
    send_command('input /macro book 4;wait .1;input /macro set 1') -- set macro book/set here --
---- .::Spellmaps::. ---->		
    enfMND = S{'Paralyze','Slow'}
    enfINT = S{'Blind'}		
	-- Area mapping --	
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
	         "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
	         "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}
    Assault = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
                "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}
---- Precast ----
    sets.precast = {}
    sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'Enmity-3','INT+5','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Fast Cast"+5','MND+9','"Mag.Atk.Bns."+15',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Naji's Loop",
    right_ring="Kishar Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
    sets.precast.Cure = set_combine(sets.precast.FC, {ear1="Mendi. Earring"})		
    sets.precast.Enhancing = set_combine(sets.precast.FC, {})
    sets.precast['Stoneskin'] = set_combine(sets.precast.FC, {})
	sets.precast.Elemental = set_combine(sets.precast.FC, {})
	sets.precast['Impact'] = {
		ammo="Impatiens",
        head=empty,
		neck="Voltsurge Torque",
        ear1="Loquac. Earring",
        ear2="Enchanter Earring +1",
        body="Twilight Cloak",
        hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5',}},
        ring1="Prolix Ring",
        ring2="Lebeche Ring",
        back="Perimede Cape",
        waist="Embla sash",
		legs="Psycloth Lappas",
        feet=gear.FC_Feet}	
	sets.precast['Death'] = {
		ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
		neck="Voltsurge Torque",
        ear2="Malignance Earring",
        ear1="Barkaro earring",
        body=gear.FC_Body,
        hands="Merlinic Dastanas",
        ring2="Lebeche Ring",
        ring1="Mephitas's Ring",
        back="Embla sash",
        waist="Channeler's Stone",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+9','"Fast Cast"+7',}},
        feet=gear.FC_Feet}		
-- Job Abilities --
	sets.JA = {}
	sets.JA['Manafont'] = {}
-- WS sets --
	sets.WS = {
	}
	sets.WS['Myrkr'] = {
	    ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",
		neck="Saevus Pendant +1",
	    ear2="Moonshade Earring",
	    ear1="Etiolation Earring",
	    body="Witching Robe",
	    hands="Amalric Gages +1",
	    ring2="Lebeche Ring",
	    ring1="Mephitas's Ring",
	    back="Pahtli cape",
	    waist="Luminary Sash",
	    feet="Medium's Sabots"}
		
	sets.WS['Oshala'] = {    main="Opashoro",
    sub="Enki Strap",
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: C',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
    sets.midcast = {}
-- Base Set --
    sets.midcast.Recast = {
		ammo="Sapience orb",
        head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+29','Magic burst dmg.+7%','Mag. Acc.+4',}},
        neck="Voltsurge Torque",
        ear2="Malignance Earring",
        ear1="Enchanter Earring +1",
        body=gear.FC_Body,
        hands="Merlinic Dastanas",
        ring1="Prolix Ring",
		ring2="Lebeche Ring",
        back="Perimede Cape",
        waist="Embla sash",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+9','"Fast Cast"+7',}},
        feet=gear.FC_Feet}
    sets.midcast.ConserveMP = {
	    ammo="Pemphredo Tathlum",
		head="Vanya Hood",
		neck="Elite Royal Collar",
		ear2="Gwati Earring",
		ear1="Mendi. Earring",
		body="Witching Robe",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		waist="Luminary Sash",
		legs="Vanya Slops",
		feet="Merlinic Crackows"}
-- Healing Magic --
    sets.midcast.Cure = {	
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Healing Torque",
    waist="Luminary Sash",
    right_ear="Malignance Earring",
    left_ear="Mendi. Earring",
    ring2="Lebeche Ring",
    ring1="Sirona's Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}	
    sets.midcast.Cure.WeaponLock = {	
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+5',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Healing Torque",
    waist="Luminary Sash",
    right_ear="Malignance Earring",
    left_ear="Mendi. Earring",
    ring2="Lebeche Ring",
    ring1="Sirona's Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}			
    sets.midcast.Enhancing = set_combine(sets.midcast.ConserveMP, {
	    head="Befouled Crown",	
        neck="Incanter's Torque",	
		ear1="Andoaa Earring",
		ear2="Augmenting Earring",
	    body="Telchine Chasuble",
		hands="Telchine Gloves",
		waist="Embla sash",
        ring1="Stikini Ring",
        ring2="Stikini Ring",		
		back="Perimede Cape",
		legs="Telchine Braconi",		
	    feet="Regal Pumps +1"
		})
	sets.midcast.Duration =  set_combine(sets.midcast.Recast, {	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})	
    sets.midcast['Stoneskin'] = set_combine(sets.midcast.ConserveMP, {	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		waist="Embla sash",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})	
-- Enfeebling Magic --
    sets.midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
		neck="Voltsurge Torque",
		waist="Luminary Sash",
		right_ear="Malignance Earring",
		left_ear="Barkaro. Earring",
		ring2="Vertigo Ring",
		ring1="Globidonta Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}	
    sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, {})
    sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, {})		
-- Dark Magic --
    sets.midcast.Dark = {}
    sets.midcast.Drain = set_combine(sets.midcast.Recast, {legs="Merlinic Shalwar",})
    sets.midcast['Stun'] = set_combine(sets.midcast.Recast, {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
		neck="Voltsurge Torque",
		waist="Luminary Sash",
		right_ear="Malignance Earring",
		left_ear="Barkaro. Earring",
		ring2="Vertigo Ring",
		ring1="Globidonta Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		})	
    sets.midcast['Death'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+3',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
		neck="Saevus Pendant +1",
		waist="Hachirin-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Malignance Earring",
		left_ring="Acumen Ring",
		right_ring="Vertigo Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}	
    sets.midcast.Death.Aspir = {
	    ammo="Pemphedro Tathlum",
		head="Amalric Coif",
		neck="Voltsurge Torque",
		ear2="Loquac. Earring",
		ear1="Etiolation Earring",
		body="Merlinic Jubbah",
        hands="Merlinic Dastanas",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Taranus's Cape",
		waist="Shinjutsu-no-Obi",
		legs=gear.MB_Legs,
		feet=gear.MB_Feet}	
-- Elemental Magic --
    sets.midcast.Elemental = {
    main="Opashoro",
    sub="Enki Strap",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	sets.midcast.Elemental.Weather = set_combine(sets.midcast.Elemental, {
		
		waist="Hachirin-no-Obi"}) 	
	sets.midcast.Elemental.MB = set_combine(sets.midcast.Elemental, {}) 
	sets.midcast.Elemental.MB.Weather = set_combine(sets.midcast.Elemental.MB, {
	 
		waist="Hachirin-no-Obi"}) 	
	sets.midcast['Impact'] = {body="Twilight Cloak"}	
	sets.midcast['Comet'] =  { -- This is special gear for the death toggle --	
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+7%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+11%','Mag. Acc.+3',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst dmg.+3%','CHR+10','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
		neck="Saevus Pendant +1",
		waist="Hachirin-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Malignance Earring",
		left_ring="Acumen Ring",
		right_ring="Vertigo Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}			
---- Aftercast ----
    sets.aftercast = {}
    sets.aftercast.Idle = {
   main="Opashoro",
    sub="Enki Strap",
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Enmity-3','INT+5','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.aftercast.Defense = set_combine(sets.aftercast.Idle, {	
	    ear1="Etiolation Earring",})
    sets.aftercast['Death'] = {
		main="Opashoro",
		sub="Enki Strap",
		ammo="Staunch Tathlum +1",
		head={ name="Merlinic Hood", augments={'Enmity-3','INT+5','"Refresh"+2','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
		body={ name="Witching Robe", augments={'MP+45','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+1','Damage taken-3%','CHR+9','"Mag.Atk.Bns."+4',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','Mag. Acc.+13','"Mag.Atk.Bns."+11',}},
		neck="Elite Royal Collar",
		waist="Channeler's Stone",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		ring2="Vertigo Ring",
		ring1="Defending Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		}		
    sets.aftercast.Town = {right_ring="Shneddick Ring"}
    sets.resting = {}
	sets.Engaged = {    main="Opashoro",
    sub="Enki Strap",
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Asperity Necklace",
    waist="Cornelia's Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
end	
function pretarget(spell,action)
-- Auto-Echo drop :D --
    if spell.action_type == 'Magic' and buffactive['Silence'] then 
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
	end
end	
---- .::Precast Functions::. ---->
-- Spells --
function precast(spell)	
    if spell.action_type == 'Magic' then
	    if MagicArray[MagicIndex] == 'Death' then
            equip(sets.precast['Death'])		
-- Healing Magic --	
        elseif string.find(spell.english,'Cure') then
	        equip(sets.precast.Cure)
	    elseif string.find(spell.english,'Cura') then
		    equip(sets.precast.Cure)	
-- Elemental Magic --		
		elseif spell.english == 'Impact' then
			equip(sets.precast['Impact'])
	    else
			equip(sets.precast.FC)
		end	
-- Job Abilities --	
    elseif spell.type == 'JobAbility' then
        equip(sets.JA[spell.english])	
-- Weapon skills --
    elseif spell.type == 'WeaponSkill' then
        equip(sets.WS[spell.english])
    end		
end		
---- .::Midcast Functions::. ---->
function midcast(spell)
    if spell.action_type == 'Magic' then
-- Healing Magic --	
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
-- Enhancing Magic --		
	    elseif spell.skill == 'Enhancing Magic' then		
	        if spell.english == 'Phalanx' then
	    	    equip(sets.midcast.Enhancing)				
	    	elseif string.find(spell.english, 'Bar') then
		        equip(sets.midcast.Enhancing)
            elseif spell.english == 'Stoneskin' then
                equip(sets.midcast[spell.english])
			elseif spell.english == 'Refresh' then
                equip(sets.midcast.Duration, {head="Amalric Coif"})   
			elseif spell.english == 'Aquaveil' then
                equip(sets.midcast.Duration, {head="Amalric Coif"})  				
			else
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
			if MagicArray[MagicIndex] == 'Death' then
				if spell.english == 'Death' then
                    equip(sets.midcast['Death'])			
                elseif string.find(spell.english, 'Aspir') then
                    equip(sets.midcast.Death.Aspir)
				
				end	
	        elseif MagicArray[MagicIndex] == 'Magic Burst' then
		        if spell.english == 'Death' then
                    equip(sets.midcast.Elemental.MB)
			        if world.weather_element == "Dark" or world.day_element == "Darksday" then
	                    equip(sets.midcast.Elemental.MB.Weather, {ear2="Static Earring"})	
				    end	
			    end	
			elseif spell.english == 'Death' then
		        equip(sets.midcast.Elemental, {ring2="Archon Ring"})			    
			    if world.weather_element == "Dark" or world.day_element == "Darksday" then
	                equip(sets.midcast.Elemental,{ring2="Archon Ring",back="Twilight Cape",waist="Hachirin-no-Obi"})	
                end					
            elseif string.find(spell.english, 'Aspir') or string.find(spell.english, 'Drain') then
                equip(sets.midcast.Drain)
            elseif spell.english == 'Stun' then
                equip(sets.midcast['Stun'])
			end					
-- Elemental Magic --		
        elseif spell.skill == 'Elemental Magic' then
			if spell.english == 'Impact' then
				equip(sets.midcast['Impact'])		
	        elseif MagicArray[MagicIndex] == 'Normal' then
		        equip(sets.midcast.Elemental)			
	            if spell.element == world.weather_element or spell.element == world.day_element then	
                    equip(sets.midcast.Elemental.Weather) 					
                    if player.mpp <75 then
                        equip(sets.midcast.Elemental.Weather,{body="Spae. Coat +1"}) 						
					end	
				elseif player.mpp <75 then
				    equip(sets.midcast.Elemental, {body="Spae. Coat +1"})
				end					
			elseif MagicArray[MagicIndex] == 'Death' then
				if spell.english == 'Comet' then
                    equip(sets.midcast['Comet'], {body="Spae. Coat +1"})
	                if spell.element == world.weather_element or spell.element == world.day_element then	
                        equip(sets.midcast['Comet'],{body="Spae. Coat +1", waist="Hachirin-no-Obi"}) 
                    end						
				else
                    equip(sets.midcast.Elemental.MB)				
				end					
	        elseif MagicArray[MagicIndex] == 'Magic Burst' then
                equip(sets.midcast.Elemental.MB)					
	            if spell.element == world.weather_element or spell.element == world.day_element then	
                    equip(sets.midcast.Elemental.MB.Weather)								
                    if player.mpp <75 then
                        equip(sets.midcast.Elemental.MB.weather,{body="Spae. Coat +1"}) 
					end	
				elseif player.mpp <75 then
				    equip(sets.midcast.Elemental.MB, {body="Spae. Coat +1"})				
				end						
			end	
		else
            equip(sets.midcast.Recast)		
		end	
	end
end	
---- .::Aftercast Sets::. ---->
function aftercast(spell,action)
    equip(sets.aftercast.Defense)
	if MagicArray[MagicIndex] == 'Death' then
	    equip(sets.aftercast['Death'])
	    status_change(player.status)  		
-- Capacity Idle Rule --	
	elseif Capacity == 'ON' then
	    equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})		    
		if player.mpp <80 then
            equip(sets.aftercast.Idle, {back="Mecisto. Mantle"})				
            if player.mpp <50 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle",waist="Fucho-no-obi"})   
		    end
	    end	
	    status_change(player.status)  
	elseif buffactive['Mana Wall'] then
        equip(sets.aftercast.Defense, {back="Taranus's Cape"})	
	    status_change(player.status) 			
	elseif player.mpp <80 then
            equip(sets.aftercast.Idle) 
        if player.mpp <50 then
            equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})  		
		end
	    status_change(player.status)		
	elseif Town:contains(world.zone) then
        equip(sets.aftercast.Town)
    end	
	status_change(player.status)	
end	
---- .::Stantus Changes::. ---->
function status_change(new,tab,old)
    if new == 'Idle' then
	    if MagicArray[MagicIndex] == 'Death' then
	        equip(sets.aftercast['Death'])	
	    elseif Capacity == 'ON' then
	        equip(sets.aftercast.Defense, {back="Mecisto. Mantle"})	
		    if player.mpp <80 then
                equip(sets.aftercast.Idle, {back="Mecisto. Mantle"})				
                if player.mpp <50 then
                    equip(sets.aftercast.Idle, {back="Mecisto. Mantle", waist="Fucho-no-obi"})
		        end
	        end	
		elseif buffactive['Mana Wall'] then
            equip(sets.aftercast.Defense, {back="Taranus's Cape"})		
	    elseif player.mpp <80 then
            equip(sets.aftercast.Idle)		
            if player.mpp <50 then
                equip(sets.aftercast.Idle, {waist="Fucho-no-obi"})    
		    end	
	    elseif Town:contains(world.zone) then
            equip(sets.aftercast.Town)
        end	
	end	
	if new == 'Resting' then
		equip(sets.resting)	
    end
end
--- ..:: Modes functions ::.. --->
function self_command(command)	
	if command == 'C1' then -- Magic Acc Cycle --		
        MagicIndex = (MagicIndex % #MagicArray) + 1
        add_to_chat(158,'Magic Set: ' .. MagicArray[MagicIndex])
        status_change(player.status)
    elseif command == 'C10' then -- Weapon Lock toggle --
        if WeaponLock == 'ON' then
            WeaponLock = 'OFF'
            enable('main', 'sub' ,'range')				
            add_to_chat(123,'Weapon Lock: [OFF]')
        else
            WeaponLock = 'ON'
            disable('main', 'sub' ,'range')			
            add_to_chat(158,'Weapon Lock: [ON]')
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