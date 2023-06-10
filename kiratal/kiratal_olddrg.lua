--Basic DRG GS file, tested and debugged. 

function get_sets()
send_command('bind f9 gs c toggle TP set')
send_command('bind f10 gs c toggle Idle set')
        function file_unload()
     
 
        send_command('unbind ^f9')
        send_command('unbind ^f10')
        send_command('unbind ^f11')
		send_command('unbind ^f12')
		send_command('unbind ^`')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
        send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
		send_command('unbind !^f9')

       
 
        end   
		        --Idle Sets--  
        sets.Idle = {}
       
        sets.Idle.index = {'Standard','Regain'}
        Idle_ind = 1                   
       
        sets.Idle.Standard = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chuq'aba Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},
}
                                                 
        sets.Idle.Regain = {
    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chuq'aba Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},
}
sets.JA = {}

sets.JA['Spirit Surge'] = {body="Pteroslaver Mail +1"}
sets.JA['Call Wyvern'] = {body="Pteroslaver Mail +1"}
sets.JA['Ancient Cirlce'] = {legs="Vishap Brais +1"}
sets.JA['Jump'] = { feet="Ostro Greaves",}
sets.JA['Spirit Link'] = {head="Vishap Armet +1",hands="Lancer's Vambraces +2"}
sets.JA['High Jump'] = { feet="Ostro Greaves",}
sets.JA['Deep Breathing'] = {head="Pteroslaver Armet +1"}
sets.JA['Angon'] = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +1"}
sets.JA['Spirit Jump'] = { feet="Ostro Greaves",}
sets.JA['Soul Jump'] = { feet="Ostro Greaves",}
  
  -- Ranged snapshot gear
    sets.RA = {Ranged="MamoolBane", Ammo="Empty"}
	
