function user_job_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','PDT','PetTank','BothDD')
	state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('None','DWDeciAxe','DualNaegling','DWDeciAxeKclub')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Knockback','Suppa','DWEarrings'}
	

	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode','GenerousArthur','TPDrain','ScissorlegXerin','BlackbeardRandy','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar','Pcrab'}
	send_command('bind ^f7 gs c cycle JugMode')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','Tank','DD'}
	send_command('bind @f7 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind @f8 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')

	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'

	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
	sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
	sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves +1"}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.precast.JA.Tame = {head="Totemic Helm +1"}
	sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +3"}
	sets.SpurAxe = {}
	sets.SpurAxesDW = {}

	sets.precast.JA['Feral Howl'] = {}

	sets.precast.JA.Reward = {
		neck="Phalaina Locket",ear1="Etiolation Earring",ear2="Domesticator's Earring", head="Bison Warbonnet",
		body="Tot. Jackcoat +3",hands="Regimen Mittens",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Pastoralist's Mantle",waist="Klouskap Sash",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1",}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})
	
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	sets.precast.JA.Charm = {}

	-- CURING WALTZ
	sets.precast.Waltz = {
		head=gear.valorous_pet_head,neck="Elite Royal Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tot. Jackcoat +3",hands="Regimen Mittens",ring1="Valseur's Ring",ring2="Asklepian Ring",
		back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Valorous Greaves"}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {ammo="Voluspa Tathlum",
		head="Gavialis Helm",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Heartseeker Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Valorous Greaves"}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {ammo="Voluspa Tathlum",
		head="Gavialis Helm",neck="Combatant's Torque",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Valorous Greaves"}

	sets.precast.FC = {    ammo="Impatiens",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -7%','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Flume Belt +1",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Prolix Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

		-- MIDCAST SETS
	sets.midcast.FastRecast = {    ammo="Impatiens",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Taeon Tabard", augments={'Spell interruption rate down -7%','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Flume Belt +1",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Prolix Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Cure = {
		head="Gavialis Helm",neck="Phalaina Locket",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Jumalik Mail",hands="Macabre Gaunt. +1",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Pastoralist's Mantle",waist="Klouskap Sash",legs="Tali'ah Sera. +2",feet="Tot. Gaiters +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast.Stoneskin = sets.midcast.FastRecast

	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})

	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

	sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.SomeAcc = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.Acc = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.FullAcc = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	sets.precast.WS.Fodder = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

	-- Specific weaponskill sets.
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {    ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Nukumi Gausape +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Nukumi Ocreae +3",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Thrud Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},})
	sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {})
	sets.precast.WS['Ruinator'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})

	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {left_ear="Sherida Earring"})
	sets.precast.WS['Onslaught'].WSMidAcc = set_combine(sets.precast.WSMidAcc, {})
	sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {})

	sets.precast.WS['Primal Rend'] = {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
		sets.precast.WS['Decimation'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Gleti's Mask",
    body="Nukumi Gausape +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Nukumi Ocreae +3",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	  	sets.precast.WS['Mistral Axe'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nukumi Ocreae +3",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		  	sets.precast.WS['Calamity'] = {    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nukumi Gausape +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nukumi Ocreae +3",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
			  	sets.precast.WS['Rampage'] = {     ammo="Crepuscular Pebble",
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body="Nukumi Gausape +3",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Gleti's Breeches",
    feet="Nukumi Ocreae +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Gere Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {})

		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Nuk. Cabasset +3",
    body="Nukumi Gausape +3",
    hands="Nukumi Manoplas +3",
    legs="Nukumi Quijotes +3",
    feet="Gleti's Boots",
    neck="Shulmanu Collar",
    waist="Incarnation Sash",
    left_ear="Crep. Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {})
				
	sets.midcast.Pet.MagicReady = {    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Nuk. Cabasset +3",
    body="Nukumi Gausape +3",
    hands="Nukumi Manoplas +3",
    legs="Nukumi Quijotes +3",
    feet="Gleti's Boots",
    neck="Adad Amulet",
    waist="Incarnation Sash",
    left_ear="Crep. Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}
		
	sets.midcast.Pet.DebuffReady = {    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Nuk. Cabasset +3",
    body="Nukumi Gausape +3",
    hands="Nukumi Manoplas +3",
    legs="Nukumi Quijotes +3",
    feet="Gleti's Boots",
    neck="Adad Amulet",
    waist="Incarnation Sash",
    left_ear="Crep. Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.midcast.Pet.ReadyRecast = {legs="Gleti's Breeches",}
	sets.midcast.Pet.ReadyRecastDW = {legs="Gleti's Breeches",}
	sets.midcast.Pet.Neutral = {head="Nuk. Cabasset +3"}
	sets.midcast.Pet.Favorable = {head="Nuk. Cabasset +3"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +3"}

	-- RESTING
	sets.resting = {}

	sets.idle = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.idle.Refresh = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Crepuscular Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.idle.Pet = {    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.idle.Pet.Engaged = {    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Nuk. Cabasset +3",
    body="Nukumi Gausape +3",
    hands="Nukumi Manoplas +3",
    legs="Nukumi Quijotes +3",
    feet="Gleti's Boots",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Crep. Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.idle.Pet.Engaged.DW = {    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Nuk. Cabasset +3",
    body="Nukumi Gausape +3",
    hands="Nukumi Manoplas +3",
    legs="Nukumi Quijotes +3",
    feet="Gleti's Boots",
    neck={ name="Bst. Collar +2", augments={'Path: A',}},
    waist="Incarnation Sash",
    left_ear="Crep. Earring",
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	-- DEFENSE SETS
	sets.defense.PDT = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.defense.PetPDT = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.defense.PetMDT = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +3"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.defense.MEVA = { ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nukumi Quijotes +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Engraved Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Nukumi Earring +2",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +3"})

	sets.Kiting = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.SomeAcc = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Nukumi Quijotes +3",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.Acc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.FullAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.Fodder = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.SomeAcc.PDT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.Acc.PDT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.FullAcc.PDT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.Fodder.PDT = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.DW.SomeAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.DW.Acc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.DW.FullAcc = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	sets.engaged.DW.Fodder = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}},}

	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {})
	sets.engaged.DW.SomeAcc.PDT = set_combine(sets.engaged.SomeAcc.PDT, {})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc.PDT, {})
	sets.engaged.DW.FullAcc.PDT = set_combine(sets.engaged.FullAcc.PDT, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{})
	sets.engaged.BothDD.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.BothDD.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.BothDD.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{})
	sets.engaged.PetTank.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.PetTank.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.PetTank.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.BothDD.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.BothDD.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.BothDD.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.PetTank.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.PetTank.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.PetTank.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	sets.buff['Killer Instinct'] = {body="Nukumi Gausape +3"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Knockback = {}
	sets.SuppaBrutal = {}
	sets.DWEarrings = {}
	
	-- Weapons sets
	sets.weapons.DWDeciAxe = {main="Dolichenus",sub={ name="Ikenga's Axe", augments={'Path: A',}},}
	sets.weapons.DualNaegling = {    main="Naegling",
    sub={ name="Ikenga's Axe", augments={'Path: A',}},}
	sets.weapons.DWDeciAxeKclub = {main="Dolichenus",sub="Kraken Club",}


-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].TPDrain = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})


	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
	sets.precast.JA['Bestial Loyalty'].Pcrab = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rancid Broth"})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(6, 16)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 16)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 20)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 20)
	else
		set_macro_page(6, 20)
	end
end