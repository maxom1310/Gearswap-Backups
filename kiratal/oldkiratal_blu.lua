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
		send_command('bind ^pagedown send simaron cure 5 kiratal')
		send_command('bind !^pagedown send simaron erase kiratal')
		send_command('bind !pagedown send simaron curaga 4 kiratal')
		
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
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                 
        sets.Idle.DT = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
                                                       
                                                       
                                                       
       
       
        --TP Sets--
        sets.TP = {}
 
        sets.TP.index = {'Standard','DT', 'DTHybrid'}
        --1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
        TP_ind = 1
       
        sets.TP.Standard = {
    ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
                                                  
        sets.TP.DT = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}, --5
}
                                 
        sets.TP.DTHybrid = {  --3+6+9+5+10+5+7+4= 49
	    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}


       
       
       
       
       
        --Weaponskill Sets--
        sets.WS = {}
       
        sets.Requiescat = {}
       
        sets.Requiescat.index = {'Attack','Accuracy'}
        Requiescat_ind = 1
       
        sets.Requiescat.Attack = {
    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body="Assim. Jubbah +3",
    hands="Malignance Gloves",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Soil Belt",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epona's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
                                                                 
		sets.Requiescat.Accuracy = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs={ name="Herculean Trousers", augments={'Accuracy+16','Weapon skill damage +3%','STR+9','Attack+14',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Kentarch Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epona's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}
                                                         
        sets.ChantDuCygne = {}
       
        sets.ChantDuCygne.index = {'Attack','Accuracy','HighAcc'}
        ChantDuCygne_ind = 1
       
        sets.ChantDuCygne.Attack = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
                                                           
        sets.ChantDuCygne.Accuracy = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.ChantDuCygne.HighAcc = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Grunfeld Rope",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
                                                           
        sets.WS.SanguineBlade = {}
       
        sets.WS.SanguineBlade = {ammo="Pemphredo Tathlum",
    ammo="Hydrocera",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.SeraphBlade = {}
       
        sets.WS.SeraphBlade = {
    ammo="Hydrocera",
    head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.SeraphStrike = {}
       
        sets.WS.SeraphStrike = {
    ammo="Hydrocera",
    head="Nyame Helm",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
               
        sets.WS.CircleBlade = {}               
                       --Savage Blade Also
        sets.WS.CircleBlade = 	{
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ifrit Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                   
        sets.WS.Expiacion = {}         
                       
        sets.WS.Expiacion = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Assim. Jubbah +3",
    hands="Nyame Gauntlets",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
    right_ring="Ilabrat Ring",
}

	sets.WS.VorpalBlade = {}
	
	sets.WS.VorpalBlade = {
	    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands={ name="Herculean Gloves", augments={'Attack+23','Crit.hit rate+4','DEX+11','Accuracy+11',}},
    legs="Luhlaza Shalwar +3",
    feet={ name="Herculean Boots", augments={'DEX+10','Accuracy+26', 'Attack+13','Triple Atk.+4',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
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
    head="Jhakri Coronal +2",
    body="Amalric doublet +1",
    hands="Jhakri cuffs +2",
    legs="Luhlaza Shalwar +3",
    feet="Amalric nails +1",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Epaminondas's Ring",
     back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
        sets.WS.BlackHalo = {}
       
        sets.WS.BlackHalo = {
	    ammo="Crepuscular Pebble",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body="Assim. Jubbah +3",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                               
                                                               
        --Magic Burst Sets--

	sets.Burst = {}
	sets.Burst.index = {'BA', 'MB'}
	Burst_ind = 1                                                       
                                                               
                                                               
        --Blue Magic Sets--
        sets.BlueMagic = {}
       
        sets.BlueMagic.STR = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                 
        sets.BlueMagic.STRDEX = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                       
        sets.BlueMagic.STRVIT = {
     ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                         
        sets.BlueMagic.STRMND = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                               
        sets.BlueMagic.AGI = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Odr Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
                                                 
        sets.BlueMagic.INT = {
    ammo="Pemphredo Tathlum",
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.BlueMagic.Earth = set_combine( sets.BlueMagic.INT,{neck="Quanpur Necklace",})

	sets.BlueMagic.Dark = {
    ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
    body="Amalric Doublet +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
     waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
                                                 
        sets.BlueMagic.Cures = {
    ammo="Hydrocera",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
        sets.BlueMagic.SelfCures = {
     ammo="Hydrocera",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
        sets.BlueMagic.Stun = {
    ammo="Hydrocera",
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
    back="Aurist's Cape +1",
}
                                                   
        sets.BlueMagic.HeavyStrike = {ammo="Mantoptera Eye",
    head="Malignance Chapeau",
    body="Adhemar Jacket +1",
    hands="Adhemar wristbands +1",
	legs="Luhlaza Shalwar +3",
    feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','DEX+1','Accuracy+12','Attack+14',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Chuq'aba Belt",
    left_ear="Heartseeker Earring",
    right_ear="Steelflash Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Breath dmg. taken -3%',}},
    right_ring="Ilabrat Ring",
    back="Cornflower cape",
}
                                                                 
        sets.BlueMagic.ChargedWhisker = {
		ammo="Pemphredo Tathlum",
    head={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','INT+14','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
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
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Eschan Stone",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                                         
        sets.BlueMagic.MagicAccuracy = {
  ammo="Pemphredo Tathlum",
    head="Malignance Chapeau",
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
    back="Aurist's Cape +1",
}

	sets.BlueMagic.Enmity = {
	ammo="Sapience Orb",
		head="Nyame Helm",
		body="Emet Harness +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Elite Royal Collar",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Vengeful Ring",
		right_ring="Begrudging Ring",
		back="Agema cape",
}

	sets.BlueMagic.ConserveMP = {
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'DEF+19','Spell interruption rate down -10%','Enh. Mag. eff. dur. +8',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Moonlight Cape",
}

	sets.BlueMagic.Refresh = {
    ammo="Staunch Tathlum +1",
    head="Amalric Coif +1",
    body={ name="Telchine Chas.", augments={'Spell interruption rate down -9%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Mag. Acc.+14','"Cure" potency +6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Spell interruption rate down -7%','Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'DEF+18','Spell interruption rate down -9%','Enh. Mag. eff. dur. +10',}},
    neck="Elite Royal Collar",
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
    ammo="Crepuscular Pebble",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6','INT+6',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6','Mag. Acc.+4',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+6','MND+5','Mag. Acc.+15',}},
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
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
		head="Haruspex hat",
		neck="Stone Gorget",
		ear1="Loquac. earring",
		ear2="Earthcry earring",
        body="Assim. jubbah +1",
		hands="Stone Mufflers",
		ring1="Prolix ring",
    back="Moonlight Cape",
		waist="Siegel sash",
		legs="Haven hose",
		feet="Iuitl gaiters"
		}
                                                         
        sets.Utility.Phalanx = {
    ammo="Crepuscular Pebble",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +7',}},
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",
		}

                                                       
        sets.Utility.Steps = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vocane Ring",
    right_ring="Vengeful Ring",
    back="Moonlight Cape",
}
                                                 
        sets.Utility.PDT = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                               
        sets.Utility.MDT = {
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Chuq'aba Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Vengeful Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}
                                                       
       
       
       
       
       
        --Job Ability Sets--
       
        sets.JA = {}
       
        sets.JA.ChainAffinity = {feet="Assim. charuqs +1"}
       
        sets.JA.BurstAffinity = {}
       
        sets.JA.Efflux = {}
       
        sets.JA.AzureLore = {hands="Luh. bazubands +1"}
       
        sets.JA.Diffusion = {feet="Luhlaza Charuqs"}
                                                               
                                                               
                       
                       
                       
                       
        --Precast Sets--
        sets.precast = {}
       
        sets.precast.FC = {}
       
        sets.precast.FC.Standard = {
    ammo="Crepuscular Pebble",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6','INT+6',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6','Mag. Acc.+4',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+6','MND+5','Mag. Acc.+15',}},
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Rosmerta's Cape", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Evasion+15',}},
}  --10+15+8+13+6+5+3+2+4
       
        sets.precast.FC.Blue = {
    ammo="Crepuscular Pebble",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6','INT+6',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+21','"Fast Cast"+6','Mag. Acc.+4',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+6','MND+5','Mag. Acc.+15',}},
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
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
	or spell.english == 'Searing Tempest'  or spell.english == 'Diffusion Ray' or spell.english == 'Spectral Floe' then
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
	if spell.english == 'Entomb' then
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
	or spell.english == 'Tourbillion'  or spell.english == 'Sub-zero smash' or spell.english == 'Filamented Hold' or spell.english == 'Mind Blast' or spell.english == 'Sandspin' or spell.english == 'Tearing Gust' or spell.english == 'Reaving Wind' or spell.english == 'Feather Tickle' or spell.english == 'Osmosis'
	or spell.english == 'Hecatomb Wave' or spell.english == 'Blank Gaze' or spell.english == 'Cold Wave' or spell.english == 'Terror Touch' or spell.english == 'Retinal Glare' or spell.english == 'Dream Flower' or spell.english == 'Silent Storm'
	or spell.english == 'Geist Wall' or spell.english == 'Absolute Terror' or spell.english == 'Blistering Roar' then
                equip(sets.BlueMagic.MagicAccuracy)
        end
       
        if spell.english == 'MP Drainkiss' or spell.english == 'Digest' or spell.english == 'Blood Saber' or spell.english == 'Blood Drain' then
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