sets. TP = {}
sets.TP.index = {'Nyame','Gleti','Maxdps'}
TP_Index = 1



			
sets.TP.Nyame = { ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
	
	sets.TP.Gleti = {  ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
			
sets.TP.Maxdps = {   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}
sets.Savage = {}
sets.Savage.index = {'Reg','Acc'}
Star_Index = 1	
	
sets.Savage.Reg ={
    main="Naegling",
    sub="Sm. Escutcheon",
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
sets.Savage.Acc = set_combine(sets.Savage.Reg,{left_ring="Regal Ring",})

sets.Star = {}
sets.Star.index = {'Reg','Acc'}
Star_Index = 1


sets.Star.Reg = {    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

sets.Star.Acc = set_combine(sets.Star.Reg,{})

sets.Star.GH = set_combine(sets.Star.Reg,{})
sets.Star.R = set_combine(sets.Star.Reg,{neck="Ygnas's Resolve +1"})

sets.Drake = {}
sets.Drake.index = {'Reg','Acc'}
Drake_Index = 1

sets.Drake.Reg = {  ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

sets.Drake.Acc = set_combine(sets.Drake.Reg,{ring1="Rajas Ring",back="Updraft Mantle",legs="Mikinaak Cuisses"})

sets.Drake.GH = set_combine(sets.Drake.Reg,{})
sets.Drake.R = set_combine(sets.Drake.Reg,{neck="Ygnas Resolve +1"})

sets.Caml = {}
sets.Caml.index = {'Reg','Acc'}
Caml_Index = 1

sets.Caml.Reg = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

sets.Caml.Acc = set_combine(sets.Caml.Reg,{})

sets.Caml.GH = set_combine(sets.Caml.Reg,{})		
sets.Caml.R = set_combine(sets.Caml.Reg,{neck="Ygnas's Resolve +1"})		
				
sets.Sonic = {}
sets.Sonic.index = {'Reg','Acc'}
Sonic_Index = 1

sets.Sonic.Reg = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Mag. Evasion+15',}},}

sets.Sonic.Acc = set_combine(sets.Sonic.Reg,{})

sets.Sonic.GH = set_combine(sets.Sonic.Reg,{})
sets.Sonic.R = set_combine(sets.Sonic.Reg,{neck="Ygnas's Resolve +1"})
				
end

function precast(spell,act)

	if player.equipment.main == "empty" or player.equipment.sub == "empty" then
		equip({main="Trishula",sub="Utu Grip"})
	end
	if spell.action_type == 'Ranged Attack' then
	equip(sets.RA)
	end
	
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end

	if spell.english == "Stardiver" then
	equip(sets.Star[sets.Star.index[Star_Index]])
	end
	if spell.english == "Impulse Drive" then
	equip(sets.Impulse[sets.Impulse.index[Impulse_Index]])
	end
		if spell.english == "Savage Blade" then
	equip(sets.Savage[sets.Savage.index[Star_Index]])
	end

	if spell.english == "Drakesbane" then
	equip(sets.Drake[sets.Drake.index[Drake_Index]])
	end

	if spell.english == "Sonic Thrust" then
	equip(sets.Sonic[sets.Sonic.index[Sonic_Index]])
	end

	if spell.english == "Camlann's Torment" then
	equip(sets.Caml[sets.Caml.index[Caml_Index]])
	end
	
	if buffactive['Reive Mark'] and spell.english == "Stardiver" then
	equip(sets.Star.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Drakesbane" then
	equip(sets.Drake.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Sonic Thrust" then
	equip(sets.Sonic.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Camlann's Torment" then
	equip(sets.Caml.R)
	end

	if spell.english == "Stardiver" and (world.day == "Earthsday" or world.day == "Darksday" or world.day == "Lightsday") then
	equip(sets.Star.GH)
	end

	if spell.english == "Drakesbane" and (world.day == "Firesday" or world.day == "Lightsday") then
	equip(sets.Drake.GH)
	end

	if spell.english == "Sonic Thrust" and (world.day == "Lightsday" or world.day == "Earthsday") then
	equip(sets.Sonic.GH)
	end

	if spell.english == "Camlann's Torment" and (world.day == "Lightsday" or world.day == "Windsday" or world.day == "Lightiningday") then
	equip(sets.Caml.GH)
	end

end

function midcast(spell,act)

	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end

	if spell.english == "Stardiver" then
	equip(sets.Star[sets.Star.index[Star_Index]])
	end

	if spell.english == "Drakesbane" then
	equip(sets.Drake[sets.Drake.index[Drake_Index]])
	end

	if spell.english == "Sonic Thrust" then
	equip(sets.Sonic[sets.Sonic.index[Sonic_Index]])
	end

	if spell.english == "Camlann's Torment" then
	equip(sets.Caml[sets.Caml.index[Caml_Index]])
	end

	if buffactive['Reive Mark'] and spell.english == "Stardiver" then
	equip(sets.Star.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Drakesbane" then
	equip(sets.Drake.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Sonic Thrust" then
	equip(sets.Sonic.R)
	end

	if buffactive['Reive Mark'] and spell.english == "Camlann's Torment" then
	equip(sets.Caml.R)
	end

	if spell.english == "Stardiver" and (world.day == "Earthsday" or world.day == "Darksday" or world.day == "Lightsday") then
	equip(sets.Star.GH)
	end

	if spell.english == "Drakesbane" and (world.day == "Firesday" or world.day == "Lightsday") then
	equip(sets.Drake.GH)
	end

	if spell.english == "Sonic Thrust" and (world.day == "Lightsday" or world.day == "Earthsday") then
	equip(sets.Sonic.GH)
	end

	if spell.english == "Camlann's Torment" and (world.day == "Lightsday" or world.day == "Windsday" or world.day == "Lightiningday") then
	equip(sets.Caml.GH)
	end
end

function aftercast(spell,act)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_Index]])
	   else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
	
	if player.status == 'Engaged' and buffactive['Reive Mark'] then
                equip{neck="Ygnas's Resolve +1"}
    end
end

function buff_change(new,old)

if player.status == 'Engaged' and buffactive['Reive Mark'] then
                equip{neck="Ygnas's Resolve +1"}
        end

end

function status_change(new,old)

if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_Index]])
	 else
             equip(sets.Idle[sets.Idle.index[Idle_ind]])
     end
	
if player.status == 'Engaged' and buffactive['Reive Mark'] then
                equip{neck="Ygnas's Resolve +1"}
    end
end



function self_command(command)

	if command == 'toggle TP set' then	
		TP_Index = TP_Index +1
		if TP_Index > #sets.TP.index then TP_Index = 1 end
		send_command('@ input /echo >>> TP set changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])
	elseif command == 'toggle Idle set' then
                Idle_ind = Idle_ind +1
                if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                equip(sets.Idle[sets.Idle.index[Idle_ind]])

	elseif command == 'toggle WS set' then
		Star_Index = Star_Index +1
		if Star_Index > #sets.Star.index then Star_Index = 1 end
		Drake_Index = Drake_Index +1
		if Drake_Index > #sets.Drake.index then Drake_Index = 1 end
		Sonic_Index = Sonic_Index +1
		if Sonic_Index > #sets.Sonic.index then Sonic_Index = 1 end
		Caml_Index = Caml_Index +1
		if Caml_Index > #sets.Caml.index then Caml_Index = 1 end
		send_command('@ input /echo >>> WS sets changed to '..sets.Star.index[Star_Index]..' ')
	elseif command == 'equip Idle set' then
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
    
	end
		
	end