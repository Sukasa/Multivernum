/proc/ScriptRun(var/ScriptName, var/Detached)
	if (!Detached)
		Events.RunScript(ScriptName)
	else
		Events.RunScriptDetached(ScriptName)