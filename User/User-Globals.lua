--Place for your settings and custom functions that are meant to affect all of your jobs and characters.
latency = .25
--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false
--Display related settings.

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)
state.RefineWaltz         = M(false, 'RefineWaltz')
state.AutoContradanceMode = M(false, 'Auto Contradance Mode')
state.AutoPrestoMode = M(false, 'Auto Presto Mode')
state.WakeUpWeapons = M(true, 'Wake Up Weapons')

-- No auto-engage when using a Step while idle
if not original_check_abilities then
	original_check_abilities = check_abilities
end

function check_abilities(spell, spellMap, eventArgs)
	if spell.type == 'Step' then return false end
	return original_check_abilities(spell, spellMap, eventArgs)
end

local last_roll_cd_msg = 0

function user_filter_precast(spell, spellMap, eventArgs)
	if spell.type == 'CorsairRoll' then
		local recast = windower.ffxi.get_ability_recasts()[spell.recast_id]
		local party = windower.ffxi.get_party()
		-- Only announce when the roll is really on cooldown, you're in a party,
		-- and at most once every 5 seconds so a spammed macro doesn't flood chat.
		if recast and recast >= 5 and party and party.party1_count > 1 and os.clock() > last_roll_cd_msg + 5 then
			send_command('input /p '..spell.english..' on cooldown for '..seconds_to_clock(recast)..' :)')
			last_roll_cd_msg = os.clock()
		end
	end
end

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.

NotifyBuffs = S{'doom','petrification'}
