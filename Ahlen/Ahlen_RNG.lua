function get_sets()
    TP_Index = 1
    Idle_Index = 1
	RACC_Index = 1
	
	send_command('bind f9 gs c toggle Idle set')
	send_command('bind f10 gs c toggle TP set')
	send_command('bind f12 gs c toggle RACC set')
			function file_unload()
			send_command('unbind ^f9')
			send_command('unbind ^f10')
			send_command('unbind ^f12')
       
			send_command('unbind !f9')
			send_command('unbind !f10')
			send_command('unbind !f12')
 
			send_command('unbind f9')
			send_command('unbind f10')
			send_command('unbind f12')
			end	  
    
    sets.JA = {}  
	sets.JA['Barrage'] = {hands="Orion Bracers +3"}
	sets.JA['Shadowbind'] = {hands="Orion Bracers +3"}
    sets.JA['Bounty Shot'] = {hands="Amini Glove. +3",
							head={ name="Herculean Helm", augments={'Pet: Haste+1','Accuracy+5 Attack+5','"Treasure Hunter"+1',}},
							waist="Chaac Belt"}
    sets.JA['Sharpshot'] = {legs="Orion Braccae +3"}
    sets.JA['Unlimited Shot'] = {feet="Amini Bottillons +3"}
	sets.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.JA['Camouflage'] = {body="Orion Jerkin +2"}
	sets.JA['Eagle Eye Shot'] = { head="Orion Beret +3",
							body="Nyame Mail",
							hands="Nyame Gauntlets",
							legs="Nyame Flanchard",
							feet="Nyame Sollerets",
							neck="Scout's Gorget +2",
							waist="Fotia Belt",
							left_ear="Sherida Earring",
							right_ear="Amini Earring +1",
							left_ring="Ephramad's Ring",
							right_ring="Regal Ring",
							back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}}
	sets.JA['Velocity Shot'] = { body="Amini Caban +3", back="Belenus's Cape"}
							
	sets.obi = {waist="Hachirin-No-Obi"}
    
    -- WEAPONSKILL Sets --
	sets.WS = {}
    sets.WS['Last Stand'] = 	{
    head="Orion Beret +3",
    body="Ikenga's Vest",
    hands="Nyame Gauntlets",
    legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
    feet="Amini Bottillons +3",
   neck="Scout's Gorget +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    sets.WS['Coronach'] =	{
    head="Orion Beret +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.WS['Namas Arrow'] = {head="Orion Beret +3",
							body="Nyame Mail",
							hands="Nyame Gauntlets",
							legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
							feet="Nyame Sollerets",
							neck="Scout's Gorget +2",
							waist="Fotia Belt",
							left_ear="Sherida Earring",
							right_ear="Amini Earring +1",
							left_ring="Ephramad's Ring",
							right_ring="Regal Ring",
							back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}		
	sets.WS["Jishnu's Radiance"] = {    ammo="Chrono Arrow",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Amini Caban +3",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Amini Bottillons +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Amini Earring +1",
    left_ring="Begrudging Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
}

	sets.WS["Trueflight"] = {
	    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.WS["Wildfire"] = {
	    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Scout's Gorget +2",
    waist="Orpheus's Sash",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.WS["Aeolian Edge"] = {
	    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
   neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.WS["Savage Blade"] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
	back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
						}
	sets.WS['Default'] = {    head="Orion Beret +3",
    body="Ikenga's Vest",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Amini Bottillons +3",
   neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Amini Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	--Precast Sets--
    sets.precast = {}
	sets.precast.RA = {   
	head={ name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Snapshot"+5','"Snapshot"+5',}}, --10
    body="Amini Caban +3",
	neck="Scout's Gorget +2", --4
    hands="Carmine Fin. Ga. +1", --8
    legs="Adhemar Kecks +1", --10
    feet="Meg. Jam. +2",  --10
    waist="Impulse Belt",  --3
    right_ring="Crepuscular Ring", --3
    back={ name="Belenus's Cape", augments={'"Snapshot"+10',}}, --10
						}
						--5+10+4+8+10+10+3+3+10
	sets.precast.RA_Flurry = {
						 head="Orion Beret +3",
						body="Amini Caban +3",
						hands="Carmine Fin. Ga. +1", --8
							neck="Scout's Gorget +2", --4
						legs="Adhemar Kecks +1", --10
						feet="Meg. Jam. +2",  --40
						waist="Yemaya Belt",
						  right_ring="Crepuscular Ring",  --3
						back={ name="Belenus's Cape", augments={'Snapshot+10',}},}	
						--60 Snapshot
    sets.precast.FC = {}
    sets.precast.FC.Standard = {
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    hands="Leyline Gloves",
    legs={ name="Herculean Trousers", augments={'"Fast Cast"+6','STR+6','"Mag.Atk.Bns."+9',}},
    feet={ name="Herculean Boots", augments={'"Fast Cast"+5','INT+3','Mag. Acc.+15','"Mag.Atk.Bns."+9',}},
    neck="Orunmila's Torque",
    waist="Chaac Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Lebeche Ring",
    back="Moonlight Cape",
								}  

	--Midcast Sets--
	RACC_Set_Names = {"STP", "RACC", "Full RACC", "Dead Aim"}
    sets.midcast = {}
	sets.midcast['STP'] = {       
    head="Arcadian Beret +3",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Scout's Gorget +2",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},
								}
								
	sets.midcast['RACC'] = {  
	head="Arcadian Beret +3",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Scout's Gorget +2",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},
								}
								
	sets.midcast['Full RACC'] = {  
	head="Arcadian Beret +3",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Scout's Gorget +2",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Petrov Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},
								}
								
	sets.midcast['Dead Aim'] = {   
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Amini Bottillons +3",
    neck={ name="Scout's Gorget +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Amini Earring +1",
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Damage taken-5%',}},
	}
        
       --Utility Sets--

	TP_Set_Names = {"Hybrid", "Kclub"}							
	sets.TP = {}
						
	sets.TP['Kclub'] = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Defending Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
						
	sets.TP['Hybrid'] = { 
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Amini Glove. +3",
    legs="Amini Bragues +3",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
        

    
    Idle_Set_Names = {'Movement','DT'}
    sets.Idle = {    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",}
    sets.Idle.Movement = {    
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
							
    sets.Idle.DT =  {  
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Flume Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
end

function precast(spell)
    if sets.JA[spell.english] then
        equip(sets.JA[spell.english])
    elseif spell.action_type == 'Magic' then
        equip(sets.precast.FC.Standard)
    elseif spell.action_type == 'Ranged Attack' then
        if buffactive['Flurry'] or buffactive['Embrava'] then
            equip(sets.precast.RA_Flurry)
        else
            equip(sets.precast.RA)
        end
    elseif spell.type == 'WeaponSkill' then
        if (spell.english == 'Trueflight' or spell.english == 'Wildfire') and (spell.element == world.weather_element or spell.element == world.day_element) then
           equip(sets.WS[spell.english], {waist="Hachirin-No-Obi"})
        elseif sets.WS[spell.english] then
            equip(sets.WS[spell.english])
        else
            equip (sets.WS['Default'])
        end
    end
end

	

function midcast(spell)
    if sets.JA[spell.english] 
		then equip(sets.JA[spell.english])
		end
	if spell.action_type == 'Magic' 
		then equip(sets.precast.FC.Standard)
		end
	if spell.action_type == 'Ranged Attack' 
        then equip(sets.midcast[RACC_Set_Names[RACC_Index]])
			if buffactive['Barrage'] then
                        equip(sets.JA['Barrage'])
			end
	end
	end

function aftercast(spell)
    if player.status=='Engaged' then
        equip(sets.TP[TP_Set_Names[TP_Index]])
    else
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
    end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
    elseif new == 'Engaged' then
        equip(sets.TP[TP_Set_Names[TP_Index]])
    end
end

function self_command(command)
    if command == 'toggle TP set' then
        TP_Index = TP_Index +1
        if TP_Index > #TP_Set_Names then TP_Index = 1 end
        send_command('@input /echo ----- TP Set changed to '..TP_Set_Names[TP_Index]..' -----')
        equip(sets.TP[TP_Set_Names[TP_Index]])
    elseif command == 'toggle Idle set' then
        Idle_Index = Idle_Index +1
        if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip(sets.Idle[Idle_Set_Names[Idle_Index]])
	elseif command == 'toggle RACC set' then
        RACC_Index = RACC_Index +1
        if RACC_Index > #RACC_Set_Names then RACC_Index = 1 end
        send_command('@input /echo ----- RACC Set changed to '..RACC_Set_Names[RACC_Index]..' -----')
        equip(sets.midcast[RACC_Set_Names[RACC_Index]])
    end
end