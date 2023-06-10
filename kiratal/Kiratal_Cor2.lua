-------------------------------------------
-- This lua for COR uses 2 arrays.  One controls gear for melee (-physical damage, normal, acc) and the 
-- other controls ranged accuracy for normal and extra racc.  In my init file I bound the command for 
-- the 2 arrays to my Ctrl-q and Ctrl-w keys.
-- The arrays work independently so you can be melee'ing in higher acc gear but shooting in normal racc gear.
-- Because ranged jobs mostly stand engaged but away from the mob the default melee set is TPwildfire.  If you are 
-- intending to melee you can toggle to the 'normal' melee set.
-------------------------------------------
-- Function to get the current weather intensity: 0 for none, 1 for single weather, 2 for double weather.
	send_command('wait 2; input /lockstyleset 20')
function user_setup()
  --  select_default_macro_book()
	set_lockstyle()

end
function get_sets()

TPback = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
SNAPback = { name="Camulus's Cape", augments={'"Snapshot"+10',}}
AGIback = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
MABback = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%',}}

MABhead = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +3%','Mag. Acc.+12',}}
MABlegs = { name="Herculean Trousers", augments={'"Repair" potency +1%','"Waltz" potency +6%','Weapon skill damage +9%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
MABfeet = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +4%','DEX+4','Mag. Acc.+3',}}
WSbody = { name="Herculean Vest", augments={'Rng.Acc.+7 Rng.Atk.+7','Weapon skill damage +3%','AGI+12','Rng.Acc.+12',}}
lockstyleset = 20
Adhemar_M = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
Adhemar_R = { name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}}
sets.Obi = {waist="Hachirin-no-Obi"}
send_command('lua l autocor')
TP_Index = 1
RA_Index = 1
elemental_ws = S{"Aeolian Edge", "Leaden Salute", "Wildfire"}
TP_Array = {'TPsavage', 'TPdoomsday', 'TPtauretdoomsday', }
RA_Array = {'RAnormal', 'RAacc'}
	send_command('bind f9 gs c toggle TP set')
	send_command('bind f10 gs c toggle RA set')
				function file_unload()
			send_command('unbind f9')
			send_command('unbind f10')
			send_command('lua u autocor')
			end	  

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

	
		
	sets.aftercast.Idle = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
     neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Chuq'aba Belt",
    left_ear="Thureous Earring",
    right_ear="Etiolation Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},
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
    neck="Loricate Torque +1",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Cessance Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		} 
		-- Haste: 4+4+5+4+4=21 haste

		--change earrings to Cessance + Telos for greater acc setup, lost a bit double atk but + acc & + stp
		--maybe get herc feet with more TA
		--look into adhemar +1 body
		
	sets.engaged.TPdoomsday = set_combine(sets.engaged.TPsavage, {
	    main="Naegling",
    sub={ name="Demers. Degen +1", augments={'Path: A',}},
    range="Doomsday",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Cessance Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}) 
		-- Haste: 4+2+4+1+9+4+2 = 26

	sets.engaged.TPtauretdoomsday = set_combine(sets.engaged.TPsavage, {
	main="Naegling",
    sub="Tauret",
    range="Fomalhaut",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
       neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Cessance Earring",
    left_ring="Gelatinous Ring +1",
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
		head="Taeon Chapeau", --9/0 4 leaftip & 5 dusktip, need to max leaftip
		    neck={ name="Comm. Charm +2", augments={'Path: A',}},
		lear="Enervating Earring", --just in case instant-shot
		rear="Telos Earring", --just in case instant-shot
		body="Oshosi Vest", --14/0
		hands="Carmine Fin. Ga. +1", --8/11
		lring="Gelatinous Ring +1", --0
		rring="Dingir Ring", --0 replace w/Regal Ring
		 back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}}, --10/0
		waist="Yemaya Belt", --0/5
		legs="Oshosi Trousers", --10/13
		feet="Meg. Jam. +2"} --10/0
		--snapshot: 10 gifts +9+14+8+10+10+10 = 71 out of 70

	sets.precast.Ranged.Flurry = {
		head="Chass. Tricorne +1", --0/14
		    neck={ name="Comm. Charm +2", augments={'Path: A',}},
		lear="Enervating Earring", --just in case instant-shot
		rear="Telos Earring", --just in case instant-shot
		body="Laksa. Frac +3", --0/20
		hands="Carmine Fin. Ga. +1", --8/11
		lring="Gelatinous Ring +1", --0
		rring="Dingir Ring", --0 replace w/Regal Ring
		 back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}}, --10/0
		waist="Yemaya Belt", --0/5
		legs="Adhemar Kecks +1", --10/13
		feet="Meg. Jam. +2"} --10/0
		--snapshot: 30 flurry II + 10 gifts + 8+10+10+10 = 78
			--acceptable overage in event it's Flurry I (15 less snapshot)

	sets.midcast.Ranged.RAnormal.default = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
       neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Enervating Earring",
    right_ear="Beyla Earring",
    left_ring="Longshot Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	} --0
	
		-- STP totals: Fomal 10 + 8+4+5+10+7+5+10+8 = 67 STP +3 w/shield

-- get Regal Ring, replace Dingir with it
		
	sets.midcast.Ranged.RAacc.default = set_combine(sets.midcast.Ranged.RAnormal.default, {
		body="Laksa. Frac +3", --0 (was 10)
		lring="Cacoethic Ring", --0 (was 5)
		legs="Meg. Chausses +2"}) --0 (was 8)
		
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
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Vulcan's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		} --23 (no wsd, but kept for the acc, look to replace with herc when augmented)
		
	sets.precast.Acc.WSStr = set_combine(sets.precast.Normal.WSStr, {})
	
