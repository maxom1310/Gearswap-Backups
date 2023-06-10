-------------------------------------------
-- This lua for COR uses 2 arrays.  One controls gear for melee (-physical damage, normal, acc) and the 
-- other controls ranged accuracy for normal and extra racc.  In my init file I bound the command for 
-- the 2 arrays to my Ctrl-q and Ctrl-w keys.
-- The arrays work independently so you can be melee'ing in higher acc gear but shooting in normal racc gear.
-- Because ranged jobs mostly stand engaged but away from the mob the default melee set is TPwildfire.  If you are 
-- intending to melee you can toggle to the 'normal' melee set.
-------------------------------------------
-- Function to get the current weather intensity: 0 for none, 1 for single weather, 2 for double weather.
	send_command('wait 5; input /lockstyleset 20')
function user_setup()
  --  select_default_macro_book()
	set_lockstyle()

end
function get_weather_intensity()
    return gearswap.res.weather[world.weather_id].intensity
end
function get_sets()

lockstyleset = 20
sets.Obi = {waist="Hachirin-no-Obi"}
send_command('lua l autocor')
TP_Index = 1
RA_Index = 1

TP_Array = {'TPsavage', 'TPdoomsday', 'TPtauretdoomsday', 'TPlow', 'TPaeolian', }
RA_Array = {'RAnormal', 'RAacc'}
	send_command('bind f9 gs c toggle TP set')
	send_command('bind f10 gs c toggle RA set')
				function file_unload()
			send_command('unbind f9')
			send_command('unbind f10')
			send_command('lua u autocor')
			end	  




-- Function to get the current weather intensity: 0 for none, 1 for single weather, 2 for double weather.

-------------------------------------------

	-- aftercast for returning to TP and Idle sets
	-- the 'self command' area will change the set defined as aftercast.TP
-------------------------------------------		
	sets.aftercast = {}
	sets.engaged = {}
	sets.precast = {}
	sets.precast.Normal = {}
	sets.precast.Acc = {}
	sets.midcast = {}
	sets.midcast.Ranged = {}
	sets.midcast.Ranged.RAnormal = {}
	sets.midcast.Ranged.RAacc = {}
	sets.buffs = {}
	

	Agi_WS = S{"Hot Shot","Split Shot","Sniper Shot","Detonator","Numbing Shot"}
	Agi2_WS = S{"Last Stand","Slug Shot"} 
	MAB_WS = S{"Leaden Salute"}
	MAB2_WS = S{"Wildfire", "Aeolian Edge"}
	elemental_ws = S{"Aeolian Edge", "Leaden Salute", "Wildfire"}
	
		
	sets.aftercast.Idle = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
		}

-------------------------------------------
	-- The outermost table has to be named "sets", but
	-- otherwise there are no restrictions.
-------------------------------------------

	sets.engaged.TPsavage = {
    main="Naegling",
    sub={ name="Demers. Degen +1", augments={'Path: A',}},
    range="Anarchy +2",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
		} 
		-- Haste: 4+4+5+4+4=21 haste

		--change earrings to Cessance + Telos for greater acc setup, lost a bit double atk but + acc & + stp
		--maybe get herc feet with more TA
		--look into adhemar +1 body
		
	sets.engaged.TPdoomsday = set_combine(sets.engaged.TPsavage, {
	    main={ name="Rostam", augments={'Path: A',}},
	sub="Tauret",
    range="Armageddon",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}) 
		-- Haste: 4+2+4+1+9+4+2 = 26

	sets.engaged.TPtauretdoomsday = set_combine(sets.engaged.TPsavage, {
    main={ name="Rostam", augments={'Path: A',}},
    sub="Tauret",
    range="Death Penalty",
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	})
	sets.engaged.TPaeolian = {
	    main={ name="Rostam", augments={'Path: A',}},
    sub="Tauret",
	 range="Anarchy +2",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
		
		sets.engaged.TPlow = set_combine(sets.engaged.TPsavage, {
    main="Xiphos",
    sub="Bronze Knife",
    range="Death Penalty",
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	})
		-- Haste: 4+2+4+9+4+2 = 25
		
	sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
	
-------------------------------------------
	-- Ranged sets:  
	--   Precast is Snapshot (SS) / Rapid Shot (RS) 
		-- Snapshot reduces aiming delay by %, Rapid Shot reduces aiming delay by chance procs
		-- Snapshot goal 70 without Flurry (merits 5/5 = 10)
		-- Flurry build allows for more RS to be input because 70 SS achieved easier
			-- Flurry I = 15 SS and Flurry II = 30, sets below assume II is active
		-- Some -DT (Damage Taken) mixed, just in case
	--   Midcast is the TP builds, showing a normal and acc build
		-- default is the set used for Fomalhaut, it has the least STP because the TP return is highest naturally
		-- lua is built to accommodate for specific weapons, which is relevant as diff weapons have diff delays so STP builds may differ
			-- would be for the midcast shot, and set names would be something like sets.midcast.Ranged.RAnormal.Fomalhaut
-------------------------------------------	
	sets.precast.Ranged = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="Laksa. Frac +3",
    hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Ponente Sash",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
	back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}}, --10/0
		--waist="Yemaya Belt", --0/5 Missing
		} --10/0
		--snapshot: 10 gifts +9+14+8+10+10+10 = 71 out of 70

	sets.precast.Ranged.Flurry = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="Laksa. Frac +3",
  	hands="Carmine Fin. Ga. +1", --8/11
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Ponente Sash",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
	back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}}, --10/0
		--waist="Yemaya Belt", --0/5
		} --10/0
		--snapshot: 30 flurry II + 10 gifts + 8+10+10+10 = 78
			--acceptable overage in event it's Flurry I (15 less snapshot)

	sets.midcast.Ranged.RAnormal.default = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki yotai",
    left_ear="Dedition Earring",
    right_ear="Crepuscular Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	} --0
	
		-- STP totals: Fomal 10 + 8+4+5+10+7+5+10+8 = 67 STP +3 w/shield

