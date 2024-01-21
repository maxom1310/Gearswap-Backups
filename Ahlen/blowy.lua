function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Melee', 'DT', 'Enspell')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Normal','PDL')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','DT','Resist')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Sequence','DualWeapons','DualWeaponsAcc','DualEvisceration','DualClubs','DualAeolian','DualProcDaggers','EnspellOnly')


		-- Additional local binds
		send_command('bind f8 gs c cycle WeaponskillMode')
		send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind  gs c cycle ElementalMode')
	send_command('bind f10 gs c cycle MagicBurstMode')
	send_command('bind f11 gs c cycle CastingMode')
	send_command('bind f12 gs c cycle IdleMode')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	--send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
	--send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	--ddsend_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = { ammo="Impatiens",
    head="Atrophy Chapeau +3",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Aya. Manopolas +2",
     legs="Volte Brais",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Elite Royal Collar",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Estq. Earring",
    left_ring="Lebeche Ring",
    right_ring="Weather. Ring",
    back="Moonbeam Cape",
}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Sacro Bulwark"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
	sets.precast.WS.Proc = 	{range=empty,ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS['Chant du Cygne'] = {ammo="Yetshila",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lethargy Sayon +3",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Thereoid Greaves",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
    left_ring="Ilabrat Ring",
    right_ring="Lehko's Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
}
		
	sets.precast.WS['Evisceration'] = {ammo="Yetshila",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lethargy Sayon +3",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Thereoid Greaves",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
    left_ring="Ilabrat Ring",
    right_ring="Lehko's Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
}

	sets.precast.WS['Savage Blade'] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}		
	sets.precast.WS['Death Blossom'] ={ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Regal Earring",
    left_ring="Sroda Ring",
    right_ring="Shukuyu Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

	sets.precast.WS['Sanguine Blade'] = {ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Jhakri Cuffs +2",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Persis Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
	sets.precast.WS['Seraph Blade'] = {ammo="Sroda Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Jhakri Cuffs +2",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Weather. Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Sroda Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Jhakri Cuffs +2",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

 sets.precast.WS['Black Halo'] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
    left_ring="Ilabrat Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

 sets.precast.WS['Spirits Within'] ={ammo="Staunch Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Supershear Ring",
    right_ring="K'ayres Ring",
    back="Moonbeam Cape",
}

sets.precast.WS['Uriel Blade'] ={ammo="Sroda Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Jhakri Cuffs +2",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Weather. Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

sets.precast.WS['Knights of Round'] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Shukuyu Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

sets.precast.WS['Savage Blade'].PDL = {  ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Sroda Ring",
    right_ring="Shukuyu Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

sets.precast.WS['Knights of Round'].PDL = {ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Shukuyu Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

sets.precast.WS['Death Blossom'].PDL ={ ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Sherida Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {   body="Volte Jupon",
    legs="Volte Hose",
    feet="Volte Boots",
})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat",
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea Slops",
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	
	sets.midcast.FastRecast = { ammo="Impatiens",
    head="Atrophy Chapeau +3",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Aya. Manopolas +2",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Elite Royal Collar",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Estq. Earring",
    left_ring="Lebeche Ring",
    right_ring="Weather. Ring",
    back="Moonbeam Cape",
}
    sets.midcast.Cure = {main={ name="Serenity", augments={'MP+25','Enha.mag. skill +3','"Cure" spellcasting time -1%',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Healing Torque",
    waist="Witful Belt",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Healing Torque",
    waist="Witful Belt",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
        
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main={ name="Serenity", augments={'MP+25','Enha.mag. skill +3','"Cure" spellcasting time -1%',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Healing Torque",
    waist="Witful Belt",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Malison Medallion",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
})
		
	--sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	--sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	--sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Telchine Cap", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +7',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +7',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
     left_ring="Stikini Ring",
    right_ring="Stikini Ring",
	right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +3",
		body="Lethargy Sayon +3",hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj",
    head="Befouled Crown",
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +3",
    neck="Melic Torque",
    waist="Olympus Sash",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +9','Mag. Acc.+1','Enh. Mag. eff. dur. +17',}},
}
	sets.midcast.Refresh = {body="Atrophy Tabard +3",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {ammo="Staunch Tathlum",
    head="Chironic Hat",
    body="Ros. Jaseran +1",
    hands="Regal Cuffs",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Emphatikos Rope",
    right_ear="Halasz Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.midcast.BarElement = { neck="Sroda Necklace", legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	--sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.midcast.Temper
	--sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Stoneskin = { legs="Haven Hose",
    neck="Nodens Gorget",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
}
	sets.midcast.Protect = {  left_ear="Brachyura Earring",
    left_ring="Sheltered Ring",
}
	sets.midcast.Shell = {  left_ear="Brachyura Earring",
    left_ring="Sheltered Ring",
}
	
	sets.midcast['Enfeebling Magic'] = {main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +3",
    hands="Lethargy Gantherots +3",
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
   range="Ullr",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +3",
    hands="Lethargy Gantherots +3",
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {range="Ullr", ammo="empty", body="Atrophy Tabard +3", hands="Regal Cuffs",left_ring="Kishar Ring",})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
     body="Lethargy Sayon +3",
    hands="Lethargy Gantherots +3",
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {   body="Volte Jupon",
    legs="Volte Hose",
    feet="Volte Boots",
})

	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {   body="Volte Jupon",
    legs="Volte Hose",
    feet="Volte Boots",
})
	
   sets.TreasureHunter = {   body="Volte Jupon",
    legs="Volte Hose",
    feet="Volte Boots",
}
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +3",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
     head="Leth. Chappel +3",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Amalric Gages +1",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    --sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Ammurapi Shield",range=empty,ammo="Dosis Tathlum",
       --head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
      --  body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
       --	 back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

   -- sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,range=empty,ammo="Impatiens",
      -- body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        --back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Ullr",
    body="Twilight Cloak",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Ovate Rope",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

	sets.midcast['Dark Magic'] = { main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
   range="Ullr",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck="Erra Pendant",
    waist="Casso Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.Drain = {main={ name="Rubicundity", augments={'Mag. Acc.+9','"Mag.Atk.Bns."+8','Dark magic skill +9','"Conserve MP"+5',}},
    sub="Ammurapi Shield",
    range="Ullr",
    head="Pixie Hairpin +1",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+18','"Drain" and "Aspir" potency +8','Accuracy+16 Attack+16','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+6','"Drain" and "Aspir" potency +8','MND+14',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Mag. Acc.+1','"Mag.Atk.Bns."+15',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring",
	}
  

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
        range="Ullr",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	
		
	sets.midcast.Stun.Resistant ={ main={ name="Murgleis", augments={'Path: A',}},
    sub="Ammurapi Shield",
        range="Ullr",
    head="Atrophy Chapeau +3",
    body="Atrophy Tabard +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
     legs={ name="Chironic Hose", augments={'Pet: VIT+11','Mag. Acc.+27','Accuracy+17 Attack+17','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Regal Earring" 	,
    right_ear="Digni. Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	

	-- Sets for special buff conditions on spells.
	
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], { head={ name="Chironic Hat", augments={'Weapon Skill Acc.+10','Pet: MND+1','Phalanx +3',}},
    body={ name="Chironic Doublet", augments={'MND+15','"Mag.Atk.Bns."+4','Phalanx +5','Accuracy+13 Attack+13','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    hands={ name="Chironic Gloves", augments={'Enmity+5','DEX+5','Phalanx +4','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Chironic Hose", augments={'INT+8','Mag. Acc.+1','Phalanx +3','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Taeon Boots", augments={'Rng.Acc.+22','"Snapshot"+5','Phalanx +3',}},
})
		
	sets.buff.Saboteur = {hands="Lethargy Gantherots +3"}
	
	sets.HPDown = {ammo="Staunch Tathlum",
   head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back="Moonbeam Cape",
}
		
    sets.HPCure = {main={ name="Serenity", augments={'MP+25','Enha.mag. skill +3','"Cure" spellcasting time -1%',}},
    sub="Enki Strap",
    ammo="Staunch Tathlum",
    head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Healing Torque",
    waist="Witful Belt",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.buff.Doom = set_combine(sets.buff.Doom, { neck="Nicander's Necklace",
    left_ring="Blenmot's Ring +1",
    right_ring="Blenmot's Ring +1",
})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back="Moonbeam Cape",
}
	

	-- Idle sets
	sets.idle = {main={ name="Murgleis", augments={'Path: A',}},
     sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
     body="Lethargy Sayon +3",
    hands={ name="Chironic Gloves", augments={'"Store TP"+2','Pet: "Store TP"+1','"Refresh"+2','Accuracy+16 Attack+16','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
     legs="Volte Brais",
    feet={ name="Chironic Slippers", augments={'AGI+7','Pet: VIT+8','"Refresh"+2',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
		
	sets.idle.DT = {main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
     body="Lethargy Sayon +3",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
		
		
	sets.idle.Weak = {main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}

sets.idle.Resist = { ammo="Staunch Tathlum",
    head="Leth. Chappel +3",
    body="Volte Jupon",
    hands="Leth. Ganth. +3",
    legs="Volte Hose",
    feet="Volte Boots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Warden's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
	
	--sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
		
    sets.defense.MEVA = {main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+28 MP+28','Magic dmg. taken -3%',}},
    ammo="Staunch Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Thureous Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}	
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Sequence = {main="Sequence",sub="Ammurapi Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.Almace = {main="Almace",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Thibron"}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Almace"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Almace"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Daybreak"}
	sets.weapons.DualProcDaggers = {main="Blurred Knife +1",sub="Atoyac"}
	sets.weapons.EnspellOnly = {main="Norgish Dagger",sub="Aern Dagger",range="Kaja Bow",ammo="Beetle Arrow"}
	sets.weapons.DualClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.DualBlackHalo = {main="Kaja Rod",sub="Thibron"}
	sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}
	sets.weapons.DualBow = {main="Naegling",sub="Tauret",range="Kaja Bow"}
	sets.weapons.BowMacc = {range="Kaja Bow",ammo=empty}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Amar Cluster",
    head="Malignance Chapeau",
     body="Malignance Tabard",
    hands="Malignance Gloves",
   legs="Malignance Tights",
     feet="Malignance Boots",
    neck="Anu Torque",
    waist="Orpheus's Sash",
    left_ear="Sherida Earring",
    right_ear="Crep. Earring",
    left_ring="Lehko's Ring",
    right_ring="Chirich Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','"Regen"+5',}},
}

sets.engaged.Melee = {ammo="Amar Cluster",
    head="Malignance Chapeau",
     body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
     feet="Malignance Boots",
    neck="Anu Torque",
    waist="Orpheus's Sash",
    left_ear="Sherida Earring",
    right_ear="Digni. Earring",
    left_ring="Lehko's Ring",
    right_ring="Chirich Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','"Regen"+5',}},
}
		


	sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Carmine Greaves +1"}	
		

	sets.engaged.DT = {  ammo="Staunch Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Bunzi's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Sherida Earring",
    right_ear="Etiolation Earring",
    left_ring="Ayanmo Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}
		
	sets.engaged.Enspell ={ range="Ullr",
    head="Umuthi Hat",
     body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}, 		
     feet="Malignance Boots",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Suppanomimi",
    right_ear="Hollow Earring",
    left_ring="Chirich Ring",
    right_ring="Chirich Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}	
		
	
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 1)
	else
		set_macro_page(2, 1)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		if player.equipment.main == nil or player.equipment.main == 'empty' then
			windower.chat.input('/lockstyleset 021')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 022')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 021')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 022')
			else
				windower.chat.input('/lockstyleset 021') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 030')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 031')
	else
		windower.chat.input('/lockstyleset 032')
	end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end