-------------------------------------------
	-- AGI WS Mix : All Marksmanship WS's (except Trueflight/Wildfire -magic ws- & Coronach -Relic WS-)
	-- So it's easy to determine if new obtained gear can replace anything, listed agi stats per piece
-------------------------------------------
	sets.precast.Normal.WSAgi = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Beyla Earring",
    left_ring="Longshot Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	} --54   ... replace w/lanun +3 feet for 10wsd
		--need "AGI+WSD" herc gear for head, legs
		
	sets.precast.Acc.WSAgi = set_combine(sets.precast.Normal.WSAgi, {
		head="Meghanada Visor", --31
		lear="Telos Earring",
		legs="Meg. Chausses +2"}) --42
	
-------------------------------------------
	-- Magic WS Mix : Leaden Salute & Wildfire
	-- They have an AGI Modifier so using that as a base and applying gear with MAB
	-- Applying notes for gear chosen
-------------------------------------------
	sets.precast.Normal.Leaden = {
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +1%','MND+1','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	} 
	
	sets.precast.Acc.Leaden = set_combine(sets.precast.Normal.Leaden, {})
	sets.precast.ObiLeaden = set_combine(sets.precast.Normal.Leaden, {waist="Hachirin-no-Obi",})
	
	sets.precast.Normal.Wildfire = {
    head={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','"Mag.Atk.Bns."+15',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +1%','MND+1','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Longshot Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	} 
		
	sets.precast.Acc.Wildfire = set_combine(sets.precast.Normal.Wildfire, {})
		
-------------------------------------------
	-- Precast sets for fastcast spells
-------------------------------------------	
	sets.precast.Fastcast = set_combine(sets.engaged.TPsavage, {
		head="Herculean Helm",
		neck="Voltsurge Torque",
		lear="Loquac. Earring",
		legs={ name="Herculean Trousers", augments={'VIT+4','Pet: Attack+16 Pet: Rng.Atk.+16','"Treasure Hunter"+2','Accuracy+1 Attack+1','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		feet={ name="Herculean Boots", augments={'Spell interruption rate down -3%','"Subtle Blow"+1','"Treasure Hunter"+2',}},
		rear="Enchntr. Earring +1",
		body="Malignance Tabard",
		hands="Leyline Gloves",
		lring="Lebeche Ring",
		rring="Prolix Ring",
		waist="Sailfi Belt +1",
		    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},})
	
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {
		neck="Magoraga Beads",})
		
	sets.precast.CorsairRoll = set_combine(sets.aftercast.Idle, {
		main="Lanun Knife",
		head="Lanun Tricorne",
		neck="Regal Necklace",
		hands="Chasseur's Gants +1",
		rring="Luzaf's Ring",
		range="Compensator",
		back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Damage taken-5%',}},
		}
		)
	
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {
		legs="Chas. Culottes +1"})
		
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {
		feet="Chass. Bottes +1"})
		
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {
		head="Chass. Tricorne +1"})
	
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
	sets.precast["Double-Up"] = set_combine(sets.aftercast.Idle, {head="Lanun Tricorne +1",neck="Regal Necklace",hands="Chasseur's Gants +1",rring="Luzaf's Ring",back=AGIback})
	sets.precast["Quick Draw"] = {head="Laksa. Tricorne +3",feet="Chass. Bottes +1"}
	sets.precast["Random Deal"] = {body="Lanun Frac +3"}
	sets.precast["Snake Eye"] = {legs="Lanun Culottes +1"}
	sets.precast.Fold = {hands="Lanun Gants +1"}
	sets.precast["Triple Shot"] = {body="Chasseur's Frac +1"}
--	sets.precast["Crooked Cards"] = {""}
--	sets.precast["Cutting Cards"] = {""}
	sets.precast.Waltz = {hands="Slither Gloves +1",legs=MABlegs}
	
	sets.buffs["Quick Draw"] = {
		head="Laksa. Tricorne +3",
		neck="Sanctity Necklace", --10 mab/mac/racc
		lear="Friomisi Earring", --10 mab
		rear="Crematio Earring", --6 mab
		body="Samnuha Coat", --35 mab, 38 mac, 8 mbd II
		hands="Carmine Fin. Ga. +1", --42 mab
		lring="Dingir Ring", --10 mab
		rring="Acumen Ring", --4 mab, replace with Regal Ring later
		back="Gunslinger's Cape", --10 mab + 3 mab aug
		waist="Eschan Stone", --7 mab/mac, 15 racc/ratk
		legs=MABlegs, --20 mab/mac, 9 wsd augments
		feet="Chass. Bottes +1"}
	
	sets.buffs["Triple Shot"] = set_combine(sets.midcast.Ranged.RAacc.default, {
		body="Chasseur's Frac +1"})	
			
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
		elseif MAB_WS:contains(spell.english) and world.weather_element == 'Dark' or MAB_WS:contains(spell.english) and world.day_element == 'Dark' then
			equip(sets.precast.ObiLeaden)
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

function midcast(spell,action)
-------------------------------------------
	-- this has to be at the top of the midcast function, thats to make sure the correct aftercast
	-- ranged is set if you have changed weapon
-------------------------------------------
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
		else equip(sets.precast.Fastcast)
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