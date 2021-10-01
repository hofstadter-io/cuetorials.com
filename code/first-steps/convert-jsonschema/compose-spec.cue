package compose

import "list"

#ComposeSpec: {
	// Compose Specification
	//
	// The Compose file is a YAML file defining a multi-containers
	// based application.
	@jsonschema(schema="http://json-schema.org/draft/2019-09/schema#")

	// Version of the Compose specification used. Tools not
	// implementing required version MUST reject the configuration
	// file.
	version?: string
	services?: {
		{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: #service}
	}
	networks?: {
		{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: #network}
		...
	}
	volumes?: {
		{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: #volume}
	}
	secrets?: {
		{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: #secret}
	}
	configs?: {
		{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: #config}
	}

	{[=~"^x-" & !~"^(version|services|networks|volumes|secrets|configs)$"]: _}

	#service: {
		deploy?: #deployment
		build?:  string | {
			context?:    string
			dockerfile?: string
			args?:       #list_or_dict
			labels?:     #list_or_dict
			cache_from?: [...string]
			network?:     string
			target?:      string
			shm_size?:    int | string
			extra_hosts?: #list_or_dict
			isolation?:   string

			{[=~"^x-" & !~"^(context|dockerfile|args|labels|cache_from|network|target|shm_size|extra_hosts|isolation)$"]: _}
		}
		blkio_config?: {
			device_read_bps?: [...#blkio_limit]
			device_read_iops?: [...#blkio_limit]
			device_write_bps?: [...#blkio_limit]
			device_write_iops?: [...#blkio_limit]
			weight?: int
			weight_device?: [...#blkio_weight]
		}
		cap_add?:       list.UniqueItems() & [...string]
		cap_drop?:      list.UniqueItems() & [...string]
		cgroup_parent?: string
		command?:       string | [...string]
		configs?: [...string | {
			source?: string
			target?: string
			uid?:    string
			gid?:    string
			mode?:   number

			{[=~"^x-" & !~"^(source|target|uid|gid|mode)$"]: _}
		}]
		container_name?: string
		cpu_count?:      int & >=0
		cpu_percent?:    int & >=0 & <=100
		cpu_shares?:     number | string
		cpu_quota?:      number | string
		cpu_period?:     number | string
		cpu_rt_period?:  number | string
		cpu_rt_runtime?: number | string
		cpus?:           number | string
		cpuset?:         string
		credential_spec?: {
			config?:   string
			file?:     string
			registry?: string

			{[=~"^x-" & !~"^(config|file|registry)$"]: _}
		}
		depends_on?: #list_of_strings | {
			{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: condition: "service_started" | "service_healthy" | "service_completed_successfully"}
		}
		device_cgroup_rules?: #list_of_strings
		devices?:             list.UniqueItems() & [...string]
		dns?:                 #string_or_list
		dns_opt?:             list.UniqueItems() & [...string]
		dns_search?:          #string_or_list
		domainname?:          string
		entrypoint?:          string | [...string]
		env_file?:            #string_or_list
		environment?:         #list_or_dict
		expose?:              list.UniqueItems() & [...number | string]
		extends?:             string | {
			service: string
			file?:   string
		}
		external_links?: list.UniqueItems() & [...string]
		extra_hosts?:    #list_or_dict
		group_add?:      list.UniqueItems() & [...number | string]
		healthcheck?:    #healthcheck
		hostname?:       string
		image?:          string
		init?:           bool
		ipc?:            string
		isolation?:      string
		labels?:         #list_or_dict
		links?:          list.UniqueItems() & [...string]
		logging?: {
			driver?: string
			options?: {
				{[=~"^.+$" & !~"^()$"]: null | number | string}
				...
			}

			{[=~"^x-" & !~"^(driver|options)$"]: _}
		}
		mac_address?:     string
		mem_limit?:       number | string
		mem_reservation?: int | string
		mem_swappiness?:  int
		memswap_limit?:   number | string
		network_mode?:    string
		networks?:        #list_of_strings | {
			{[=~"^[a-zA-Z0-9._-]+$" & !~"^()$"]: {
								aliases?: #list_of_strings, ipv4_address?: string, ipv6_address?: string, link_local_ips?: #list_of_strings, priority?: number

				{[=~"^x-" & !~"^(aliases|ipv4_address|ipv6_address|link_local_ips|priority)$"]: _}
			} | null
			}
		}
		oom_kill_disable?: bool
		oom_score_adj?:    int & >=-1000 & <=1000
		pid?:              null | string
		pids_limit?:       number | string
		platform?:         string
		ports?:            list.UniqueItems() & [...number | string | {
			mode?:      string
			host_ip?:   string
			target?:    int
			published?: int
			protocol?:  string

			{[=~"^x-" & !~"^(mode|host_ip|target|published|protocol)$"]: _}
		}]
		privileged?:   bool
		profiles?:     #list_of_strings
		pull_policy?:  "always" | "never" | "if_not_present" | "build" | "missing"
		read_only?:    bool
		restart?:      string
		runtime?:      string
		scale?:        int
		security_opt?: list.UniqueItems() & [...string]
		shm_size?:     number | string
		secrets?: [...string | {
			source?: string
			target?: string
			uid?:    string
			gid?:    string
			mode?:   number

			{[=~"^x-" & !~"^(source|target|uid|gid|mode)$"]: _}
		}]
		sysctls?:           #list_or_dict
		stdin_open?:        bool
		stop_grace_period?: string
		stop_signal?:       string
		storage_opt?: {
			...
		}
		tmpfs?: #string_or_list
		tty?:   bool
		ulimits?: {
			{[=~"^[a-z]+$" & !~"^()$"]: int | {
							hard: int, soft: int

				{[=~"^x-" & !~"^(hard|soft)$"]: _}
			}}
			...
		}
		user?:        string
		userns_mode?: string
		volumes?:     list.UniqueItems() & [...string | {
			type:         string
			source?:      string
			target?:      string
			read_only?:   bool
			consistency?: string
			bind?: {
				propagation?:      string
				create_host_path?: bool

				{[=~"^x-" & !~"^(propagation|create_host_path)$"]: _}
			}
			volume?: {
				nocopy?: bool

				{[=~"^x-" & !~"^(nocopy)$"]: _}
			}
			tmpfs?: {
				size?: int & >=0 | string

				{[=~"^x-" & !~"^(size)$"]: _}
			}

			{[=~"^x-" & !~"^(type|source|target|read_only|consistency|bind|volume|tmpfs)$"]: _}
		}]
		volumes_from?: list.UniqueItems() & [...string]
		working_dir?:  string

		{[=~"^x-" & !~"^(deploy|build|blkio_config|cap_add|cap_drop|cgroup_parent|command|configs|container_name|cpu_count|cpu_percent|cpu_shares|cpu_quota|cpu_period|cpu_rt_period|cpu_rt_runtime|cpus|cpuset|credential_spec|depends_on|device_cgroup_rules|devices|dns|dns_opt|dns_search|domainname|entrypoint|env_file|environment|expose|extends|external_links|extra_hosts|group_add|healthcheck|hostname|image|init|ipc|isolation|labels|links|logging|mac_address|mem_limit|mem_reservation|mem_swappiness|memswap_limit|network_mode|networks|oom_kill_disable|oom_score_adj|pid|pids_limit|platform|ports|privileged|profiles|pull_policy|read_only|restart|runtime|scale|security_opt|shm_size|secrets|sysctls|stdin_open|stop_grace_period|stop_signal|storage_opt|tmpfs|tty|ulimits|user|userns_mode|volumes|volumes_from|working_dir)$"]: _}
	}

	#healthcheck: {
		disable?:      bool
		interval?:     string
		retries?:      number
		test?:         string | [...string]
		timeout?:      string
		start_period?: string

		{[=~"^x-" & !~"^(disable|interval|retries|test|timeout|start_period)$"]: _}
	}

	#deployment: null | {
		mode?:          string
		endpoint_mode?: string
		replicas?:      int
		labels?:        #list_or_dict
		rollback_config?: {
			parallelism?:       int
			delay?:             string
			failure_action?:    string
			monitor?:           string
			max_failure_ratio?: number
			order?:             "start-first" | "stop-first"

			{[=~"^x-" & !~"^(parallelism|delay|failure_action|monitor|max_failure_ratio|order)$"]: _}
		}
		update_config?: {
			parallelism?:       int
			delay?:             string
			failure_action?:    string
			monitor?:           string
			max_failure_ratio?: number
			order?:             "start-first" | "stop-first"

			{[=~"^x-" & !~"^(parallelism|delay|failure_action|monitor|max_failure_ratio|order)$"]: _}
		}
		resources?: {
			limits?: {
				cpus?:   number | string
				memory?: string

				{[=~"^x-" & !~"^(cpus|memory)$"]: _}
			}
			reservations?: {
				cpus?:              number | string
				memory?:            string
				generic_resources?: #generic_resources
				devices?:           #devices

				{[=~"^x-" & !~"^(cpus|memory|generic_resources|devices)$"]: _}
			}

			{[=~"^x-" & !~"^(limits|reservations)$"]: _}
		}
		restart_policy?: {
			condition?:    string
			delay?:        string
			max_attempts?: int
			window?:       string

			{[=~"^x-" & !~"^(condition|delay|max_attempts|window)$"]: _}
		}
		placement?: {
			constraints?: [...string]
			preferences?: [...{
				spread?: string

				{[=~"^x-" & !~"^(spread)$"]: _}
			}]
			max_replicas_per_node?: int

			{[=~"^x-" & !~"^(constraints|preferences|max_replicas_per_node)$"]: _}
		}

		{[=~"^x-" & !~"^(mode|endpoint_mode|replicas|labels|rollback_config|update_config|resources|restart_policy|placement)$"]: _}
	}

	#generic_resources: [...{
		discrete_resource_spec?: {
			kind?:  string
			value?: number

			{[=~"^x-" & !~"^(kind|value)$"]: _}
		}

		{[=~"^x-" & !~"^(discrete_resource_spec)$"]: _}
	}]

	#devices: [...{
		capabilities?: #list_of_strings
		count?:        int | string
		device_ids?:   #list_of_strings
		driver?:       string
		options?:      #list_or_dict

		{[=~"^x-" & !~"^(capabilities|count|device_ids|driver|options)$"]: _}
	}]

	#network: null | {
		name?:   string
		driver?: string
		driver_opts?: {
			{[=~"^.+$" & !~"^()$"]: number | string}
			...
		}
		ipam?: {
			driver?: string
			config?: [...{
				subnet?:   string
				ip_range?: string
				gateway?:  string
				aux_addresses?: {
					{[=~"^.+$" & !~"^()$"]: string}
				}

				{[=~"^x-" & !~"^(subnet|ip_range|gateway|aux_addresses)$"]: _}
			}]
			options?: {
				{[=~"^.+$" & !~"^()$"]: string}
			}

			{[=~"^x-" & !~"^(driver|config|options)$"]: _}
		}
		external?: bool | {
			name?: string @deprecated()

			{[=~"^x-" & !~"^(name)$"]: _}
		}
		internal?:    bool
		enable_ipv6?: bool
		attachable?:  bool
		labels?:      #list_or_dict

		{[=~"^x-" & !~"^(name|driver|driver_opts|ipam|external|internal|enable_ipv6|attachable|labels)$"]: _}
	}

	#volume: null | {
		name?:   string
		driver?: string
		driver_opts?: {
			{[=~"^.+$" & !~"^()$"]: number | string}
			...
		}
		external?: bool | {
			name?: string @deprecated()

			{[=~"^x-" & !~"^(name)$"]: _}
		}
		labels?: #list_or_dict

		{[=~"^x-" & !~"^(name|driver|driver_opts|external|labels)$"]: _}
	}

	#secret: {
		name?:     string
		file?:     string
		external?: bool | {
			name?: string
			...
		}
		labels?: #list_or_dict
		driver?: string
		driver_opts?: {
			{[=~"^.+$" & !~"^()$"]: number | string}
			...
		}
		template_driver?: string

		{[=~"^x-" & !~"^(name|file|external|labels|driver|driver_opts|template_driver)$"]: _}
	}

	#config: {
		name?:     string
		file?:     string
		external?: bool | {
			name?: string @deprecated()
			...
		}
		labels?:          #list_or_dict
		template_driver?: string

		{[=~"^x-" & !~"^(name|file|external|labels|template_driver)$"]: _}
	}

	#string_or_list: string | #list_of_strings

	#list_of_strings: list.UniqueItems() & [...string]

	#list_or_dict: {
		{[=~".+" & !~"^()$"]: null | bool | number | string}
	} | list.UniqueItems() & [...string]

	#blkio_limit: {
		path?: string
		rate?: int | string
	}

	#blkio_weight: {
		path?:   string
		weight?: int
	}

	#constraints: _
}
