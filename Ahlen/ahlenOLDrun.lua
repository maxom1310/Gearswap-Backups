function get_sets()
	--Idle Sets--
	sets.Idle = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
     waist="Engraved Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	--TP Sets--
	sets.TP = {}
	sets.TP.index = {'DT','DTNyame','Hybrid'}
	TP_ind = 1
	--offensive melee set
	sets.TP.Standard	 = {
	   ammo="Yamarang",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','DEX+10','Attack+13',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	--high accuracy/DT hybrid set
	sets.TP.Accuracy = {
       ammo="Yamarang",
    head="Nyame Helm",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','DEX+10','Attack+13',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	--full DT melee set
	sets.TP.DT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Turms Leggings +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
	}
		sets.TP.DTNyame = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
	}
	--Hybrid melee set
	sets.TP.Hybrid = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
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
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	
	--Weaponskill Sets--
	sets.WS = {}     
	--multi, carries FTP
	sets.Resolution = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Sroda Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} 
	sets.Ruinator = {
	    ammo="Yamarang",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	--single, doesn't carry FTP Dimidiation
	sets.Single = {
     ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}   
	--single hit, benefits from DA
	sets.Cleave = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Sroda Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} 
	--added effect
	sets.Shockwave = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}                    
	--Requiescat
	sets.Req = {
    ammo="Crepuscular Pebble",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+27','"Triple Atk."+4','STR+7','Attack+14',}},
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','"Triple Atk."+1','STR+13','Attack+2',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epona's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}                                       
	--crit based
	sets.Vorp = {
		neck="Fotia Gorget",
    left_ear="Odr Earring",
    right_ear="Moonshade Earring",
	hands={ name="Herculean Gloves", augments={'Accuracy+27','"Triple Atk."+4','STR+7','Attack+14',}},
    body="Nyame Mail",
	ring1="Epona's Ring",ring2="Ilabrat Ring",
	waist="Fotia Belt",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','DEX+10','Attack+13',}},
	back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} 
	--elemental spells
	 sets['Elemental Magic'] = {
    ammo="Pemphredo Tathlum",
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
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
}
	--magic WS
	sets.HercSlash = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Fenrir Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	} 
	sets.Utility = {}   
	--full PDT set for when stunned, etc.
	sets.Utility.PDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	--full MDT set for when stunned, etc
	sets.Utility.MDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
	}
	--Job Ability Sets--
	sets.JA = {}
	sets.JA.Lunge = {
    ammo="Pemphredo Tathlum",
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
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
}
	sets.JA.Vallation = {body="Runeist's Coat +2",legs="Futhark Trousers +3"}       
	sets.JA.Gambit = {hands="Runeist mitons +2"}
	sets.JA.Rayke = {feet="Futhark boots"}  
	sets.JA.Battuta = {head="Futhark bandeau +3"}      
	sets.JA.Pflug = {feet="Runeist bottes +1"}              
	sets.JA.Pulse = {head="Erilaz Galea +2"}
					
	--Precast Sets--
	--Fast Cast set
	sets.precast = {
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -7%','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Fast Cast"+6','STR+6','"Mag.Atk.Bns."+9',}},
    feet="Carmine Greaves +1",
    neck="Orunmila's Torque",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Kishar Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}, --10
	} --2 +12 + 4+ 7+ 5 + 1 + 2 + 4 + 10 = 
	
	sets.Phalanx = {
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'"Blood Boon"+1','Enmity-2','Phalanx +4','Accuracy+13 Attack+13','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+25','Pet: Crit.hit rate +1','Phalanx +4','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},}  
	sets.recphalanx = {
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'"Blood Boon"+1','Enmity-2','Phalanx +4','Accuracy+13 Attack+13','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+25','Pet: Crit.hit rate +1','Phalanx +4','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+2 Attack+2','Mag. Acc.+9','Phalanx +4','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},} 
	--Enmity set for high hate generating spells and JAs                
	sets.Enmity =  {     
    ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +2",
    feet="Erilaz Greaves +2",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Vengeful Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
		}     --6
	sets.OneforAll = {
    ammo="Aqreqaq Bomblet",
    head="Halitus Helm",
    body="Nyame Mail",
    hands="Regal Gaunlets",
    legs="Eri. Leg Guards +2",
    feet="Carmine Greaves +1",
    neck={ name="Futhark Torque +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Eihwaz Ring",
    right_ring="Vengeful Ring",
    back="Moonlight Cape",
	}
	--Magic acc for enfeebles, handy for VW
	sets.MagicAcc = {
		  head="Nyame Helm",
		ear1="Gwati Earring",
		body="Nyame Mail",
		hands="Leyline Gloves",
		feet="Nyame Sollerets"}             
	 
	--Toggle TP sets button, change if you want; currently ALT+F9 toggles forward, CTRL+F9 toggles backwards
	send_command('bind !f9 gs c toggle TP set')
	send_command('bind ^f9 gs c reverse TP set')
	--other stuff, don't touch
	ShadowType = 'None'
end
 
--the following section looks at the weather/day to see if the Hachirin-no-Obi is worth using
--add the following line to a section to have it check the element and equip the obi:
-->>>  mid_obi(spell.element,spell.name)
function mid_obi(spelement,spellname)
    if spelement == nil then
		spelement = "Light"
    end
    if spellname == nil then
		spellname = "Cure"
    end   
    elements = {}
        elements.list = S{'Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark'}
        elements.number = {[0]="Fire",[1]="Ice",[2]="Wind",[3]="Earth",[4]="Lightning",[5]="Water",[6]="Light",[7]="Dark"}
        elements.weak = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
    ['Lightning']='Earth', ['Water']='Lightning'}
        weather = world.weather_element
        intensity = 1 + (world.weather_id % 2)
        day = world.day
        boost = 0
        obi = nil
        
       for _,buff in pairs (windower.ffxi.get_player().buffs) do
            if buff > 177 and buff < 186 then
                weather = elements.number[(buff - 178)]
                intensity = 1
            elseif buff > 588 and buff < 597 then
                weather = elements.number[(buff - 589)]
                intensity = 2
            end
            if spellname == "Swipe" or spellname == "Lunge" or spellname == "Vivacious Pulse" then
                if buff > 522 and buff < 531 then
					spelement = elements.number[(buff - 523)]
                end
            end
        end
        if weather == spelement then
			boost = boost + intensity
        elseif weather == elements.weak[spelement] then
			boost = boost - intensity
        end
        if day == spelement then
			boost = boost + 1
        elseif day == elements.weak[spelement] then
			boost = boost - 1
        end
        if boost > 0 then
            if player.inventory["Hachirin-no-Obi"] or player.wardrobe["Hachirin-no-Obi"] then
                equip({waist="Hachirin-no-Obi"})
            end
        end
end
                
function precast(spell,abil)
	--equips favorite weapon if disarmed
	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		equip({main="Epeolatry",sub="Utu Grip"})
	end
	if spell.action_type == 'Magic' then 
		equip(sets.Utility.PDT,sets.precast)            
	end  
	if spell.skill == 'Enhancing Magic' then
		equip({legs="Futhark Trousers +3"})
	end
	if string.find(spell.name,'Utsusemi') then
		equip({})
	end  
	if spell.name == 'Lunge' or spell.name == 'Swipe' then
		equip(sets.JA.Lunge)
		mid_obi(spell.element,spell.name)
	end      
	--prevents Valiance/Vallation/Liement from being prevented by each other (cancels whichever is active)
	if spell.name == 'Valiance' or spell.name == 'Vallation' or spell.name == 'Liement' then
		if buffactive['Valiance'] then
			cast_delay(0.2)
			windower.ffxi.cancel_buff(535)
		elseif buffactive['Vallation'] then
			cast_delay(0.2)
			windower.ffxi.cancel_buff(531)
		elseif buffactive['Liement'] then
			cast_delay(0.2)
			windower.ffxi.cancel_buff(537)
		end
	end
	if spell.name == 'Vallation' or spell.name == 'Valiance' then
		equip(sets.Enmity,sets.JA.Vallation)
	end  
	if spell.name == 'Pflug' then
		equip(sets.Enmity,sets.JA.Pflug)
	end      
	if spell.name == 'Elemental Sforzo' or spell.name == 'Liement' then
		equip(sets.Enmity,{body="Futhark Coat +1"})
	end      
	if spell.name == 'Gambit' then
		equip(sets.Enmity,sets.JA.Gambit)
	end
	if spell.name == 'Rayke' then
		equip(sets.Enmity,sets.JA.Rayke)
	end
	if spell.name == 'Battuta' then
		equip(sets.Enmity,sets.JA.Battuta)
	end
	if spell.name == 'Vivacious Pulse' then
		equip(sets.Enmity,sets.JA.Pulse)
		mid_obi(spell.element,spell.name)
	end
	if spell.name == 'Embolden' or spell.name == 'Odyllic Subterfuge' or spell.name == 'Warcry' 
	or spell.name == 'Swordplay' or spell.name == 'Meditate' or spell.name == 'Provoke' then   
		equip(sets.Enmity)
	end
	if spell.name == 'One for All' then
		equip(sets.OneforAll)
	end
	if spell.name == 'Resolution'   then
		equip(sets.Resolution)
	end
	if spell.name == 'Ruinator'  then
			equip(sets.Ruinator)
	end
	
	if spell.name == 'Spinning Slash' 
	or spell.name == 'Ground Strike'
	or spell.name == 'Upheaval' 
	or spell.name == 'Dimidiation' 
	or spell.name == 'Steel Cyclone'   
	or spell.name == 'Crescent Moon'  
	or spell.name == 'Savage Blade' then
		equip(sets.Single)
	end
	if spell.name == 'Shockwave' then
		equip(sets.Shockwave)
	end
	if spell.name == 'Fell Cleave' or spell.name == 'Circle Blade' then
		equip(sets.Cleave)
	end
	if spell.name == 'Requiescat' then
		equip(sets.Req)
	end
	if spell.name == 'Vorpal Blade' or spell.name == 'Rampage' then
		equip(sets.Vorp)
	end
	if spell.name == 'Herculean Slash'
	or spell.name == 'Freezebite'  
	or spell.name == 'Sanguine Blade' 
	or spell.name == 'Red Lotus Blade'
	or spell.name == 'Seraph Blade' then
		equip(sets.HercSlash)
		mid_obi(spell.element,spell.name)
	end
	--prevents casting Utsusemi if you already have 3 or more shadows
	if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' and (buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
		cancel_spell()
	end
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
		if TP_ind == 4 then
			equip(sets.Utility.MDT) else
			equip(sets.Utility.PDT)
		end
	end
	if buffactive.sleep and player.hp > 100 and player.status == "Engaged" then 
		equip({head="Frenzy Sallet"})
	end
end            
  
function midcast(spell,act,arg) 
	if spell.action_type == 'Magic' then 
		equip(sets.Utility.PDT,{})         
	end  
	if spell.skill == 'Enhancing Magic' then
		equip({head="Erilaz Galea +2",legs="Futhark Trousers +3",hands="Regal Gaunlets",})
		if spell.name == "Blink" or spell.name == "Stoneskin" or string.find(spell.name,'Utsusemi') then
			equip(sets.Utility.PDT,{})
		elseif string.find(spell.name,'Bar') or spell.name=="Temper" then
			equip({hands="Runeist mitons +2", legs="Carmine Cuisses +1", 
			left_ear= "Andoaa Earring", right_ear="Mimir Earring",left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",neck="Melic Torque",waist="Olympus Sash",})
		end
		if buffactive.embolden then
			equip({back="Evasionist's Cape"})
		end 
	end
	if spell.name == 'Foil' or spell.name == 'Flash' or spell.name == "Stun" then 
		equip(sets.Enmity,{left_ring="Defending Ring",})
	end 
	if spell.name == 'Phalanx' then
		equip(sets.Phalanx)
	end      
	if string.find(spell.name,'Regen') then
		equip({head="Runeist bandeau +1"})
	end
	if spell.name == "Repose" or spell.skill == 'Enfeebling Magic' or spell.skill == 'Dark Magic' then
		equip(sets.MagicAcc)
	end
	if spell.skill == 'Elemental Magic' then
		equip(sets.JA.Lunge)
		mid_obi(spell.element,spell.name)
	end
	--cancels Ni shadows (if there are only 1 or 2) when casting Ichi
	if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
		send_command('cancel Copy Image')
		send_command('cancel Copy Image (2)')
	end
end
 
function aftercast(spell)
	equip_current()
	if string.find(spell.name,'Utsusemi') and not spell.interrupted then
		if spell.name == 'Utsusemi: Ichi' then
			ShadowType = 'Ichi'
		elseif spell.name == 'Utsusemi: Ni' then
			ShadowType = 'Ni'
		end
	end
end
 
function status_change(new,old)
    equip_current()
end 
  
function equip_TP()
   equip(sets.TP[sets.TP.index[TP_ind]])
	--equips offensive gear despite being on defensive set if you have shadows
--	if TP_ind == 3 and ((buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) or buffactive['Third Eye'] or buffactive['Blink']) then
--		equip(sets.TP.Accuracy)
--	end
	--equips DW gear if using two weapons
--	if player.equipment.sub == "Tramontane Axe" or player.equipment.sub == "Pukulatmuj" or player.equipment.sub == "Anahera Sword" then
--		equip({ear2="Suppanomimi"})
--	end
	--equips offensive gear and relic boots during Battuta
--	if buffactive.battuta then
		--remains on defensive set if Avoidance Down is active
--		if buffactive['Avoidance Down'] then
	--	else
	--		if TP_ind == 3 then
		--		equip(sets.TP.Accuracy)
	--		end
	--	equip({feet="Futhark Boots +1"})
	--	end
--	end
	--equip defensive gear when hit with terror/petrify/stun/sleep
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
			if TP_ind == 4 then
				equip(sets.Utility.MDT) else
				equip(sets.Utility.PDT)
			end
	end
	--equip Frenzy Sallet (will wake you up) if engaged, slept, and over 100 HP
	if buffactive.sleep and player.hp > 100 then 
		equip({head="Frenzy Sallet"})
	end
end
 
function equip_idle()
    equip(sets.Idle)
	--equips extra refresh gear when MP is below 75%
	if player.mpp < 75 then
		equip({body="Runeist's Coat +2"})
	end
	--auto-equip defensive gear when hit with terror/petrify/stun/sleep
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
			if TP_ind == 4 then
				equip(sets.Utility.MDT) else
				equip(sets.Utility.PDT)
			end
	end
end
 
function buff_change(buff,gain)
    local buff = string.lower(buff)
	if buff == "terror" or buff == "petrification" or buff == "stun" or buff == "sleep" then
		if gain then  
			if TP_ind == 4 then
				equip(sets.Utility.MDT) else
				equip(sets.Utility.PDT)
			end
			if buff == "sleep" and player.hp > 100 and player.status == "Engaged" then 
				equip({head="Frenzy Sallet"})
			end
		else 
			equip_current()
		end
	end
end
 
function equip_current()
	if player.status == 'Engaged' then
		equip_TP()
	else
		equip_idle()
	end
end
             
function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then 
			TP_ind = 1 
		end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
	elseif command == 'reverse TP set' then
		TP_ind = TP_ind -1
		if TP_ind == 0 then 
			TP_ind = #sets.TP.index 
		end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
	
		elseif command == 'Toggle DT' then
		TP_ind = 1
		if TP_ind == 0 then 
			TP_ind = #sets.TP.index 
		end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
		elseif command == 'Toggle Hybrid' then
		TP_ind = 2
		if TP_ind == 0 then 
			TP_ind = #sets.TP.index 
		end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
	end
	
end