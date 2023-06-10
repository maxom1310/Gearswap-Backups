function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Enspell','EnspellonlyDW')
    state.HybridMode:options('Normal','DT','Enspell','EnspellOnlyDW')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','AutoMeleeMND','AutoMeleeStr','AutoMeleeDex','AutoInt')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT','MDT','DTHippo')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Sequence','DualWeapons','DualWeaponsAcc','DualEvisceration','DualClubs','DualAeolian','DualProcDaggers','EnspellOnly','EnspellDW')
	

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
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
--	send_command('bind ^r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c weapons Default;gs c set unlockweapons false')
	send_command('bind ^q gs c set weapons enspellonly;gs c set unlockweapons true')
--	send_command('bind !r gs c set skipprocweapons true;gs c reset weaponskillmode;gs c set weapons none')
	send_command('bind !q gs c set skipprocweapons false;gs c set weapons DualProcDaggers;gs c set weaponskillmode proc')
			send_command('bind !f9 input /equipset 13;wait1;input /echo Daybreak + shield')
		send_command('bind @f9 input /equipset 14;wait1;input /echo Savage Blade;wait1;aws use savage blade')
		send_command('bind !^@f9 input /equipset 16;wait1;input /echo Maxentus;wait1;aws use black halo' )
		send_command('bind ^f9 input /equipset 15;wait1;input /echo Seraph Blade;wait1;aws use seraph blade')
		send_command('bind !^f9 input /equipset 16;wait1;input /echo Aeolian')	
	
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
	
	sets.precast.FC = {      ammo="Sapience Orb",
	head="Bunzi's Hat",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back="Perimede Cape",}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {     ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS.Proc = 	{range=empty,ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.wsd_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
      waist="Shadow Belt",
    left_ear="Malignance Earring",
    right_ear="Sherida Earring",
     left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS['Chant du Cygne'] = {    ammo="Yetshila +1",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Shadow Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Ephramad's Ring",
    right_ring="Ilabrat Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
	}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant du Cygne']

	sets.precast.WS['Savage Blade'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
   neck="Rep. Plat. Medal",
   waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
   	sets.precast.WS['Mercy Stroke'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
   neck="Rep. Plat. Medal",
   waist="Sailfi Belt +1",
    right_ear="Sherida Earring",
    left_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	   
	   	sets.precast.WS['Black Halo'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Dls. Torque +2",
   waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Sanguine Blade'] = {
		head="Pixie Hairpin +1",    ammo="Regal Gem",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Archon Ring",
	    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Seraph Blade'] = {    ammo="Regal Gem",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Regal Gem",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
	 back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}
	 
	 	sets.precast.WS['Red Lotus Blade'] = {ammo="Regal Gem",
	head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
	 back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="Volte Cap", Hands="Volte Bracers",legs={ name="Chironic Hose", augments={'"Dual Wield"+3','Accuracy+10','"Treasure Hunter"+1','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
	sets.midcast.FastRecast = {    ammo="Sapience Orb",
    head="Bunzi's Hat",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back="Perimede Cape",}

    sets.midcast.Cure = {     ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},}
		
    sets.midcast.LightWeatherCure = {     ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {    ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Luminary Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Naji's Loop",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	sets.midcast['Enhancing Magic'] = {    ammo="Crepuscular Pebble",
    head="Telchine Cap",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy gloves +3",
    legs="Telchine Braconi",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Lethargy Earring +1",
    right_ring={name="Eihwaz Ring",priority=10,},
    left_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +2",
		body="Lethargy Sayon +3",hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj +1",  body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},head="Befouled Crown",--neck="Incanter's Torque",
	  neck={ name="Dls. Torque +2", augments={'Path: A',}},  left_ear="Andoaa Earring",
	ear2="Mimir Earring",hands="Viti. Gloves +3",back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3",  feet="Leth. Houseaux +3",    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",}
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})
	sets.midcast.BoostStat = {hands="Viti. Gloves +3"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {    ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast['Enfeebling Magic'].Resistant = {       ammo="Regal Gem",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Spell interruption rate down -1%','MND+15','Mag. Acc.+14',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {hands="Regal Cuffs",})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{})--waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{})--waist="Acuity Belt +1"})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {hands="Leth. Ganth. +3"})--ear1="Vor Earring",hands="Leth. Ganth. +3",legs="Psycloth Lappas"})
	
	sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Frazzle III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Distract III'].Resistant = sets.midcast['Enfeebling Magic'].Resistant
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Elemental Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Resistant = {     ammo="Pemphredo Tathlum",
   head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
    sets.midcast['Elemental Magic'].Fodder = {       ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

    sets.midcast['Elemental Magic'].Proc = {       ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Mizu. Kubikazari",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Shiva Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
	sets.midcast.Impact = {    ammo="Regal Gem",
	head=empty,
    body="Crepuscular Cloak",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Dark Magic'] = {    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Erra Pendant",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

    sets.midcast.Drain = {    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {    ammo="Regal Gem",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.midcast['Absorb-TP'] = {
	    ammo="Regal Gem",
    head="Amalric Coif +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
		
	sets.midcast.Stun.Resistant = {    ammo="Regal Gem",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
    sets.HPCure = {range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Viti. Tabard +3",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
	

	-- Idle sets
	sets.idle = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},}
		
	sets.idle.PDT = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
	neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.idle.MDT = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
	waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.idle.Weak = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
   back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})
	
	-- Defense sets
	sets.defense.PDT = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
    sets.defense.MEVA = {    ammo="Crepuscular Pebble",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},}
		
	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
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
	sets.weapons.EnspellDW = {main="Blurred Knife +1",sub="Atoyac",range="Kaja Bow",ammo="Beetle Arrow"}
	sets.weapons.DualClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.DualBlackHalo = {main="Maxentus",sub="Thibron"}
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

	sets.engaged = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.Enspell = {
    ammo="Sroda Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}

	sets.engaged.Acc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}	
		
	sets.engaged.FullAcc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

	sets.engaged.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
     waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.Acc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.FullAcc.DT = {    ammo="Coiste Bodhar",
   head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Grunfeld Rope",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
	sets.engaged.DW = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
      waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
		
	sets.engaged.DW.Acc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
   waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
		
	sets.engaged.DW.FullAcc = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
     left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
		
	sets.engaged.DW.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
		
	sets.engaged.DW.Acc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
   waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
		
	sets.engaged.DW.FullAcc.DT = {    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
   waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},}
	
	sets.engaged.DW.Enspell = {
    ammo="Sroda Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
		}
			sets.engaged.DW.EnspellonlyDW = {
    ammo="Sroda Tathlum",
    head="Bunzi's Hat",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
		}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 7)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 7)
	else
		set_macro_page(1, 7)
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
			windower.chat.input('/lockstyleset 060')
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Sword/Club.
				windower.chat.input('/lockstyleset 060')
			else
				windower.chat.input('/lockstyleset 060') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Dagger/Club.
				windower.chat.input('/lockstyleset 060')
			else
				windower.chat.input('/lockstyleset 060') --Catchall
			end
		elseif res.items[item_name_to_id(player.equipment.main)].skill == 11 then --Club in main hand.
			if res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Club/Sword.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Club/Dagger.
				windower.chat.input('/lockstyleset 060')
			elseif res.items[item_name_to_id(player.equipment.sub)].skill == 11 then --Club/Club.
				windower.chat.input('/lockstyleset 060')
			else
				windower.chat.input('/lockstyleset 060') --Catchall
			end
		end
	elseif player.sub_job == 'WHM' or state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
		windower.chat.input('/lockstyleset 060')
	elseif player.sub_job == 'BLM' or state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
		windower.chat.input('/lockstyleset 060')
	else
		windower.chat.input('/lockstyleset 060')
	end
end