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
	--gear.FC_Body = { name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+8%','STR+3',}},
	--gear.FC_Feet = { name="Merlinic Crackows", augments={'"Fast Cast"+7','AGI+10',}}
	--gear.Macc_Body = { name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+8%','STR+3',}},
   -- gear.MB_Head = { name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+8%','INT+6','Mag. Acc.+9',}},
	--gear.MB_Body = "Spaekona's Coat +2"
  --  gear.MB_Feet = { name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}}
 --   gear.Death_Hands = { name="Amalric Gages +1", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
  --  gear.MB_Hands = { name="Amalric Gages +1", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
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
		main={ name="Grioavolr", augments={'Enmity-1','Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. Acc.+20','Magic Damage +2',}},
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head={ name="Merlinic Hood", augments={'Accuracy+19','"Fast Cast"+6','MND+9','Mag. Acc.+8',}},
		body="Shango Robe",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+12',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','AGI+10',}},
		neck="Voltsurge Torque",
		waist="Channeler's Stone",
		left_ear="Genmei Earring",
		right_ear="Malignance Earring",
		left_ring="Lebeche Ring",
		right_ring="Prolix Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
    sets.precast.Cure = set_combine(sets.precast.FC, {ear="Mendi. earring"})		
    sets.precast.Enhancing = set_combine(sets.precast.FC, {})
    sets.precast['Stoneskin'] = set_combine(sets.precast.FC, {})
	sets.precast.Elemental = set_combine(sets.precast.FC, {})
	sets.precast['Impact'] = {
		ammo="Impatiens",
        head=empty,
		neck="Voltsurge Torque",
        ear1="Loquac. Earring",
        ear2="Enchntr. Earring +1",
        body="Twilight Cloak",
        hands="Merlinic Destanas",
        ring1="Prolix Ring",
        ring2="Lebeche Ring",
        back="Perimede Cape",
        waist="Witful Belt",
		legs="Psycloth Lappas",
        feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','AGI+10',}}}	
	sets.precast['Death'] = {
    ammo="Strobilus",
    head={ name="Merlinic Hood", augments={'Accuracy+19','"Fast Cast"+6','MND+9','Mag. Acc.+8',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+8%','STR+3',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+10','Pet: VIT+3',}},
    legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+12',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','AGI+10',}},
    neck="Voltsurge Torque",
    waist="Channeler's Stone",
    left_ear="Malignance Earring",
    right_ear="Barkaro. Earring",
    left_ring="Prolix Ring",
    right_ring="Lebeche Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}		
-- Job Abilities --
	sets.JA = {}
	sets.JA['Manafont'] = {}
-- WS sets --
	sets.WS = {}
	sets.WS['Myrkr'] = {
    ammo="Strobilus",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body="Rosette Jaseran",
    hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+4%','INT+9','Mag. Acc.+9',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Mendi. Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Lebeche Ring",
    back="Tantalic Cape",
	}
    sets.midcast = {}
-- Base Set --
    sets.midcast.Recast = {
		main={ name="Grioavolr", augments={'Enmity-1','Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. Acc.+20','Magic Damage +2',}},
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head={ name="Merlinic Hood", augments={'Accuracy+19','"Fast Cast"+6','MND+9','Mag. Acc.+8',}},
		body="Shango Robe",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+12',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','AGI+10',}},
		neck="Voltsurge Torque",
		waist="Channeler's Stone",
		left_ear="Genmei Earring",
		right_ear="Malignance Earring",
		left_ring="Lebeche Ring",
		right_ring="Prolix Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
		}
    sets.midcast.ConserveMP = {
	    ammo="Pemphredo Tathlum",
		head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Gwati Earring",
		ear2="Gifted Earring",
		body="Witching Robe",
		back="Taranus's Cape",
		waist="Luminary Sash",
		legs="Vanya Slops",
		feet="Merlinic Crackows"}
-- Healing Magic --
    sets.midcast.Cure = {	
    ammo="Staunch Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Genmei Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Stikini Ring",
    back="Tempered Cape",
	}	
    sets.midcast.Cure.WeaponLock = {	
    ammo="Staunch Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Genmei Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Stikini Ring",
    back="Tempered Cape",
		}			
    sets.midcast.Enhancing = set_combine(sets.midcast.ConserveMP, {
	    head="Befouled Crown",	
        neck="Incanter's Torque",	
		ear1="Andoaa Earring",
		ear2="Augmenting Earring",
	    body="Telchine Chasuble",
		hands="Telchine Gloves",
        ring1="Stikini Ring",
        ring2="Stikini Ring",		
		back="Perimede Cape",
		legs="Telchine Braconi",		
	    feet="Telchine Pigaches"})
	sets.midcast.Duration =  set_combine(sets.midcast.Recast, {	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})	
    sets.midcast['Stoneskin'] = set_combine(sets.midcast.ConserveMP, {	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		hands="Telchine Gloves",		
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})	
-- Enfeebling Magic --
    sets.midcast.Enfeebling = {
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body="Ea Houppe. +1",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+18','Accuracy+2','Magic burst dmg.+12%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Barkaro. Earring",
		left_ring="Stikini Ring",
		right_ring="Globidonta Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}	
    sets.midcast.Enfeebling.MND = set_combine(sets.midcast.Enfeebling, {})
    sets.midcast.Enfeebling.INT = set_combine(sets.midcast.Enfeebling, {head="Ea Hat +1"})		
-- Dark Magic --
    sets.midcast.Dark = {}
    sets.midcast.Drain = set_combine(sets.midcast.Recast, {})
    sets.midcast['Stun'] = set_combine(sets.midcast.Recast, {
        ammo="Pemphredo Tathlum",
	    ring2="Stikini Ring",
		back="Taranus's Cape"})	
    sets.midcast['Death'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+8%','INT+6','Mag. Acc.+9',}},
		body="Ea Houppe. +1",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+18','Accuracy+2','Magic burst dmg.+12%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
		neck="Mizu. Kubikazari",
		waist="Hachirin-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Malignance Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Archon Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}	
    sets.midcast.Death.Aspir = {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+8%','INT+6','Mag. Acc.+9',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+8%','STR+3',}},
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+18','Accuracy+2','Magic burst dmg.+12%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
		neck="Mizu. Kubikazari",
		waist="Fucho-no-Obi",
		left_ear="Barkaro. Earring",
		right_ear="Malignance Earring",
		left_ring="Mephitas's Ring +1",
		right_ring="Archon Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
		}	
