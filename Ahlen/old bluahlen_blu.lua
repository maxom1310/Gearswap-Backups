function get_sets()
 
        send_command('bind f9 gs c toggle TP set')
        send_command('bind f10 gs c toggle Idle set')
        send_command('bind f11 gs c toggle CDC set')
        send_command('bind f12 gs c toggle Req set')
        send_command('bind !f12 gs c toggle Rea set')
		send_command('bind ^` gs c toggle MB set')
		send_command('bind !f9 input /equipset 8;wait1;input /echo Club Magic Weapons')
		send_command('bind @f9 input /equipset 11;wait1;input /echo Magic Sword Weapons')
		send_command('bind ^f9 input /equipset 9;wait1;input /echo Sword melee Weapons')
		send_command('bind !^f9 input /equipset 10;wait1;input /echo Club Melee Weapons')
		send_command('bind !@^f9 input /equipset 12;wait1;input /echo Naegling')
		
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
       
        sets.Idle.index = {'Standard','DT'}
        Idle_ind = 1                   
       
        sets.Idle.Standard = {
	ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Amalric Doublet +1",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                 
        sets.Idle.DT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
                                                       
                                                       
                                                       
       
       
        --TP Sets--
        sets.TP = {}
 
        sets.TP.index = {'Standard','DT', 'DTHybrid'}
        --1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
        TP_ind = 1
       
        sets.TP.Standard = {ammo="Ginsen",
    head="Malignance Chapeau",
    body="Adhemar Jacket +1",
    hands="Adhemar wristbands +1",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'DEX+10','Accuracy+26', 'Attack+13','Triple Atk.+4',}},
    neck="Mirage Stole +2",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
                                           
                                              

                                                       


                                                       
        sets.TP.DT = {
		-- 3+5+7+7+4+6+4+7+10+5=                       3 4 7 4 6 7 10 5 = 46 DT
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}, --5
}
                                 
        sets.TP.DTHybrid = {  --3+6+9+5+10+5+7+4= 49
		ammo="Staunch Tathlum +1", --3
        head="Malignance Chapeau",  --6
		neck="Mirage Stole +2", 
		ear1="Brutal Earring",
		ear2="Telos Earring",
		body="Malignance Tabard",  --9
		hands="Malignance gloves", --5
		ring1="Epona's Ring",  
		ring2="Defending ring", --10
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}, --5
		waist="Windbuffet Belt +1",  
		legs="Malignance tights", --7
		feet="Malignance Boots", --4
}


       
       
       
       
       
        --Weaponskill Sets--
        sets.WS = {}
       
        sets.Requiescat = {}
       
        sets.Requiescat.index = {'Attack','Accuracy'}
        Requiescat_ind = 1
       
        sets.Requiescat.Attack = {
	ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Moonshade Earring",
    left_ring="Epona's Ring",
    right_ring="Metamor. Ring +1",
	 back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                                 
		sets.Requiescat.Accuracy = {
	ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame gauntlets", 
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Moonshade Earring",
    left_ring="Epona's Ring",
    right_ring="Metamor. Ring +1",
	 back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
                                                         
        sets.ChantDuCygne = {}
       
        sets.ChantDuCygne.index = {'Attack','Accuracy','HighAcc'}
        ChantDuCygne_ind = 1
       
        sets.ChantDuCygne.Attack = {
		
	ammo="Crepuscular Pebble",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Samnuha Tights",
    feet="Thereoid greaves",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
                                                           
        sets.ChantDuCygne.Accuracy = {
	ammo="Crepuscular Pebble",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Samnuha Tights",
    feet="Thereoid greaves",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}

	sets.ChantDuCygne.HighAcc = {
	ammo="Crepuscular Pebble",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar wristbands +1",
    legs="Samnuha Tights",
    feet="Malignance Boots",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
                                                           
        sets.WS.SanguineBlade = {}
       
        sets.WS.SanguineBlade = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="amalric doublet +1",
    hands="Jhakri Cuffs +2",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
      back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.SeraphBlade = {}
       
        sets.WS.SeraphBlade = {
    ammo="Pemphredo Tathlum",
     head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
     hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.SeraphStrike = {}
       
        sets.WS.SeraphStrike = {
    ammo="Pemphredo Tathlum",
      head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
     hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
               
        sets.WS.CircleBlade = {}               
                       --Savage Blade Also
        sets.WS.CircleBlade = 	{
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
	hands="Nyame gauntlets", 
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                   
        sets.WS.Expiacion = {}         
                       
        sets.WS.Expiacion = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
  hands="Nyame gauntlets", 
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Shukuyu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.WS.VorpalBlade = {}
	
	sets.WS.VorpalBlade = {
	  head="Nyame Helm",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Luhlaza Shalwar +3",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
                                                 
        sets.Realmrazer = {}
       
        sets.Realmrazer.index = {'Attack','Accuracy'}
        Realmrazer_ind = 1
       
        sets.Realmrazer.Attack = {    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'DEX+10','Accuracy+26', 'Attack+13','Triple Atk.+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Telos Earring",
    right_ear="Moonshade Earring",
    left_ring="Epona's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
                                                         
        sets.Realmrazer.Accuracy = {    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'DEX+10','Accuracy+26', 'Attack+13','Triple Atk.+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Epona's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
                                                       
        sets.WS.FlashNova = {}
       
        sets.WS.FlashNova = {
		ammo="Pemphredo Tathlum",
	head="Nyame Helm",
    body="Amalric doublet +1",
    hands="Jhakri cuffs +2",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.BlackHalo = {}
       
        sets.WS.BlackHalo = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
    hands="Nyame gauntlets", 
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
	feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                               
                                                               
        --Magic Burst Sets--

	sets.Burst = {}
	sets.Burst.index = {'BA', 'MB'}
	Burst_ind = 1                                                       
                                                               
                                                               
        --Blue Magic Sets--
        sets.BlueMagic = {}
       
        sets.BlueMagic.STR = {
		ammo="Honed tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Luhlaza Shalwar +3",
    feet={ name="Herculean Boots", augments={'DEX+10','Accuracy+26', 'Attack+13','Triple Atk.+4',}},
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Shukuyu Ring",
    right_ring="Ilabrat Ring",
    back="Cornflower cape",
}
                                                 
        sets.BlueMagic.STRDEX = {
		ammo="Honed tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Luhlaza Shalwar +3",
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
	waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
     right_ring="Ilabrat Ring",
   left_ring="Shukuyu Ring",
    back="Cornflower cape",
}
                                                       
        sets.BlueMagic.STRVIT = {
    ammo="Ginsen",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},
}
                                                         
        sets.BlueMagic.STRMND = {
    ammo="Ginsen",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},
}
                                                               
        sets.BlueMagic.AGI = {
    ammo="Ginsen",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Shukuyu Ring",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},
}
                                                 
        sets.BlueMagic.INT = {
		
	ammo="Pemphredo Tathlum",
     head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+28','Pet: "Mag.Atk.Bns."+19','Accuracy+7 Attack+7','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body="Amalric doublet +1",
    hands="Amalric gages +1",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck="Sanctity necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.BlueMagic.Earth = set_combine( sets.BlueMagic.INT,{neck="Quanpur Necklace",})
		
	sets.BlueMagic.Dark = {ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Amalric doublet +1",
    hands="Amalric gages +1",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
                                                 
        sets.BlueMagic.Cures = {ammo="Hydrocera",
    ammo="Staunch Tathlum +1",
    head="Pinga Crown +1",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
   feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
                                                       
        sets.BlueMagic.SelfCures = {
    ammo="Staunch Tathlum +1",
    head="Pinga Crown +1",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
                                                       
        sets.BlueMagic.Stun = {
    ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},
}
                                                   
        sets.BlueMagic.HeavyStrike = {ammo="Mantoptera Eye",
    head="Malignance Chapeau",
    body="Adhemar Jacket +1",
    hands="Adhemar wristbands +1",
	legs="Luhlaza Shalwar +3",
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
    waist="Chuq'aba Belt",
    left_ear="Heartseeker Earring",
    right_ear="Steelflash Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Breath dmg. taken -3%',}},
    right_ring="Ilabrat Ring",
    back="Cornflower cape",
}
                                                                 
        sets.BlueMagic.ChargedWhisker = {
		ammo="Pemphredo Tathlum",
       head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+28','Pet: "Mag.Atk.Bns."+19','Accuracy+7 Attack+7','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body="Amalric doublet +1",
    hands="Amalric gages +1",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck="Sanctity necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
       
        sets.BlueMagic.WhiteWind = {
    ammo="Staunch Tathlum +1",
    head="Pinga Crown +1",
    body="Pinga Tunic +1",
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs="Pinga Pants +1",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	left_ring="Vocane Ring",
    right_ring="Kunaji Ring",
    back="Moonlight Cape",
}
                                                                         
        sets.BlueMagic.MagicAccuracy = {
    ammo="Pemphredo Tathlum",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.BlueMagic.Enmity = {
	ammo="Sapience Orb",
		head="Nyame Helm",
		body="Emet Harness +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Vengeful Ring",
		right_ring="Supershear Ring",
		   back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}

	sets.BlueMagic.ConserveMP = {
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}

	sets.BlueMagic.Refresh = {
    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'DEF+18','Spell interruption rate down -9%','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}
                                                                         
    sets.BlueMagic.Skill = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Cornflower Cape", augments={'MP+20','Accuracy+2','Blue Magic skill +10',}},
}
                                                       
        sets.BlueMagic.SkillRecast = {
    ammo="Staunch Tathlum +1",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -7%','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
     legs={ name="Herculean Trousers", augments={'Accuracy+30','"Conserve MP"+3','"Fast Cast"+8','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Fi Follet Cape +1",
}
                                                                 
     sets.BlueMagic.TH = {
	 			ammo="Pemphredo Tathlum",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Mag. Acc.+12','"Treasure Hunter"+2',}},
			feet={ name="Herculean Boots", augments={'MND+8','Pet: "Dbl. Atk."+1','"Treasure Hunter"+2','Accuracy+13 Attack+13','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
			neck="Mirage Stole +2",
			waist="Luminary Sash",
			left_ear="Digni. Earring",
			right_ear="Gwati Earring",
			left_ring="Stikini Ring +1",
			right_ring="Metamor. Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
			}
                                                                 
                                                                 
                                               
                                               
        --Utility Sets--
        sets.Utility = {}
	
	sets.Utility.Weather = {waist="Hachirin-no-obi"}

	sets.Utility.MB = {ring2="Mujin Band"}
 
       
        sets.Utility.Stoneskin = {

		ear1="Loquac. earring",
		ear2="Earthcry earring",
        body="Assim. jubbah +3",
		ring1="Prolix ring",
   back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
		waist="Siegel sash",
		legs="Haven hose",
		feet="Iuitl gaiters"
		}
                                                         
        sets.Utility.Phalanx = {
		ammo="Staunch Tathlum +1",
		 head={ name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','Blood Pact Dmg.+2','Phalanx +4','Accuracy+15 Attack+15',}},
		neck="Melic Torque",
		ear1="Mimir earring",
		ear2="Andoaa Earring",
		body="Taeon Tabard",
		hands="Taeon Gloves",
		ring1="Stikini ring +1",
		ring2="Stikini ring +1",
        back="Fi Follet cape +1",
		waist="Olympus sash",
		legs="Taeon Tights",
		feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		}
		sets.recphalanx = 	{
		ammo="Staunch Tathlum +1",
		head={ name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','Blood Pact Dmg.+2','Phalanx +4','Accuracy+15 Attack+15',}},
		body="Taeon Tabard",
		hands="Taeon Gloves",
        legs="Taeon Tights",
		feet={ name="Herculean Boots", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','Mag. Acc.+20','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}}, 
		}	 
        sets.Utility.Steps = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
      back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                 
        sets.Utility.PDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                               
        sets.Utility.MDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
       
       
       
       
       
        --Job Ability Sets--
       
        sets.JA = {}
       
        sets.JA.ChainAffinity = {feet="Assim. charuqs +1"}
       
        sets.JA.BurstAffinity = {}
       
        sets.JA.Efflux = {}
       
        sets.JA.AzureLore = {hands="Luh. bazubands +1"}
       
        sets.JA.Diffusion = {feet="Luhlaza Charuqs +1"}
                                                               
                                                               
                       
                       
                       
                       
        --Precast Sets--
        sets.precast = {}
       
        sets.precast.FC = {}
       
        sets.precast.FC.Standard = {
		ammo="Impatiens", --0
    head="Pinga Crown +1", --10
    body="Pinga Tunic +1", --15
    hands="Leyline Gloves", --8
    legs="Pinga Pants +1", --13
    feet="Carmine Greaves +1", --8
    neck="Orunmila's Torque", --5
    waist="Witful Belt", --3  +3 oc 
    left_ear="Enchntr. Earring +1", --2
    right_ear="Odnowa Earring +1", --0
    left_ring="Lebeche Ring", --0
    right_ring="Kishar Ring", --4
     back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},--0   +4 oc
}  --10+15+8+13+6+5+3+2+4
       
        sets.precast.FC.Blue = {ammo="Impatiens",
    head="Pinga Crown +1",
    body="Pinga Tunic +1",
    hands="Leyline Gloves",
    legs="Pinga Pants +1",
    feet="Carmine Greaves +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Odnowa Earring +1",
	left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
   back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
end
 
 
 
 
 
 
function precast(spell)
        if spell.action_type == 'Magic' then
                equip(sets.precast.FC.Standard)
                               
                if spell.skill == 'Blue Magic' then
                equip(sets.precast.FC.Blue)
                end
        end
       
        if spell.english == 'Azure Lore' then
                equip(sets.JA.AzureLore)
        end
       
        if spell.english == 'Requiescat' then
                equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        end
       
        if spell.english == 'Chant du Cygne' then
                equip(sets.ChantDuCygne[sets.ChantDuCygne.index[ChantDuCygne_ind]])
        end
       
        if spell.english == 'Circle Blade' or spell.english == 'Savage Blade' or spell.english == 'Judgment' then
                equip(sets.WS.CircleBlade)
        end
               
        if spell.english == 'Expiacion' then
                equip(sets.WS.Expiacion)
        end

	if spell.english == 'Vorpal Blade' then
		equip(sets.WS.VorpalBlade)
	end
       
        if spell.english == 'Sanguine Blade' then
                equip(sets.WS.SanguineBlade)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
        end
            if spell.english == 'Seraph Blade' then
                equip(sets.WS.SeraphBlade)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
        end
		if spell.english == 'Seraph Strike' then
                equip(sets.WS.SeraphBlade)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
        end
        if spell.english == 'Box Step' then
                equip(sets.Utility.Steps)
        end
       
        if spell.english == 'Realmrazer' then
                equip(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
        end
       
        if spell.english == 'Flash Nova' then
                equip(sets.WS.FlashNova)
        	if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
	end
	    if spell.english == 'Black Halo' then
                equip(sets.WS.BlackHalo)
		end
end
       
function midcast(spell,act)
        if spell.english == 'Vertical Cleave' or spell.english == 'Death Scissors' or spell.english == 'Empty Thrash' or spell.english == 'Dimensional Death' or spell.english == 'Quadrastrike' or spell.english == 'Bloodrake' then
                equip(sets.BlueMagic.STR)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
               
        if spell.english == 'Disseverment' or spell.english == 'Hysteric Barrage' or spell.english == 'Frenetic Rip' or spell.english == 'Seedspray' or spell.english == 'Vanity Dive' or spell.english == 'Goblin Rush' or spell.english == 'Paralyzing Triad' or spell.english == 'Thrashing Assault' then
                equip(sets.BlueMagic.STRDEX)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Quad. Continuum' or spell.english == 'Delta Thrust' or spell.english == 'Cannonball' or spell.english == 'Glutinous Dart' then
                equip(sets.BlueMagic.STRVIT)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Whirl of Rage' then
                equip(sets.BlueMagic.STRMND)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Benthic Typhoon' or spell.english == 'Final Sting' or spell.english == 'Spiral Spin' then
                equip(sets.BlueMagic.AGI)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
     if spell.english == 'Gates of Hades' or spell.english == 'Lunge' or spell.english == 'Swipe' or spell.english == 'Leafstorm' or spell.english == 'Firespit' or spell.english == 'Acrid Stream' or spell.english == 'Corrosive Ooze' or spell.english == 'Thermal Pulse' or spell.english == 'Magic Hammer' 
	or spell.english == 'Evryone. Grudge' or spell.english == 'Water Bomb' or spell.english == 'Dark Orb' or spell.english == 'Thunderbolt' or spell.english == 'Tem. Upheaval' or spell.english == 'Embalming Earth' or spell.english == 'Foul Waters' or spell.english == 'Rending Deluge' 
	or spell.english == 'Droning Whirlwind' or spell.english == 'Subduction' or spell.english == 'Anvil Lightning' or spell.english == 'Blinding Fulgor' or spell.english == 'Palling Salvo' or spell.english == 'Scouring Spate' 
	or spell.english == 'Searing Tempest' or spell.english == 'Silent Storm' or spell.english == 'Diffusion Ray' or spell.english == 'Spectral Floe' then
                equip(sets.BlueMagic.INT)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
                if buffactive['Burst Affinity'] then
			if Burst_ind == 1 then	
                        equip(sets.JA.BurstAffinity)
			elseif Burst_ind == 2 then
			equip(sets.Utility.MB)
		end
                end
		end
	if spell.english == 'Entomb'  then
		equip(sets.BlueMagic.Earth)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
                if buffactive['Burst Affinity'] then
			if Burst_ind == 1 then	
                        equip(sets.JA.BurstAffinity)
			elseif Burst_ind == 2 then
			equip(sets.Utility.MB)
		end
                end
        end

	if spell.english == 'Tenebral Crush' or spell.english == 'Palling Salvo' then
		equip(sets.BlueMagic.Dark)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
                if buffactive['Burst Affinity'] then
			if Burst_ind == 1 then	
                        equip(sets.JA.BurstAffinity)
			elseif Burst_ind == 2 then
			equip(sets.Utility.MB)
		end
                end
        end
       
        if spell.english == 'Magic Fruit' or spell.english == 'Plenilune Embrace' or spell.english == 'Wild Carrot' or spell.english == 'Pollen' or spell.english == 'Cure III' or spell.english == 'Cure IV' then
                equip(sets.BlueMagic.Cures)
			if spell.target.name == player.name and string.find(spell.english, 'Magic Fruit') or string.find(spell.english, 'Plenilune Embrace') or string.find(spell.english, 'Wild Carrot') or string.find(spell.english, 'Cure III') or string.find(spell.english, 'Cure IV') then
                                equip(sets.BlueMagic.SelfCures)
                        end
			
        end
       
        if spell.english == 'White Wind' then
                equip(sets.BlueMagic.WhiteWind)
        end
       
        if spell.english == 'Head Butt' or spell.english == 'Sudden Lunge' or spell.english == 'Tourbillion' or spell.english == 'Saurian Slide' or spell.english == 'Sweeping Gouge' or spell.english == 'Frypan' then
                equip(sets.BlueMagic.Stun)
        end
       
        if spell.english == 'Heavy Strike' then
                equip(sets.BlueMagic.HeavyStrike)
        end
       
        if spell.english == 'Charged Whisker' then
                equip(sets.BlueMagic.ChargedWhisker)
                if buffactive['Burst Affinity'] then
                        equip(sets.JA.BurstAffinity)
                end
        end
       if spell.english == 'Sound Blast' or spell.english == 'Lowing' or spell.english == 'Cimicine Discharge' then 
	   equip(sets.BlueMagic.TH)
	   end
        if spell.english == 'Frightful Roar' or spell.english == 'Cruel Joke' or spell.english == 'Regurgitation' or spell.english == 'Infrasonics' or spell.english == 'Sleepga' or spell.english == 'Chaotic Eye' or spell.english == 'Auroral Drape' or spell.english == 'Sheep Song' or spell.english == 'Barbed Crescent' 
	or spell.english == 'Tourbillion'  or spell.english == 'Sub-zero smash' or spell.english == 'Filamented Hold' or spell.english == 'Mind Blast' or spell.english == 'Sandspin' or spell.english == 'Tearing Gust'
	or spell.english == 'Hecatomb Wave' or spell.english == 'Blank Gaze' or spell.english == 'Cold Wave' or spell.english == 'Terror Touch' or spell.english == 'Retinal Glare' or spell.english == 'Dream Flower' or spell.english == 'Osmosis'
	or spell.english == 'Geist Wall' or spell.english == 'Absolute Terror' or spell.english == 'Blistering Roar' then
                equip(sets.BlueMagic.MagicAccuracy)
        end
       
        if spell.english == 'MP Drainkiss' or spell.english == 'Digest' or spell.english == 'Blood Saber' or spell.english == 'Blood Drain'  or spell.english == 'Feather Tickle' or spell.english == 'Reaving Wind'then
                equip(sets.BlueMagic.SkillRecast)
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
		if spell.english == 'Occultation' or spell.english == 'Magic Barrier' or spell.english == 'Diamondhide' or spell.english == 'Metallic Body' then
                equip(sets.BlueMagic.Skill)
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
	
	if spell.english == 'Fantod' or spell.english =='Jettatura' or spell.english =='Wind Breath' or spell.english =='Exuviation' then
                equip(sets.BlueMagic.Enmity)
                
        end
	
	if spell.english == 'Mighty Guard' or spell.english == 'Erratic Flutter' or spell.english == 'Nat. Meditation' or spell.english == 'Uproot' or spell.english == 'Saline Coat' or spell.english == 'Barrier Tusk' then
		equip(sets.BlueMagic.ConserveMP)
	end
	
	if spell.english == 'Battery Charge' or spell.english == 'Refresh' or spell.english == 'Aquaveil' then
		equip(sets.BlueMagic.Refresh)
	end
	if spell.english == 'Phalanx'then
	    equip(sets.Utility.Phalanx)
		end
       
        if spell.english == 'Cocoon' or spell.english == 'Mighty Guard' or spell.english == 'Harden Shell' or spell.english == 'Animating Wail' or spell.english == 'Battery Charge' or spell.english == 'Nat. Meditation' or spell.english == 'Carcharian Verve' or spell.english == 'O. Counterstance' or spell.english == 'Barrier Tusk' or spell.english == 'Saline Coat' or spell.english == 'Regeneration' or spell.english == 'Erratic Flutter' then
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
end
 
function aftercast(spell)
        if player.status == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
       
        if spell.action_type == 'Weaponskill' then
                add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
        end
end
 
function status_change(new,old)
        if new == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end
 
function self_command(command)
        if command == 'toggle TP set' then
                TP_ind = TP_ind +1
                if TP_ind > #sets.TP.index then TP_ind = 1 end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'toggle Idle set' then
                Idle_ind = Idle_ind +1
                if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        elseif command == 'toggle Req set' then
                Requiescat_ind = Requiescat_ind +1
                if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
                send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
        elseif command == 'toggle CDC set' then
                ChantDuCygne_ind = ChantDuCygne_ind +1
                if ChantDuCygne_ind > #sets.ChantDuCygne.index then ChantDuCygne_ind = 1 end
                send_command('@input /echo <----- Chant du Cygne Set changed to '..sets.ChantDuCygne.index[ChantDuCygne_ind]..' ----->')
        elseif command == 'toggle Rea set' then
                Realmrazer_ind = Realmrazer_ind +1
                if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
                send_command('@input /echo <----- Realmrazer Set changed to '..sets.Realmrazer.index[Realmrazer_ind]..' ----->')
	elseif command == 'toggle MB set' then
		Burst_ind = Burst_ind +1
		if Burst_ind > #sets.Burst.index then Burst_ind = 1 end
		send_command('@input /echo [MB Set changed to '..sets.Burst.index[Burst_ind]..']')
        elseif command == 'equip TP set' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'equip Idle set' then
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end