-- get Regal Ring, replace Dingir with it
		
	sets.midcast.Ranged.RAacc.default = set_combine(sets.midcast.Ranged.RAnormal.default, {
		--body="Laksa. Frac +3", --0 (was 10)
		--lring="Cacoethic Ring", --0 (was 5)
		--legs="Meg. Chausses +2"
		}) --0 (was 8)
		
		-- STP totals: 67 -10-5-8 = 44 STP +3 w/shield 
		
	sets.aftercast.Ranged = sets.midcast.Ranged[RA_Array[RA_Index]].default
	
-------------------------------------------
	-- STR WS : melee ws'ing
	-- So it's easy to determine if new obtained gear can replace anything, listed str stats per piece
-------------------------------------------
	sets.precast.Normal.WSStr = {
    head={ name="Herculean Helm", augments={'Accuracy+19','Weapon skill damage +5%','STR+10',}},
    body={ name="Herculean Vest", augments={'Attack+9','Weapon skill damage +3%','STR+12','Accuracy+10',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +3%','STR+9','Attack+14',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Commodore charm +2",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		} --23 (no wsd, but kept for the acc, look to replace with herc when augmented)
		
	sets.precast.Acc.WSStr = set_combine(sets.precast.Normal.WSStr, {})
	
-------------------------------------------
	-- AGI WS Mix : All Marksmanship WS's (except Trueflight/Wildfire -magic ws- & Coronach -Relic WS-)
	-- So it's easy to determine if new obtained gear can replace anything, listed agi stats per piece
-------------------------------------------
	sets.precast.Normal.WSAgi = {
    main={ name="Rostam", augments={'Path: A',}},
    sub="Nusku Shield",
    range={ name="Armageddon", augments={'Path: A',}},
    ammo="Devastating Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	} --54   ... replace w/lanun +3 feet for 10wsd
		--need "AGI+WSD" herc gear for head, legs
		
	sets.precast.Acc.WSAgi = set_combine(sets.precast.Normal.WSAgi, {
		--head="Meghanada Visor", --31
		lear="Telos Earring",
		--legs="Meg. Chausses +2"
		}) --42
	
-------------------------------------------
	-- Magic WS Mix : Leaden Salute & Wildfire
	-- They have an AGI Modifier so using that as a base and applying gear with MAB
	-- Applying notes for gear chosen
-------------------------------------------
	sets.precast.Normal.Leaden = {
    main={ name="Rostam", augments={'Path: A',}},
    sub="Nusku Shield",
    range="Fomalhaut",
    ammo="Devastating Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	} 
	
	sets.precast.Acc.Leaden = set_combine(sets.precast.Normal.Leaden, {})
	sets.precast.ObiLeaden = set_combine(sets.precast.Normal.Leaden, {})
	
	
	sets.precast.Normal.Wildfire = {
    main={ name="Rostam", augments={'Path: A',}},
    sub="Nusku Shield",
    range={ name="Armageddon", augments={'Path: A',}},
    ammo="Devastating Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	} 
	sets.precast.ObiWildfire = set_combine(sets.precast.Normal.Wildfire, {waist="Hachirin-no-Obi",})
	
	sets.precast.Acc.Wildfire = set_combine(sets.precast.Normal.Wildfire, {})
		
-------------------------------------------
	-- Precast sets for fastcast spells
-------------------------------------------	
	sets.precast.Fastcast =  {
	head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6','INT+6',}},
    body="Malignance Tabard",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'VIT+4','Pet: Attack+16 Pet: Rng.Atk.+16','"Treasure Hunter"+2','Accuracy+1 Attack+1','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    feet={ name="Herculean Boots", augments={'Spell interruption rate down -3%','"Subtle Blow"+1','"Treasure Hunter"+2',}},
    neck="Voltsurge Torque",
    waist="Chaac Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},
			}
	
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {})
	--	neck="Magoraga Beads",})
		
	sets.precast.CorsairRoll = set_combine(sets.aftercast.Idle, {
	   main={ name="Rostam", augments={'Path: C',}},
		head="Lanun Tricorne +3",
		neck="Regal Necklace",
		hands="Chasseur's Gants +1",
		rring="Luzaf's Ring",
		range="Compensator",
		back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},
		}
		)
	
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {
		legs="Chas. Culottes +1"})
		
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {})
		--feet="Chass. Bottes +1"})
		
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {})
		--head="Chass. Tricorne +1"})
	
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {
		body="Chasseur's Frac +1"})
	
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {
		hands="Chasseur's Gants +1"})
						
		