-- Elemental Magic --
    sets.midcast.Elemental = {
		ammo="Pemphredo Tathlum",
		head="C. Palug Crown",
		body="Ea Houppe. +1",
		hands="Amalric Gages +1",
		legs="Ea Slops +1",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
		neck="Mizu. Kubikazari",
		waist="Eschan Stone",
		left_ear="Barkaro. Earring",
		right_ear="Malignance Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}	
	sets.midcast.Elemental.Weather = set_combine(sets.midcast.Elemental, {
--		back="Twilight Cape",
		waist="Hachirin-no-Obi"}) 	
	sets.midcast.Elemental.MB = set_combine(sets.midcast.Elemental, {head="Ea Hat +1"}) 
	sets.midcast.Elemental.MB.Weather = set_combine(sets.midcast.Elemental.MB, {
--	    ear2="Static Earring",
--		back="Twilight Cape",
		waist="Hachirin-no-Obi"}) 	
	sets.midcast['Impact'] = {body="Twilight Cloak"}	
	sets.midcast['Comet'] =  { -- This is special gear for the death toggle --	
	    ammo="Pemphredo Tathlum",
		head="Ea Hat +1",
		neck="Mizukage-no-kubikazari",
		ear1="Barkarole Earring",
		ear2="Malignance Earring",
	    body="Ea Houppe. +1",
        hands="Amalric Gages +1",
		ring1="Mephitas's Ring +1",
		ring2="Archon Ring",
		back="Taranus's Cape",
		waist="Hachirin-no-Obi",
		legs="Ea Slops +1",
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+1','INT+9','Mag. Acc.+12','"Mag.Atk.Bns."+13',}}}			
---- Aftercast ----
    sets.aftercast = {}
    sets.aftercast.Idle = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head={ name="Merlinic Hood", augments={'STR+10','Attack+20','"Refresh"+2','Accuracy+17 Attack+17','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		body= "Revealer's Tunic",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Attack+21','Phys. dmg. taken -4%','Mag. Acc.+14','"Mag.Atk.Bns."+11',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22','Damage taken-3%','MND+9','"Mag.Atk.Bns."+8',}},
		neck="Elite Royal Collar",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Taranus's Cape",
	}
    sets.aftercast.Defense = set_combine(sets.aftercast.Idle, {	})
    sets.aftercast['Death'] = {
		main="Grioavolr",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head={ name="Merlinic Hood", augments={'STR+10','Attack+20','"Refresh"+2','Accuracy+17 Attack+17','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		body= "Revealer's Tunic",
		hands="Amalric Gages +1",
		legs={ name="Merlinic Shalwar", augments={'Attack+21','Phys. dmg. taken -4%','Mag. Acc.+14','"Mag.Atk.Bns."+11',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22','Damage taken-3%','MND+9','"Mag.Atk.Bns."+8',}},
		neck="Elite Royal Collar",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Thureous Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back="Taranus's Cape",
		}		
    sets.aftercast.Town = {feet="Herald's Gaiters"}
    sets.resting = {}
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
                        equip(sets.midcast.Elemental.Weather,{body="Spaekona's Coat +2"}) 						
					end	
				elseif player.mpp <75 then
				    equip(sets.midcast.Elemental, {body="Spaekona's Coat +2"})
				end					
			elseif MagicArray[MagicIndex] == 'Death' then
				if spell.english == 'Comet' then
                    equip(sets.midcast['Comet'], {body="Spaekona's Coat +2"})
	                if spell.element == world.weather_element or spell.element == world.day_element then	
                        equip(sets.midcast['Comet'],{body="Spaekona's Coat +2", waist="Hachirin-no-Obi"}) 
                    end						
				else
                    equip(sets.midcast.Elemental.MB)				
				end					
	        elseif MagicArray[MagicIndex] == 'Magic Burst' then
                equip(sets.midcast.Elemental.MB)					
	            if spell.element == world.weather_element or spell.element == world.day_element then	
                    equip(sets.midcast.Elemental.MB.Weather)								
                    if player.mpp <75 then
                        equip(sets.midcast.Elemental.MB.weather,{body="Spaekona's Coat +2"}) 
					end	
				elseif player.mpp <75 then
				    equip(sets.midcast.Elemental.MB, {body="Spaekona's Coat +2"})				
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