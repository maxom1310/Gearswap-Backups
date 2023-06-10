-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Byrth & Motenten's Functions ** --
 function user_unload()
    send_command('unbind ^f1')
    send_command('unbind ^f9')
	send_command('unbind f9 gs c C6')
    send_command('unbind ^f10')
    send_command('unbind ^f11')	
end
function get_sets()

    send_command('bind ^f1 gs c C1')
	send_command('bind f9 gs c C6')
	send_command('bind ^f9 gs c C7')
	send_command('bind ^f10 gs c C17')	
	send_command('bind f10 gs c C16')	
	send_command('bind ^f11 gs c C11')

        AccIndex = 1
        AccArray = {"CarnDW","CarnSW","SavageSW","SavageDW","EvisSW","EvisDW"} -- 3 Levels Of Accuracy Sets For TP/WS. First Set Is CarnDW. Add More ACC Sets If Needed Then Create Your New ACC Below --
        IdleIndex = 1
        IdleArray = {"DT","Refresh","Movement"} -- Default Idle Set Is Movement --
        Armor = 'None'
        timer_reg = {}
        pianissimo_cycle = false
        Daurdabla = 'OFF' -- Set Default Lock Daurdabla ON or OFF Here --
        Elemental_Staff = 'OFF' -- Set Default Precast Elemental Staves ON or OFF Here --
        Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
        target_distance = 6 -- Set Default Distance Here --
        select_default_macro_book() -- Change Default Macro Book At The End --
		include('organizer-lib')
		
        -- Daurdabla Trigger Songs: Use The Following Songs or Daurdabla Toggle To Equip Daurdabla, Add or Remove Daurdabla Songs --
        DaurdSongs = S{"Army's Paeon","Army's Paeon II","Army's Paeon III","Army's Paeon IV","Army's Paeon V"}
 
        Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
        Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
        sc_map = {SC1 = "ChocoboMazurka", SC2 = "HerbPastoral", SC3 = "GoblinGavotte"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
 
        sets.Idle = {}
        -- Idle Sets --
        sets.Idle.DT = {
			main="Daybreak",
	sub="Genmei Shield",
	range="Nibiru Harp",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Moonlight Ring",
    right_ring="Vengeful Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
}
        sets.Idle.Refresh = set_combine(sets.Idle.DT,{
	main="Daybreak",
	sub="Genmei Shield",
    range="Nibiru Harp",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'Pet: Accuracy+4 Pet: Rng. Acc.+4','Weapon Skill Acc.+1','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
   	neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
})
		sets.Idle.Movement = set_combine(sets.Idle.Refresh,{})
        sets.Resting = set_combine(sets.Idle.Movement,{})
 
        -- PDT Set --
        sets.PDT = {
	main="Daybreak",
	sub="Genmei Shield",
  range="Nibiru Harp",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'Pet: Accuracy+4 Pet: Rng. Acc.+4','Weapon Skill Acc.+1','"Refresh"+2','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
   	neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
} 
	
 
        sets.Precast = {}
        -- Song Precast Set (empty = To Fix Club/Staff Issue) --
        sets.Precast.SongCast = {
    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},    --7
	sub="Genmei Shield",
    range="Marsyas",
    head="Fili Calot +1",  --14
    body="Inyanga Jubbah +2",  --13
     hands="Leyline Gloves",  --7
    legs="Ayanmo cosciales +2",  --6
    feet="Bihu Slippers +3",--10
    neck="Voltsurge torque",  --4
    waist="Embla sash",  --5
    left_ear="Etiolation Earring",  --1
    right_ear="Enchanter's Earring +1",  --2
    left_ring="Lebeche Ring",
    right_ring="Kishar ring", --4
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},  --10
}
 
        -- Elemental Staves --
 
        -- Precast Daurdabla Set --
        sets.Precast.Daurdabla = set_combine(sets.Precast.SongCast,{
						range="Daurdabla",
                        ammo=empty,})
 
        -- Fastcast Set --
        sets.Precast.FastCast = {
    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},
	sub="Genmei Shield",
    head="Chironic Hat",
    body="Inyanga Jubbah +2",
    hands="Leyline Gloves",
    legs="Ayanmo cosciales +2",
    feet={ name="Chironic Slippers", augments={'"Fast Cast"+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}},
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter's Earring +1",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
 
        -- Cure Precast Set --
        sets.Precast.Cure = {
    main={ name="Kali", augments={'Mag. Acc.+14','String instrument skill +9','Wind instrument skill +9',}},
	sub="Genmei Shield",
    range="Marsyas",
    head="Vanya Hood",
    body="Inyanga Jubbah +2",
    hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+26','"Cure" spellcasting time -10%','CHR+10','Mag. Acc.+3',}},
    legs="Lengo Pants",
    feet="Vanya Clogs",
    neck="Voltsurge torque",
    waist="Embla sash",
    left_ear="Etiolation Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
	sets.Precast.Dispelga = set_combine(sets.Precast.FastCast,{main="Daybreak",sub="Genmei Shield"})
        -- Midcast Base Set --
        sets.Midcast = {}
 
        -- Song Debuff Set --
        sets.Midcast.Wind = {
    main="Carnwenhan",
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Bihu Roundlet +3",
    body="Inyanga Jubbah +2",
    hands="Bihu Cuffs +3",
    legs="Bihu Cannions +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
		-- Enfeebling Spell Set --
		sets.Midcast.Enfeebling = {
		    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Brioso Cuffs +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','MND+2','Mag. Acc.+14','"Mag.Atk.Bns."+7',}},
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Gwati Earring",
    left_ring="Kishar Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
	sets.Midcast.Enfeebling.MND = set_combine(sets.Midcast.Enfeebling, {})
    sets.Midcast.Enfeebling.INT = set_combine(sets.Midcast.Enfeebling, {})	
		
        -- Song Buff Set --
        sets.Midcast.WindBuff = {
     	 main="Carnwenhan",
	  sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +1",
    body="Fili Hongreline +1",
    hands="Fili Manchettes +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
   back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}},
}
 
        sets.Midcast.March = {hands="Fili Manchettes +1"}
        sets.Midcast.Minuet = {body="Fili Hongreline +1"}
        sets.Midcast.Madrigal = {head="Fili Calot +1"}
        sets.Midcast.Ballad = {legs="Fili Rhingrave +1"}
        sets.Midcast.Scherzo = {feet="Fili Cothurnes +1"}
        sets.Midcast.Mazurka = {head=""}
        sets.Midcast.Paeon = {head="Brioso Roundlet +2"}
        sets.Midcast.Finale = {}
		sets.Midcast.Honor = {range="Marsyas",ammo=empty,hands="Fili Manchettes +1"}
		sets.Midcast.Etude = {head="Mousai Turban +1"}
		sets.Midcast.Threnody = {body="Mousai Manteel +1"}
		sets.Midcast.Carol = {hands="Mousai Gages +1"}
		sets.Midcast.Minne = {legs="Mousai Seraweels +1"}
		sets.Midcast.Mambo = {feet="Mousai crackows +1"}
        
		sets.Midcast.Lullaby = {
   main="Carnwenhan",
   sub="Genmei Shield",
    range="Blurred harp +1",
    head="Inyanga Tiara +2",
    body="Fili Hongreline +1",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Enchanter Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Inyanga Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
		sets.Midcast.Dispelga = set_combine(sets.Midcast.Wind,{main="Daybreak",sub="Genmei Shield"})				
		sets.Midcast['Foe Requiem'] = set_combine(sets.Midcast.Wind,{})
		sets.Midcast['Horde Lullaby'] = set_combine(sets.Midcast.Lullaby,{feet={ name="Chironic Slippers", augments={'Attack+4','Mag. Acc.+9','"Treasure Hunter"+1',}},waist="Chaac Belt",})
 
        -- Cure Set --
        sets.Midcast.Cure = {
    main="Daybreak",
	sub="Genmei Shield",
    head="Vanya Hood",
    body="Vanya Robe",
    hands="Inyanga Dastanas +2",
    legs="Vanya Slops",
    feet="Vanya Clogs",
    neck="Healing Torque",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Sirona's Ring",
    back="Solemnity cape",
}
 
        -- Curaga Set --
        sets.Midcast.Curaga = set_combine(sets.Midcast.Cure,{})
 
        -- Haste Set --
        sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
						sub="Genmei Shield",
						head="Telchine Cap",
						body="Telchine Chasuble",
						hands="Telchine Gloves",
								waist="Embla sash",
						legs="Telchine Braconi",
						feet="Telchine Pigaches"})
						
	 sets.Midcast.Enhancing = set_combine(sets.Precast.FastCast,{
	    main="Gada",
	    sub="Genmei Shield",	
	    head="Befouled Crown",	
        neck="Enhancing Torque",	
		ear1="Andoaa Earring",
	    body="Telchine Chasuble",
		hands="Inyanga dastanas +2",		
		back="Perimede Cape",
		ear2="Mimir Earring",
		waist="Embla sash",
		legs="Telchine Braconi",		
	    feet="Regal Pumps +1"})
	sets.Midcast.Duration = set_combine(sets.Precast.FastCast,{
	    main="Oranyan",	
	    head="Telchine Cap",
   		body="Telchine Chas.",
		hands="Telchine Gloves",
		waist="Embla sash",		
		ear2="Mimir Earring",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})			

 
        -- Cursna Set --
        sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
		neck="Debilis Medallion",
        ring1="Haoma's Ring",
        ring2="Haoma's Ring",
		hands="Inyanga Dastanas +2",
		head="Vanya Hood",
		body="Vanya Robe",
		legs="Vanya Slops",
		feet="Vanya Clogs",
	})
 
        -- Stoneskin Set --
        sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste)
 
        -- JA Sets --
        sets.JA = {}
        sets.JA.Nightingale = {feet="Bihu Slippers +3"}
        sets.JA.Troubadour = {body="Bihu Jstcorps. +3"}
        sets.JA["Soul Voice"] = {legs="Bihu Cannions +3"}
 
        -- Waltz --
        sets.Waltz = {}
 
        -- Melee Sets --
        sets.Melee = {
    main={ name="Carnwenhan", augments={'Path: A',}},
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
    body="Nyame Mail",
    hands="Bunzi's Gloves",
	legs="NYame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
						}
		sets.Melee.CarnSW = set_combine(sets.Melee,{right_ear="Crep. Earring",})  --CarnSW				
        sets.Melee.SavageSW = set_combine(sets.Melee,{main="Naegling", right_ear="Crep. Earring",})  --SavageSW
		sets.Melee.SavageDW = set_combine(sets.Melee,{main="Naegling",})  --SavageDW
        sets.Melee.EvisSW = set_combine(sets.Melee.SavageSW,{main="Tauret", right_ear="Crep. Earring",})  --EvisSW
		sets.Melee.EvisDW = set_combine(sets.Melee.SavageDW,{main="Tauret",})  --EvisDW
						
		sets.Melee.AM3 = {
     main={ name="Carnwenhan", augments={'Path: A',}},
    range={ name="Linos", augments={'Accuracy+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Aya. Zucchetto +2",
	body="Nyame Mail",
    hands="Bunzi's Gloves",
   	 legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
						}
		sets.Melee.CarnSW.AM3 = set_combine(sets.Melee.AM3,{right_ear="Crep. Earring",})  --CarnSW				
        sets.Melee.SavageSW.AM3 = set_combine(sets.Melee.AM3,{main="Naegling", right_ear="Crep. Earring",})  --SavageSW
		sets.Melee.SavageDW.AM3 = set_combine(sets.Melee.AM3,{main="Naegling",})  --SavageDW
        sets.Melee.EvisSW.AM3 = set_combine(sets.Melee.SavageSW.AM3,{main="Tauret", right_ear="Crep. Earring",})  --EvisSW
		sets.Melee.EvisDW.AM3 = set_combine(sets.Melee.SavageDW.AM3,{main="Tauret",})  --EvisDW				

 
        -- WS Base Set --
        sets.WS = {}
 
        sets.WS.Exenterator = {}
        sets.WS.Exenterator.SavageSW = set_combine(sets.WS.Exenterator,{})
        sets.WS.Exenterator.EvisSW = set_combine(sets.WS.Exenterator.SavageSW,{})
 
        sets.WS.Evisceration = {
						range="Linos",
						ammo=empty,
						head="Aya. Zucchetto +2",
						neck={ name="Bard's Charm +2", augments={'Path: A',}},
						ear1="Moonshade Earring",
						ear2="Brutal Earring",
						body="Ayanmo Corazza +2",
						hands={ name="Chironic Gloves", augments={'Crit.hit rate+5','Pet: Haste+1','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
						ring1="Begrudging Ring",
						ring2="Ilabrat Ring",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
						waist="Fotia Belt",
						 legs="Nyame Flanchard",
						feet="Lustratio Leggings"}
        sets.WS.Evisceration.SavageSW = set_combine(sets.WS.Evisceration,{})
        sets.WS.Evisceration.EvisSW = set_combine(sets.WS.Evisceration.SavageSW,{})
		sets.WS.Evisceration.EvisDW = set_combine(sets.WS.Evisceration.SavageDW,{})
		
        sets.WS["Mercy Stroke"] = {}
        sets.WS["Mercy Stroke"].SavageSW = set_combine(sets.WS["Mercy Stroke"],{})
        sets.WS["Mercy Stroke"].EvisSW = set_combine(sets.WS["Mercy Stroke"].SavageSW,{})
 
        sets.WS["Rudra's Storm"] = {
						range="Linos",
						ammo=empty,
						head="Aya. Zucchetto +2",
						neck={ name="Bard's Charm +2", augments={'Path: A',}},
						ear1="Moonshade Earring",
						ear2="Ishvara Earring",
						body="Ayanmo Corazza +2",
						hands="Aya. Manopolas +2",
						ring1="Apate Ring",
						ring2="Ilabrat Ring",
						back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
						waist="Grunfeld Rope",
						legs="Nyame Flanchard",
						feet="Lustratio Leggings"}
        sets.WS["Rudra's Storm"].SavageSW = set_combine(sets.WS["Rudra's Storm"],{})
        sets.WS["Rudra's Storm"].EvisSW = set_combine(sets.WS["Rudra's Storm"].SavageSW,{})
 
        sets.WS["Mordant Rime"] = {
    main={ name="Carnwenhan", augments={'Path: A',}},
   range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
       hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear="Regal Earring", 
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.WS["Mordant Rime"].SavageSW = set_combine(sets.WS["Mordant Rime"],{})
		sets.WS["Mordant Rime"].CarnSW = set_combine(sets.WS["Mordant Rime"],{})
        sets.WS["Mordant Rime"].EvisSW = set_combine(sets.WS["Mordant Rime"].SavageSW,{})
						
	sets.WS["Savage Blade"] = {
	main="Naegling",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head="Nyame Helm",
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
   	 legs="Nyame Flanchard",
  feet="Nyame Sollerets",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.WS["Savage Blade"].SavageSW = set_combine(sets.WS["Savage Blade"],{})
		sets.WS["Savage Blade"].SavageDW = set_combine(sets.WS["Savage Blade"],{})
        sets.WS["Savage Blade"].EvisSW = set_combine(sets.WS["Savage Blade"].SavageSW,{})
end
 
function pretarget(spell,action)
        if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                cancel_spell()
                send_command('input /item "Echo Drops" <me>')
        elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
                cancel_spell()
                add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                return
        elseif spell.type == "BardSong" and spell.target.name == player.name and buffactive.Pianissimo then -- Change Target From <me> To <t> When Pianissimo Is Active --
                change_target('<t>')
        elseif spell.type == 'BardSong' and spell.target.type and spell.target.type == 'PLAYER' and not buffactive.Pianissimo and not spell.target.charmed and not pianissimo_cycle then -- Auto Pianoissimo When You Cast A Song On A Player --
                cancel_spell()
                pianissimo_cycle = true
                send_command('input /ja "Pianissimo" <me>;wait 1.5;input /ma "'..spell.name..'" '..spell.target.name..';')
                return
        elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
                degrade_spell(spell,Cure_Spells)
        elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
                degrade_spell(spell,Curaga_Spells)
        end
        if spell.name ~= 'Pianissimo' then
                pianissimo_cycle = false
        end
end
 
function precast(spell,action)
        if spell.action_type == 'Magic' then
                if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu or BardSong If You Are Silenced or Out of Range --
                        cancel_spell()
                        add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
                        return
                else
                        if spell.type == 'BardSong' then
                                if Daurdabla == 'ON' then
                                        equip(sets.Precast.Daurdabla)
                                else
                                        if buffactive.Nightingale then
                                                equip_song_gear(spell)
                                                return
                                        else
                                                equip_song_gear(spell)
                                                equip(sets.Precast.SongCast)
                                        end
                                end
                        elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
                                equip(sets.Precast.Cure)
						elseif spell.name == 'Dispelga' then
								equip({main="Daybreak",sub="Genmei Shield"})
                        elseif spell.english == 'Utsusemi: Ni' then
                                if buffactive['Copy Image (3)'] then
                                        cancel_spell()
                                        add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
                                        return
                                else
                                        equip(sets.Precast.FastCast)
                                end
                        else
                                equip(sets.Precast.FastCast)
                        end
                end
        elseif spell.type == "WeaponSkill" then
                if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
                        cancel_spell()
                        add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
                        return
                else
                        equipSet = sets.WS
                        if equipSet[spell.english] then
                                equipSet = equipSet[spell.english]
                        end
                        if equipSet[AccArray[AccIndex]] then
                                equipSet = equipSet[AccArray[AccIndex]]
                        end
                        if spell.english == "EvisSWceration" and player.tp > 2990 then
                                equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
                        end
                        equip(equipSet)
                end
        elseif spell.type == "JobAbility" then
                if sets.JA[spell.english] then
                        equip(sets.JA[spell.english])
                end
        elseif spell.type == "Waltz" then
                refine_waltz(spell,action)
                equip(sets.Waltz)
        elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                cast_delay(0.2)
                send_command('cancel Sneak')
        end
        if sets.Precast[spell.element] and not buffactive.Nightingale and Elemental_Staff == 'ON' then
                equip(sets.Precast[spell.element])
        end
end
 
function midcast(spell,action)
        equipSet = {}
        if spell.action_type == 'Magic' then
                equipSet = sets.Midcast
                if equipSet[spell.english] then
                        equipSet = equipSet[spell.english]
                elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
                        if spell.english:startswith('Cure') then
                                equipSet = equipSet.Cure
                        elseif spell.english:startswith('Cura') then
                                equipSet = equipSet.Curaga
                        end
                        if world.day_element == spell.element or world.weather_element == spell.element then
                                equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
                        end
				elseif spell.english == 'Slow' or spell.english == 'Paralyze' or spell.english == 'Blind' or spell.english == 'Silence' or spell.english == 'Sleep' or spell.english == 'Dispel' or spell.english == 'Distract' or spell.english == 'Frazzle' or spell.english == 'Sleep II' then
					equip(sets.Midcast.Enfeebling)


				elseif string.find(spell.english, 'Bar') then
					equip(sets.Midcast.Enhancing)
				elseif spell.english == 'Refresh' then
					equip(sets.Midcast.Duration)	
				elseif spell.english == 'Aquaveil' then
					equip(sets.Midcast.Duration)	
					

				
                elseif spell.english == "Stoneskin" then
                        if buffactive.Stoneskin then
                                send_command('@wait 2.8;cancel stoneskin')
                        end
                        equipSet = equipSet.Stoneskin
                elseif spell.english == "Sneak" then
                        if spell.target.name == player.name and buffactive['Sneak'] then
                                send_command('cancel sneak')
                        end
                        equipSet = equipSet.Haste
				elseif spell.english == "Invisible" then
                        if spell.target.name == player.name and buffactive['Invisible'] then
                                send_command('cancel invisible')
                        end
                        equipSet = equipSet.Haste
                elseif spell.english:startswith('Utsusemi') then
                        if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
                                send_command('@wait 1.7;cancel Copy Image*')
                        end
                        equipSet = equipSet.Haste
                elseif spell.english == 'Monomi: Ichi' then
                        if buffactive['Sneak'] then
                                send_command('@wait 1.7;cancel sneak')
                        end
                        equipSet = equipSet.Haste
                elseif spell.type == 'BardSong' then
                        if Daurdabla == 'ON' then
                                equip(sets.Precast.Daurdabla)
                        else
                                equip_song_gear(spell)
                        end
                 end
        end
        equip(equipSet)
end


 
function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end
 
function status_change(new,old)
        check_equip_lock()
        if Armor == 'PDT' then
                equip(sets.PDT)
        elseif new == 'Engaged' then
                equipSet = sets.Melee
                if equipSet[AccArray[AccIndex]] then
                        equipSet = equipSet[AccArray[AccIndex]]
                end
				if buffactive["Aftermath: Lv.3"] then
						equipSet = equipSet["AM3"]
                end
                equip(equipSet)
        elseif new == 'Idle' then
                equipSet = sets.Idle
                if equipSet[IdleArray[IdleIndex]] then
                        equipSet = equipSet[IdleArray[IdleIndex]]
                end
                if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
                        equipSet = set_combine(equipSet,{neck="Adoulin's Refuge +1"})
                end
                if world.area:endswith('Adoulin') then
                        equipSet = set_combine(equipSet,{main="Carnwenhan",range="Marsyas",body="Councilor's Garb",feet="Fili Cothurnes +1"})
                end
                equip(equipSet)
        elseif new == 'Resting' then
                equip(sets.Resting)
        end
end
 
function buff_change(buff,gain)
        buff = string.lower(buff)
        if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
                if gain then
                        send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
                else
                        send_command('timers delete "Aftermath: Lv.3"')
                        add_to_chat(123,'AM3: [OFF]')
                end
        elseif buff == 'weakness' then -- Weakness Timer --
                if gain then
                        send_command('timers create "Weakness" 300 up')
                else
                        send_command('timers delete "Weakness"')
                end
        end
        if not midaction() then
                status_change(player.status)
        end
end
 
-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
        if command == 'C1' then
                send_command('input /ma "Victory March" <me>')
                add_to_chat(158,'Melee Speed II: [Victory March]')
        elseif command == 'C2' then
                send_command('input /ma "Advancing March" <me>')
                add_to_chat(158,'Melee Speed: [Advancing March]')
        elseif command == 'C3' then
                send_command('input /ma "Valor Minuet V" <me>')
                add_to_chat(158,'Melee Attack: [Valor Minuet V]')
        elseif command == 'C5' then
                send_command('input /ma "Valor Minuet IV" <me>')
                add_to_chat(158,'Melee Attack: [Valor Minuet IV]')
        elseif command == 'C9' then
                send_command('input /ma "Blade Madrigal" <me>')
                add_to_chat(158,'Melee Accuracy II: [Blade Madrigal]')
        elseif command == 'C10' then
                send_command('input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'Melee Accuracy: [Sword Madrigal]')
        elseif command == 'C15' then -- PDT Toggle --
                if Armor == 'PDT' then
                        Armor = 'None'
                        add_to_chat(123,'PDT Set: [Unlocked]')
                else
                        Armor = 'PDT'
                        add_to_chat(158,'PDT Set: [Locked]')
                end
                status_change(player.status)
        elseif command == 'C17' then -- Lock Main Weapon Toggle --
                if Lock_Main == 'ON' then
                        Lock_Main = 'OFF'
                        add_to_chat(123,'Main Weapon: [Unlocked]')
                else
                        Lock_Main = 'ON'
                        add_to_chat(158,'Main Weapon: [Locked]')
                end
                status_change(player.status)
				
		elseif command == 'C99' then -- Lock Main Weapon  --
                if Lock_Main == 'ON' then
                        add_to_chat(123,'Main Weapon: [Still Locked]')
                else
                        Lock_Main = 'ON'
                        add_to_chat(158,'Main Weapon: [Locked]')
                end
                status_change(player.status)
					
        elseif command == 'C7' then -- Daurdabla Toggle --
                if Daurdabla == 'ON' then
                        Daurdabla = 'OFF'
                        add_to_chat(123,'Daurdabla: [OFF]')
                else
                        Daurdabla = 'ON'
                        add_to_chat(158,'Daurdabla: [ON]')
                end
                status_change(player.status)
        elseif command == 'C16' then -- Accuracy Level Toggle --
                AccIndex = (AccIndex % #AccArray) + 1
                status_change(player.status)
                add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
        elseif command == 'C12' then -- Auto Update Gear Toggle --
                status_change(player.status)
                add_to_chat(158,'Auto Update Gear')
        elseif command == 'C8' then -- Distance Toggle --
                if player.target.distance then
                        target_distance = math.floor(player.target.distance*10)/10
                        add_to_chat(158,'Distance: '..target_distance)
                else
                        add_to_chat(123,'No Target Selected')
                end
        elseif command == 'C6' then -- Idle Toggle --
                IdleIndex = (IdleIndex % #IdleArray) + 1
                add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
                status_change(player.status)
        elseif command:match('^SC%d$') then
                send_command('//' .. sc_map[command])
        end
end
 
function check_equip_lock() -- Lock Equipment Here --
     if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
    --          disable('ring1','ring2')
      elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
  --              disable('back')
      elseif Lock_Main == 'ON' then
                disable('main','sub')
      else
                enable('main','sub','ring1','ring2','back')
        end
end
 
function equip_song_gear(spell)
        if DaurdSongs:contains(spell.english) then
                equip(sets.Precast.Daurdabla)
                add_to_chat(158,'Daurdabla: [ON]')
        else
                if spell.target.type == 'MONSTER' then
                        equip(sets.Midcast.Wind)
                        if string.find(spell.english,'Finale') then equip(sets.Midcast.Finale) end
                        if string.find(spell.english,'Lullaby') then equip(sets.Midcast.Lullaby) end
						if string.find(spell.english,'Threnody') then equip(sets.Midcast.Threnody) end
                else
                        equip(sets.Midcast.WindBuff)
                        if string.find(spell.english,'March') then equip(sets.Midcast.March) end
                        if string.find(spell.english,'Minuet') then equip(sets.Midcast.Minuet) end
                        if string.find(spell.english,'Madrigal') then equip(sets.Midcast.Madrigal) end
                        if string.find(spell.english,'Ballad') then equip(sets.Midcast.Ballad) end
                        if string.find(spell.english,'Scherzo') then equip(sets.Midcast.Scherzo) end
                        if string.find(spell.english,'Mazurka') then equip(sets.Midcast.Mazurka) end
                        if string.find(spell.english,'Paeon') then equip(sets.Midcast.Paeon) end
						if string.find(spell.english,'Honor') then equip(sets.Midcast.Honor) end
						if string.find(spell.english,'Etude') then equip(sets.Midcast.Etude) end
						if string.find(spell.english,'Carol') then equip(sets.Midcast.Carol) end
						if string.find(spell.english,'Minne') then equip(sets.Midcast.Minne) end
						if string.find(spell.english,'Mambo') then equip(sets.Midcast.Mambo) end
                end
        end
end

 
function actualCost(originalCost)
        if buffactive["Penury"] then
                return originalCost*.5
        elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
                return originalCost*.9
        elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
                return originalCost*1.1
        else
                return originalCost
        end
end
 
function degrade_spell(spell,degrade_array)
        spell_index = table.find(degrade_array,spell.name)
        if spell_index > 1 then
                new_spell = degrade_array[spell_index - 1]
                change_spell(new_spell,spell.target.raw)
                add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
        end
end
 
function change_spell(spell_name,target)
        cancel_spell()
        send_command('//'..spell_name..' '..target)
end
 
function refine_waltz(spell,action)
        if spell.type ~= 'Waltz' then
                return
        end
 
        if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" then
                return
        end
 
        local newWaltz = spell.english
        local waltzID
 
        local missingHP
 
        if spell.target.type == "SELF" then
                missingHP = player.max_hp - player.hp
        elseif spell.target.isallymember then
                local target = find_player_in_alliance(spell.target.name)
                local est_max_hp = target.hp / (target.hpp/100)
                missingHP = math.floor(est_max_hp - target.hp)
        end
 
        if missingHP ~= nil then
                if player.sub_job == 'DNC' then
                        if missingHP < 40 and spell.target.name == player.name then
                                add_to_chat(123,'Full HP!')
                                cancel_spell()
                                return
                        elseif missingHP < 150 then
                                newWaltz = 'Curing Waltz'
                                waltzID = 190
                        elseif missingHP < 300 then
                                newWaltz = 'Curing Waltz II'
                                waltzID = 191
                        else
                                newWaltz = 'Curing Waltz III'
                                waltzID = 192
                        end
                else
                        return
                end
        end
 
        local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
        local tpCost = waltzTPCost[newWaltz]
 
        local downgrade
 
        if player.tp < tpCost then
 
                if player.tp < 20 then
                        add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
                        cancel_spell()
                        return
                elseif player.tp < 35 then
                        newWaltz = 'Curing Waltz'
                elseif player.tp < 50 then
                        newWaltz = 'Curing Waltz II'
                end
 
                downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
        end
 
        if newWaltz ~= spell.english then
                send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
                if downgrade then
                        add_to_chat(8, downgrade)
                end
                cancel_spell()
                return
        end
 
        if missingHP > 0 then
                add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
        end
end
 
function find_player_in_alliance(name)
        for i,v in ipairs(alliance) do
                for k,p in ipairs(v) do
                        if p.name == name then
                                return p
                        end
                end
        end
end
 
function sub_job_change(newSubjob, oldSubjob)
        select_default_macro_book()
end
 
function set_macro_page(set,book)
        if not tonumber(set) then
                add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
                return
        end
        if set < 1 or set > 10 then
                add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
                return
        end
 
        if book then
                if not tonumber(book) then
                        add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
                        return
                end
                if book < 1 or book > 20 then
                        add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
                        return
                end
                send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
        else
                send_command('@input /macro set '..tostring(set))
        end
end
 
function select_default_macro_book()
        -- Default macro set/book
        if player.sub_job == 'WHM' then
                set_macro_page(9, 1)
        elseif player.sub_job == 'BLM' then
                set_macro_page(9, 1)
        elseif player.sub_job == 'DNC' then
                set_macro_page(9, 1)
        elseif player.sub_job == 'NIN' then
                set_macro_page(9, 1)
        elseif player.sub_job == 'WAR' then
                set_macro_page(9, 1)
        else
                set_macro_page(9, 1)
        end
end