-------------------------------------------
	-- Job Ability sets
	-- The sets.buff is present because this particular JA requires gear to be worn during the duration of the buff
	-- and not just at the point of activation like the rest.  Rules for both are in the function for precast
-------------------------------------------
		
	sets.precast["Wild Card"] = {feet="Lanun Bottes +3"}
--	sets.precast["Phantom Roll"] = {""}  the JA doesn't actually call upon Phantom Roll 
--	but rather the specific roll like Chaos and such.  So rules needed instead for CorsairRoll above
	sets.precast["Double-Up"] = set_combine(sets.aftercast.Idle, {head="Lanun Tricorne",neck="Regal Necklace",hands="Chasseur's Gants +1",rring="Luzaf's Ring",back="Camulus's Mantle",})
	sets.precast["Quick Draw"] = {}--head="Laksa. Tricorne +3",}--feet="Chass. Bottes +1"}
	sets.precast["Random Deal"] = {body="Lanun Frac +3"}
	sets.precast["Snake Eye"] = {}--legs="Lanun Culottes +1"}
	sets.precast.Fold = {}--hands="Lanun Gants +1"}
	sets.precast["Triple Shot"] = {body="Chasseur's Frac +1"}
--	sets.precast["Crooked Cards"] = {""}
--	sets.precast["Cutting Cards"] = {""}
	sets.precast.Waltz = {}
	
	sets.buffs["Quick Draw"] = {
    head={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','"Mag.Atk.Bns."+15',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Attack+3','"Mag.Atk.Bns."+29','Damage taken-3%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}
	
	sets.midcast['Utsusemi: Ni'] = {
	    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Voltsurge Torque",
    waist="Chuq'aba Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},
	}
	
	
	sets.buffs["Triple Shot"] = set_combine(sets.midcast.Ranged.RAacc.default, {})	
			
	send_command('input /macro book 11')
end
function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
function precast(spell,action)
	equip_sets = {}
	if spell.action_type == 'Ranged Attack' and buffactive['Flurry'] then
		equip(sets.precast.Ranged.Flurry) 
	elseif sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	elseif spell.type == 'CorsairRoll' then
		equip(sets.precast.CorsairRoll[spell.english] or sets.precast.CorsairRoll)
	elseif spell.type == 'WeaponSkill' then
		if sets.aftercast.TP == sets.engaged.TPsavage then
			mode = "Normal"
		else
			mode = "Acc"
		end

		if Agi_WS:contains(spell.english) then
			equip_sets[#equip_sets+1] = sets.precast[mode].WSAgi
		elseif Agi2_WS:contains(spell.english) then
			equip_sets[#equip_sets+1] = sets.precast.Acc.WSAgi
		elseif MAB_WS:contains(spell.english) and world.weather_element == 'Dark' and get_weather_intensity() == 2 or MAB_WS:contains(spell.english) and world.day_element == 'Dark' and world.weather_element == 'Dark' or MAB_WS:contains(spell.english) and world.day_element == 'Dark' and spell.target.distance > (8 + spell.target.model_size) and not world.weather_element == 'Light' or MAB_WS:contains(spell.english) and world.weather_element == 'Dark' and spell.target.distance > (8 + spell.target.model_size) and not world.day_element == 'Light' then
			equip(sets.precast.ObiLeaden)
		elseif MAB2_WS:contains(spell.english) and world.weather_element == 'Fire' and get_weather_intensity() == 2 or MAB2_WS:contains(spell.english) and world.day_element == 'Fire' and world.weather_element == 'Fire' or MAB2_WS:contains(spell.english) and world.day_element == 'Fire' and spell.target.distance > (8 + spell.target.model_size) and not world.weather_element == 'Water' or MAB2_WS:contains(spell.english) and world.weather_element == 'Fire' and spell.target.distance > (8 + spell.target.model_size) and not world.day_element == 'Water' then
			equip(sets.precast.ObiWildfire)
		elseif MAB_WS:contains(spell.english) then
			equip_sets[#equip_sets+1] = sets.precast[mode].Leaden
		elseif MAB2_WS:contains(spell.english) then
			equip_sets[#equip_sets+1] = sets.precast[mode].Wildfire
		else equip_sets[#equip_sets+1] = sets.precast[mode].WSStr
		end


	end
	for buff in pairs(buffactive) do
		equip_sets[#equip_sets+1] = sets.buffs[buff]
	end
	equip(set_combine(table.unpack(equip_sets)))
	
end
-- Orpheus Sash Leaden Salute and Wildfire
function job_post_precast(spell, action, spellMap, eventArgs)
   if elemental_ws:contains(spell.name) then
        -- Matching double weather (w/o day conflict).
        if spell.element == world.weather_element and get_weather_intensity() == 2 then
            equip({waist="Hachirin-no-Obi"})
        -- Target distance under 1.7 yalms.
        elseif spell.target.distance < (1.7 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Matching day and weather.
        elseif spell.element == world.day_element and spell.element == world.weather_element then
            equip({waist="Hachirin-no-Obi"})
        -- Target distance under 8 yalms.
        elseif spell.target.distance < (8 + spell.target.model_size) then
            equip({waist="Orpheus's Sash"})
        -- Match day or weather.
        elseif spell.element == world.day_element or spell.element == world.weather_element then
            equip({waist="Hachirin-no-Obi"})
        end
    end
end
function midcast(spell,action)
-------------------------------------------
	-- this has to be at the top of the midcast function, thats to make sure the correct aftercast
	-- ranged is set if you have changed weapon
-------------------------------------------
-- Handles equipment modifications based of distance and spell weather/day alignment.

	if sets.midcast.Ranged[RA_Array[RA_Index]][player.equipment.range] then
		sets.aftercast.Ranged = sets.midcast.Ranged[RA_Array[RA_Index]][player.equipment.range]
	else
		sets.aftercast.Ranged = sets.midcast.Ranged[RA_Array[RA_Index]].default
	end
-------------------------------------------
	if spell.action_type == "Ranged Attack" then
		equip(sets.aftercast.Ranged)
	end
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if windower.wc_match(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then -- Cancel Copy Image 1 & 2 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
		else equip(sets.midcast['Utsusemi: Ni'])
		end
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.aftercast.TP)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)
	if new == 'Idle' then
		equip(sets.aftercast.Idle)
	elseif new == 'Resting' then
		equip(sets.aftercast.Resting)
	elseif new == 'Engaged' then
		equip(sets.aftercast.TP)
	end
end

-------------------------------------------
	-- The 'self command' allows you to toggle inbetween sets, based on the TP and RA Arrays identified in the beginning
	-- The TP_Array toggles between a normal, acc, and TPwildfire set
	-- The RA_Array toggles between a ranged normal & ranged accuracy sets
	-- I binded my ctrl+q & ctrl+w keys in the 'init.txt' file (in the Scripts folder) for the TP and RA toggling
		--without being bound, the manual command to toggle would be     //gs c toggle TP set     &     //gs c toggle RA set
-------------------------------------------
function self_command(command)
	if command == 'toggle TP set' then
		TP_Index = (TP_Index % #TP_Array) + 1
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
	if command == 'ksavage' then
		TP_Index = 1
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
		if command == 'kwildfire' then
		TP_Index = 2
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
		if command == 'kleaden' then
		TP_Index = 3
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
		if command == 'klow' then
		TP_Index = 4
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
		if command == 'kedge' then
		TP_Index = 5
		sets.aftercast.TP = sets.engaged[TP_Array[TP_Index]]
		status_change(player.status, player.status)
		send_command('@input /echo '..TP_Array[TP_Index]..' SET')
	end
	
	if command == 'toggle RA set' then
		RA_Index = (RA_Index % #RA_Array) + 1
		sets.aftercast.RA = sets.engaged[RA_Array[RA_Index]]
		if sets.midcast.Ranged[RA_Array[RA_Index]] and sets.midcast.Ranged[RA_Array[RA_Index]][player.equipment.range] then
			sets.aftercast.Ranged = sets.midcast.Ranged[RA_Array[RA_Index]][player.equipment.range]
		else
			if sets.midcast.Ranged[RA_Array[RA_Index]] then
				sets.aftercast.Ranged = sets.midcast.Ranged[RA_Array[RA_Index]].default
			end
		status_change(player.status, player.status)
		end
		send_command('@input /echo '..RA_Array[RA_Index]..' SET')
	end

end