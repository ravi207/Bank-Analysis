from datetime import datetime
import commands
params = [x.strip() for x in file("storage_policies.param",'r').readlines()]

for each_line in params:
	each_param = each_line.split(",")
	path, hot_date, warm_date, cold_date = each_param[0], datetime.strptime(each_param[1], '%Y-%m-%d'), datetime.strptime(each_param[2], '%Y-%m-%d'), datetime.strptime(each_param[3], '%Y-%m-%d')
	curr_date = datetime.now()
	policy_command = "hdfs storagepolicies -setStoragePolicy -path %s -policy" % path
	if curr_date < hot_date:
		policy_command = policy_command + " HOT"
	elif curr_date < warm_date:
		policy_command = policy_command + " WARM"
	else:
		policy_command = policy_command + " COLD"
	status, output = commands.getstatusoutput(policy_command)